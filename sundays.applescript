#!/usr/bin/osascript

-- All of the years Christmas will land on a Sunday.
-- Taken from here:  http://rosettacode.org/wiki/Day_of_the_week#AppleScript

set sundays to {}
set Christmas to (current date)
set month of Christmas to December
set day of Christmas to 25

repeat with year from year of Christmas to 2200
    set year of Christmas to year
    if weekday of Christmas is Sunday
        set end of sundays to year
    end if
end repeat

sundays
