$version = "1.6.0.3"
$srcBin32 = "..\bin"
$srcBin64 = "..\bin64"
$targetFolder32 = "..\gpprof_2017_v"+$version
$targetFolder32Include = $folder32+"\include"	
$targetFolder64 = "..\gpprof_2017x64_v"+$version
$targetFolder64Include = $folder64+"\include"	
$targetZip32 = "..\gpprof_2017_v"+$version+".zip"
$targetZip64 = "..\gpprof_2017x64_v"+$version+".zip"
    
if (Test-Path -Path $folder32) {
    Write-Host "$folder32 already exists, recreating it"
    Remove-Item $folder32 -Recurse
}
if (Test-Path -Path $folder64) {
    Write-Host "$folder64 already exists, recreating it"
    Remove-Item $folder64 -Recurse
}

Write-Host "Creating 32 bit folder structure" -f Green
New-item -Path $targetFolder32 -ItemType Directory -Force	 | Out-Null
New-item -Path $targetFolder32Include -ItemType Directory	-Force | Out-Null

Write-Host "Copying bin32 artefacts from $srcBin32\* to $targetFolder32" -f Green
Copy-Item -Path $srcBin32\* -Include *.exe,*.chm,*.eul -Destination $targetFolder32
Copy-Item -Path ..\include\* -Include *.pas -Destination $targetFolder32Include
Compress-Archive -LiteralPath $targetFolder32 -DestinationPath $targetZip32


Write-Host "Creating 64 bit folder structure" -f Green
New-item -Path $targetFolder64 -ItemType Directory -Force	 | Out-Null
New-item -Path $targetFolder64Include -ItemType Directory	-Force | Out-Null


Write-Host "Copying bin64 artefacts from $srcBin64\* to $targetFolder64" -f Green
Copy-Item -Path $srcBin64\* -Include *.exe,*.chm,*.eul -Destination $targetFolder64
Copy-Item -Path ..\include\* -Include *.pas -Destination $targetFolder64Include

Compress-Archive -LiteralPath $targetFolder64 -DestinationPath $targetZip64

