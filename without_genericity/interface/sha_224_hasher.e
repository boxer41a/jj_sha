note
	description: "[
		Functions and interface specific to SHA-224 calculations
		]"
	author: "Jimmy J Johnson"
	date: "1/26/26"


class
	SHA_224_HASHER
	
inherit

	SHA_256_HASHER
		redefine
			digest_imp
		end

feature {NONE} -- Basic operations

	digest_imp: detachable SHA_224_DIGEST
			-- Allow dynamic programming in `digest'.	

end
