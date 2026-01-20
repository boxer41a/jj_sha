note
	description: "[
		Base class for the parser classes which are used to preprocess and pad
		messages before calculation of a `digest' in the Secure Hash Algorithm
		(SHA) classes (e.g. {SHA_1}, {SHA_256} and {SHA_224}).

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

	SHA_PARSER
		redefine
			default_create,
			block_anchor
		end

feature {NONE} -- Initialization

	default_create
			-- Initialize Current
		do
			Precursor
			create blocks.make (0)
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
		do
				-- Check the last block
			b := blocks.last
			if b.count < {SHA_BLOCK_32}.words_per_block then
					-- There is room for one more value.
				b.put (0x80000000, b.count - 1)	-- an {SHA_BLOCK} is zero based
			else
					-- There is not room, so create a new block
				create b
				b.put (0x80000000, 0)		-- an SHA_BLOCK is zero-based
				blocks.extend (b)
			end
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
			if b.count < {SHA_BLOCK_32}.words_per_block - 2 then
					-- Pad with zeros leaving room for length vector
				from i := b.count
				until i > {SHA_BLOCK_32}.words_per_block- 2
				loop
					b.put (0, i - 1)
					i := i + 1
				end
			else
					-- There is no room for length, so fill with zeros and make new block
				from i := b.count
				until i > {SHA_BLOCK_32}.words_per_block
				loop
					b.put (0, i - 1)
					i := i + 1
				end
				check
					last_block_full: b.count = {SHA_BLOCK_32}.words_per_block
				end
				create b
					-- Remember, a block is zero-based
				b.put (0, {SHA_BLOCK_32}.words_per_block - 2 - 1)
				b.put (message.count.as_natural_32, {SHA_BLOCK_32}.words_per_block - 1)
				blocks.extend (b)
			end
			is_padded := True
		end

	read_word (a_position: INTEGER_32): NATURAL_32
			-- Read one 32-bit word from the input source
		require
			valid_position: is_valid_position (a_position)
			position_small_enough: a_position + {SHA_BLOCK_32}.bytes_per_word <= message_count
		do
			if is_string_32_parsing then
				Result := read_word_32 (a_position)
			elseif is_string_8_parsing then
				Result := read_word_8 (a_position)
			elseif is_file_parsing then
				Result := read_word_8 (a_position)
			end
		end

	is_valid_position (a_position: INTEGER_32): BOOLEAN
			-- Is `a_position' in range for a read operation
		do
				-- The `message_count' if figured differently for differing message types:
			if is_string_32_parsing then
					-- 1) {STRING_32} `count' is the number of 32-bit {CHARACTER_32} values
				Result := a_position + {SHA_BLOCK_32}.bytes_per_word <= message_count
			elseif is_string_8_parsing then
					-- 2) {STRING_} `count' is the number of 8-bit {CHARACTER_8} values
				Result := a_position + {SHA_BLOCK_32}.bytes_per_word <= message_count
			elseif is_file_parsing then
					-- 3)  {MANAGED_POINTER} `count' is the number of 8-bit {} bytes
				Result := a_position + {SHA_BLOCK_32}.bytes_per_word <= message_count
			end
		end

	read_word_8 (a_position: INTEGER): NATURAL_32
			-- Read one word from `string_8_message, starting at `a_position'
		require else
			position_big_enough: a_position >= 1
			position_small_enough: a_position + {SHA_BLOCK_32}.bytes_per_word <= message_count
		local
			pos: INTEGER_32
			b_count: INTEGER_32
			n: NATURAL_32
		do
				-- The result type will be effected as NATURAL_32 or NATURAL_64
			pos := a_position
			from b_count := 0
			until b_count = block_anchor.bytes_per_word
			loop
				Result := Result.bit_shift_left (8)
				n := string_8_message.item (pos).code.as_natural_8
				Result := Result.bit_or (n)
				b_count := b_count + 4
				pos := pos + 1
			end
		end

	read_word_32 (a_position: INTEGER): NATURAL_32
			-- Read one word from `string_32_message' starting at `a_position'
		require
			is_string_32_parsing: is_string_32_parsing
			position_big_enough: a_position >= 1
			position_small_enough: a_position + {SHA_BLOCK_32}.bytes_per_word <= message_count
		local
			pos: INTEGER_32
			b_count: INTEGER_32
			n: NATURAL_32
		do
			pos := a_position
			from b_count := 0
			until b_count = block_anchor.bytes_per_word
			loop
					Result := Result.bit_shift_left (32)
					n := string_32_message.item (pos).natural_32_code
					Result := Result.bit_or (n)
					b_count := b_count + 4
					pos := pos + 1
			end
		end

	read_block (a_position: INTEGER): SHA_BLOCK_32
			-- Read one FULL block of values from input starting at `a_position'
		require
			has_full_blocks_remaining: full_block_count (a_position) > 0
		local
			i: INTEGER_32
--			w: NATURAL_32	-- a word
		do
			create Result
			from i := 0
			until i > {like block_anchor}.words_per_block - 1	-- zero based
			loop
--				w := read_word (i)
				Result.put (read_word (i), i)
				i := i + 1
			end
		end

--	add_full_blocks_from_string
--			-- Read words from `message', filling blocks completely.
--			-- Stop reading when three are not enough words to fill a block
--			-- Return the position to begin reading next words/bytes.
--		do
--			check attached {IMMUTABLE_STRING_32} message as m then
--					-- Each item of the input is 32-bit so just put them into blocks.
--					-- A block contains sixteen 42-bit values
--				fbc := m.count // {SHA_BLOCK_32}.words_per_block
--				from i := 1
--				until i > fbc
--				loop
--					create b
--						-- Remember, a {SHA_BLOCK} is zero-based
--					from j := 0
--					until j > {SHA_BLOCK_32}.words_per_block - 1
--					loop
--						n := m.item (i * j).natural_32_code
--						b.put (n, j)
--						j := j + 1
--					end
--					i := i + 1
--				end
--			check attached {IMMUTABLE_STRING_8} message as m then
--				fbc := m.count // {SHA_BLOCK_32}.bytes_per_block
--				from i := 1
--				until i > fbc
--				loop
--					create b
--					from j := 0
--					until j > 15
--					loop
--							-- Read 4 characters to fill a byte
--						from k := 1
--						until k > {SHA_BLOCK_32}.bytes_per_word
--						loop
--							pos := (i * j + k)
--							c := m.item (pos)
--							n := n.bit_or (c.code.as_natural_32)
--							if k < 4 then
--								n := n.bit_shift_left (8)
--							end
--							k := k + 1
--						end
--						b.put (n, j)
--						j := j + 1
--					end
--					blocks.extend (b)
--					i := i + 1
--		end


	parse_string_32
			-- Parse the `message' into "blocks" and "words", placing the words
			-- into the  `blocks' list and adding the length (in bits) as the
			-- last two words.
			-- See FIBs Pub 180-4 (Mar 2012).
		require
			not_file_input: not is_file_parsing
			is_32_bit_string: attached {IMMUTABLE_STRING_32} message
		local
			i, j, pos: INTEGER_32
			fbc: INTEGER_32		-- full block count
			rem: INTEGER_32	-- a remainder
			b: SHA_BLOCK_32
			n: NATURAL_32
		do

			check attached {IMMUTABLE_STRING_32} message as m then
					-- Each item of the input is 32-bit so just put them into blocks.
					-- A block contains sixteen 42-bit values
				fbc := m.count // {SHA_BLOCK_32}.words_per_block
				from i := 1
				until i > fbc
				loop
					create b
						-- Remember, a {SHA_BLOCK} is zero-based
					from j := 0
					until j > {SHA_BLOCK_32}.words_per_block - 1
					loop
						n := m.item (i * j).natural_32_code
						b.put (n, j)
						j := j + 1
					end
					i := i + 1
				end
				rem := m.count \\ {SHA_BLOCK_32}.words_per_block
				if rem > 0 then
						-- There are characters on the end that will not completely fill a block
						-- Get index of first of these remaining characters
					i := fbc * {SHA_BLOCK_32}.words_per_block + 1
					check
						index_big_enough: i >= 1
						index_small_enough: i <= m.count
					end
					create b
					from
						j := 0
						i := i + j
						pos := i + j
					invariant
						i > fbc * {SHA_BLOCK_32}.words_per_block and pos <= m.count and b.count < {SHA_BLOCK_32}.words_per_block
					variant
						m.count - pos
					until pos > m.count
					loop
						pos := i + j
						b.put (m.item (pos).natural_32_code, pos)
						j := j + 1
					end
				end
			end
				-- Pad `blocks' with a trailing one bit and add count in last two words of last block
			pad
			is_padded := True
			is_parsed := True
		ensure
			is_padded: is_padded
			is_parsed: is_parsed
		end

	parse_string_8
			-- Build the `blocks' array from the string input in `message'
		require
			not_file_input: not is_file_parsing
			is_8_bit_string: attached {IMMUTABLE_STRING_8} message
		local
			i, j: INTEGER_32
			fbc: INTEGER_32		-- full block count
			b: SHA_BLOCK_32
			c: CHARACTER_8
			n: NATURAL_32
			bytes_rem: INTEGER_32
			words_rem: INTEGER_32
		do
