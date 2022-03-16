#�}�N����ps1�`���ŋL�q���Adoskey�œo�^�����}�N�����ɉ������R�}���h�������Ŏ��s����B

function getAnacondaEnvPath([string]$file1){
    #current env�̃p�X��Ԃ�.������active�Ȋ���python.exe�̈ʒu
    $folder1=Split-Path $file1 -Parent;
    return $folder1;
}
function getAnacondaLibBinPath([string]$file1){
    #current env��Library\bin\�p�X��Ԃ�.������active�Ȋ���python.exe�̈ʒu
    $folder1=getAnacondaEnvPath $file1;
    $folder1=Join-Path $folder1 "\Library\bin\";
    return $folder1;
}
function qteditCommand([string]$file1){
    #Qt Editor���J���}�N���B�ʂ�bat�t�@�C������Ă΂��O��B������active�Ȋ���python.exe�̈ʒu
    Write-Output "open QtEditor";
    Write-Host  "open QtEditor";
    $folder1=getAnacondaLibBinPath $file1;
    $file2=Join-Path $folder1 "designer.exe";
    Start-Process -FilePath $file2;
}
function ui2pyCommand($file1,$file2){
    #pyside2��.ui��.py�ɕϊ�����}�N��.�ʂ�bat�t�@�C������Ă΂��O��B����1��active�Ȋ���python.exe�̈ʒu.2�͕ϊ�����t�@�C��
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
#����1�F���s����}�N���� #����2�ȍ~�@�}�N���̈���
#$MACROLIST[$Args[0]]
$cmdstr=$Args[0]
$command1=$MACROLIST[$cmdstr]

$ReturnValude = & $command1 $Args[1]