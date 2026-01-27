note
	description: "[
		Functions and interface specific to SHA-256 calculations
		]"
	author: "Jimmy J Johnson"
	date: "1/26/26"

class
	SHA_512

inherit

	SHA_HASHER_64

feature {NONE} -- Basic operations

	show_variables (t: INTEGER_32; a, b, c, d, e, f, g, h: NATURAL_64)
			-- Test routine to show intermediate calcuated values in the same format
			-- as FIPS PUB 180-2 (Aug 2002), page 42-
		do
			print ("t = " + t.out + " :  ")
			print (a.to_hex_string + "  " + b.to_hex_string + "  " + c.to_hex_string + "  " + d.to_hex_string + "%N")
			print ("%T" + e.to_hex_string + " " + f.to_hex_string + " " + g.to_hex_string + " " + h.to_hex_string + "%N")
		end

	calculate_imp
			-- Calculate and make result available in the `digest'
			-- See FIPS Pub 108-4 (Mar 2012) pages 24-25.
		local
			big_t_one, big_t_two: NATURAL_64
			a, b, c, d, e, f, g, h: NATURAL_64			-- the working variables
			i, t: INTEGER
		do
			create digest_imp
			check attached digest_imp as di then
				di.initialize
				from i := 1
				until i > blocks.count
				loop
							-- Step 1:  W_sub_t is calculated on the fly and memoized.
					message_schedule.clear_all
							-- Step 2:  Initilize the working variables with the (i-1)st
							-- hash value; the values are modified with `set_all' below.
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
						big_t_one := h + sigma_one_512 (e) + ch (e, f, g) + big_k [t] + w_sub_t (t, i)
						big_t_two := sigma_zero_512 (a) + maj (a, b, c)
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
							-- Step 4:  Compute the i-th intermedate hash value H(i)
					di.set_all (a + di.word_0, b + di.word_1, c + di.word_2, d + di.word_3,
								 e + di.word_4, f + di.word_5, g + di.word_6, h + di.word_7)
					i := i + 1
				end
			end
			is_calculated := True
		end

	w_sub_t (t, i: INTEGER): NATURAL_64
			-- The `t'-th word from the schedule of the hash for i-th block
			-- See FIPS Pub 180-4 (Mar 2012) page 24.
		local
			w_t2, w_t7, w_t15, w_t16: NATURAL_64
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
					Result := alpha_one_512 (w_t2) + w_t7 + alpha_zero_512 (w_t15) + w_t16
					message_schedule[t] := new_word_ref (Result)
				end
			end
		end

	sigma_zero_512 (x: NATURAL_64): NATURAL_64
			-- Function for use in SHA-384, SHA-512, SHA-512/224, and
			-- SHA-512/256 calculations which operate on 64-bit words.
			-- FIBS Pub 180-4 (Mar 2012) pages 11
		local
			rotr_28, rotr_34, rotr_39: NATURAL_64
		do
			rotr_28 := rotate_right (x, 28)
			rotr_34 := rotate_right (x, 34)
			rotr_39 := rotate_right (x, 39)
			Result := (rotr_28.bit_xor (rotr_34)).bit_xor (rotr_39)
		end

	sigma_one_512 (x: NATURAL_64): NATURAL_64
			-- Function for use in SHA-384, SHA-512, SHA-512/224, and
			-- SHA-512/256 which operate on 64-bit words.
			-- FIBS Pub 180-4 (Mar 2012) pages 11
		local
			rotr_14, rotr_18, rotr_41: NATURAL_64
		do
			rotr_14 := rotate_right (x, 14)
			rotr_18 := rotate_right (x, 18)
			rotr_41 := rotate_right (x, 41)
			Result := (rotr_14.bit_xor (rotr_18)).bit_xor (rotr_41)
		end

	alpha_zero_512 (x: NATURAL_64): NATURAL_64
			-- Function for use in SHA-384, SHA-512, SHA-512/224, and
			-- SHA-512/256 which operate on 64-bit words.
			-- FIBS Pub 180-4 (Mar 2012) pages 11
		local
			rotr_1, rotr_8, shr_7: NATURAL_64
		do
			rotr_1 := rotate_right (x, 1)
			rotr_8 := rotate_right (x, 8)
			shr_7 := right_shift (x, 7)
			Result := (rotr_1.bit_xor (rotr_8)).bit_xor (shr_7)
		end

	alpha_one_512 (x: NATURAL_64): NATURAL_64
			-- Function for use in SHA-384, SHA-512, SHA-512/224, and
			-- SHA-512/256 which operate on 64-bit words.
			-- FIBS Pub 180-4 (Mar 2012) pages 11
		local
			rotr_19, rotr_61, shr_6: NATURAL_64
		do
			rotr_19 := rotate_right (x, 19)
			rotr_61 := rotate_right (x, 61)
			shr_6 := right_shift (x, 6)
			Result := (rotr_19.bit_xor (rotr_61)).bit_xor (shr_6)
		end

	Upper_index: INTEGER = 79
			-- One less than the number of intermediate hash calculations
			-- performed by the algorithm; the index of the last calculation
			-- or accessed word.  "SHA-384, SHA-512, SHA-512/224 and SHA-512/256
			-- use the same sequence of eighty constant64-bit words	..." stored
			-- in feature `big_k'.
			-- See FIPS Pub 180-4 (Mar 2012) page 12.

	big_k: ARRAY [NATURAL_64]
			-- Zero-based array holding constants (represented by "K") in
			-- FIPS Pub 180-4 (Mar 2012) pages 11-12.
			-- See FIPS Pub 180-4 (Mar 2012) page 12.
		once
			Result := {ARRAY [NATURAL_64]} <<
				0x428a2f98d728ae22, 0x7137449123ef65cd, 0xb5c0fbcfec4d3b2f, 0xe9b5dba58189dbbc,
				0x3956c25bf348b538, 0x59f111f1b605d019, 0x923f82a4af194f9b, 0xab1c5ed5da6d8118,
				0xd807aa98a3030242, 0x12835b0145706fbe, 0x243185be4ee4b28c, 0x550c7dc3d5ffb4e2,
				0x72be5d74f27b896f, 0x80deb1fe3b1696b1, 0x9bdc06a725c71235, 0xc19bf174cf692694,
				0xe49b69c19ef14ad2, 0xefbe4786384f25e3, 0x0fc19dc68b8cd5b5, 0x240ca1cc77ac9c65,
				0x2de92c6f592b0275, 0x4a7484aa6ea6e483, 0x5cb0a9dcbd41fbd4, 0x76f988da831153b5,
				0x983e5152ee66dfab, 0xa831c66d2db43210, 0xb00327c898fb213f, 0xbf597fc7beef0ee4,
				0xc6e00bf33da88fc2, 0xd5a79147930aa725, 0x06ca6351e003826f, 0x142929670a0e6e70,
				0x27b70a8546d22ffc, 0x2e1b21385c26c926, 0x4d2c6dfc5ac42aed, 0x53380d139d95b3df,
				0x650a73548baf63de, 0x766a0abb3c77b2a8, 0x81c2c92e47edaee6, 0x92722c851482353b,
				0xa2bfe8a14cf10364, 0xa81a664bbc423001, 0xc24b8b70d0f89791, 0xc76c51a30654be30,
				0xd192e819d6ef5218, 0xd69906245565a910, 0xf40e35855771202a, 0x106aa07032bbd1b8,
				0x19a4c116b8d2d0c8, 0x1e376c085141ab53, 0x2748774cdf8eeb99, 0x34b0bcb5e19b48a8,
				0x391c0cb3c5c95a63, 0x4ed8aa4ae3418acb, 0x5b9cca4f7763e373, 0x682e6ff3d6b2b8a3,
				0x748f82ee5defb2fc, 0x78a5636f43172f60, 0x84c87814a1f0ab72, 0x8cc702081a6439ec,
				0x90befffa23631e28, 0xa4506cebde82bde9, 0xbef9a3f7b2c67915, 0xc67178f2e372532b,
				0xca273eceea26619c, 0xd186b8c721c0c207, 0xeada7dd6cde0eb1e, 0xf57d4f7fee6ed178,
				0x06f067aa72176fba, 0x0a637dc5a2c898a6, 0x113f9804bef90dae, 0x1b710b35131c471b,
				0x28db77f523047d84, 0x32caab7b40c72493, 0x3c9ebe0a15c9bebc, 0x431d67c49c100d4c,
				0x4cc5d4becb3e42b6, 0x597f299cfc657e2a, 0x5fcb6fab3ad6faec, 0x6c44198c4a475817
				>>
			Result.rebase (0)
		end

	digest_imp: detachable SHA_512_DIGEST
			-- Allow dynamic programming in `digest'.	

end
