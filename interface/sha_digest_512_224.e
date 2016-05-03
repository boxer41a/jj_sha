note
	description: "[
		Used as the working variables and the result of Secure Hash 
		Algorithm SHA-512/224.
		
		See FIPS Pub 180-4, Mar 2012.
		]"
	author: "Jimmy J. Johnson"
	date: "$Date$"
	revision: "$Revision$"

class
	SHA_DIGEST_512_224

inherit

	SHA_DIGEST_512
		redefine
			as_hex_string,
			initialize
		end

feature -- Access

	as_hex_string: STRING_8
			-- The string representation in hexidecimal of the 3.5 words
			-- (224 bits = 3.5 * 64) with a space between the words.
			-- FIPS Pub 180-4 (Mar 20-12) page 26.
		local
			n64: NATURAL_64
			n32: NATURAL_32
		do
			Result := word_0.to_hex_string + " " + word_1.to_hex_string + " "
				-- Take the left-most 32 bits from the third word
			n64 := word_2.bit_shift_right (32)
			n32 := n64.as_natural_32
			Result := Result + n32.to_hex_string
		end

feature -- Basic operations

	initialize
			-- Set to initial_values
			-- FIPS Pub 180-4 (Mar 2012) page 17.
		do
			word_0 := 0x8C3D37C819544DA2
			word_1 := 0x73E1996689DCD4D6
			word_2 := 0x1DFAB7AE32FF9C82
			word_3 := 0x679DD514582F9FCF
			word_4 := 0x0F6D2B697BD44DA8
			word_5 := 0x77E36F7304C48942
			word_6 := 0x3F9D85A86A1D36C8
			word_7 := 0x1112E6AD91D692A1
		end

end
