#!/usr/bin/osascript

property output : ""
repeat with i from 1 to 100
    if i mod 15 = 0 then
        set output to output & "FizzBuzz"
    else if i mod 3 = 0 then
        set output to output & "Fizz"
    else if i mod 5 = 0 then
        set output to output & "Buzz"
    else
        set output to output & i
    end if
    set output to output & linefeed
end repeat
output
