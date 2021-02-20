#!/bin/bash
username=""
password=""
database=""
startnow=$(date +"%Y-%m-%d %I:%M:%S %p")
mysql --user="$username" --password="$password" --database="$database" --execute="DELETE FROM our_file WHERE id IN (SELECT att.file_id FROM our_attachment as att WHERE att.object_id IN (SELECT the.id FROM our_thread as th INNER JOIN our_thread_entry as the on th.id = the.thread_id INNER JOIN our_ticket as tk ON th.object_id = tk.ticket_id WHERE tk.number IN (SELECT number FROM our_ticket WHERE status_id = 3 AND SUBSTRING(created,1,4) < 2020 ))); SELECT ROW_COUNT();"

endnow=$(date +"%Y-%m-%d %I:%M:%S %p")
echo "Step2: Successfully deleted closed file! Start: $startnow End: $endnow"
echo "Step2: Successfully deleted closed file! Start: $startnow End: $endnow" | mail -s "Step 2 Delete File Table" sample@up.edu.ph
