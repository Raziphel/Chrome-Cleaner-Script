# The Chrome Data Cleaner! (Without Closing Chrome) 
# The script will miss quite a bit if Chrome is running.  But it shouldn't close any tabs!

$chromePath = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default"

Write-Host "Clearing Google Chrome temporary data..."

# Destroy Browsing & Download History (Only if Chrome allows it while running)
$historyPath = "$chromePath\History"
if (Test-Path $historyPath) {
    Write-Host "Clearing History..."
    Clear-Content -Path $historyPath -Force -ErrorAction SilentlyContinue
}

$historyJournalPath = "$chromePath\History-journal"
if (Test-Path $historyJournalPath) {
    Remove-Item $historyJournalPath -Force -ErrorAction SilentlyContinue
}

# Delete Cookies - keeps saved logins
$cookiesPath = "$chromePath\Cookies"
if (Test-Path $cookiesPath) {
    Write-Host "Clearing Cookies..."
    Clear-Content -Path $cookiesPath -Force -ErrorAction SilentlyContinue
}

$cookiesJournalPath = "$chromePath\Cookies-journal"
if (Test-Path $cookiesJournalPath) {
    Remove-Item $cookiesJournalPath -Force -ErrorAction SilentlyContinue
}

# Annihilate Cached Images and Files
$cachePath = "$chromePath\Cache"
if (Test-Path $cachePath) {
    Write-Host "Clearing Cache..."
    Remove-Item "$cachePath\*" -Recurse -Force -ErrorAction SilentlyContinue
}

$codeCachePath = "$chromePath\Code Cache"
if (Test-Path $codeCachePath) {
    Write-Host "Clearing Code Cache..."
    Remove-Item "$codeCachePath\*" -Recurse -Force -ErrorAction SilentlyContinue
}

# Delete Data Cache for Hosted Apps
$swCachePath = "$chromePath\Service Worker\CacheStorage"
if (Test-Path $swCachePath) {
    Write-Host "Clearing Service Worker Cache..."
    Remove-Item "$swCachePath\*" -Recurse -Force -ErrorAction SilentlyContinue
}

Write-Host "Chrome temporary data cleared successfully!"

# Tada!