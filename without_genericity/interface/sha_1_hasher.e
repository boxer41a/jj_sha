note
	description: "[
		Functions specific to SHA-1 calculations.

		See FIPS Pub 180-4 (Mar 2012).
		]"
	author: "Jimmy J. Johnson"
	date: "$Date$"
	revision: "$Revision$"

class
	SHA_1_HASHER

inherit

	SHA_HASHER_32
		redefine
			default_create
		end

feature {NONE} -- Initialization

	default_create
			-- Initialize Current
		do
			Precursor
			create message_schedule.make_filled (Void, 0, Upper_index)
		end

feature {NONE} -- Basic operations

	calculate_imp
			-- Calculate and make result available in the `digest'
			-- FIPS Pub 108-4 (Mar 2012).pdf (page 18-20)
		local
			big_T, a, b, c, d, e: NATURAL_32	-- the working variables
			i, t: INTEGER
		do
			create digest_imp
			check attached digest_imp as di then
				di.initialize
				from i := 1
				until i > blocks.count
				loop
					message_schedule.clear_all
							-- Step 2:  Initilize the working variables with
							-- the (i-1)st hash value
					a := di.word_0
					b := di.word_1
					c := di.word_2
					d := di.word_3
					e := di.word_4
							-- Step 3:  for t = 0 to 79
					from t := 0
					until t > Upper_index
					loop
						big_T := rotate_left (a, 5) + f_sub_t (t, b, c, d) + e + big_k [t] + w_sub_t (t, i)
						e := d
						d := c
						c := rotate_left (b, 30)
						b := a
						a := big_T
						t := t + 1
					end
							-- Step 4:  Compute the i-th intermedate hash value H(i)
					di.set_five (a + di.word_0, b + di.word_1, c + di.word_2, d + di.word_3, e + di.word_4)
					i := i + 1
				end
			end
		end

	w_sub_t (t, i: INTEGER): NATURAL_32
			-- The `t'-th word from the schedule of the hash for i-th block.
			-- See FIPS Pub 180-4 (Mar 2012) page 19.
		local
			w_t3, w_t8, w_t14, w_t16: NATURAL_32
			w: NATURAL_32
		do
			if attached message_schedule.item (t) as w_ref then
				Result := w_ref.item
			else
				if t <= 15 then
					Result := blocks[i].item (t)
					message_schedule [t] := new_word_ref (Result)
				else
					w_t3 := w_sub_t (t - 3, i)
					w_t8 := w_sub_t (t - 8, i)
					w_t14 := w_sub_t (t - 14, i)
					w_t16 := w_sub_t (t - 16, i)
					w := ((w_t3.bit_xor (w_t8)).bit_xor (w_t14)).bit_xor (w_t16)
					Result := rotate_left (w, 1)
					message_schedule[t] := new_word_ref (Result)
				end
			end
		end

	message_schedule: ARRAY [detachable like new_word_ref]
			-- The message schedule for this hash iteration.  This feature
			-- allows dynamic programming, saving values as they are calculated.

	new_word_ref (a_word: NATURAL_32): CELL [NATURAL_32]
			-- Create a new reference containing `a_word' stored in `blocks'.
		do
			create Result.put (a_word)
		end

	parity (x, y, z: NATURAL_32): NATURAL_32
			-- The "Parity(x,y,z)" function as defined in FIBS Pub 180-4
			-- (Mar 2012) pages 10-11 Used in SHA-1 calculations only.
		do
			Result := (x.bit_xor (y)).bit_xor (z)
		end

	f_sub_t (t: INTEGER; x, y, z: NATURAL_32): NATURAL_32
			-- The function specific to SHA-1, as defined in
			-- FIBS Pub 180-4 (Mar 2012) pages 10-11.
		require
			t_large_enough: t >= 0
			t_small_enough: t <= Upper_index
		do
			inspect t
			when 0..19 then
				Result := ch (x, y, z)
			when 20..39 then
				Result := parity (x, y, z)
			when 40..59 then
				Result := maj (x, y, z)
			when 60..79 then
				Result := parity (x, y, z)
			else
				check
					should_not_happen: False then
						-- because of precondition
				end
			end
		end

	big_k: ARRAY [NATURAL_32]
			-- Zero-based array holding constants (represented by "K") in
			-- FIPS Pub 180-4 (Mar 2012) pages 11-12.
			-- See FIPS Pub 180-4 (Mar 2012) page 11.
		local
			i: INTEGER
		once
				-- This could have been coded as a multi-branch "inspect"
				-- statement, but using an array is more general
			create Result.make_filled (0, 0, Upper_index)
				-- 0..19
			from i := 0
			until i > 19
			loop
				Result [i] := 0x5a827999
				i := i + 1
			end
				-- 20..39
			from i := 20
			until i > 39
			loop
				Result [i] := 0x6ed9eba1
				i := i + 1
			end
				-- 40..59
			from i := 40
			until i > 59
			loop
				Result [i] := 0x8f1bbcdc
				i := i + 1
			end
				-- 60..79
			from i := 60
			until i > 79
			loop
				Result [i] := 0xca62c1d6
				i := i + 1
			end
		end

	Upper_index: INTEGER = 79
			-- One less than the number of intermediate hash calculations
			-- performed by the algorithm; the index of the last calculation
			-- or accessed word.  "SHA-1 uses a sequence of eighty constant
			-- 32-bit words..." stored in the `big_k' array.
			-- See FIPS Pub 180-4 (Mar 2012) page 11.

	digest_imp: detachable SHA_DIGEST_1
			-- Allow dynamic programming in `digest'.

end
