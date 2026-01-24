note
	description: "[
		Base class defining the 64-bit SHA (Secure Hash Algorithms message
		digests.  A message digest, or simply digest, is the result calculated
		by running a SHA on a string message.  It consists of five to eight,
		64-bit words formatted as a string.

		This class defines eight NATURAL working variable words used by feature
		`calculate' (from the SHA_xxx classes), to compute the hash.  The
		descendant classes define the initial hash values and effect feature
		`as_hex_string'.

		See FIPS Pub 180-4, Mar 2012.
		]"
	author: "Jimmy J. Johnson"
	date: "1/14/26"

deferred class
	SHA_DIGEST_64

inherit

	SHA_DIGEST

feature -- Initialize

	initialize
			-- Set to initial values
		deferred
		end

feature -- Access

	word_0: NATURAL_32
			-- The zero-th working variable (i.e. first word).
	word_1: NATURAL_32
	word_2: NATURAL_32
	word_3: NATURAL_32
	word_4: NATURAL_32
	word_5: NATURAL_32
	word_6: NATURAL_32
	word_7: NATURAL_32
			-- The 8th working variable; the 8th word of the calculation

feature -- Element change

	wipe_out
			-- Set all words to zero
		do
			word_0 := 0
			word_1 := 0
			word_2 := 0
			word_3 := 0
			word_4 := 0
			word_5 := 0
			word_6 := 0
			word_7 := 0
		ensure
			word_0_is_zero: word_0 = 0
			word_1_is_zero: word_1 = 0
			word_2_is_zero: word_2 = 0
			word_3_is_zero: word_3 = 0
			word_4_is_zero: word_4 = 0
			word_5_is_zero: word_5 = 0
			word_6_is_zero: word_6 = 0
			word_7_is_zero: word_7 = 0
		end

	set_five (w0, w1, w2, w3, w4: NATURAL_32)
			-- Assign correspoding values to the first five words (for SHA-1).
		do
			word_0 := w0
			word_1 := w1
			word_2 := w2
			word_3 := w3
			word_4 := w4
		end

	set_all (w0, w1, w2, w3, w4, w5, w6, w7: NATURAL_32)
			-- Assign correspoding values to all eight words.
		do
			word_0 := w0
			word_1 := w1
			word_2 := w2
			word_3 := w3
			word_4 := w4
			word_5 := w5
			word_6 := w6
			word_7 := w7
		end

end
