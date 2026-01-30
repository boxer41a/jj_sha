note
	description: "[
		Used as the working variables and the result of Secure Hash
		Algorithm {SHA_1_HASHER}.

		See FIPS Pub 180-4, Mar 2012.
		]"
	author: "Jimmy J. Johnson"
	date: "1/23/26"

class
	SHA_1_DIGEST

inherit

	SHA_DIGEST_32

create
	default_create	-- calls `initialize'

feature {NONE} -- Initialization

	initialize
			-- Set to initial_values.
			-- See FIPS Pub 180-4 (Mar 2012) page 14.
		do
			wipe_out
			word_0 := 0x67452301
			word_1 := 0xefcdab89
			word_2 := 0x98badcfe
			word_3 := 0x10325476
			word_4 := 0xc3d2e1f0
		end

feature -- Access

	out: STRING_8
			-- The words of Current condensed into a string with no spaces.
		do
			Result := word_0.to_hex_string + word_1.to_hex_string +
						word_2.to_hex_string + word_3.to_hex_string +
						word_4.to_hex_string
		end

	as_hex_string: STRING_8
			-- The string representation in hexidecimal of the first five words
			-- (160 bits = 5 * 32) with a space between the words.
			-- FIPS Pub 180-4 (Mar 20-12) page 18.
		do
			Result := word_0.to_hex_string + " " + word_1.to_hex_string + " " +
						word_2.to_hex_string + " " + word_3.to_hex_string + " " +
						word_4.to_hex_string
		end

end
