#!/usr/bin/php
startnow=$(date +"%Y-%m-%d %I:%M:%S %p")
php ../manage.php file migrate --backend D --to F --limit=160495
#--limit=total_rows_of_chunkfile_files
endnow=$(date +"%Y-%m-%d %I:%M:%S %p")
echo "Step8: Successfully migrated blobs to file system! Start: $startnow End: $endnow"
echo "Step8: Successfully migrated blobs to file system! Start: $startnow End: $endnow" | mail -s "Step 8 migrate blobs to file system" sample@up.edu.ph
