@echo off
rem ---------Macro Backup Field ƒ}ƒNƒƒoƒbƒNƒAƒbƒvˆ—-----------------------
powershell -executionpolicy RemoteSigned -File %USERPROFILE%\cmd_macros\macros_sub.ps1
rem cat %USERPROFILE%\cmd_macros\log.txt

rem ---------Macro Definition Field ƒ}ƒNƒ’è‹`ƒGƒŠƒA--------------------------------------
if exist "%USERPROFILE%\cmd_macros\macrolist.bat" call "%USERPROFILE%\cmd_macros\macrolist.bat"
if exist "%USERPROFILE%\cmd_macros\secretmacros.bat" call "%USERPROFILE%\cmd_macros\secretmacros.bat"

rem ---------Color Definition Field F’è‹`ƒGƒŠƒA--------------------------------------
rem F•t‚¯•”‚ÌƒvƒƒOƒ‰ƒ€‚ÍAhttp://it-junkbox.cocolog-nifty.com/blog/2011/08/ms-dos-06fd.html ‚æ‚è”qØ
set •=[30m
set Ô=[31m
set —Î=[32m
set ‰©=[33m
set Â=[34m
set ‡=[35m
set …=[36m
set ”’=[37m
set ƒfƒtƒHƒ‹ƒg=[0m
set •”wŒi=[40m
set Ô”wŒi=[41m
set —Î”wŒi=[42m
set ‰©”wŒi=[43m
set Â”wŒi=[44m
set ‡”wŒi=[45m
set …”wŒi=[46m
set ”’”wŒi=[47m
set black=[30m
set red=[31m
set green=[32m
set yellow=[33m
set blue=[34m
set purple=[35m
set lightblue=[36m
set white=[37m
set default=[0m
set black_bg=[40m
set red_bg=[41m
set green_bg=[42m
set yellow_bg=[43m
set blue_bg=[44m
set purple_bg=[45m
set lightblue_bg=[46m
set white_bg=[47m

echo %green_bg%%white%setting macros. see %USERPROFILE%\cmd_macros\macros.bat%default%
echo;

rem ---------Macro Display Field ƒ}ƒNƒˆê——•\¦ƒGƒŠƒA--------------------------------------
echo %green_bg%%white%Macros are%blue_bg%
doskey /macros
echo %default%

rem ---------unalias Color Definition Field F’è‹`‰ğœƒGƒŠƒA--------------------------------------
set •=
set Ô=
set —Î=
set ‰©=
set Â=
set ‡=
set …=
set ”’=
set ƒfƒtƒHƒ‹ƒg=
set •”wŒi=
set Ô”wŒi=
set —Î”wŒi=
set ‰©”wŒi=
set Â”wŒi=
set ‡”wŒi=
set …”wŒi=
set ”’”wŒi=
set black=
set red=
set green=
set yellow=
set blue=
set purple=
set lightblue=
set white=
set default=
set black_bg=
set red_bg=
set green_bg=
set yellow_bg=
set blue_bg=
set purple_bg=
set lightblue_bg=
set white_bg=


echo end settings