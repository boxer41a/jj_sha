note
	description: "[
		Used as the working variables and the result of Secure Hash 
		Algorithm SHA-512/256.
		
		See FIPS Pub 180-4, Mar 2012.
		]"
	author: "Jimmy J. Johnson"
	date: "$Date$"
	revision: "$Revision$"

class
	SHA_DIGEST_512_256

inherit

	SHA_DIGEST_512
		redefine
			as_hex_string,
			initialize
		end

feature -- Access

	as_hex_string: STRING_8
			-- The string representation in hexidecimal of the 4 words
			-- (256 bits = 4 * 64) with a space between the words.
			-- FIPS Pub 180-4 (Mar 20-12) page 26.
		do
			Result := word_0.to_hex_string + " " + word_1.to_hex_string + " " +
						word_2.to_hex_string + " " + word_3.to_hex_string

		end

feature -- Basic operations

	initialize
			-- Set to initial_values
			-- FIPS Pub 180-4 (Mar 2012) page 17.
		do
			word_0 := 0x22312194FC2BF72C
			word_1 := 0x9F555FA3C84C64C2
			word_2 := 0x2393B86B6F53B151
			word_3 := 0x963877195940EABD
			word_4 := 0x96283EE2A88EFFE3
			word_5 := 0xBE5E1E2553863992
			word_6 := 0x2B0199FC2C85B8AA
			word_7 := 0x0EB72DDC81C52CA2
		end

end
