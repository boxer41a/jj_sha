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
		end

feature -- Access

	item (a_index: INTEGER): like word_anchor
			-- The value at `a_index'
		require
			index_big_enough: a_index >= 0
			index_small_enough: a_index <= words_per_block - 1
		do
			Result := imp.item (a_index)
		end

	zero_word: like word_anchor
			-- To get a value of correct type for array
		deferred
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

feature -- Basic_operations

	put (a_value: like zero_word; a_index: INTEGER)
			-- Replace `a_index'-th entry, if in index interval, by `a_value'.
		require
			index_big_enough: a_index >= 0
			index_small_enough: a_index <= words_per_block -1
		do
			imp.put (a_value, a_index)
		ensure
			is_inserted: item (a_index) = a_value
		end

feature {NONE} -- Implementation

	imp: ARRAY [like word_anchor]
			-- Implemetation structure to hold the words.	

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
