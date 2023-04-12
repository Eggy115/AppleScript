on q(str)
	return "\"" & str & "\""
end q

on notify(rec) # params: title, description, sticky, icon of application
	if is_installed() then
		if is_running("Growl") then
			set params to "tell application id \"com.Growl.GrowlHelperApp\" to notify with "
			try # application name
				set reg_name to |application name| of rec as text
			on error
				set reg_name to app_name
			end try
			if reg_name is missing value then
				set reg_name to (get name of current application)
			end if
			try # notification
				set n to |name| of rec
			on error
				try
					set n to item 1 of notifications
				on error
					set n to "default"
				end try
			end try
			register(reg_name, app_icon, {n})
			if n is in notifications or n is notifications then
				set params to params & " name " & q(n)
			else
				error "unknown notifications " & n
			end if
			try # title
				set params to params & " title " & q(title of rec as text)
			end try
			try #description
				set params to params & " description " & q(|description| of rec as text)
			on error
				set params to params & " description \"\""
			end try
			try # sticky
				set params to params & " sticky " & (sticky of rec as text)
			on error # default value
				set params to params & " sticky false"
			end try
			try # icon of application
				set params to params & " icon of application " & q(|icon of application| of rec as text)
			on error
				try
					set params to params & " icon of application " & q(app_icon)
					app_icon
				end try
			end try
			try # icon of file
				set params to params & " icon of file " & q(|icon of file| of rec as text)
			end try
			try # icon of file
				set params to params & " image from location " & q(|image from location| of rec as text)
			end try
			set params to params & " application name " & q(app_name)
			#display dialog params
			run script params
		end if
	end if
end notify