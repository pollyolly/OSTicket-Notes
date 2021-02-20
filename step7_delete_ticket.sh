#!/bin/bash
username=""
password=""
database=""
startnow=$(date +"%Y-%m-%d %I:%M:%S %p")
mysql --user="$username" --password="$password" --database="$database" --execute="DELETE FROM our_ticket WHERE status_id = 3 AND SUBSTRING(created,1,4) < 2020;"

endnow=$(date +"%Y-%m-%d %I:%M:%S %p")
echo "Step7: Successfully deleted ticket records! Start: $startnow End: $endnow"
echo "Step7: Successfully deleted ticket records! Time: $startnow End: $endnow" | mail -s "Step 7 Delete Ticket Records Table" sample@up.edu.ph
