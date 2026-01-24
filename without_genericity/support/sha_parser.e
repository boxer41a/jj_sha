note
	description: "[
		Base class for 32-bit and 64-bit implmentations, {SHA_PARSER_32} and
		{SHA_PARSER_64}, which read string or file input, parsing that input
		into "blocks" for use by the {SHA_HASHER} Secure Hash Algorithm
		calculations. 
		
		This class interacts with user input, processing that input through a `buffer'
		into a 32-bit or 64-bit implementation of a `blocks' array as described in:
		
			FIPS Pub 108-4 (Mar 2012).
		
		]"
	author: "Jimmy J Johnson"
	date: "1/24/26"

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

	is_parsed: BOOLEAN
			-- Has the message been parsed into its corresponding `blocks'?
			-- Feature `blocks' is defined in {SHA_PARSER_32}.

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

feature -- Basic operations

	parse
			-- Process the `buffer', building up a "blocks" array as
			-- described in FIPS Pub 108-4 (Mar 2012)
		require
			not_parsed: not is_parsed
		local
			i: INTEGER_32
			b: like anchor_block
		do
				-- Read all the full blocks
			from i := 1
			until i > block_count
			loop
				b := i_th_block (i)
				blocks.extend (b)
--				extend_block (b)
				i := i + 1
			end
			if has_partial_block then
				b := partial_block
				blocks.extend (b)
--				extend_block (b)
			end
			is_parsed := True
			pad
		ensure
			is_parsed: is_parsed
		end

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

feature {NONE} -- Implementation

	partial_block: SHA_BLOCK
			-- The last block, which does not have enough words to fill a block.
			-- The result may be full in some cases
		require
			has_partial_block: has_partial_block
		deferred
		end

	i_th_block (a_index: INTEGER_32): SHA_BLOCK
			-- The `a_index'-th block from the input stream `buffer'
		require
			index_big_enough: a_index >= 1
			index_small_enough: a_index <= block_count
		deferred
		ensure
			block_is_full: Result.count = anchor_block.words_per_block
		end

--	extend_block (a_block: like anchor_block)
--			-- Add `a_block' to the implementation of the "blocks"
--		deferred
--		end

	pad
		require
			not_padded: not is_padded
		deferred
		ensure
			is_padded: is_padded
		end

	is_one_padded: BOOLEAN
			-- Has a "one" bit been added to the bits in `blocks'?

	is_padded: BOOLEAN
			-- Has the message been padded with a "one", zero's, and `length'?

feature {NONE} -- Implementation

	file_message_imp: detachable like file_message
			-- The name of the file if Current is to parse a file

	string_message_imp: detachable like string_message
			-- The string that Current is to parse

feature {NONE} -- Implementation

	anchor_block: SHA_BLOCK
			-- Object from which to obtain constants, when a static contect
			-- is not allowed
		deferred
		end

	buffer: MANAGED_POINTER
			-- Used internally as the input buffer
			-- Set in `set_with_filename'

	blocks: ARRAYED_LIST [like anchor_block]
			-- An array of blocks, holding the parsed message.

invariant

	is_file_parsing_implication: is_file_parsing implies not is_string_parsing
	is_string_parsing_implication: is_string_parsing implies not is_file_parsing

	is_padded_implication_1: is_padded implies is_one_padded

	is_padded_implication_2: is_padded implies across blocks as ic all ic.item.count = anchor_block.words_per_block end

end
