# Define the list of remote sources
$urlList = @(
    # SourceHanSerifCN-Bold.ttf
    "https://raw.githubusercontent.com/wordshub/free-font/refs/heads/master/assets/font/%E4%B8%AD%E6%96%87/%E6%80%9D%E6%BA%90%E5%AD%97%E4%BD%93%E7%B3%BB%E5%88%97/%E6%80%9D%E6%BA%90%E5%AE%8B%E4%BD%93/SourceHanSerifCN-Bold.ttf"
    # SourceHanSerifCN-Regular.ttf
    , "https://raw.githubusercontent.com/wordshub/free-font/refs/heads/master/assets/font/%E4%B8%AD%E6%96%87/%E6%80%9D%E6%BA%90%E5%AD%97%E4%BD%93%E7%B3%BB%E5%88%97/%E6%80%9D%E6%BA%90%E5%AE%8B%E4%BD%93/SourceHanSerifCN-Regular.ttf"
)

# Define the destination directory
$destDir = "./fonts"

# Ensure the destination directory exists (equivalent to curl --create-dirs)
if (-not (Test-Path -Path $destDir -PathType Container)) {
    New-Item -Path $destDir -ItemType Directory -Force | Out-Null
}

foreach ($url in $urlList) {
    # Extract the filename from the URL, ignoring URL query strings
    $encodedFileName = [System.IO.Path]::GetFileName([uri]::new($url).LocalPath)
    
    # Decode URL-encoded characters (e.g., %20 to space) just in case
    $fileName = [System.Uri]::UnescapeDataString($encodedFileName)
    
    $destPath = Join-Path -Path $destDir -ChildPath $fileName

    if (-not (Test-Path -Path $destPath -PathType Leaf)) {
        Write-Host "Downloading: $fileName ..."
        
        # Ref: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/invoke-webrequest
        Invoke-WebRequest -Uri $url -OutFile $destPath
        
        Write-Host "Saved to: $destPath" -ForegroundColor Green
    } else {
        Write-Host "Already exists: $fileName" -ForegroundColor DarkGray
    }
}
