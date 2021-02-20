#!/bin/bash
username=""
password=""
database=""
startnow=$(date +"%Y-%m-%d %I:%M:%S %p")
mysql --user="$username" --password="$password" --database="$database" --execute="DELETE FROM our_thread WHERE object_id IN (SELECT ticket_id FROM our_ticket WHERE status_id = 3 AND SUBSTRING(created,1,4) < 2020 ) AND object_type = 'T';SELECT ROW_COUNT();"

endnow=$(date +"%Y-%m-%d %I:%M:%S %p")
echo "Step5: Successfully deleted thread records! Start: $startnow End: $endnow"
echo "Step5: Successfully deleted thread records! Start: $startnow End: $endnow" | mail -s "Step 5 Delete Thread Records Table" sample@up.edu.ph
