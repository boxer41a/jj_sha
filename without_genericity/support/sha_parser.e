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
			create file_pointer.make (0)
			create file_message.make_from_string ("")
			create string_8_message.make_from_string ("")
			create string_32_message.make_from_string ("")
		end

	make_with_filename (a_string: READABLE_STRING_8)
			-- Create an instance, setting `message_origin' to `a_string' and
			-- process the message as a file of bytes.
		do
			default_create
			set_with_filename (a_string)
			is_file_parsing := True
		end

	make_with_string_8 (a_string: READABLE_STRING_GENERAL)
			-- Create an instance, setting `message_origin' to `a_string'
		do
			default_create
			set_with_string (a_string)
			is_file_parsing := False
		end

feature -- Initialization

	set_with_filename (a_string: READABLE_STRING_8)
			-- Initialize Current and set the `message' to `a_string'
		require
			file_exists: (create {RAW_FILE}.make_with_name (a_string)).exists
		local
			f: RAW_FILE
		do
			default_create
			create f.make_open_read (a_string)
			f.read_to_managed_pointer (file_pointer, 0, f.count)
				-- Need an {IMMUTABLE_STRING_8}
			file_message := create {IMMUTABLE_STRING_8}.make_from_string (a_string)

				-- Set status
			is_file_parsing := False
			is_string_8_parsing := True
			is_string_32_parsing := False
				-- Parsing status
			is_padded := false
			is_parsed := false
		ensure
			not_file_parsing: is_file_parsing
			is_string_8_parsing: not is_string_8_parsing
			not_string_32_parsing: not is_string_32_parsing
			not_one_padded: not is_one_padded
			not_padded: not is_padded
			not_parsed: not is_parsed
		end

	set_with_string (a_string: READABLE_STRING_GENERAL)
			-- Initialize Current and set the `message' to `a_string'
		local
			f: RAW_FILE
		do
			default_create
				-- Need an {IMMUTABLE_STRING_8}
			if attached {READABLE_STRING_8} a_string as s8 then
--				string_8_message := create {IMMUTABLE_STRING_8}.make_from_string (s8)
		elseif attached {READABLE_STRING_32} a_string as s32 then
				string_32_message := create {IMMUTABLE_STRING_32}.make_from_string (s32)
			else
				check
					should_not_happen: False
						-- because that covers all the string types
				end
			end

				-- Write the string to a temp file, then process the file as in `set_with_file'
			create f.make_open_write ("temp_file.raw")
			from i := 1
			until i > a_string.count
			loop
				f.put_natural_32 (a_string.code (i))
				i := i + 1
			end


				-- Set status
			is_file_parsing := False
			is_string_8_parsing := True
			is_string_32_parsing := False
				-- Parsing status
			is_padded := false
			is_parsed := false
		ensure
			not_file_parsing: not is_file_parsing
			is_string_8_parsing: is_string_8_parsing
			not_string_32_parsing: not is_string_32_parsing
			not_one_padded: not is_one_padded
			not_padded: not is_padded
			not_parsed: not is_parsed
		end

feature -- Access

	message: IMMUTABLE_STRING_GENERAL
			-- The string or filename from which to build the `blocks'
			-- (i.e. the data bytes to be parsed)
		do
			if is_string_8_parsing then
				Result := string_8_message
			elseif is_string_32_parsing then
				Result := string_32_message
			elseif is_file_parsing then
				Result := file_message
			else
				check
					should_not_happen: False then
						-- because all cases coverd above
				end
			end
		end

	string_8_message: IMMUTABLE_STRING_8
			-- Used when `set_with_string' recieves a {STRING_8}

	string_32_message: IMMUTABLE_STRING_32
			-- Used when `set_with_string' recieves a {STRING_32}

	file_message: IMMUTABLE_STRING_8
			-- Used when `set_with_filename' was called

	file_pointer: MANAGED_POINTER
			-- Used when reading from a file
			-- Set in `set_with_filename'

