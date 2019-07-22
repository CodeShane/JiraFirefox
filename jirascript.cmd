cd C:\Users\Anicet\AppData\Roaming\Mozilla\Firefox\Profiles\yydk87ps.default

sqlite3 places.sqlite "select title from moz_places where url like '"%%stackoverflow.com/%%"' or url like '"%%ubuntuforums.org/%%"' or url like '"%%superuser.com/%%"' or url like '"%%askubuntu.com/%%"' order by id desc limit 1;"> desc

set /p title=< desc

set title=%title:- Stack Overflow=%

set title=%title:- Super User=%

set title=%title:- Ask Ubuntu=%

jiracli --issue-search "summary ~ '""%title%""'" > searchfile

set searchresult=

set /p searchresult=< searchfile

if "%searchresult%" == "" jiracli -c KTP Task "%title%" "" ""> newtask 

if "%searchresult%" == "" set /p taskcode=< newtask 

if "%searchresult%" == "" set taskcode=%taskcode:~8% 

if "%searchresult%" == "" for /f "tokens=1 delims=," %%a in ("%taskcode%") do set taskcode=%%a 

if "%searchresult%" == "" jiracli --issue-trans-custom %taskcode% "In Progress"

cd C:\Users\Anicet\Desktop

pause

