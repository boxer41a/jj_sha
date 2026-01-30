note
	description: "[
		Base class defining the various SHA (Secure Hash Algorithms message
		digests.  A message digest, or simply digest, is the result calculated
		by running a SHA on a string message.  It consists of five to eight,
		32- or 64-bit words, (depending on the algorithm) formatted as a string.


		Base class for {SHA_DIGEST_32} and {SHA_DIGEST_64}, the 32-bit
		and 64-bit implementaion of a message digest as described in:
		
			See FIPS Pub 180-4, Mar 2012.
		]"
	author: "Jimmy J Johnson"
	date: "1/24/26"

deferred class
	SHA_DIGEST

inherit

	HASHABLE
		undefine
			out
		redefine
			default_create
		end

feature {NONE} -- Iniitialization

	default_create
			-- Create an instance
		do
			initialize
		end

	initialize
			-- Set to initial values
		deferred
		end

feature -- Access

	as_hex_string: STRING_8
			-- The words of Current as hexidecimal strings with
			-- a space between each word.
		deferred
		end

	frozen as_string: STRING_8
			-- The `as_hex_string' converted to lower case as described
			-- in FIPS PUB 180-4 (Mar 2012)
		do
			Result := as_hex_string.as_lower
		end

	hash_code: INTEGER
			-- Produced from the hash-code of the string representation of Current
		do
			Result := as_hex_string.hash_code
		end

end
