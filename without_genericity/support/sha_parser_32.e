note
	description: "[
		A 32-bit implementation of an {SHA_PARSER}.

		This class implements `pad', which adds a one to `message' and rounds
		its size off to a word boundary, and `parse', which places the message
		bytes into blocks as words in preparation for `calculate'.

		See FIPS Pub 108-4 (Mar 2012)
		]"
	author: "Jimmy J Johnson"
	date: "1/13/26"

class
	SHA_PARSER_32

inherit

	ANY
		redefine
			default_create
		end

feature {NONE} -- Initialization

	default_create
			-- Initialize Current
		do
			Precursor
			create buffer.make (0)
			create blocks.make (0)
		end

	make_with_filename (a_string: READABLE_STRING_8)
			-- Create an instance, setting `message_origin' to `a_string' and
			-- process the message as a file of bytes.
		do
			default_create
			set_with_filename (a_string)
		ensure
			is_file_parsing: is_file_parsing
		end

	make_with_string (a_string: READABLE_STRING_GENERAL)
			-- Create an instance, setting `message_string' to `a_string'
		do
			default_create
			set_with_string (a_string)
		ensure
			is_string_parsing: is_string_parsing
		end

feature -- Initialization

	set_with_filename (a_string: READABLE_STRING_GENERAL)
			-- Initialize Current and set the `message' to `a_string'
		require
			file_exists: (create {RAW_FILE}.make_with_name (a_string)).exists
		local
			f: RAW_FILE
		do
			default_create
			create f.make_open_read (a_string)
			f.read_to_managed_pointer (buffer, 0, f.count)
				-- Need an {IMMUTABLE_STRING_8}
			string_message_imp := Void
			create file_message_imp.make_from_string (a_string)
				-- Parsing status
			reset_status_flags
		ensure
			is_file_parsing: is_file_parsing
			not_string_parsing: not is_string_parsing
			not_one_padded: not is_one_padded
			not_padded: not is_padded
			not_parsed: not is_parsed
		end

	set_with_string (a_string: READABLE_STRING_GENERAL)
			-- Initialize Current and set the `message' to `a_string'
		local
			i: INTEGER
			fn: STRING_8
			f: RAW_FILE
		do
			default_create
				-- Save the string so it can't be changed externally
			file_message_imp := Void
			create string_message_imp.make_from_string (a_string)
				-- Write the string to a temp file
			fn := "temp_file.raw"
			create f.make_open_write (fn)
				--
			if attached {READABLE_STRING_8} a_string as s8 then
				from i := 1
				until i > s8.count
				loop
					f.put_natural_8 (s8.code (i).as_natural_8)
					i := i + 1
				end
			elseif attached {READABLE_STRING_32} a_string as s32 then
				from i := 1
				until i > s32.count
				loop
					f.put_natural_32 (s32.code (i))
					i := i + 1
				end
			else
				check
					should_not_happen: False
						-- because only two string types
				end
			end
			f.close
				-- Read the temp file into the `file_pointer'
			create f.make_open_read (fn)
			create buffer.make (f.count)
			f.read_to_managed_pointer (buffer, 0, f.count)
				-- Parsing status
			reset_status_flags
		ensure
			not_file_parsing: not is_file_parsing
			is_string_8_parsing: is_string_parsing
			not_one_padded: not is_one_padded
			not_padded: not is_padded
			not_parsed: not is_parsed
		end

feature -- Access

show_stats
		-- for testing
	do
		print (" " + byte_count.out + " bytes,  " + word_count.out + " full words,  ")
		print (block_count.out + " full blocks  -- ")
		if has_partial_block then
			print ("  partial block  ")
		end
		if has_partial_word then
			print ("  partial word ")
		end
		print ("%N")
	end

	message: IMMUTABLE_STRING_GENERAL
			-- The string or filename from which to build the `blocks'
			-- (i.e. the data bytes to be parsed)
		do
			if is_file_parsing then
				Result := file_message
			elseif is_string_parsing then
				Result := string_message
			else
				check
					should_not_happen: False then
						-- because all cases covered above
				end
			end
		end

	string_message: IMMUTABLE_STRING_32
			-- A copy of the string that is used as input
		require
			is_string_parsing: is_string_parsing
		do
			check attached string_message_imp as s then
				Result := s
			end
		end

	file_message: IMMUTABLE_STRING_32
			-- A copy of the filename of a file used as input
		require
			is_file_parsing: is_file_parsing
		do
			check attached file_message_imp as s then
				Result := s
			end
		end

