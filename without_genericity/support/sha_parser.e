note
	description: "[

fix me by getting rid of the xxx_imp and just assing default values.
the flags will lead to the correct message without having to check
for attachement


	]"
	author: "Jimmy J Johnson"
	date: "1/16/26"

deferred class
	SHA_PARSER

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
			 create file_message_imp.make_from_string (a_string)
				-- Parsing status
			is_padded := false
			is_parsed := false
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
			 create string_message_imp.make_from_string (a_string)
				-- Write the string to a temp file
			fn := "temp_file.raw"
			create f.make_open_write (fn)
			from i := 1
			until i > a_string.count
			loop
				f.put_natural_32 (a_string.code (i))
				i := i + 1
			end
			f.close
				-- Read the temp file into the `file_pointer'
			create f.make_open_read (fn)
			create buffer.make (f.count)
			f.read_to_managed_pointer (buffer, 0, f.count)
				-- Parsing status
			is_padded := false
			is_parsed := false
		ensure
			not_file_parsing: not is_file_parsing
			is_string_8_parsing: is_string_parsing
			not_one_padded: not is_one_padded
			not_padded: not is_padded
			not_parsed: not is_parsed
		end

feature -- Access

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

	buffer: MANAGED_POINTER
			-- Used internally as the input buffer
			-- Set in `set_with_filename'

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
			Result := byte_count // anchor_block.bytes_per_word
		end

	has_partial_word: BOOLEAN
			-- Does the message contain bytes at the end, but not enough to fill a word?
		do
			Result := word_count * anchor_block.bytes_per_word < byte_count
		end

	block_count: INTEGER_32
			-- The number of FULL blocks that will result from parsing the message.
		do
			Result := byte_count // anchor_block.bytes_per_block
		end

	has_partial_block: BOOLEAN
			-- Does the message contain bytes at the end, but not enough to fill a block?
		do
			Result := block_count * anchor_block.bytes_per_block < byte_count
		end

feature {NONE} -- Basic operations

	i_th_word (a_index: INTEGER_32): like word_anchor
			-- The `a_index'th word from the input `message'
			-- Deferred because have to read 8-bit values into 32- or 64-bit words,
			-- and the reading requires bits operations which are not in {NUMERIC
		require
			index_big_enough: a_index>= 1
			index_small_enough: a_index <= word_count or else (has_partial_word and then a_index <= word_count + 1)
		deferred
		end

	partial_word: NUMERIC
			-- The last word readable from the input, if the input does not have
			-- enough bytes to read a full word.
		require
			has_partial_word: has_partial_word
		deferred
		end

	i_th_block (a_index: INTEGER_32): like block_anchor
			-- The `a_index'-th block from the input stream `message'
		require
			index_big_enough: a_index >= 1
			index_small_enough: a_index <= block_count
		local
			i: INTEGER_32
			w: like word_anchor
		do
			Result := new_block
			from i := 1
			until i > anchor_block.words_per_block
			loop
				w := i_th_word (a_index + i)
				Result.put (w, i - 1)		-- a {SHA_BLOCK} is zero based
				i := i + 1
			end
		ensure
--			block_is_full: Result.count = anchor_block.words_per_block
		end

	partial_block: like block_anchor
			-- The last block, which does not have enough words to fill a block
		require
			has_partial_block: has_partial_block
		local
			i: INTEGER_32
			w: like word_anchor
			n: INTEGER_32
		do
			Result := new_block
			from i := (blocks.count * anchor_block.words_per_block).max (1)
			until i > word_count
			loop
				w := i_th_word (i)
				Result.put (w, n)
				n := n + 1
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
			b: like block_anchor
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

	pad
			-- Add a one (really a byte containing a one in the high order bit
			-- followed by seven zero's) after the last bit in `message'.
		require
			is_parsed: is_parsed
			not_padded: not is_padded
		deferred
		ensure
			is_padded: is_padded
--			has_full_blocks: across blocks as ic all ic.item.count = anchor_block.words_per_block end
		end

feature {NONE} -- Implementation

	file_message_imp: detachable like file_message
			-- The name of the file if Current is to parse a file

	string_message_imp: detachable like string_message
			-- The string that Current is to parse

	blocks: ARRAYED_LIST [like block_anchor]
			-- An array of blocks, holding the parsed message.
		deferred
		end

feature {NONE} -- Implementation

	new_block: like block_anchor
			-- Create a new block of correct type
		deferred
		end

	anchor_block: like block_anchor
			-- Used to create one instance from which to obtain constants
			-- that can't be accessed from a static context
			-- Redefine as a once feature
		deferred
		end

	word_anchor: NUMERIC
			-- Anchor for type used by the SHA calculations; 32- or 64-bit natural.
			-- Not to be called; just used to anchor types.
			-- Declared as a feature to avoid adding an attribute.
			-- Redefine as {NATURAL_32} or {NATURAL_64}
		require
			not_callable: False
		do
			check
				do_not_call: False then
					-- Because gives no info; simply used as anchor.
			end
		end

	block_anchor: SHA_BLOCK
			-- Anchor for type used by the SHA calculations; 32 or 64 bits.
			-- Not to be called; just used to anchor types.
			-- Declared as a feature to avoid adding an attribute.
			-- This should be an ancestor of the NATURAL_xx types, but there
			-- is no such class.
		require
			not_callable: False
		do
			check
				do_not_call: False then
					-- Because gives no info; simply used as anchor.
			end
		end

invariant

	is_file_parsing_implication: is_file_parsing implies not is_string_parsing
	is_string_parsing_implication: is_string_parsing implies not is_file_parsing

--	is_padded_implication: is_padded implies across blocks as ic all ic.item.count = anchor_block.words_per_block end
end
