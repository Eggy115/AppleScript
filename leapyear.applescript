#!/usr/bin/osascript

-- Calculate whether a year is a leap year.

on leap(year)
    if (year mod 100 is equal to 0) then
        return (year mod 100 is equal to 0)
    else
        return (year mod 4 is equal to 0)
    end if
end leap

leap(1900)
