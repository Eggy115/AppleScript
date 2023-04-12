property app_name : missing value # application name
property app_icon : missing value # icon of application
property notifications : missing value # notifications list

on is_installed()
	tell application "Finder" to set Answer_ to exists application file ((path to applications folder as string) & "Growl")
end is_installed

on is_running(appname)
	tell application "System Events" to return (count of (processes whose name is appname)) > 0
end is_running

on is_exists(path) # return true if dir or file is exists
	return ((do shell script "if test -e '" & path & "'; then echo 1;else echo 0; fi") as integer) as boolean
end is_exists

on ticket_file(appname)
	return (POSIX path of (path to home folder)) & "/Library/Application Support/Growl/Tickets/" & appname & ".growlTicket"
end ticket_file

on is_ticket_exists(appname)
	return is_exists(ticket_file(appname))
end is_ticket_exists

on register(appname, notice_list, icon)
	if is_installed() then
		if is_running("Growl") then
			if app_name is missing value then
				set app_name to appname
				set notifications to notice_list
				set app_icon to icon
				if is_ticket_exists(app_name) = false then
					tell application id "com.Growl.GrowlHelperApp"
						register as application ¬
							app_name all notifications notice_list ¬
							default notifications notice_list ¬
							icon of application icon
					end tell
				end if
			end if
		end if
	end if
end register