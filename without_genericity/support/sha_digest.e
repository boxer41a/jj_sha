note
	description: "[
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
		redefine
			default_create
		end

feature {NONE} -- Iniitialization

	default_create
			-- Create an instance
		do
			initialize
		end

feature -- Initialize

	initialize
			-- Set to initial values
		deferred
		end

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
