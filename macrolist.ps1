#マクロをps1形式で記述し、doskeyで登録したマクロ名に応じたコマンドをここで実行する。

function getAnacondaEnvPath([string]$file1){
    #current envのパスを返す.引数はactiveな環境のpython.exeの位置
    $folder1=Split-Path $file1 -Parent;
    return $folder1;
}
function getAnacondaLibBinPath([string]$file1){
    #current envのLibrary\bin\パスを返す.引数はactiveな環境のpython.exeの位置
    $folder1=getAnacondaEnvPath $file1;
    $folder1=Join-Path $folder1 "\Library\bin\";
    return $folder1;
}
function qteditCommand([string]$file1){
    #Qt Editorを開くマクロ。別のbatファイルから呼ばれる前提。引数はactiveな環境のpython.exeの位置
    Write-Output "open QtEditor";
    Write-Host  "open QtEditor";
    $folder1=getAnacondaLibBinPath $file1;
    $file2=Join-Path $folder1 "designer.exe";
    Start-Process -FilePath $file2;
}
function ui2pyCommand($file1,$file2){
    #pyside2で.uiを.pyに変換するマクロ.別のbatファイルから呼ばれる前提。引数1はactiveな環境のpython.exeの位置.2は変換するファイル
    Write-Output ".ui to .py";
    Write-Host  ".ui to .py";
    $folder1=getAnacondaLibBinPath $file1;
    $filePysideCom=Join-Path $folder1 "pyside2-uic";
    $fileUI=[System.IO.Path]::GetFileNameWithoutExtension($file2);
    $folder2=Split-Path $file2 -Parent;
    $fileUI=Join-Path $folder2 $fileUI;
    pyside2-uic $fileUI+".ui" -o $fileUI+".py"
}

$MACROLIST=@{
    "qtedit"="qteditCommand";
    "ui2py"="ui2pyCommand";
}
#引数1：実行するマクロ名 #引数2以降　マクロの引数
#$MACROLIST[$Args[0]]
$cmdstr=$Args[0]
$command1=$MACROLIST[$cmdstr]

$ReturnValude = & $command1 $Args[1]