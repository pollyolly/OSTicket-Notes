#!/bin/bash
username=""
password=""
database=""
startnow=$(date +"%Y-%m-%d %I:%M:%S %p")
mysql --user="$username" --password="$password" --database="$database" --execute="DELETE FROM our_ticket__cdata WHERE ticket_id IN (SELECT ticket_id FROM our_ticket WHERE status_id = 3 AND SUBSTRING(created,1,4) < 2020);"

endnow=$(date +"%Y-%m-%d %I:%M:%S %p")
echo "Step6: Successfull deleted ticket cdata records! Start: $startnow End: $endnow"
echo "Step6: Successfully deleted thread cdata records! Start: $startnow End: $endnow" | mail -s "Step 6 Delete Thread Cdata Records Table" sample@up.edu.ph
