# http://growl.info/extras.php/#growlnotify

on growlnotify(title, desc)
	if desc is not missing value then
		do shell script "/usr/local/bin/growlnotify -n 'Time Out Free' -a 'Time Out Free' -t '" & title & "' -m '" & desc & "'"
	else
		do shell script "/usr/local/bin/growlnotify -n 'Time Out Free' -a 'Time Out Free' -t '" & title & "'"
	end if
end growlnotify

# -n,--name       Set the name of the application that sends the notification
# -a,--appIcon    Specify an application name to take the icon from
# -m,--message    Sets the message to be used instead of using stdin
# -s,--sticky     Make the notification sticky
# -I,--iconpath   Specify a file whose icon will be the notification icon