--			check attached {IMMUTABLE_STRING_8} message as m then
--				fbc := m.count // {SHA_BLOCK_32}.bytes_per_block
--				from i := 1
--				until i > fbc
--				loop
--					create b
--					from j := 0
--					until j > 15
--					loop
--							-- Read 4 characters to fill a byte
--						from k := 1
--						until k > {SHA_BLOCK_32}.bytes_per_word
--						loop
--							pos := (i * j + k)
--							c := m.item (pos)
--							n := n.bit_or (c.code.as_natural_32)
--							if k < 4 then
--								n := n.bit_shift_left (8)
--							end
--							k := k + 1
--						end
--						b.put (n, j)
--						j := j + 1
--					end
--					blocks.extend (b)
--					i := i + 1
--				end
--					-- Read any remaining FULL words into a new PARTIAL block
--					-- `i', from above, will be the index of this new block
--				words_rem := m.count \\ {SHA_BLOCK_32}.bytes_per_word
--				from j := 1
--				until j > words_rem
--				loop
--						-- Read 4 characters to fill a byte
--					from k := 1
--					until k > {SHA_BLOCK_32}.bytes_per_word
--					loop
--						pos := (i * j + k)
--						c := m.item (pos)
--						n := n.bit_or (c.code.as_natural_32)
--						if k < 4 then
--							n := n.bit_shift_left (8)
--						end
--						k := k + 1
--					end
--					b.put (n, j - 1)
--					j := j + 1
--				end
--						-- Read any remaining bytes into a partial work, and go
--						-- ahead a pad this word with a one here.
--						-- Use `i' to hold bytes read in already
--				i := {SHA_BLOCK_32}.bytes_per_block + words_rem * {SHA_BLOCK_32}.bytes_per_word
--				bytes_rem := m.count - i

