(* Creates a special timestamp - including time zone abbreviations and Internet Time (Biel Mean Time (BMT)) - and adds it to the clipboard. Ready to be pasted anywhere... *)

set formattedDate to do shell script "date '+%Y-%m-%d'"
set dayOfTheWeek to weekday of (current date) as string
set shortDayOfTheWeek to (characters 1 thru 3 of dayOfTheWeek) as string
set formattedTime to do shell script "date '+%T'"
set timeZone to do shell script "date '+%Z'"

(* Generating Internet Time value from unix timestamp *)
set currentUnixTime to (do shell script "date +%s") as integer
set internetTime to ((currentUnixTime + 3600) mod 86400 / 86.4) as integer

(* Assembling the whole line together and adding it to the clipboard as plain text *)
set the clipboard to formattedDate & " " & shortDayOfTheWeek & " " & formattedTime & " " & timeZone & " @" & internetTime as text
