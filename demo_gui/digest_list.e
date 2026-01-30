note
	description: "[
		Displays the digest calculated by the `hasher'
		]"
	author: "Jimmy J Johnson"
	date: "1/28/26"

class
	DIGEST_LIST

inherit

	EV_VERTICAL_BOX
		redefine
			create_interface_objects,
			initialize,
			is_in_default_state
		end

create
	default_create

feature {NONE} -- Initialization

	is_in_default_state: BOOLEAN = True
			-- Is `Current' in its default state.
			-- Redefined to bypass this worthless check.

	create_interface_objects
			-- Setup objects specific for this class
		do
			create spaces_toggle.make_with_text ("As Words")
			create case_toggle.make_with_text ("Uppercase")
			create expected_text
			create paste_button.make_with_text ("Paste")
			create clear_button.make_with_text ("Clear")
			create rows.make (10)
			create sha_1
			create sha_256
			create sha_224
			create sha_512
			create sha_384
			create sha_512_224
			create sha_512_256
			Precursor
		end

	initialize
			-- Build the interface
		local
			r: DIGEST_ROW
		do
			Precursor
			set_padding (10)
				-- Build case and spaces buttons
			build_button_row
				-- Build the hasher digest rows
			build_row (sha_1)
			build_row (sha_256)
			build_row (sha_224)
			build_row (sha_512)
			build_row (sha_384)
			build_row (sha_512_224)
			build_row (sha_512_256)
				-- Build expected row
			build_expected_row
				-- Add actions to widgets
			add_actions
		end

	build_button_row
		local
			h_box: EV_HORIZONTAL_BOX
			spacer: EV_LABEL
		do
			create h_box
			h_box.set_minimum_height (40)
			create spacer
			spacer.set_minimum_width (180)
			h_box.extend (spacer)
			h_box.disable_item_expand (spacer)
			h_box.extend (spaces_toggle)
			create spacer
			spacer.set_minimum_width (30)
			h_box.extend (spacer)
			h_box.disable_item_expand (spacer)
			h_box.extend (case_toggle)
			create spacer
			h_box.extend (spacer)
--			h_box.extend (message_text)
			h_box.disable_item_expand (spaces_toggle)
			h_box.disable_item_expand (case_toggle)
			extend (h_box)
			disable_item_expand (h_box)
		end

	build_row (a_hasher: SHA_HASHER)
			-- Add one row to display the digest for `a_hasher'
		local
			r: DIGEST_ROW
		do
			create r.make (a_hasher)
			extend (r)
			disable_item_expand (r)
			rows.extend (r)
		end

	build_expected_row
			-- Build the row containing the expected hash value
		local
			lab: EV_LABEL
			h_box: EV_HORIZONTAL_BOX
			h_spacer: EV_HORIZONTAL_BOX
			spacer: EV_LABEL
			v_box: EV_VERTICAL_BOX
		do
			create h_box
			h_box.set_padding (30)
			h_box.set_minimum_height (40)
				-- Add margin at top to Current
			create h_spacer
			h_spacer.set_minimum_height (20)
			extend (h_spacer)
			disable_item_expand (h_spacer)
				-- add Margin at left
			create spacer
			spacer.set_minimum_width (3)
			h_box.extend (spacer)
			h_box.disable_item_expand (spacer)

			create lab.make_with_text ("Expected Hash")
			h_box.extend (lab)
			h_box.disable_item_expand (lab)
			h_box.extend (expected_text)
				-- Add spacer at right margin
--			create spacer
--			spacer.set_minimum_width (10)
--			h_box.extend (spacer)
--			h_box.disable_item_expand (spacer)
				-- Add `paste_button' and `clear_button'
			create v_box
			h_box.extend (v_box)
			v_box.extend (paste_button)
			v_box.extend (clear_button)
			h_box.disable_item_expand (v_box)
				-- Add spacer at right margin
			create spacer
			spacer.set_minimum_width (5)
			h_box.extend (spacer)
			h_box.disable_item_expand (spacer)
				-- At the row to Current
			extend (h_box)
			disable_item_expand (h_box)
				-- Add margin at bottom to Current
			create h_spacer
			h_spacer.set_minimum_height (30)
			extend (h_spacer)
			disable_item_expand (h_spacer)
		end

	add_actions
			-- Add actions and responses to buttons, etc
		do
			spaces_toggle.select_actions.extend (agent on_toggle_spaces)
			case_toggle.select_actions.extend (agent on_toggle_case)
			paste_button.select_actions.extend (agent on_paste)
			clear_button.select_actions.extend (agent on_clear)
			expected_text.change_actions.extend (agent on_expected_changed)
		end

