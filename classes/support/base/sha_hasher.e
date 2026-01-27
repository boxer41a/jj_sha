note
	description: "[
		Base class for {SHA_HASHER_32} and {SHA_HASHER_64}, the
		32-bit and 64-bit impementations of classes that caculate an SHA
		digest message as described in:
		
			See FIPS Pub 180-4, Mar 2012.

		This class interfaces through an {SHA_PARSER}, which parses a
		client's input into `blocks'.  Using these `blocks', this class produces
		a `digest'.
		]"
	author: "Jimmy J Johnson"
	date: "1/24/26"

deferred class
	SHA_HASHER

inherit

	SHA_PARSER
		redefine
			reset_status_flags
		end

feature -- Access

	frozen digest: attached like digest_imp
			-- The result of the computation.
			-- Reset when `message' is changed.
		do
			if not is_calculated then
				calculate
				is_calculated := true
			end
			check attached digest_imp as d then
				Result := d
			end
		end

feature -- Status report

	is_calculated: BOOLEAN
			-- Has the `digest' been calculated?

feature -- Status setting

	reset_status_flags
			-- Set parsing and hashing flags to false
		do
			Precursor
			is_calculated := False
		end

feature {NONE} -- Basic operations

	frozen calculate
			-- Calculate and make result available in the `digest'.
		require
			not_calculated: not is_calculated
		do
			if not is_parsed then
				parse
			end
			calculate_imp
			is_calculated := true
		ensure
			is_calculated: is_calculated
		end

	calculate_imp
			-- Calculations specific to the particular SHA type.
		require
			is_parsed: is_parsed
			not_calculated: not is_calculated
		deferred
		ensure
			is_calculated: is_calculated
		end

feature {NONE} -- Implementation

	digest_imp: detachable SHA_DIGEST
			-- Allow dynamic programming in `digest'.
		deferred
		end

end
