#!/bin/bash
username=""
password=""
database=""
startnow=$(date +"%Y-%m-%d %I:%M:%S %p")
mysql --user="$username" --password="$password" --database="$database" --execute="DELETE FROM our_attachment WHERE object_id IN (SELECT the.id FROM our_thread as th
    INNER JOIN our_thread_entry as the
    ON th.id = the.thread_id
    INNER JOIN our_ticket as tk
    ON th.object_id = tk.ticket_id
    WHERE tk.number IN (SELECT number FROM our_ticket WHERE status_id = 3 AND SUBSTRING(created,1,4) < 2020 )) AND type = 'H';
    SELECT ROW_COUNT();"
endnow=$(date +"%Y-%m-%d %I:%M:%S %p")
echo "Step3: Successfully deleted closed attachments! Start: $startnow End: $endnow"
echo "Step3: Successfully deleted closed attachments! Start: $startnow End: $endnow" | mail -s "Step 3 Delete Attachment Table" sample@up.edu.ph
