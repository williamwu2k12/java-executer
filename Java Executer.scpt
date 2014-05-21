-------------------------------------------------------------
--  Java Executer                                          --
--                                                         --
--  Created to make the .class files actually useful when  --
--  you double click them in Finder.                       --
--                                                         --
--  This application does two things:                      --
--  1. Changes to your current file directory              --
--  Edit: 2014.01.31. Updated quoted forms so directories  --
--  with spaces can still be used.                         --
--  2. Runs java on the base_name of your .class file.     --
-------------------------------------------------------------

on run {input, parameters}
    set file_path to quoted form of (do shell script "dirname " & quoted form of POSIX path of input as string) -- the two quoted forms are necessary since 'do shell script "dirname "' takes the already quoted string and returns a non quoted string
    set file_name to do shell script "basename " & quoted form of POSIX path of input & " .class" as string
    tell application "System Events"
        if exists process "Terminal" then
            tell application "Terminal" to do script ("cd " & file_path & "; java " & file_name)
        else
            tell application "Terminal" to do script ("cd " & file_path & "; java " & file_name) in window 1
        end if
        tell application "Terminal" to activate
    end tell
    return input
end run