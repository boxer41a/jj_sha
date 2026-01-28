note
	description: "[
		Used as the working variables and the result of Secure Hash
		Algorithm SHA-384.

		See FIPS Pub 180-4, Mar 2012.
		]"
	author: "Jimmy J. Johnson"
	date: "$Date$"
	revision: "$Revision$"

class
	SHA_384_DIGEST

inherit

	SHA_512_DIGEST
		redefine
			as_hex_string,
			initialize
		end

create
	default_create

feature -- Access

	as_hex_string: STRING
			-- The words as string seperated by a space between each
		do
			Result := word_0.to_hex_string + " " + word_1.to_hex_string + " " +
					word_2.to_hex_string + " " + word_3.to_hex_string + " " +
					word_4.to_hex_string + " " + word_5.to_hex_string
		end

feature -- Basic operations

	initialize
			-- Set to initial_values
			-- FIPS Pub 180-4 (Mar 2012) page 15.
		do
			word_0 := 0xcbbb9d5dc1059ed8
			word_1 := 0x629a292a367cd507
			word_2 := 0x9159015a3070dd17
			word_3 := 0x152fecd8f70e5939
			word_4 := 0x67332667ffc00b31
			word_5 := 0x8eb44a8768581511
			word_6 := 0xdb0c2e0d64f98fa7
			word_7 := 0x47b5481dbefa4fa4
		end

end