feature -- Element change

	set_string_input (a_string: STRING_8)
			-- Set input for all hashers to `a_string'
		local
			r: DIGEST_ROW
		do
			is_file_input := False
			from rows.start
			until rows.exhausted
			loop
				r := rows.item
				r.set_string_input (a_string)
				rows.forth
			end
		end

	set_file_input (a_filename: STRING_8)
			-- Set input for all hashers to `a_filename'
		local
			r: DIGEST_ROW
		do
			is_file_input := True
			from rows.start
			until rows.exhausted
			loop
				r := rows.item
				r.set_file_input (a_filename)
				rows.forth
			end
		end

feature -- Actions

	on_expected_changed
			-- Action to perform when the `expected_text' changes
		local
			r: DIGEST_ROW
			s: STRING_32
		do
			from rows.start
			until rows.exhausted
			loop
				r := rows.item
				r.set_expected (expected_text.text)
				rows.forth
			end
		end

	on_clear
			-- Action to perform when the `clear_button' is pressed
		local
			r: DIGEST_ROW
		do
			from rows.start
			until rows.exhausted
			loop
				r := rows.item
				r.clear_expected
				rows.forth
			end
			if expected_text.text.count > 0 then
				expected_text.select_all
				expected_text.delete_selection
			end
		end

	on_paste
			-- Action to perform when the `paste_button' is pressed
		do
			if expected_text.text.count > 0 then
				expected_text.select_all
				expected_text.delete_selection
			end
			expected_text.paste (1)
		end

	on_toggle_spaces
			-- React to a press on the `spaces_toggle' button
		do
			if spaces_toggle.is_selected then
				set_spaced
			else
				set_condensed
			end
		end

	on_toggle_case
			-- React to a press on the `case_toggle' button
		do
			if case_toggle.is_selected then
				set_uppercase
			else
				set_lowercase
			end
		end

feature -- Status setting

	is_file_input: BOOLEAN
			-- Is the list seeing input as a filename?

	set_uppercase
			-- Display the digest in uppercase
		do
			from rows.start
			until rows.after
			loop
				rows.item.set_uppercase
				rows.forth
			end
		end

	set_lowercase
			-- Display the digest in lowercase
		do
			from rows.start
			until rows.after
			loop
				rows.item.set_lowercase
				rows.forth
			end
		end

	set_spaced
			-- Display the digest with spaces between the words
		do
			from rows.start
			until rows.after
			loop
				rows.item.set_spaced
				rows.forth
			end
		end

	set_condensed
			-- Display the digest as one string with no spaces
		do
			from rows.start
			until rows.after
			loop
				rows.item.set_condensed
				rows.forth
			end
		end

feature {NONE} -- Implementation

	sha_1: SHA_1
			-- A hasher to calculate an SHA-1 digest

	sha_256: SHA_256
			-- A hasher to calculate an SHA-256 digest

	sha_224: SHA_224
			-- A hasher to calculate an SHA-224 digest

	sha_512: SHA_512
			-- A hasher to calculate an SHA-512 digest

	sha_384: SHA_384
			-- A hasher to calculate an SHA-384 digest

	sha_512_224: SHA_512_224
			-- A hasher to calculate an SHA-512/224 digest

	sha_512_256: SHA_256
			-- A hasher to calculate an SHA-512/256 digest

	rows: ARRAYED_LIST [DIGEST_ROW]
			-- List of rows, each displaying a digest

feature {NONE} -- Implementation

	spaces_toggle: EV_CHECK_BUTTON
			-- Toggle between show spaces in digests or not

	case_toggle: EV_CHECK_BUTTON
			-- To toggle between upper and lower case

	expected_text: EV_TEXT_FIELD
			-- To input the expected value for a hash

	paste_button: EV_BUTTON
			-- To paste from the clipboard into the `expected_text'

	clear_button: EV_BUTTON
			-- To clear the contents of the `expected_text'

end
