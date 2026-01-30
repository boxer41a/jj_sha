note
	description: "[
		Displays the digest calculated by the `hasher'
		]"
	author: "Jimmy J Johnson"
	date: "1/28/26"

class
	DIGEST_ROW

inherit

	EV_HORIZONTAL_BOX
		redefine
			create_interface_objects,
			initialize,
			is_in_default_state
		end

inherit {NONE}

	EV_STOCK_COLORS
		rename
			implementation as colors_implementation
		undefine
			default_create,
			copy,
			is_equal
		end

create
	make

feature {NONE} -- Initialization

	is_in_default_state: BOOLEAN = True
			-- Is `Current' in its default state.
			-- Redefined to bypass this worthless check.

	create_interface_objects
			-- Setup objects specific for this class
		do
			create label
			create check_button
			create text
			create copy_button.make_with_text ("Copy")
			create expected.make_empty
			Precursor
		end

	initialize
			-- Build the interface
		local
			spacer: EV_LABEL
		do
			Precursor
			text.disable_edit
			text.disable_sensitive
			extend (label)
			extend (check_button)
			extend (text)
			create spacer.make_with_text ("")
			spacer.set_minimum_width (10)
			extend (spacer)
			disable_item_expand (spacer)
			extend (copy_button)
			create spacer.make_with_text ("")
			spacer.set_minimum_width (30)
			extend (spacer)
			disable_item_expand (spacer)
				-- Set properties
			set_minimum_height (30)
			label.set_minimum_width (100)
			label.align_text_right
			disable_item_expand (label)
			disable_item_expand (copy_button)
				-- check box
			check_button.set_minimum_width (50)
			disable_item_expand (check_button)
		end

	make (a_hasher: SHA_HASHER)
			-- Create an instance
		do
			hasher := a_hasher
			default_create
			label.set_text (a_hasher.name)
			refresh
				-- Add actions
			add_actions
		end

	add_actions
			-- Set events and responses
		do
			check_button.select_actions.extend (agent refresh)
			copy_button.select_actions.extend (agent on_copy)
		end

feature -- Status report

	is_uppercase: BOOLEAN
			-- Should the `text' show in upercase?

	is_spaced: BOOLEAN
			-- Should the `text' display with spaces between the words?

feature -- Status setting

	set_uppercase
			-- Display the digest in uppercase
		do
			is_uppercase := True
			refresh
		end

	set_lowercase
			-- Display the digest in lowercase
		do
			is_uppercase := False
			refresh
		end

	set_spaced
			-- Display the digest with spaces between the words
		do
			is_spaced := True
			refresh
		end

	set_condensed
			-- Display the digest as one string with no spaces
		do
			is_spaced := False
			refresh
		end

	set_string_input (a_string: STRING_8)
			-- Set input to `hasher' to `a_string'
		do
			hasher.set_with_string (a_string)
			refresh
		end

	set_file_input (a_filename: STRING_8)
			-- Set input to `hasher' to `a_filename'
		do
			hasher.set_with_filename (a_filename)
			refresh
		end

feature -- Basic operations

	on_copy
			-- Actions to perform when copy button is pressed
		do
			if text.text.count > 0 then
				text.select_all
				text.copy_selection
				text.deselect_all
			end
		end

	set_expected (a_string: STRING_8)
			-- Change the `expected' string
		do
			expected := a_string
			refresh
		end

	clear_expected
			-- Remove the `expected' text
		do
			expected := ""
			refresh
		end

	refresh
			-- Update the display
		local
			d: SHA_DIGEST
			s: STRING_8
		do
			if check_button.is_selected then
				d := hasher.digest
				if is_spaced then
					s := d.as_hex_string
				else
					s := d.out
				end
				if is_uppercase then
					s.to_upper
				else
					s.to_lower
				end
				text.set_text (s)
				if expected.count > 0 then
					if expected ~ s then
						label.set_foreground_color (Dark_green)
						check_button.set_foreground_color (Dark_green)
						text.set_foreground_color (Dark_green)
					else
						label.set_foreground_color (Dark_red)
						check_button.set_foreground_color (Dark_red)
						text.set_foreground_color (Dark_red)
					end
				else
					label.set_foreground_color (Black)
					check_button.set_foreground_color (Black)
					text.set_foreground_color (Black)
				end
			else
				text.set_text ("")
			end
		end

feature -- Implementation

	hasher: SHA_HASHER
			-- The SHA_HASHER for which to display the `digest'

	label: EV_LABEL
			-- Shows the name of the hasher

	check_button: EV_CHECK_BUTTON
			-- Check box to show/hide the digest

	text: EV_TEXT_FIELD
			-- Shows the digest when `check_button' is selected

	copy_button: EV_BUTTON
			-- Button to copy the `text' to the clipboard

	expected: STRING_8
			-- The value, if any, to which to compare results
end
