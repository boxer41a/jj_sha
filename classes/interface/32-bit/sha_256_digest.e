note
	description: "[
		Used as the working variables and the result of Secure Hash
		Algorithm {SHA_256_HASHER}.

		See FIPS Pub 180-4, Mar 2012.
		]"
	author: "Jimmy J. Johnson"
	date: "1/23/26"

class
	SHA_256_DIGEST

inherit

	SHA_DIGEST_32

create
	default_create

feature {NONE} -- Initialization

	initialize
			-- Set to initial_values
			-- See FIPS Pub 180-4 (Mar 2012) page 15.
		do
			word_0 := 0x6a09e667
			word_1 := 0xbb67ae85
			word_2 := 0x3c6ef372
			word_3 := 0xa54ff53a
			word_4 := 0x510e527f
			word_5 := 0x9b05688c
			word_6 := 0x1f83d9ab
			word_7 := 0x5be0cd19
		end

feature -- Access

	out: STRING_8
			-- The words of Current condensed into a string with no spaces.
		do
			Result := word_0.to_hex_string + word_1.to_hex_string +
						word_2.to_hex_string + word_3.to_hex_string +
						word_4.to_hex_string + word_5.to_hex_string +
						word_6.to_hex_string + word_7.to_hex_string
		end

	as_hex_string: STRING_8
			-- The string representation in hexidecimal of the eight words
			-- (256 bits = 8 * 32) with a space between the words.
			-- FIPS Pub 180-4 (Mar 20-12) page 21.
		do
			Result := word_0.to_hex_string + " " + word_1.to_hex_string + " " +
					word_2.to_hex_string + " " + word_3.to_hex_string + " " +
					word_4.to_hex_string + " " + word_5.to_hex_string + " " +
					word_6.to_hex_string + " " + word_7.to_hex_string
		end

end
