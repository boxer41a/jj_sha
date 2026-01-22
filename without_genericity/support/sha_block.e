note
	description: "[
		One block of sixteen, 32- or 64-bit values used by an {SHA_PARSER}
		in the Secure Hash Algorithms.
		]"
	author: "Jimmy J Johnson"
	date: "1/15/26"

deferred class
	SHA_BLOCK

inherit

	ANY
		redefine
			default_create
		end

feature {NONE} -- Initialization

	default_create
			-- Create an instance where each `item' is equal to zero
		do
			create imp.make_filled (zero_word, 0, 15)
--			create indexes_imp.make (16)
		end

feature -- Access

	zero_word: NUMERIC
			-- To get a value of correct type for array
		deferred
		end

	count: INTEGER_32
			-- The number of values in the block
		do
			Result := imp.count
		end

	words_per_block: INTEGER_32 = 16
			-- Number of entries (i.e. words) in a block

	items_per_word: INTEGER_32
			-- The number of input `item' in a word
			-- One for 32-bit representations and two for 64 bit representations
		deferred
		ensure
			valid_result: Result = 1 or Result = 2
		end

	bits_per_block: INTEGER_32
			-- The number of bits in Current
		deferred
		end

	bytes_per_block: INTEGER_32
			-- The number of 8-bit bytes in Current
			-- bit_count bits / (8 bits / byte) = 128
		deferred
		end

	bytes_per_item: INTEGER_32
			-- The number of bytes in each {NUMERIC} item in the block
		deferred
		end

	bytes_per_word: INTEGER_32
			-- The number of bytes in a word
		deferred
		end

--	count: INTEGER_32
--			-- The number of words in Current
--		do
--			Result := imp.count
----			Result := indexes_imp.count
--		end

--	item (a_index: INTEGER_32): like word_anchor
--			-- The value at `a_index'
--			-- Zero based to work with the {SHA_HASHER} calculations
--		require
--			index_big_enough: a_index >= 0
--			index_small_enough: a_index <= words_per_block - 1
--		deferred
----			Result := imp.item (a_index)
--		end

	item (a_index: INTEGER): NUMERIC
			-- The value at `a_index'
		require
			index_big_enough: a_index >= 0
			index_small_enough: a_index <= words_per_block - 1
		deferred
				-- Do not try to anchor the result to `word_type'.  Anchoring will
				-- cause a seg fault due, I think, to what Alexander said in message
				-- https://groups.google.com/g/eiffel-users/c/Ha7_Ig8FsAM/m/cHuue2-9BwAJ.
				-- Anchoring this feature combined with the genericity of the array `imp'
				-- is probably what the type of senario to which he was refering.
----			Result := imp.item (a_index)
		end

feature -- Basic_operations

--	extend (a_value: like word_anchor)
--			-- Add `a_value' to the end
--		require
----			index_big_enough: a_index >= 0
----			index_small_enough: a_index <= words_per_block -1
--			not_full: count <= words_per_block
--		deferred
----			imp.put (a_value, a_index)
--		ensure
--			count_big_enough: count >= 1
--			count_small_enough: count <= words_per_block
--			one_more: count = old count + 1
--			is_inserted: imp.last = a_value
--		end

--	put_i_th (a_value: like word_anchor; a_index: INTEGER_32)
--			-- Replace the `a_value' at `a_index' with `a_value'
--			-- Indexing is zero based to work with {SHA_HASHER} calculations.
--		require
--			index_big_enough: a_index >= 0
--			index_small_enough: a_index <= words_per_block - 1
--		deferred
----			imp.put (a_value, a_index)
--		ensure
--			count_big_enough: count >= 1
--			count_small_enough: count <= words_per_block
--			one_more: count = old count + 1
--			is_inserted: imp.last = a_value
--		end


	put (a_value: NUMERIC; a_index: INTEGER_32)
			-- Replace `a_index'-th entry, if in index interval, by `a_value'.
		require
			index_big_enough: a_index >= 0
			index_small_enough: a_index <= words_per_block - 1
--			not_index_used: not has_index (a_index)
		deferred
				-- Do not try to anchor `a_value' to `word_type'.  Anchoring will
				-- cause a seg fault due, I think, to what Alexander said in message
				-- https://groups.google.com/g/eiffel-users/c/Ha7_Ig8FsAM/m/cHuue2-9BwAJ.
				-- Anchoring this feature combined with the genericity of the array `imp'
				-- is probably what the type of senario to which he was refering.
----			imp.put (a_value, a_index)
		ensure
			is_inserted: item (a_index) = a_value
--			has_index: has_index (a_index)
		end

feature -- Query

--	has_index (a_index: INTEGER_32): BOOLEAN
--			-- Has an item been `put' into Current at `a_index'?
--		do
--			Result := indexes_imp.has (a_index)
--		end

feature {NONE} -- Implementation

	imp: ARRAY [NUMERIC]
			-- Implemetation structure to hold the words.	

--	indexes_imp: ARRAYED_SET [INTEGER_32]
			-- A set of indexes for which `put' has been called.
			-- This is easier than changing `imp' to an {ARRAYED_LIST} to get a count

feature {NONE} -- Anchors

	word_anchor: NUMERIC
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

end
