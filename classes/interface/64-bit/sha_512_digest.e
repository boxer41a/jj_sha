note
	description: "Summary description for {SHA_512_DIGEST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SHA_512_DIGEST

inherit

	SHA_DIGEST_64

create
	default_create

feature {NONE} -- Initialization

	initialize
			-- Set to initial_values
			-- FIPS Pub 180-4 (Mar 2012) pages 15-16.
		do
			word_0 := 0x6a09e667f3bcc908
			word_1 := 0xbb67ae8584caa73b
			word_2 := 0x3c6ef372fe94f82b
			word_3 := 0xa54ff53a5f1d36f1
			word_4 := 0x510e527fade682d1
			word_5 := 0x9b05688c2b3e6c1f
			word_6 := 0x1f83d9abfb41bd6b
			word_7 := 0x5be0cd19137e2179
		end

feature -- Access

	out: STRING_8
			-- The words of Current condensed into a string with no spaces.
		do
			Result := word_0.to_hex_string + word_1.to_hex_string +
					word_2.to_hex_string + word_3.to_hex_string+
					word_4.to_hex_string + word_5.to_hex_string +
					word_6.to_hex_string + word_7.to_hex_string
		end

	as_hex_string: STRING_8
			-- The string representation in hexidecimal of the eight words
			-- (512 bits = 8 * 64) with a space between the words.
			-- FIPS Pub 180-4 (Mar 20-12) page 24.
		do
			Result := word_0.to_hex_string + " " + word_1.to_hex_string + " " +
					word_2.to_hex_string + " " + word_3.to_hex_string + " " +
					word_4.to_hex_string + " " + word_5.to_hex_string + " " +
					word_6.to_hex_string + " " + word_7.to_hex_string
		end

end

