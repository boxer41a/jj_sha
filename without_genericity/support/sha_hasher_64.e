note
	description: "[
		Top-level class for 64-bit hasher operations used by Secure Hash
		Algorithm classes.
	]"
	author: "Jimmy J Johnson"
	date: "1/26/26"

deferred class
	SHA_HASHER_64

inherit

	SHA_PARSER_64
		redefine
			default_create,
			reset_status_flags
		end

	SHA_HASHER
		redefine
			default_create,
			reset_status_flags
		end

feature {NONE} -- Initialization

	default_create
			-- Initialize Current
		do
			Precursor {SHA_PARSER_64}
			create message_schedule.make_filled (Void, 0, Upper_index)
		end

feature -- Status setting

	reset_status_flags
			-- Set parsing and hashing flags to false
		do
			Precursor {SHA_PARSER_64}
			Precursor {SHA_HASHER}
		end

feature {NONE} -- Basic operations

	rotate_left (x: NATURAL_64; n: INTEGER): NATURAL_64
			-- Circular left shift of 'x' by `n'
			-- (x << n) v (x >> w-n) where w = 32
			-- FIBS Pub 180-4 (Mar 2012) pages 8-9
		require
			n_big_enough: n >= 0
			n_small_enough: n < 32
		do
			Result := x.bit_shift_left (n) | x.bit_shift_right (32 - n)
		end

	rotate_right (x: NATURAL_64; n: INTEGER): NATURAL_64
			-- Circular right shift of 'x' by `n'
			-- (x >> n) v (x << w-n) where w = `32'
			-- FIBS Pub 180-4 (Mar 2012) pages 8-9
		require
			n_big_enough: n >= 0
			n_small_enough: n < 64
		do
			Result := x.bit_shift_right (n) | x.bit_shift_left (32 - n)
		end

	right_shift (x: NATURAL_64; n: INTEGER): NATURAL_64
			-- The "right shift" function used by SHA-224, SHA-256, SHA-384,
			-- SHA-512, SHA-512/224, and SHA-512/256 as defined in
			-- FIBS Pub 180-4 (Mar 2012) page 8.
		require
			n_big_enough: n >= 0
			n_small_enough: n < 64
		do
			Result := x.bit_shift_right (n)
		end

	ch (x, y, z: NATURAL_64): NATURAL_64
			-- The "Ch(x,y,z)" function as defined in
			-- FIBS Pub 180-4 (Mar 2012) pages 10-11.
		do
			Result := (x & y).bit_xor (x.bit_not & z)
		end

	maj (x, y, z: NATURAL_64): NATURAL_64
			-- The "Maj(x,y,z)" function as defined in
			-- FIBS Pub 180-4 (Mar 2012) pages 10-11.
		do
			Result := ((x & y).bit_xor (x & z)).bit_xor (y & z)
		end

	w_sub_t (t, i: INTEGER): NATURAL_64
			-- The `t'-th word from the schedule of the hash for i-th block.
			-- See FIPS Pub 180-4 (Mar 2012) page 19.
		require
			t_big_enough: t >= 0
			t_small_enough: t <= Upper_index
			i_big_enough: i >= 1
			i_small_enough: i <= blocks.count
		deferred
		end

	Upper_index: INTEGER_32
			-- One less than the number of intermediate hash calculations
			-- performed by the algorithm; the index of the last calculation
			-- or accessed word.
		deferred
		ensure
			valid_result: Result = 79 or Result = 63
		end

feature {NONE} -- Implementation

	message_schedule: ARRAY [detachable like new_word_ref]
			-- The message schedule for this hash iteration.  This feature
			-- allows dynamic programming, saving values as they are calculated.

	new_word_ref (a_word: NATURAL_64): CELL [NATURAL_64]
			-- Create a new reference containing `a_word' stored in `blocks'.
		do
			create Result.put (a_word)
		end

end
