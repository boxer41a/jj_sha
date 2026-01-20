note
	description: "[
		Base class defining the various SHA (Secure Hash Algorithms message
		digests.  A message digest, or simply digest, is the result calculated
		by running a SHA on a string message.  It consists of five to eight,
		32- or 64-bit words, (depending on the algorithm) formatted as a string.

		Desendant classes define eight NATURAL working variable words used by
		feature `calculate' (from the SHA_xxx classes), to compute the hash.
		The descendant classes define the initial hash values and effect feature
		`as_hex_string'.

		See FIPS Pub 180-4, Mar 2012.
		]"
	author: "Jimmy J. Johnson"
	date: "$Date$"
	revision: "$Revision$"


deferred class
	SHA_DIGEST

inherit

	HASHABLE
		redefine
			default_create
		end

feature {NONE} -- Initialization

	default_create
			-- Create an instance, and set words to initial values
		do
			initialize
		end

feature -- Basic operations

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
