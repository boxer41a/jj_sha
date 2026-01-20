note
	description: "[
		Function class for bit operations that are not in {NUMERIC}.
		Used by the SHA classes
		]"
	author: "Jimmy J Johnson"
	date: "1/16/26"

deferred class
	NUMERIC_FUNCTIONS

feature -- Query

	bit_count (a_number: NUMERIC): INTEGER_32
			-- The number of bits in `a_number'
		do
			if attached {NATURAL_8} a_number then
				Result := 8
			elseif attached {NATURAL_16} a_number then
				Result := 16
			elseif attached {NATURAL_32} a_number then
				Result := 32
			elseif attached {NATURAL_64} a_number then
				Result := 64
			end
		end

	shifted_left (a_number: NUMERIC; a_shift: INTEGER_32): like block.zero_word
			-- The result of shifting `a_number' to the left by `a_count'
		require
			is_valid_type: attached {NATURAL_8} a_number or attached {NATURAL_16} a_number or
								attached {NATURAL_32} a_number or attached {NATURAL_64} a_number
			shift_big_enough: a_shift >= 0
			shift_small_enough: a_shift <= bit_count (a_number)
		do
			if attached {NATURAL_8} a_number as n8 then
				Result := n8.bit_shift (a_shift)
			elseif attached {NATURAL_16} a_number as n16 then
				Result := n16.bit_shift (a_shift)
			elseif attached {NATURAL_32} a_number as n32 then
				Result := n32.bit_shift (a_shift)
			elseif attached {NATURAL_64} a_number as n64 then
				Result := n64.bit_shift (a_shift)
			else
				check
					not_applicable: False then
				end
			end
		end

	bit_or (a_number: NUMERIC; a_other: NUMERIC): like block.zero_word
			-- The result of shifting `a_number' to the left by `a_count'
		require
			same_types: a_number.same_type (a_other)
			is_valid_type: attached {NATURAL_8} a_number or attached {NATURAL_16} a_number or
								attached {NATURAL_32} a_number or attached {NATURAL_64} a_number
			other_is_valid_type: attached {NATURAL_8} a_number or attached {NATURAL_16} a_number or
								attached {NATURAL_32} a_number or attached {NATURAL_64} a_number
		do
			if attached {NATURAL_8} a_number as n8 and then attached {NATURAL_8} a_other as n8_other then
				Result := n8.bit_or (n8_other)
			elseif attached {NATURAL_16} a_number as n16 and then attached {NATURAL_16} a_other as n16_other then
				Result := n16.bit_or (n16_other)
			elseif attached {NATURAL_32} a_number as n32 and then attached {NATURAL_32} a_other as n32_other then
				Result := n32.bit_or (n32_other)
			elseif attached {NATURAL_64} a_number as n64 and then attached {NATURAL_64} a_other as n64_other then
				Result := n64.bit_or (n64_other)
			else
				check
					not_applicable: False then
				end
			end
		end

feature {NONE} -- Implementation

	block: SHA_BLOCK
			-- Simply to anchor the type
			-- Will be effected in a descendant of {SHA_PARSER}
		deferred
		end

end
