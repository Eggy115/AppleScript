#!/usr/bin/osascript

-- What day will Christmas be on this year?

set Christmas to (current date)
set month of Christmas to December
set day of Christmas to 25

linefeed & "Christmas this year will be on a " & weekday of Christmas & "."