--							-- Must read the remaining 1 to 3  bytes and merge into a {NATURAL_32}
--					from pos := i + 1
--					until pos > m.count
--					loop
--						c := m.item (pos)
--						n8 := n.bit_or (c.code.as_natural_32)
--						n := n.bit_or (n8)
--						n := n.bit_shift_left (8)
--						pos := pos + 1
--						b_count := b_count + 1
--						check
--							not_too_many_bytes_read: b_count < {SHA_BLOCK_32}.bytes_per_word
--								-- because of above logic
--						end
--					end
--						-- Now, pad with a one for this special case (don't call `pad_with_one')
--					n8 := 0x80000000
--					n := n.bit_or (n8)
--					b_count := b_count + 1
--					is_one_padded := True
--					if b_count < {SHA_BLOCK_32}.bytes_per_word then
--							-- Pad this word with zeros
--						from
--						until b_count > {SHA_BLOCK_32}.bytes_per_word
--						loop
--							n := n.bit_shift_left (8)
--							n8 := 0x00000000
--							n := n.bit_or (n8)
--							b_count := b_count + 1
--						end
--						b.put (n, )
--					end
--				end
--				blocks.extend (b)
--			end
--			is_parsed := True
--				-- Pad `blocks' with a trailing one bit and add count in last two words of last block
--			pad
		ensure
			is_padded: is_padded
			is_parsed: is_parsed
		end

	parse_file
			-- Produce the `blocks' from the file named in `mesage_origin'
		require
			origin_is_file: is_file_parsing
			filename_not_empty: not message.is_empty
			filename_not_blank: not message.is_whitespace
			file_exists: (create {RAW_FILE}.make_with_name (message)).exists
		local
			f: RAW_FILE
			b: SHA_BLOCK_32
			mp: MANAGED_POINTER
			fbc: INTEGER_32		-- full bloc count
			i, j, pos: INTEGER_32
			rem: INTEGER_32	-- a remainder
			b_count: INTEGER_32
			n, n8: NATURAL_32
		do
			create f.make_open_read_write (message)
				-- Create pointer with number of bytes in the file
			create mp.make (f.count)
				-- Read the whole file (i.e. number of bytes) into the pointer.
			f.read_to_managed_pointer (mp, 0, f.count)
				-- Read in as {NATURAL_32} values
			fbc := mp.count // {SHA_BLOCK_32}.bytes_per_block
			from i := 1
			until i > fbc
			loop
					create b
						-- Remember, a {SHA_BLOCK} is zero-based
					from j := 0
					until j > {SHA_BLOCK_32}.words_per_block - 1
					loop
						n := mp.read_natural_32 (i * j)
						b.put (n, j)
						j := j + 1
					end
				i := i + 1
			end
			rem := mp.count \\ {SHA_BLOCK_32}.bytes_per_block
			if rem > 0 then
					-- The bytes on the end of the {MANAGED_POINTER} are too few
					-- to  completely fill a block.
					-- Get index of first of these remaining characters
				i := fbc * {SHA_BLOCK_32}.words_per_block + 1
				check
					index_big_enough: i >= 1
					index_small_enough: i <= mp.count
				end
				create b
				from
					j := 0
					i := i + j
					pos := i
				invariant
					i > fbc * {SHA_BLOCK_32}.words_per_block and pos <= mp.count and b.count < {SHA_BLOCK_32}.words_per_block
				variant
					mp.count - (pos)
				until pos > mp.count
				loop
					pos := i + j
					if pos + {SHA_BLOCK_32}.bits_per_block <= mp.count then
							-- There is at least one more value with  {SHA_BLOCK_32}.bits_per_word bits.
						n := mp.read_natural_32 (pos)
					else
						check
							is_some_bytes_remaining: pos + mp.natural_8_bytes <= mp.count
								-- because would have jumped out earlier if not
						end
						check
							not_full_word_reamining: pos + mp.natural_32_bits > mp.count
								-- because the if conditional is false	
						end
							-- Must read the remaining 1 to 3  bytes and merge into a {NATURAL_32}
						from
						until pos > mp.count
						loop
							n8 := mp.read_natural_8 (pos)
							n := n.bit_or (n8)
							n := n.bit_shift_left (8)
							pos := pos + mp.natural_8_bits
							b_count := b_count + 1
							check
								not_too_many_bytes_read: b_count < {SHA_BLOCK_32}.bytes_per_word
									-- because of above logic
							end
						end
							-- Now, pad with a one for this special case (don't call `pad_with_one')
						n8 := 0x80000000
						n := n.bit_or (n8)
						b_count := b_count + 1
						is_one_padded := True
						if b_count < {SHA_BLOCK_32}.bytes_per_word then
								-- Pad this word with zeros
							from
							until b_count > {SHA_BLOCK_32}.bytes_per_word
							loop
								n := n.bit_shift_left (8)
								n8 := 0x00000000
								n := n.bit_or (n8)
								b_count := b_count + 1
							end
						end
					end
					b.put (n, j)
					j := j + 1
				end
			end
				-- Pad `blocks' with a trailing one bit and add count in last two words of last block
			pad
			is_padded := True
			is_parsed := True
		ensure
			is_one_padded: is_one_padded
			is_padded: is_padded
			is_parsed: is_parsed
		end

feature {NONE} -- Implementation

	bits_per_word: INTEGER = 32
			-- The number of bits in the `word_type'.

	bytes_per_word: INTEGER = 4
			-- The number of bytes in the `word_type'.

	blocks: ARRAYED_LIST [SHA_BLOCK_32]
			-- An array of blocks, holding the parsed message.

feature {NONE} -- Implementation

	anchor_block: SHA_BLOCK_32
			-- Used to create one instance from which to obtain constants
			-- that can't be accessed from a static context
			-- Redefine as a once feature
		do
			create Result
		end

	block_anchor: SHA_BLOCK_32
			-- Anchor for type used by the SHA calculations; 32 or 64 bits.
			-- Not to be called; just used to anchor types.
			-- Declared as a feature to avoid adding an attribute.
			-- This should be an ancestor of the NATURAL_xx types, but there
			-- is no such class.
		do
			check
				do_not_call: False then
					-- Because gives no info; simply used as anchor.
			end
		end

invariant

	is_padded implies is_one_padded

end