feature -- Status setting

	reset_status_flags
			-- Set parsing and hashing flags to false
		do
			is_one_padded := False
			is_padded := False
			is_parsed := False
		end

feature -- Status report

	is_file_parsing: BOOLEAN
			-- Is the input source a file?
		do
			Result := attached file_message_imp
		end

	is_string_parsing: BOOLEAN
			-- Is the input a string?
		do
			Result := attached string_message_imp
		end

	is_one_padded: BOOLEAN
			-- Has a "one" bit been added to the bits in `blocks'?

	is_padded: BOOLEAN
			-- Has the message been padded with a "one", zero's, and `length'?

	is_parsed: BOOLEAN
			-- Has the message been parsed into its corresponding `blocks'?
			-- Feature `blocks' is defined in {SHA_PARSER_32}.

feature -- Query

	byte_count: INTEGER_32
			-- The number of bytes that can be read from the input
		do
			Result := buffer.count
		end

	word_count: INTEGER_32
			-- The number of FULL words that can be read from the input
		do
			Result := byte_count // {SHA_BLOCK_32}.bytes_per_word
		end

	has_partial_word: BOOLEAN
			-- Does the message contain bytes at the end, but not enough to fill a word?
		do
			Result := word_count * {SHA_BLOCK_32}.bytes_per_word < byte_count
		end

	block_count: INTEGER_32
			-- The number of FULL blocks that will result from parsing the message.
		do
			Result := byte_count // {SHA_BLOCK_32}.bytes_per_block
		end

	has_partial_block: BOOLEAN
			-- Does the message contain bytes at the end, but not enough to fill a block?
		do
			Result := block_count * {SHA_BLOCK_32}.bytes_per_block < byte_count
		end

feature {NONE} -- Basic operations

	pad_with_one
			-- Add a one bit right after the last word in `blocks'.
		require
			is_parsed: is_parsed
			not_padded: not is_padded
			not_one_padded: not is_one_padded
		local
			b: SHA_BLOCK_32
			n: NATURAL_32
		do
			n := 0x80000000
				-- Check the last block
			b := blocks.last
			if b.count < {SHA_BLOCK_32}.words_per_block then
					-- There is room for one more value.
				b.put (n, b.count)		-- an {SHA_BLOCK} is zero based
			else
					-- There is not room, so create a new block
				create b
				b.put (n, 0)		-- an SHA_BLOCK is zero-based
				blocks.extend (b)
			end
			is_one_padded := True
		ensure
			is_one_padded: is_one_padded
		end

	pad
			-- Add a one bit right after the last word in `blocks' it not already
			-- done, and place the length vector in the last two bytes of the
			-- last block.
		local
			b: SHA_BLOCK_32
			i: INTEGER_32
		do
			if not is_one_padded then
				pad_with_one
			end
				-- Pad with zeros if nessesary
			b := blocks.last
			if b.count > {SHA_BLOCK_32}.words_per_block - 2 then
					-- There is no room for length, so fill with zeros and make new block
				from i := b.count
				until i >= {SHA_BLOCK_32}.words_per_block
				loop
					b.put (0, i)
					i := i + 1
				end
				create b
				blocks.extend (b)
			end
				-- For last block or block just created add zeros, leaving room for length vector
			from i := b.count
			until i >= {SHA_BLOCK_32}.words_per_block - 2
			loop
				b.put (0, i)
				i := i + 1
			end
				-- Now add the length vectot.  Remember, a block is zero-based
			b.put (0, {SHA_BLOCK_32}.words_per_block - 2)
			b.put ((byte_count * 8).as_natural_32, {SHA_BLOCK_32}.words_per_block - 1)
			is_padded := True
		end

	i_th_word (a_index: INTEGER_32): NATURAL_32
			-- The `a_index'th word in the `file_pointer' input
		local
			i: INTEGER_32
		do
			i := (a_index) * {SHA_BLOCK_32}.bytes_per_word
