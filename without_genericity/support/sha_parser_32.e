note
	description: "[
		A 32-bit implementation of an {SHA_PARSER}.

		This class redefines feature `blocks' along with the anchor features to
		use 32-bit classes and types.

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
			word_anchor,
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
			n: NATURAL_32
		do
			n := 0x80000000
				-- Check the last block
			b := blocks.last
			if b.count < {SHA_BLOCK_32}.words_per_block then
					-- There is room for one more value.
				b.put (n, b.count - 1)	-- an {SHA_BLOCK} is zero based
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
					b.put (0, i - 1)
					i := i + 1
				end
				create b
				blocks.extend (b)
			end
				-- For last block or block just created add zeros, leaving room for length vector
			from i := b.count
			until i >= {SHA_BLOCK_32}.words_per_block - 2
			loop
				b.put (0, i - 1)
				i := i + 1
			end
				-- Now add the length vectot.  Remember, a block is zero-based
			b.put (0, {SHA_BLOCK_32}.words_per_block - 2 - 1)
			b.put (message.count.as_natural_32, {SHA_BLOCK_32}.words_per_block - 1)
			is_padded := True
		end

	i_th_word (a_index: INTEGER_32): like word_anchor
			-- The `a_index'th word in the `file_pointer' input
		local
			i: INTEGER_32
		do
			i := (a_index - 1) * anchor_block.bytes_per_word
			Result := buffer.read_natural_32 (i)
		end

	partial_word: NATURAL_32
			-- The last word, when the bytes remaining are not enough to fill a word
		local
			i: INTEGER_32
			n8: NATURAL_32
		do
			from i := word_count * anchor_block.bytes_per_word + 1
			until i > byte_count
			loop
				n8 := buffer.read_natural_8 (i)		-- conversion to {NATURAL_32}
				Result := Result.bit_or (n8)
				Result := Result.bit_shift_left (8)
				check
					not_too_many_byte: i < anchor_block.bytes_per_word
						-- because this is a partial word
				end
				i := i + 1
			end
				-- Now, pad with a one for this special case (don't call `pad_with_one')
			n8 := 0x80000000
			Result := Result.bit_or (n8)
			is_one_padded := True
				-- Pad this word with trailing zeros
			from
			until i > anchor_block.bytes_per_word
			loop
				Result := Result.bit_shift_left (8)
				i := i + 1
			end
		end

--	partial_block: SHA_BLOCK_32
--			-- The last block, which does not have enough words to fill a block
--		do
--			create Result

--			check
--				false
--			end
--		end

--	read_block (a_index: INTEGER): SHA_BLOCK_32
--			-- Read the `a_index'th FULL block
--		require
--			has_full_blocks_remaining: block_count (a_position) > 0
--		local
--			i: INTEGER_32
----			w: NATURAL_32	-- a word
--		do
--			create Result
--			from i := 0
--			until i > {like block_anchor}.words_per_block - 1	-- zero based
--			loop
----				w := read_word (i)
--				Result.put (read_word (i), i)
--				i := i + 1
--			end
--		end

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


--	parse_string_32
--			-- Parse the `message' into "blocks" and "words", placing the words
--			-- into the  `blocks' list and adding the length (in bits) as the
--			-- last two words.
--			-- See FIBs Pub 180-4 (Mar 2012).
--		require
--			not_file_input: not is_file_parsing
--			is_32_bit_string: attached {IMMUTABLE_STRING_32} message
--		local
--			i, j, pos: INTEGER_32
--			fbc: INTEGER_32		-- full block count
--			rem: INTEGER_32	-- a remainder
--			b: SHA_BLOCK_32
--			n: NATURAL_32
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
--				rem := m.count \\ {SHA_BLOCK_32}.words_per_block
--				if rem > 0 then
--						-- There are characters on the end that will not completely fill a block
--						-- Get index of first of these remaining characters
--					i := fbc * {SHA_BLOCK_32}.words_per_block + 1
--					check
--						index_big_enough: i >= 1
--						index_small_enough: i <= m.count
--					end
--					create b
--					from
--						j := 0
--						i := i + j
--						pos := i + j
--					invariant
--						i > fbc * {SHA_BLOCK_32}.words_per_block and pos <= m.count and b.count < {SHA_BLOCK_32}.words_per_block
--					variant
--						m.count - pos
--					until pos > m.count
--					loop
--						pos := i + j
--						b.put (m.item (pos).natural_32_code, pos)
--						j := j + 1
--					end
--				end
--			end
--				-- Pad `blocks' with a trailing one bit and add count in last two words of last block
--			pad
--			is_padded := True
--			is_parsed := True
--		ensure
--			is_padded: is_padded
--			is_parsed: is_parsed
--		end

