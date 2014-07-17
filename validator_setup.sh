#!/bin/bash

CURRENT_COMMIT=`git rev-parse --short HEAD`
START_DATE="20140430"
END_DATE="20140816"

# Install packages we need for validation
sudo apt-get update -qq
sudo apt-get install -qq zip
git clone https://github.com/seabre/googletransitdatafeed

# Generate feed_info.txt
echo "feed_publisher_name,feed_publisher_url,feed_lang,feed_start_date,feed_end_date,feed_version" > feed_info.txt
echo "CARTA,http://www.gocarta.org,EN,${START_DATE},${END_DATE},${CURRENT_COMMIT}" >> feed_info.txt

# Write gtfs.zip
zip gtfs.zip *.txt
