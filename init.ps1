Param($arg1,$arg2)
$tf=$arg1;
$odpath=$arg2;
$ignorelist=@(".ignore","log.txt","README.md")
$json=@{Backup=$tf;OneDriveFolderName=$odpath;ignorelist=$ignorelist}
$jsonpath=Join-Path $env:USERPROFILE "cmd_macros\config.json"
ConvertTo-Json $json | Out-File $jsonpath -Encoding utf8 -Force 

