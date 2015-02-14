
The `InternetTimeStampToClipBoard.applescript` script creates a special timestamp - including [time zone abbreviations](http://www.timeanddate.com/time/zones/) and [Internet Time](http://en.wikipedia.org/wiki/Swatch_Internet_Time) - and adds it to the clipboard. Ready to be pasted anywhere...

This is what's happening in the background:

``` applescript
tell current application
  do shell script "date '+%Y-%m-%d'"
    --> "2015-02-14"
  current date
    --> date "Saturday, 14 February 2015 21:56:50"
  do shell script "date '+%T'"
    --> "21:56:50"
  do shell script "date '+%Z'"
    --> "CET"
  do shell script "date +%s"
    --> "1423947410"
end tell
tell application "Script Editor"
  set the clipboard to "2015-02-14 Sat 21:56:50 CET @914"
end tell
```

#### Tested on

* Mac OS X Yosemite 10.10.2
