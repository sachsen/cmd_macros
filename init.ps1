Param($arg1,$arg2)
$tf=$arg1;
$odpath=$arg2;
$json=@{Backup=$tf;OneDriveFolderName=$odpath}
$jsonpath=Join-Path $env:USERPROFILE "cmd_macros\config.json"
ConvertTo-Json $json | Out-File $jsonpath -Encoding utf8 -Force 

