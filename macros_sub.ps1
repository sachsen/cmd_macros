
function compareFiles([string]$file1){
    $localpath=Join-Path $env:USERPROFILE $file1;
    $localtime= $(Get-ItemProperty  $localpath).LastWriteTime;
    $remotepath=Join-Path $env:USERPROFILE 'OneDrive - Osaka University\cmd_macros\';
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
function checkExist([string]$file1){
    $localpath=Join-Path $env:USERPROFILE $file1;
    $remotepath=Join-Path $env:USERPROFILE 'OneDrive - Osaka University\cmd_macros\';
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
        #óºï˚ë∂ç›ÇµÇ»Ç¢ not exist both
        return 3;
    }
}
function execFiles([string]$file1,[int]$num){
    $localpath=Join-Path $env:USERPROFILE $file1;
    $remotepath=Join-Path $env:USERPROFILE 'OneDrive - Osaka University\cmd_macros\';
    $remotepath=Join-Path $remotepath $file1;
    switch ($num){
        0 {
            $remotenewer1=compareFiles $file1;
            switch($remotenewer1){
                1 {
                    Write-Output $file1+": local file updated!";
                    Write-Host $file1+": local file updated!";
                    Copy-Item -Path $remotepath -Destination $localpath -Force;
                }
                -1{
                    Write-Output $file1+": remote file updated!";
                    Write-Host $file1+": remote file updated!";
                    Copy-Item -Path $localpath -Destination $remotepath -Force;
                }
                0{
                    Write-Output $file1+": no file updated!";
                    Write-Host $file1+": no file updated!";
                }
            }
            
            return $TRUE;
        }
        1 {
            Copy-Item -Path $localpath -Destination $remotepath -Force;
            Write-Output $file1+": remote file created!";
            return $TRUE;
        }
        2 {
            Copy-Item -Path $remotepath -Destination $localpath -Force;
            Write-Output $file1+": local file created!";
            return $TRUE;        
        }
        3 {
            Write-Output $file1+": error!! not exist!";
            return $False;
        }
    }
}
$logpath=Join-Path $env:USERPROFILE logtemp.txt
Start-Transcript $logpath
$batname="macros.bat";
$psname="macros_sub.ps1";
$existbat=checkExist $batname;
$existps=checkExist $psname;
$result1=execFiles $batname $existbat;
$result2=execFiles $psname $existps;
Stop-Transcript
if($result1 -and $result2){
    Write-Output "updadate successed!"
    exit 0;
}else{
    Write-Output "updadate failed!!"
    exit 1;
}
