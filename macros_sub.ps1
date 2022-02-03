
function compareFiles([string]$file1,[string]$folder1){
    $localpath=Join-Path $env:USERPROFILE "cmd_macros";
    $localpath=Join-Path $localpath $file1;
    $localtime= $(Get-ItemProperty  $localpath).LastWriteTime;
    $remotepath=Join-Path $env:USERPROFILE $folder1'\cmd_macros\';
    $remotepath=Join-Path $remotepath $file1;
    $remotetime=$(Get-ItemProperty  $remotepath).LastWriteTime;
    if((get-date $localtime) -lt (get-date $remotetime)){
        $remotenewer=1;
    }elseif((get-date $remotetime) -lt (get-date $localtime)){
        $remotenewer=-1;
    }else{
        $remotenewer=0;
    }
    ;
    return $remotenewer
}
function checkExist([string]$file1,[string]$folder1){
    $localpath=Join-Path $env:USERPROFILE "cmd_macros";
    $localpath=Join-Path $localpath $file1;
    $remotepath=Join-Path $env:USERPROFILE $folder1'\cmd_macros\';
    $remotepath=Join-Path $remotepath $file1;
    $exlocal=Test-Path $localpath
    $exremote=Test-Path $remotepath
    if ($exlocal -and $exremote) {
        return 0;
    }elseif($exlocal -and (-not $exremote)){
        #remoteÇ™ë∂ç›ÇµÇ»Ç¢ not exist remote file
        return 1;
    }elseif((-not $exlocal) -and $exremote){
        return 2;
    }elseif((-not $exlocal) -and (-not $exremote)){
        #óºï˚ë∂ç›ÇµÇ»Ç¢ neither exist
        return 3;
    }
}
function execFiles([string]$file1,[int]$num,[string]$folder1){
    $localpath=Join-Path $env:USERPROFILE 'cmd_macros\';
    $localpath=Join-Path $localpath $file1;
    $remotepath=Join-Path $env:USERPROFILE $folder1'\cmd_macros\';
    $remotepath=Join-Path $remotepath $file1;
    switch ($num){
        0 {
            $remotenewer1=compareFiles $file1 $folder1;
            switch($remotenewer1){
                1 {
                    Write-Output $file1": local file updated!";
                    Write-Host $file1": local file updated!";
                    Copy-Item -Path $remotepath -Destination $localpath -Force;
                }
                -1{
                    Write-Output $file1": remote file updated!";
                    Write-Host $file1": remote file updated!";
                    Copy-Item -Path $localpath -Destination $remotepath -Force;
                }
                0{
                    Write-Output $file1": no file updated!";
                    Write-Host $file1": no file updated!";
                }
            }
            
            return $TRUE;
        }
        1 {
            Copy-Item -Path $localpath -Destination $remotepath -Force;
            Write-Output $file1": remote file created!";
            return $TRUE;
        }
        2 {
            Copy-Item -Path $remotepath -Destination $localpath -Force;
            Write-Output $file1": local file created!";
            return $TRUE;        
        }
        3 {
            Write-Output $file1": error!! not exist!";
            return $False;
        }
    }
}


$logpath=Join-Path $env:USERPROFILE "cmd_macros\log.txt";
Start-Transcript $logpath;
$jsonpath=Join-Path $env:USERPROFILE "cmd_macros\config.json"
$jsonContent = (Get-Content $jsonpath | ConvertFrom-Json)
if(!$jsonContent.Backup){
    Write-Output "Backup setting : Disable"
    exit 0;
}
$configpath=Join-Path  $env:USERPROFILE "cmd_macros\config.json"
$batname="macros.bat";
$psname="macros_sub.ps1";
$existbat=checkExist $batname $jsonContent.OneDrivePath;
$existps=checkExist $psname $jsonContent.OneDrivePath;
$result1=execFiles $batname $existbat $jsonContent.OneDrivePath;
$result2=execFiles $psname $existps $jsonContent.OneDrivePath;
Stop-Transcript
if($result1 -and $result2){
    Write-Output "updadate successed!"
    exit 0;
}else{
    Write-Output "updadate failed!!"
    exit 1;
}
