note
	description: "[
		Calculates the SHA-224 multi-bit `digest' for a string `message'.  The
		`digest' is calculated the same way as SHA-256, but the initial hash values
		(set in feature `initialize' form class {SHA_DIGEST_224}) are
		different, and the digest is output as 224 bits (i.e. seven 32-bit words).

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
	SHA_224

inherit

	SHA_256
		redefine
			digest_imp
		end

create
	default_create,
	set_with_string,
	set_with_filename

feature {NONE} -- Anchors

	digest_imp: detachable SHA_DIGEST_224
			-- Implementation of `digest'

end
