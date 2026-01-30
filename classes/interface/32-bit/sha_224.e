note
	description: "[
		Functions and interface specific to SHA-224 calculations
		]"
	author: "Jimmy J Johnson"
	date: "1/26/26"


class
	SHA_224

inherit

	SHA_256
		redefine
			name,
			digest_imp
		end

create
	default_create,
	make_with_filename,
	make_with_string

feature -- Access

	name: STRING_8 = "SHA-224"
			-- Displayable name of this hasher

feature {NONE} -- Basic operations

	digest_imp: detachable SHA_224_DIGEST
			-- Allow dynamic programming in `digest'.	

end
