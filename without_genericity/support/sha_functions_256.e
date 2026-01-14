note
	description: "[
		Functions specific to SHA-224 and SHA SHA-256 calculations.

		See FIPS Pub 180-4 (Mar 2012).
		]"
	author: "Jimmy J. Johnson"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	SHA_FUNCTIONS_256

inherit

	SHA_PARSER_32

feature {NONE} -- Basic operations

	calculate_imp
			-- Calculate and make result available in the `digest'
			-- See FIPS Pub 108-4 (Mar 2012) pages 22-23.
		local
			big_t_one, big_t_two: NATURAL_32
			a, b, c, d, e, f, g, h: NATURAL_32		-- the working variables
			i, t: INTEGER
		do
			check attached digest_imp as di then
				di.initialize
				from i := 1
				until i > blocks.count
				loop
						-- Step 1:  W_sub_t calculated on the fly and memoized.
					message_schedule.clear_all
						-- Step 2:  Initilize the working variables with the
						-- (i-1)st hash value (i.e. the values from the previous
						-- iteration); modified below with `set_all'.
					a := di.word_0
					b := di.word_1
					c := di.word_2
					d := di.word_3
					e := di.word_4
					f := di.word_5
					g := di.word_6
					h := di.word_7
							-- Step 3:  for t = 0 to 79
					from t := 0
					until t > Upper_index
					loop
						big_t_one := h + sigma_one_256 (e) + ch (e, f, g) + big_k [t] + w_sub_t (t, i)
						big_t_two := sigma_zero_256 (a) + maj (a, b, c)
						h := g
						g := f
						f := e
						e := d + big_t_one
						d := c
						c := b
						b := a
						a := big_t_one + big_t_two
						t := t + 1
					end
						-- Step 4:  Compute the i-th intermediate hash value H(i)
					di.set_all (a + di.word_0, b + di.word_1, c + di.word_2, d + di.word_3,
								 e + di.word_4, f + di.word_5, g + di.word_6, h + di.word_7)
					i := i + 1
				end
			end
		end

	w_sub_t (t, i: INTEGER): NATURAL_32
			-- The `t'-th word from the schedule of the hash for i-th block.
			-- See FIPS Pub 180-4 (Mar 2012) page 22.
		local
			w_t2, w_t7, w_t15, w_t16: NATURAL_32
		do
			if attached message_schedule.item (t) as w_ref then
				Result := w_ref.item
			else
				if t <= 15 then
					Result := blocks[i].item (t)
					message_schedule [t] := new_word_ref (Result)
				else
					w_t2 := w_sub_t (t - 2, i)
					w_t7 := w_sub_t (t - 7, i)
					w_t15 := w_sub_t (t - 15, i)
					w_t16 := w_sub_t (t - 16, i)
					Result := alpha_one_256 (w_t2) + w_t7 + alpha_zero_256 (w_t15) + w_t16
					message_schedule[t] := new_word_ref (Result)
				end
			end
		end

	sigma_zero_256 (x: NATURAL_32): NATURAL_32
			-- Function for use in SHA-224 and SHA-256 calculations, which
			-- operate on 32-bit words.
			-- FIBS Pub 180-4 (Mar 2012) pages 10
		require
			correct_word_bit_count: bits_per_word = 32
		local
			rotr_2, rotr_13, rotr_22: NATURAL_32
		do
			rotr_2 := rotate_right (x, 2)
			rotr_13 := rotate_right (x, 13)
			rotr_22 := rotate_right (x, 22)
			Result := (rotr_2.bit_xor (rotr_13)).bit_xor (rotr_22)
		end

	sigma_one_256 (x: NATURAL_32): NATURAL_32
			-- Function for use in SHA-224 and SHA-256 calculations, which
			-- operate on 32-bit words.
			-- FIBS Pub 180-4 (Mar 2012) pages 10
		require
			correct_word_bit_count: bits_per_word = 32
		local
			rotr_6, rotr_11, rotr_25: NATURAL_32
		do
			rotr_6 := rotate_right (x, 6)
			rotr_11 := rotate_right (x, 11)
			rotr_25 := rotate_right (x, 25)
			Result := (rotr_6.bit_xor (rotr_11)).bit_xor (rotr_25)
		end

	alpha_zero_256 (x: NATURAL_32): NATURAL_32
			-- Function for use in SHA-224 and SHA-256, which
			-- operate on 32-bit words.
			-- FIBS Pub 180-4 (Mar 2012) pages 10
		require
			correct_word_bit_count: bits_per_word = 32
		local
			rotr_7, rotr_18, shr_3: NATURAL_32
		do
			rotr_7 := rotate_right (x, 7)
			rotr_18 := rotate_right (x, 18)
			shr_3 := right_shift (x, 3)
			Result := (rotr_7.bit_xor (rotr_18)).bit_xor (shr_3)
		end

	alpha_one_256 (x: NATURAL_32): NATURAL_32
			-- Function for use in SHA-224 and SHA-256, which
			-- operate on 32-bit words.
			-- FIBS Pub 180-4 (Mar 2012) pages 10
		require
			correct_word_bit_count: bits_per_word = 32
		local
			rotr_17, rotr_19, shr_10: NATURAL_32
		do
			rotr_17 := rotate_right (x, 17)
			rotr_19 := rotate_right (x, 19)
			shr_10 := right_shift (x, 10)
			Result := (rotr_17.bit_xor (rotr_19)).bit_xor (shr_10)
		end

	Upper_index: INTEGER = 63
			-- One less than the number of intermediate hash calculations
			-- performed by the algorithm; the index of the last calculation
			-- or accessed word.  "SHA-224 and SHA-256 use the same sequence of
			-- sixty-four constant 32-bit words..." stored in the `big_k' array.
			-- See FIPS Pub 180-4 (Mar 2012) page 11.

	big_k: ARRAY [NATURAL_32]
			-- Zero-based array holding constants (represented by "K") in
			-- FIPS Pub 180-4 (Mar 2012) pages 11-12.
			-- See FIPS Pub 180-4 (Mar 2012) page 11.
			-- Reminder: cannot use anchor (i.e. NATURAL_32) as the result
			-- of a once feature.
		once
			Result := {ARRAY [NATURAL_32]} <<
				0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
				0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
				0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
				0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
				0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
				0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
				0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
				0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2
				>>
			Result.rebase (0)
		end

end
