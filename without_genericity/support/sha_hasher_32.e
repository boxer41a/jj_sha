note
	description: "[
		Root class for the classes that perform the SHA math to
		produce a {SHA_DIGEST}
		]"
	author: "Jimmy J Johnson"
	date: "1/15/26"

deferred class
	SHA_HASHER_32

inherit

	SHA_PARSER_32

	SHA_HASHER
		undefine
			default_create,
			word_anchor,
			block_anchor
		end

feature -- Implemetation

end
