note
	description: "[
		Represents one block containing sixteen 32-bit values produced 
		by SHA_PARSER_32 in the Secure Hash Algorithms.
		]"
	author: "Jimmy J Johnson"
	date: "1/14/26"

class
	SHA_BLOCK_32

inherit

	SHA_BLOCK
		redefine
			default_create
		end

feature {NONE} -- Initialization

	default_create
			-- Create an instance where each `item' is equal to zero
		do
			Precursor
			create imp.make_filled (0, 0, 15)
		end

feature -- Access

	items_per_word: INTEGER_32 = 1
			-- The number of items (1 or 2) that make up a word

	bits_per_block: INTEGER_32 = 512
			-- The number of bits in Current
			-- 32 bits / item * 16 items = 512 bits

	bytes_per_block: INTEGER_32 = 64
			-- The number of 8-bit bytes in Current

	bytes_per_item: INTEGER_32 = 4
			-- The number of bytes in each word

	bytes_per_word: INTEGER_32 = 4
			-- The number of bytes in each {NUMERIC} item in the block

	item (a_index: INTEGER_32): NATURAL_32
			-- The value at `a_index'
			-- Zero based to work with the {SHA_HASHER} calculations
		require
			index_big_enough: a_index >= 0
			index_small_enough: a_index <= words_per_block - 1
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
			-- Replace `a_index'-th entry, if in index interval, by `a_value'.
		require
			index_big_enough: a_index >= 0
			index_small_enough: a_index <= words_per_block - 1
			not_index_used: not has_index (a_index)
		do
			imp.put (a_value, a_index)
			indexes_imp.extend (a_index)
		ensure
			is_inserted: item (a_index) = a_value
			has_index: has_index (a_index)
		end

feature {NONE} -- Implementation

	imp: ARRAY [NATURAL_32]
			-- Implemetation structure to hold the words.	

end
