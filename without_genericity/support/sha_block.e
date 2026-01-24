note
	description: "[
		Base class for {SHA_BLOCK_32} and {SHA_BLOCK_64} which
		hold sixteen 32-bit or 64-bit words for use in SHA calculatins.

		See FIPS Pub 108-4 (Mar 2012)
		
		This class does not know the implementaton of the "blocks".
		In the descendants, `blocks' is defined as an ARRAY of {NATURA_32}
		or {NATURAL_64}.  It would be nice to have been able to declare
			blocks: ARRAY [NUMERIC]
		here as deferred, but trying to change from a reference type to an
		expanded type in a generic context seems to cause segmentation
		faults.  See Alexander's answer near to bottom of the newsgroup
		message at:
			https://groups.google.com/g/eiffel-users/c/Ha7_Ig8FsAM/m/cHuue2-9BwAJ
			
		This class defines as much as possible here.
		
		Feature `indexes_imp' requires some explanation.  In the descendants,
		defining `blocks' as a zero-based ARRAY works well with the algorithms
		in the FIPS Pub, but some features need to know the number of items
		that have been `put' into a `blocks' ARRAY.  Unfortunatedly, `count' from
		ARRAY returns the capacity (i.e. it is always full in this context).  Feature
		`indexes_imp' allows a feature to `update_index' at which an item has
		been placed, so that the count can be obtained and to prevent placing
		a value at an index more than once.
		]"
	author: "Jimmy J Johnson"
	date: "1/24/26"

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
			create indexes_imp.make (16)
		end

feature -- Access

	words_per_block: INTEGER_32 = 16
			-- Number of entries (i.e. words) in a block

	items_per_word: INTEGER_32
			-- The number of items (1 or 2) that make up a word
		deferred
		end

	bits_per_block: INTEGER_32
			-- The number of bits in Current
			-- 32 bits / item * 16 items = 512 bits
		deferred
		end

	bytes_per_block: INTEGER_32
			-- The number of 8-bit bytes in Current
			-- bit_count bits / (4 bits / byte) = 128
		deferred
		end

	bytes_per_item: INTEGER_32
			-- The number of bytes in each word
		deferred
		end

	bytes_per_word: INTEGER_32
			-- The number of bytes in each {NUMERIC} item in the block
		deferred
		end

	count: INTEGER_32
			-- Number of items `put' into Current
		do
			Result := indexes_imp.count
		end

feature -- Query

	has_index (a_index: INTEGER_32): BOOLEAN
			-- Has a value been added at `a_index'?
		do
			Result := indexes_imp.has (a_index)
		end

feature {NONE} -- Implementation

	indexes_imp: ARRAYED_SET [INTEGER_32]
			-- To keep track of number of items `put' into Current while maintaining
			-- the ARRAY implemention

end
