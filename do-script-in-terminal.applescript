load script "/Users/scott/github/iconify/ai-scripts/_string.scpt"

set this_node to ""

tell application "Terminal"
	
	if not (exists window 1) then
		reopen
	end if
	
	do script with command "which node | /usr/bin/awk '{ print " & "\"RESULT:\"" & " $1}'"
	
	delay 0.5
	
	set the_content to (contents of window 1) as string
	set n to (count of every paragraph of the_content)
	
	close window 1
end tell

repeat with i from 1 to n
	try
		set test_str to (characters 1 thru 7 of paragraph i of the_content) as string
		log test_str
		if test_str is equal to "RESULT:" then
			set this_line to paragraph i of the_content as string
			set this_node to trim_line(this_line, test_str, 0)
		end if
	on error err_str number err_number
		-- log err_str & "[" & err_number & "]"
	end try
end repeat

log this_node

on trim_line(this_text, trim_chars, trim_indicator)
	-- 0 = beginning, 1 = end, 2 = both
	set x to the length of the trim_chars
	-- TRIM BEGINNING
	if the trim_indicator is in {0, 2} then
		repeat while this_text begins with the trim_chars
			try
				set this_text to characters (x + 1) thru -1 of this_text as string
			on error
				-- the text contains nothing but the trim characters
				return ""
			end try
		end repeat
	end if
	-- TRIM ENDING
	if the trim_indicator is in {1, 2} then
		repeat while this_text ends with the trim_chars
			try
				set this_text to characters 1 thru -(x + 1) of this_text as string
			on error
				-- the text contains nothing but the trim characters
				return ""
			end try
		end repeat
	end if
	return this_text
end trim_line