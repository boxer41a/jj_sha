note
	description: "[
		Used as the working variables and the result of Secure Hash 
		Algorithm SHA-224.
		
		See FIPS Pub 180-4, Mar 2012.
		]"
	author: "Jimmy J. Johnson"
	date: "$Date$"
	revision: "$Revision$"

class
	SHA_DIGEST_224

inherit

	SHA_DIGEST_256
		redefine
			as_hex_string,
			initialize
		end

create
	default_create

feature -- Access

	as_hex_string: STRING_8
			-- The string representation in hexidecimal of the eight words
			-- (256 bits = 8 * 32) with a space between the words.
			-- See FIPS Pub 180-4 (Mar 20-12) page 21.
		do
			Result := word_0.to_hex_string + " " + word_1.to_hex_string + " " +
						word_2.to_hex_string + " " + word_3.to_hex_string + " " +
						word_4.to_hex_string + " " + word_5.to_hex_string + " " +
						word_6.to_hex_string
		end

feature -- Basic operations

	initialize
			-- Set to initial_values
			-- See FIPS Pub 180-4 (Mar 2012) page 15.
		do
			word_0 := 0xc1059ed8
			word_1 := 0x367cd507
			word_2 := 0x3070dd17
			word_3 := 0xf70e5939
			word_4 := 0xffc00b31
			word_5 := 0x68581511
			word_6 := 0x64f98fa7
			word_7 := 0xbefa4fa4
		end

end

