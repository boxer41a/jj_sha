note
	description: "[
		Base class for the parser classes which are used to preprocess and pad
		messages before calculation of a `digest' in the Secure Hash Algorithm
		(SHA) classes (e.g. {SHA_1}, {SHA_256} and {SHA_224}).

		This class implements `pad', which adds a one to `message' and rounds
		its size off to a word boundary, and `parse', which places the message
		bytes into blocks as words in preparation for `calculate'.

		See FIPS Pub 108-4 (Mar 2012)
		]"
	author: "Jimmy J Johnson"
	date: "1/13/26"

deferred class
	SHA_PARSER_32

inherit

	SHA_32
		redefine
			default_create
		end

feature {NONE} -- Initialization

	default_create
			-- Initialize Current
		do
			Precursor
			create blocks.make (5)
			create message_schedule.make_filled (Void, 0, Upper_index)
		end

feature {NONE} -- Basic operations

	pad
			-- Add a one (really a byte containing a one in the high order bit
			-- followed by seven zero's) after the last bit in `message'.
		local
			n: NATURAL_8
		do
				-- Add the one as the left-most nibble in a byte
				-- (i.e. 0x80 or 0b10000000)
			n := 0x80
			message.extend (n)
				-- Round off the "word" with zeros
			from
			until (message.count \\ bytes_per_word) = 0
			loop
				message.extend (n.zero)
			end
			is_padded := true
		end

	parse
			-- Parse the `message' into "blocks" and "words", placing the words
			-- into the  `blocks' list and adding the length (in bits) as the
			-- last two words.
			-- See FIBs Pub 180-4 (Mar 2012).
		local
			fbc: INTEGER				-- full block count
			bc, wc, i: INTEGER
			rem: INTEGER
			w: NATURAL_32
			b: detachable like block_type
		do
			fbc := message.count // bytes_per_word // 16
				-- Build up the full blocks (each has 16 words)
			from bc := 1
			until bc > fbc
			loop
				b := new_block
				blocks.extend (b)
				from i := 1
				until i > 16
				loop
					wc := wc + 1
					w := i_th_word (wc)
					b.put (w, i - 1)
					i := i + 1
				end
				bc := bc + 1
			end
				-- How many words are left in the `message'?
			rem := words_per_message - wc
			check
				only_partial_block_left: rem <= 15
					-- because complete blocks were read above
			end
				-- Now build one last block, placing any remaining words into it
			if rem > 0 then
				b := new_block
				blocks.extend (b)
				from i := 1
				until i > rem
				loop
					w := i_th_word (wc + i)
						-- Reminder: a `block' is zero-based
					b.put (w, i - 1)
					i := i + 1
				end
			end
				-- If there is room, place the `length' in the last two words
				-- of this block, else place the `length' in the last two words
				-- of a new block.  Reminder: a `new_block' is zero-based.
			if rem = 0 or rem = 15 then
				b := new_block
				blocks.extend (b)
			end
			check attached b as otb then
				otb.put (length.w1, 14)
				otb.put (length.w2, 15)
			end
			is_parsed := true
		end

	words_per_message: INTEGER
			-- The number of words in the padded `message'.
		require
			is_padded: is_padded
			correct_word_boundaries: message.count \\ bytes_per_word = 0
		do
			Result := message.count // bytes_per_word
		end

	i_th_word (a_index: INTEGER): NATURAL_32
			-- The `a_index'th word of the `message'.
		require
			is_padded: is_padded
			correct_word_boundaries: message.count \\ bytes_per_word = 0
			index_big_enough: a_index >= 1
			index_small_enough: a_index <= words_per_message
		local
			i: INTEGER
			b: NATURAL_8
			w: NATURAL_32
		do
--			Result := word_zero
			from i := 1
			until i > bytes_per_word
			loop
				w := message.i_th (((a_index - 1) * bytes_per_word) + i)
				Result := Result.bit_or (w)
				if i < bytes_per_word then
					Result := Result.bit_shift_left (8)
				end
				i := i + 1
			end
		end

feature {NONE} -- Implementation (message parsing)

	blocks: ARRAYED_LIST [like block_type]
			-- An array of blocks, holding the parsed message.

	new_block: like block_type
			-- Create a new block containing 16 words.
			-- A word (i.e. of word_type) contain 32 bits for SHA-1,
			-- SHA-224, & SHA-25 giving 512-bit blocks; a word contains
			-- 64 bits for SHA-384, SHA-512, SHA-512/224, and SHA-512/256
			-- giving 1024-bit blocks.
			-- FIPS Pub 180-4 (Mar 2012) page 14.
		do
			create Result.make_filled (0, 0, 15)
		end

feature {NONE} -- Basic operations

	rotate_left (x: NATURAL_32; n: INTEGER): NATURAL_32
			-- Circular left shift of 'x' by `n'
			-- (x << n) v (x >> w-n) where w = `bits_per_word'
			-- FIBS Pub 180-4 (Mar 2012) pages 8-9
		require
			n_big_enough: n >= 0
			n_small_enough: n < bits_per_word
		do
			Result := x.bit_shift_left (n) | x.bit_shift_right (bits_per_word - n)
		end

	rotate_right (x: NATURAL_32; n: INTEGER): NATURAL_32
			-- Circular right shift of 'x' by `n'
			-- (x >> n) v (x << w-n) where w = `bits_per_word'
			-- FIBS Pub 180-4 (Mar 2012) pages 8-9
		require
			n_big_enough: n >= 0
			n_small_enough: n < bits_per_word
		do
			Result := x.bit_shift_right (n) | x.bit_shift_left (bits_per_word - n)
		end

	right_shift (x: NATURAL_32; n: INTEGER): NATURAL_32
			-- The "right shift" function used by SHA-224, SHA-256, SHA-384,
			-- SHA-512, SHA-512/224, and SHA-512/256 as defined in
			-- FIBS Pub 180-4 (Mar 2012) page 8.
		require
			n_big_enough: n >= 0
			n_small_enough: n < bits_per_word
		do
			Result := x.bit_shift_right (n)
		end

	ch (x, y, z: NATURAL_32): NATURAL_32
			-- The "Ch(x,y,z)" function as defined in
			-- FIBS Pub 180-4 (Mar 2012) pages 10-11.
		do
			Result := (x & y).bit_xor (x.bit_not & z)
		end

	maj (x, y, z: NATURAL_32): NATURAL_32
			-- The "Maj(x,y,z)" function as defined in
			-- FIBS Pub 180-4 (Mar 2012) pages 10-11.
		do
			Result := ((x & y).bit_xor (x & z)).bit_xor (y & z)
		end

	w_sub_t (t, i: INTEGER): NATURAL_32
			-- The `t'-th word from the schedule (i.e. `blocks') of the hash
			-- for i-th block.
		require
			t_big_enough: t >= 0
			t_small_enough: t <= Upper_index
			i_big_enough: i >= 1
			i_small_enough: i <= blocks.count
		deferred
		end

feature {NONE} -- Implementation (Constants array)

	Upper_index: INTEGER
			-- One less than the number of intermediate hash calculations
			-- performed by the algorithm; the index of the last calculation
			-- or accessed word.
		deferred
		ensure
			valid_result: Result = 79 or Result = 63
		end

	big_k: ARRAY [NATURAL_32]
			-- Zero-based array holding constants (represented by "K") in
			-- FIPS Pub 180-4 (Mar 2012) pages 11-12.
			-- Effected features should choose from one of `K_1_constants',
			-- `K_256_constants', or `K_512_constants'.
		deferred
		ensure
			correct_lower_bount: Result.lower = 0
			correct_upper_bound: Result.upper = Upper_index
			correct_count: Result.count = Upper_index + 1
			correct_capacity: Result.capacity = Upper_index + 1
		end

	k_sub_t (t: INTEGER): NATURAL_32
			-- Access into the `big_k' array
		require
			t_big_enough: t >= 0
			t_small_enough: t <= Upper_index
		do
			Result := big_k [t]
		end

	message_schedule: ARRAY [detachable CELL [NATURAL_32]]
			-- The message schedule for this hash iteration.  This feature
			-- allows dynamic programming, saving values as they are calculated.

	new_word_ref (a_word: NATURAL_32): CELL [NATURAL_32]
			-- Create a new reference containing `a_word' stored in `blocks'.
		do
			create Result.put (a_word)
		end

feature {NONE} -- Anchors

	block_type: ARRAY [NATURAL_32]
			-- The type of the N blocks (512-bits or 1024-bits), each made
			-- of 16 [32-bit or 64-bit] words.
			-- Anchor for type used by the SHA calculations.
			-- Not to be called; just used to anchor types.
			-- Declared as a feature to avoid adding an attribute.
		require
			not_callable: False
		do
			check
				do_not_call: False then
					-- Because gives no info; simply used as anchor.
			end
		end

end
