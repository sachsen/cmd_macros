rem ---Macro Definition Field マクロ定義エリア--

doskey macros=doskey /macros
doskey cat=type
doskey ls=dir
doskey open=explorer
doskey disconnect=net use x: /delete
doskey condaexport=conda env export > $1.yml
doskey condaimport=conda env create -n $1 -f $2.yml
doskey editMacros=notepad %USERPROFILE%\cmd_macros\macrolist.bat
doskey condaupdate=conda deactivate$Tconda update conda
doskey condaremove=conda deactivate$Tconda remove -n $1 --all
