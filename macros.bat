@echo off
rem ---------Macro Backup Field �}�N���o�b�N�A�b�v����-----------------------
powershell -executionpolicy RemoteSigned -File %USERPROFILE%\cmd_macros\macros_sub.ps1
rem cat %USERPROFILE%\cmd_macros\log.txt

rem ---------Macro Definition Field �}�N����`�G���A--------------------------------------
if exist "%USERPROFILE%\cmd_macros\macrolist.bat" call "%USERPROFILE%\cmd_macros\macrolist.bat"
if exist "%USERPROFILE%\cmd_macros\secretmacros.bat" call "%USERPROFILE%\cmd_macros\secretmacros.bat"

rem ---------Color Definition Field �F��`�G���A--------------------------------------
rem �F�t�����̃v���O�����́Ahttp://it-junkbox.cocolog-nifty.com/blog/2011/08/ms-dos-06fd.html ���q��
set ��=[30m
set ��=[31m
set ��=[32m
set ��=[33m
set ��=[34m
set ��=[35m
set ��=[36m
set ��=[37m
set �f�t�H���g=[0m
set ���w�i=[40m
set �Ԕw�i=[41m
set �Δw�i=[42m
set ���w�i=[43m
set �w�i=[44m
set ���w�i=[45m
set ���w�i=[46m
set ���w�i=[47m
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

rem ---------Macro Display Field �}�N���ꗗ�\���G���A--------------------------------------
echo %green_bg%%white%Macros are%blue_bg%
doskey /macros
echo %default%

rem ---------unalias Color Definition Field �F��`�����G���A--------------------------------------
set ��=
set ��=
set ��=
set ��=
set ��=
set ��=
set ��=
set ��=
set �f�t�H���g=
set ���w�i=
set �Ԕw�i=
set �Δw�i=
set ���w�i=
set �w�i=
set ���w�i=
set ���w�i=
set ���w�i=
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