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
			imp,
			word_anchor
		end

feature -- Access

	zero_word: NATURAL_32 = 0
			-- To get a value of correct type for array

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

	item (a_index: INTEGER_32): NATURAL_32
			-- The value at `a_index'
			-- Zero based to work with the {SHA_HASHER} calculations
		do
				-- Do not try to anchor the result to `word_type'.  Anchoring will
				-- cause a seg fault due, I think, to what Alexander said in message
				-- https://groups.google.com/g/eiffel-users/c/Ha7_Ig8FsAM/m/cHuue2-9BwAJ.
				-- Anchoring this feature combined with the genericity of the array `imp'
				-- is probably what the type of senario to which he was refering.
			Result := imp.item (a_index)
		end

feature -- Basic_operations

	put (a_value: NATURAL_32; a_index: INTEGER_32)
			-- Replace the `a_value' at `a_index' with `a_value'
			-- Indexing is zero based to work with {SHA_HASHER} calculations.
		do
				-- Do not try to anchor `a_value' to `word_type'.  Anchoring will
				-- cause a seg fault due, I think, to what Alexander said in message
				-- https://groups.google.com/g/eiffel-users/c/Ha7_Ig8FsAM/m/cHuue2-9BwAJ.
				-- Anchoring this feature combined with the genericity of the array `imp'
				-- is probably what the type of senario to which he was refering.
			imp.put (a_value, a_index)
--			indexes_imp.extend (a_index)
		end

feature {NONE} -- Implementation

	imp: ARRAY [NATURAL_32]
			-- Implemetation structure to hold the words.	

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
