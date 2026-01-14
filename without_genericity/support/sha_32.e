note
	description: "[
		Common ancestor class for the Secure Hash Algorithm (SHA)
		classes, such as {SHA_1}, {SHA_256}, and {SHA_224}.

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

deferred class
	SHA_32

inherit

	SHA
		redefine
			default_create
		end

feature {NONE} -- Initialization

	default_create
			-- Create an instance, setting the `message_origin' to
			-- the empty string.
		do
			Precursor
			set_length_imp
		end

feature {SHA_32} -- Implementation

	length: TUPLE [w1: NATURAL_32; w2: NATURAL_32]
			-- The length (in bits) of the original message expressed in
			-- two words
		do
			check attached length_imp as len then
				Result := len
			end
		end

	length_imp: detachable like length
			-- Implementation of `length' to delay creation.

	set_length_imp
			-- Record the number of bits into `length_imp'; called after
			-- initialization.
		do
			length_imp := [word_zero, (message.count * 8).as_natural_32]
		end

	bits_per_word: INTEGER = 32
			-- The number of bits in the `word_type'.

	bytes_per_word: INTEGER = 4
			-- The number of bytes in the `word_type'.

feature {NONE} -- Anchors

	word_zero: NATURAL_32
			-- To obtain a number of the correct type.

	digest_imp: detachable SHA_DIGEST_32
			-- Allow dynamic programming in `digest'.
		deferred
		end

end
