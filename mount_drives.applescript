# Script Name		: mount_drives
# Author				: Craig Richards
# Created			: 25th November 2012
# Last Modified		: 
# Version			: 1.0

# Modifications		:  

# Description			: This will mount the clone drive used in my Superduper clone

do shell script "diskutil mount /dev/disk4s2"
do shell script "diskutil mount /dev/disk4s3"

tell application "System Events"
	set isRunning to (count of (every process whose bundle identifier is "com.Growl.GrowlHelperApp")) > 0
end tell

if isRunning then
	tell application id "com.Growl.GrowlHelperApp"
		set the allNotificationsList to �
			{"Drives Mounted"}
		
		set the enabledNotificationsList to �
			{"Drives Mounted"}
		
		register as application �
			"Mount Clone Drives" all notifications allNotificationsList �
			default notifications enabledNotificationsList �
			icon of application "Script Editor"
		
		--       Send a Notification...
		notify with name �
			"Drives Mounted" title �
			"Drives Mounted" description �
			"I have Mounted your clone drives." application name "Mount Clone Drives"
	end tell
end if