--			Result := buffer.read_natural_32 (i)
--			Result := buffer.read_natural_32_le (i)
			Result := buffer.read_natural_32_be (i)
		end

	partial_word: NATURAL_32
			-- The last word, when the bytes remaining are not enough to fill a word
		local
			i: INTEGER_32
			bc: INTEGER_32		-- count bytes read into this word
			n8: NATURAL_32
		do
			from i := word_count * {SHA_BLOCK_32}.bytes_per_word
			until i > byte_count - 1
			loop
				n8 := buffer.read_natural_8 (i)		-- conversion to {NATURAL_32}
				bc := bc + 1
				Result := Result.bit_or (n8)
				Result := Result.bit_shift_left (8)
				check
					not_too_many_byte: bc < {SHA_BLOCK_32}.bytes_per_word
						-- because this is a partial word
				end
				i := i + 1
			end
				-- Now, pad with a one for this special case (don't call `pad_with_one')
			n8 := 0x80
			Result := Result.bit_or (n8)
			bc := bc + 1
			is_one_padded := True
				-- Pad this word with trailing zeros
			from i := bc
			until i >= {SHA_BLOCK_32}.bytes_per_word
			loop
				Result := Result.bit_shift_left (8)
				i := i + 1
			end
		end

	i_th_block (a_index: INTEGER_32): SHA_BLOCK_32
			-- The `a_index'-th block from the input stream `message'
		require
			index_big_enough: a_index >= 1
			index_small_enough: a_index <= block_count
		local
			i: INTEGER_32
			w: NATURAL_32
		do
			create Result
			from i := 1
			until i > {SHA_BLOCK_32}.words_per_block
			loop
				w := i_th_word (a_index + i)
				Result.put (w, i - 1)		-- a {SHA_BLOCK} is zero based
				i := i + 1
			end
		ensure
--			block_is_full: Result.count = anchor_block.words_per_block
		end

	partial_block: SHA_BLOCK_32
			-- The last block, which does not have enough words to fill a block
		require
			has_partial_block: has_partial_block
		local
			i: INTEGER_32
			w: NATURAL_32
			c: INTEGER_32
		do
			create Result
			from i := blocks.count * {SHA_BLOCK_32}.words_per_block
			until i >= word_count
			loop
				w := i_th_word (i)
				Result.put (w, c)
				c := c + 1
				i := i + 1
			end
			if has_partial_word then
				w := partial_word
				Result.put (w, i)
			end
		ensure
--			block_not_full: Result.count < anchor_block.words_per_block
		end

	parse
			-- Place the message into `blocks' for use by hashers
		local
			i: INTEGER_32
			b: SHA_BLOCK_32
		do
				-- Read all the full blocks
			from i := 1
			until i > block_count
			loop
				b := i_th_block (i)
				blocks.extend (b)
				i := i + 1
			end
			if has_partial_block then
				b := partial_block
				blocks.extend (b)
			end
			is_parsed := True
			pad
		ensure
			is_one_padded: is_one_padded
			is_padded: is_padded
			is_parsed: is_parsed
		end


feature {NONE} -- Implementation

--	bits_per_word: INTEGER = 32
--			-- The number of bits in the `word_type'.

--	bytes_per_word: INTEGER = 4
--			-- The number of bytes in the `word_type'.

feature {NONE} -- Implementation

	file_message_imp: detachable like file_message
			-- The name of the file if Current is to parse a file

	string_message_imp: detachable like string_message
			-- The string that Current is to parse

	blocks: ARRAYED_LIST [SHA_BLOCK_32]
			-- An array of blocks, holding the parsed message.

feature {NONE} -- Implementation

	buffer: MANAGED_POINTER
			-- Used internally as the input buffer
			-- Set in `set_with_filename'

invariant

	is_file_parsing_implication: is_file_parsing implies not is_string_parsing
	is_string_parsing_implication: is_string_parsing implies not is_file_parsing

	is_padded implies is_one_padded

--	is_padded_implication: is_padded implies across blocks as ic all ic.item.count = anchor_block.words_per_block end

end
