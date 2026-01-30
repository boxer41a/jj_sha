note
	description: "[
		A 32-bit implementation of an {SHA_PARSER}.

		This class implements `pad', which adds a one to `message' and rounds
		its size off to a word boundary, and `parse', which places the message
		bytes into blocks as words in preparation for use by an {SHA_HASHER}.

		See FIPS Pub 108-4 (Mar 2012)
		]"
	author: "Jimmy J Johnson"
	date: "1/13/26"

class
	SHA_PARSER_32

inherit

	SHA_PARSER

feature {NONE} -- Implementation

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
			n: NATURAL_32
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
				-- Now add the length vector.  Remember, a block is zero-based
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
		require else
			index_big_enough: a_index >= 0
			zero_index_implication: a_index = 0 implies byte_count = 0
			index_small_enough: a_index <= block_count
		local
			i: INTEGER_32
			w: NATURAL_32
		do
			if a_index = 0 then
					-- Special case to create an all-zero block
				create Result
				from i := 1
				until i > {SHA_BLOCK_32}.words_per_block
				loop
					Result.put (0, i - 1)
					i := i + 1
				end
			else
				create Result
				from i := 1
				until i > {SHA_BLOCK_32}.words_per_block
				loop
					w := i_th_word (a_index + i)
					Result.put (w, i - 1)		-- a {SHA_BLOCK} is zero based
					i := i + 1
				end
			end
		ensure then
--			block_is_full: Result.count = anchor_block.words_per_block
		end

	partial_block: SHA_BLOCK_32
			-- The last block, which does not have enough words to fill a block
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
		end

feature {NONE} -- Implementation

	anchor_block: SHA_BLOCK_32
			-- Object from which to obtain constants, when a static contect
			-- is not allowed
		once
			create Result
		end

end