feature -- Status report

	is_file_parsing: BOOLEAN
			-- Should the input source be read as a file?

	is_string_8_parsing: BOOLEAN
			-- Should the input source be read as an 8-bit string?

	is_string_32_parsing: BOOLEAN
			-- Should the input source be read as an 32-bit string?

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
			if is_file_parsing then
				Result := file_pointer.count
			elseif is_string_8_parsing then
				Result := string_8_message.count
			elseif is_string_32_parsing then
				Result := string_32_message.count * 4
			else
				check
					should_not_happen: False
						-- because all cases covered above
				end
			end
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

	position_of_word (a_index: INTEGER_32): INTEGER_32
			-- The position of the `a_index'th word to read from the input string.
		require
			index_big_enough: a_index >= 1
			index_small_enough: a_index <= full_word_count
		do
			if a_index = 1 then
				Result := 1
			else
				if is_file_parsing then
					Result := a_index * anchor_block.bytes_per_word
				elseif is_string_8_parsing then
					Result := a_index * anchor_block.bytes_per_word
				elseif is_string_32_parsing then
					Result := a_index * (anchor_block.bytes_per_word // anchor_block.items_per_word)
				else
					check
						should_not_happen: False
							-- because all cases covered above
					end
				end
			end
		end

	position_of_block (a_index: INTEGER_32): INTEGER_32
			-- The position (calculated differently for different input types) of
			-- the beginning of this block in the input stream.
		do
			if a_index = 1 then
				Result := 1
			else
				if is_file_parsing then
					Result := a_index * anchor_block.bytes_per_block
				elseif is_string_8_parsing then
					Result := a_index * anchor_block.bytes_per_block
				elseif is_string_32_parsing then
					Result := a_index * (anchor_block.bits_per_block // 32)
				else
					check
						should_not_happen: False
							-- because all cases covered above
					end
				end
			end
		end

feature {NONE} -- Basic operations

	i_th_file_word (a_index: INTEGER_32): like anchor_block.zero_word
			-- The `a_index'th word as read from `file_message'
			-- Deferred because have to read 8-bit values into 32- or 64-bit words,
			-- and the reading requires bits operations which are not in {NUMERIC}
		deferred
		end

	i_th_string_8_word (a_index: INTEGER_32): like anchor_block.zero_word
			-- The `a_index'th word as read from `string_8_message'
			-- Deferred because have to read 8-bit values into 32- or 64-bit words,
			-- and the reading requires bits operations which are not in {NUMERIC}
		deferred
		end

	i_th_string_32_word (a_index: INTEGER_32): like anchor_block.zero_word
			-- The `a_index'th word as read from `string_32_message'
			-- Deferred because have to read 8-bit values into 32- or 64-bit words,
			-- and the reading requires bits operations which are not in {NUMERIC}
		require
			is_string_32_parsing: is_string_32_parsing
			position_big_enough: a_index >= 1
			position_small_enough: a_index <= word_count or else (has_partial_word and a_index <= word_count + 1)
		deferred
		end

	i_th_word (a_index: INTEGER_32): like word_anchor
			-- The `a_index'th word from the input `message'
		do
			if is_file_parsing then
				Result := i_th_file_word (a_index)
			elseif is_string_8_parsing then
				Result := i_th_string_8_word (a_index)
			elseif is_string_32_parsing then
				Result := i_th_string_32_word (a_index)
			else
				check
					should_not_happen: False
						-- because all cases covered above
				end
			end
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
			bck := new_block
			from i := 1
			until i > anchor_block.words_per_block
			loop
				w := i_th_word (a_index * i)
				Result.put (w, i - 1)		-- a {SHA_BLOCK} is zero based
				i := i + 1
			end
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
				read_partial_block
			end
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
		end

--	parse
--			-- Parse the message into "blocks" usable by the calculations.
--		require
--			not_parsed: not is_parsed
--			is_padded: not is_padded
--		deferred
--		ensure
--			is_parsed: is_parsed
--			is_one_padded: is_one_padded
--			is_padded: is_padded
--		end

feature {NONE} -- Implementation

	blocks: ARRAYED_LIST [like block_anchor]
			-- An array of blocks, holding the parsed message.
		deferred
		end

feature {NONE} -- Implementation

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

	is_file_parsing_implication: is_file_parsing implies not (is_string_8_parsing or is_string_32_parsing)
	is_string_8_parsing_implication: is_string_8_parsing implies not (is_file_parsing or is_string_32_parsing)
	is_string_32_parsing_implication: is_string_32_parsing implies not (is_file_parsing or is_string_8_parsing)

end
