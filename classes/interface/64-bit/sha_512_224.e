note
	description: "[
		Calculates the SHA-512/224 multi-bit `digest' for a string `message'.

		Use `set_with_string or `set_with_filename' to set the text from which
		an SHA digest is to be calculated.  Call `digest' to get the result
		of the calculation which is performed on the first call to `digest';
		subsequent calls look up the previously calculated value.  Calling
		either `set_with_xxx" feature resets the `is_padded', `is_parsed', and
		`is_calculated' flags causing the digest to be recalculated on the
		next call to `digest'.

		See FIPS Pub 180-4 (Mar 2012).
		]"
	author: "Jimmy J. Johnson"
	date: "$Date$"
	revision: "$Revision$"

class
	SHA_512_224

inherit

	SHA_512
		redefine
			name,
			digest_imp
		end

create
	default_create,
	make_with_string,
	make_with_filename

feature -- Access

	name: STRING_8
			-- Displayable name of this hasher
		do
			Result := "SHA-512/224"
		end

feature {NONE} -- Impementation

	digest_imp: detachable SHA_512_224_DIGEST
			-- Implementation of `digest'

end
