#!/bin/bash

# The Chrome Data Cleaner! (Without Closing Chrome)
# The script will miss quite a bit if Chrome is running.  But it shouldn't close any tabs!

CHROME_PATH="$HOME/.config/google-chrome/Default"

echo "Clearing Google Chrome temporary data..."

# Destroy Browsing & Download History (Only if Chrome allows it while running)
HISTORY_PATH="$CHROME_PATH/History"
if [[ -f "$HISTORY_PATH" ]]; then
    echo "Clearing History..."
    truncate -s 0 "$HISTORY_PATH"
fi

HISTORY_JOURNAL_PATH="$CHROME_PATH/History-journal"
if [[ -f "$HISTORY_JOURNAL_PATH" ]]; then
    rm -f "$HISTORY_JOURNAL_PATH"
fi

# Delete Cookies - keeps saved logins
COOKIES_PATH="$CHROME_PATH/Cookies"
if [[ -f "$COOKIES_PATH" ]]; then
    echo "Clearing Cookies..."
    truncate -s 0 "$COOKIES_PATH"
fi

COOKIES_JOURNAL_PATH="$CHROME_PATH/Cookies-journal"
if [[ -f "$COOKIES_JOURNAL_PATH" ]]; then
    rm -f "$COOKIES_JOURNAL_PATH"
fi

# Annihilate Cached Images and Files
CACHE_PATH="$CHROME_PATH/Cache"
if [[ -d "$CACHE_PATH" ]]; then
    echo "Clearing Cache..."
    rm -rf "$CACHE_PATH"/*
fi

CODE_CACHE_PATH="$CHROME_PATH/Code Cache"
if [[ -d "$CODE_CACHE_PATH" ]]; then
    echo "Clearing Code Cache..."
    rm -rf "$CODE_CACHE_PATH"/*
fi

# Delete Data Cache for Hosted Apps
SW_CACHE_PATH="$CHROME_PATH/Service Worker/CacheStorage"
if [[ -d "$SW_CACHE_PATH" ]]; then
    echo "Clearing Service Worker Cache..."
    rm -rf "$SW_CACHE_PATH"/*
fi

echo "Chrome temporary data cleared successfully!"

# Tada