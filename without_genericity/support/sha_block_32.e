note
	description: "[
		Represents one block of sixteen 32-bit values produced by SHA_PARSER_32 
		in the Secure Hash Algorithms.
		]"
	author: "Jimmy J Johnson"
	date: "1/14/26"

class
	SHA_BLOCK_32

inherit

	SHA_BLOCK
		redefine
			word_anchor
		end

feature -- Access

	zero_word: NATURAL_32 = 0
			-- To get a value of correct type for array

	count: INTEGER_32
			-- The number of values in the block
		do
			Result := imp.count
		end

	items_per_word: INTEGER_32 = 1
			-- The number of items (1 or 2) that make up a word

	bits_per_block: INTEGER_32 = 512
			-- The number of bits in Current
			-- 32 bits / item * 16 items = 512 bits

	bytes_per_block: INTEGER_32 = 128
			-- The number of 8-bit bytes in Current
			-- bit_count bits / (4 bits / byte) = 128

	bytes_per_item: INTEGER_32 = 4
			-- The number of bytes in each word

	bytes_per_word: INTEGER_32 = 4
			-- The number of bytes in each {NUMERIC} item in the block

feature {NONE} -- Implementation

--	imp: ARRAY [NATURAL_32]
--			-- Implemetation structure to hold the words.	

	word_anchor: NATURAL_32
			-- Anchor for type used by the SHA calculations; 32 or 64 bits.
			-- Not to be called; just used to anchor types.
			-- Declared as a feature to avoid adding an attribute.
			-- This should be an ancestor of the NATURAL_xx types, but there
			-- is no such class.
		require else
			not_callable: False
		do
			check
				do_not_call: False then
					-- Because gives no info; simply used as anchor.
			end
		end
end
