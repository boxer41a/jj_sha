note
	description: "[
		Common ancestor class for the 32-bit Secure Hash Algorithm (SHA)
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

class
	SHA

inherit

	ANY
		redefine
			default_create,
			out
		end

feature {NONE} -- Initialization

	default_create
			-- Create an instance, setting the `message_origin' to
			-- the empty string.
		do
			create message.make (256)
			create sha_1_hasher
			out_count := Default_out_count
		end

	make_with_string (a_string: STRING_GENERAL)
			-- Create an instance, setting `message_origin' to `a_string'
		do
			default_create
			set_with_string (a_string)
		end

	make_with_filename (a_string: STRING_GENERAL)
			-- Create an instance, setting `message_origin' to `a_string' and
			-- process the message as a file of bytes.
		do
			default_create
			set_with_string (a_string)
		end

feature -- Initialization

	set_with_string (a_string: STRING_GENERAL)
			-- Initialize Current from `a_string', breaking the string
			-- into bytes.
		local
			i: INTEGER
			c: NATURAL_32
			b: NATURAL_32
			shift_n: INTEGER
		do
			default_create
			message_origin := a_string
		end

	set_with_filename (a_filename: STRING_GENERAL)
			-- Initialize from the file named `a_filename'.
		require
			filename_not_empty: not a_filename.is_empty
			filename_not_blank: not a_filename.is_whitespace
			file_exists: (create {RAW_FILE}.make_with_name (a_filename)).exists
		local
			f: RAW_FILE
			p: MANAGED_POINTER
			i: INTEGER
		do
			default_create
			message_origin := a_filename
			is_from_file := true
		end

feature -- Access

--	frozen digest: SHA_DIGEST
--			-- The result of the computation.
--			-- Reset when `message' is changed.
--		do
----			Result := sha_digest_1.digest
----			if not is_calculated then
----				calculate
----				is_calculated := true
----			end
----			check attached digest_imp as d then
----				Result := d
----			end
--		end

	out_count: INTEGER_32
			-- The limit set for number of bytes shown by `out'.

	Default_out_count: INTEGER_32 = 50
			-- The default number of bytes shown by `out'.

	out: STRING_8
			-- New string containing a terse printable representation
			-- of current object.
		local
			n: INTEGER
		do
			check attached message_origin as m then
				if is_from_file then
					Result := ""
					from
						n := 1
						message.start
					until message.after or n > out_count
					loop
						Result.append (message.item.to_hex_string)
						message.forth
						n := n + 1
					end
				else
					Result := m.head (out_count).out
				end
			end
		end

feature -- Element change

	set_out_count (a_value: like out_count)
			-- Change `out_count'.
		do
			out_count := a_value
		end

feature -- Status report

	is_from_file: BOOLEAN
			-- Was Current initialized by a call to `set_with_filename'?
			-- If this is true, the string given by `out' will be formated as
			-- individual bytes in hexidecimal.

	is_calculated: BOOLEAN
			-- Has the `digest' been calculated?

feature -- Basic operations


feature {NONE} -- Implementation

--	sha_1_parser: SHA_PARSER_32
--			-- Parses the input into blocks

	sha_1_hasher: SHA_1_HASHER
			-- for testing


--	sha_digest_1: SHA_DIGEST_1

	message_origin: detachable STRING_GENERAL
			-- Store the string or filename from which Current was built
			-- to simplify output (otherwize would have to convert bytes
			-- to characters.

end