--	parse_file
--			-- Produce the `blocks' from the file named in `mesage_origin'
--		require
--			origin_is_file: is_file_parsing
--			filename_not_empty: not message.is_empty
--			filename_not_blank: not message.is_whitespace
--			file_exists: (create {RAW_FILE}.make_with_name (message)).exists
--		local
--			f: RAW_FILE
--			b: SHA_BLOCK_32
--			mp: MANAGED_POINTER
--			fbc: INTEGER_32		-- full bloc count
--			i, j, pos: INTEGER_32
--			rem: INTEGER_32	-- a remainder
--			b_count: INTEGER_32
--			n, n8: NATURAL_32
--		do
--			create f.make_open_read_write (message)
--				-- Create pointer with number of bytes in the file
--			create mp.make (f.count)
--				-- Read the whole file (i.e. number of bytes) into the pointer.
--			f.read_to_managed_pointer (mp, 0, f.count)
--				-- Read in as {NATURAL_32} values
--			fbc := mp.count // {SHA_BLOCK_32}.bytes_per_block
--			from i := 1
--			until i > fbc
--			loop
--					create b
--						-- Remember, a {SHA_BLOCK} is zero-based
--					from j := 0
--					until j > {SHA_BLOCK_32}.words_per_block - 1
--					loop
--						n := mp.read_natural_32 (i * j)
--						b.put (n, j)
--						j := j + 1
--					end
--				i := i + 1
--			end
--			rem := mp.count \\ {SHA_BLOCK_32}.bytes_per_block
--			if rem > 0 then
--					-- The bytes on the end of the {MANAGED_POINTER} are too few
--					-- to  completely fill a block.
--					-- Get index of first of these remaining characters
--				i := fbc * {SHA_BLOCK_32}.words_per_block + 1
--				check
--					index_big_enough: i >= 1
--					index_small_enough: i <= mp.count
--				end
--				create b
--				from
--					j := 0
--					i := i + j
--					pos := i
--				invariant
--					i > fbc * {SHA_BLOCK_32}.words_per_block and pos <= mp.count and b.count < {SHA_BLOCK_32}.words_per_block
--				variant
--					mp.count - (pos)
--				until pos > mp.count
--				loop
--					pos := i + j
--					if pos + {SHA_BLOCK_32}.bits_per_block <= mp.count then
--							-- There is at least one more value with  {SHA_BLOCK_32}.bits_per_word bits.
--						n := mp.read_natural_32 (pos)
--					else
--						check
--							is_some_bytes_remaining: pos + mp.natural_8_bytes <= mp.count
--								-- because would have jumped out earlier if not
--						end
--						check
--							not_full_word_reamining: pos + mp.natural_32_bits > mp.count
--								-- because the if conditional is false	
--						end
--							-- Must read the remaining 1 to 3  bytes and merge into a {NATURAL_32}
--						from
--						until pos > mp.count
--						loop
--							n8 := mp.read_natural_8 (pos)
--							n := n.bit_or (n8)
--							n := n.bit_shift_left (8)
--							pos := pos + mp.natural_8_bits
--							b_count := b_count + 1
--							check
--								not_too_many_bytes_read: b_count < {SHA_BLOCK_32}.bytes_per_word
--									-- because of above logic
--							end
--						end
--							-- Now, pad with a one for this special case (don't call `pad_with_one')
--						n8 := 0x80000000
--						n := n.bit_or (n8)
--						b_count := b_count + 1
--						is_one_padded := True
--						if b_count < {SHA_BLOCK_32}.bytes_per_word then
--								-- Pad this word with zeros
--							from
--							until b_count > {SHA_BLOCK_32}.bytes_per_word
--							loop
--								n := n.bit_shift_left (8)
--								n8 := 0x00000000
--								n := n.bit_or (n8)
--								b_count := b_count + 1
--							end
--						end
--					end
--					b.put (n, j)
--					j := j + 1
--				end
--			end
--				-- Pad `blocks' with a trailing one bit and add count in last two words of last block
--			pad
--			is_padded := True
--			is_parsed := True
--		ensure
--			is_one_padded: is_one_padded
--			is_padded: is_padded
--			is_parsed: is_parsed
--		end

feature {NONE} -- Implementation

	bits_per_word: INTEGER = 32
			-- The number of bits in the `word_type'.

	bytes_per_word: INTEGER = 4
			-- The number of bytes in the `word_type'.

	blocks: ARRAYED_LIST [SHA_BLOCK_32]
			-- An array of blocks, holding the parsed message.

feature {NONE} -- Implementation

	new_block: SHA_BLOCK_32
			-- Create a new {SHA_BLOCK_32}
		do
			create Result
		end

	anchor_block: SHA_BLOCK_32
			-- Used to create one instance from which to obtain constants
			-- that can't be accessed from a static context
			-- Redefine as a once feature
		do
			create Result
		end

	word_anchor: NATURAL_32
			-- Anchor for type used by the SHA calculations; 32 bits.
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

	block_anchor: SHA_BLOCK_32
			-- Anchor for type used by the SHA calculations; 32 bits.
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
