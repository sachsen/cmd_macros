@echo off
chcp 65001
rem ---------Macro Backup Field マクロバックアップ処理-----------------------
powershell -executionpolicy RemoteSigned -File %USERPROFILE%\cmd_macros\macros_sub.ps1
rem cat %USERPROFILE%\cmd_macros\log.txt

rem ---------Macro Definition Field マクロ定義エリア--------------------------------------
if exist "%USERPROFILE%\cmd_macros\macrolist.bat" call "%USERPROFILE%\cmd_macros\macrolist.bat"
if exist "%USERPROFILE%\cmd_macros\secretmacros.bat" call "%USERPROFILE%\cmd_macros\secretmacros.bat"

rem ---------Color Definition Field 色定義エリア--------------------------------------
rem 色付け部のプログラムは、http://it-junkbox.cocolog-nifty.com/blog/2011/08/ms-dos-06fd.html より拝借
set 黒=[30m
set 赤=[31m
set 緑=[32m
set 黄=[33m
set 青=[34m
set 紫=[35m
set 水=[36m
set 白=[37m
set デフォルト=[0m
set 黒背景=[40m
set 赤背景=[41m
set 緑背景=[42m
set 黄背景=[43m
set 青背景=[44m
set 紫背景=[45m
set 水背景=[46m
set 白背景=[47m
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

rem ---------Macro Display Field マクロ一覧表示エリア--------------------------------------
echo %green_bg%%white%Macros are%blue_bg%
doskey /macros
echo %default%

rem ---------unalias Color Definition Field 色定義解除エリア--------------------------------------
set 黒=
set 赤=
set 緑=
set 黄=
set 青=
set 紫=
set 水=
set 白=
set デフォルト=
set 黒背景=
set 赤背景=
set 緑背景=
set 黄背景=
set 青背景=
set 紫背景=
set 水背景=
set 白背景=
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