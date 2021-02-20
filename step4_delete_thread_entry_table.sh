#!/bin/bash
username=""
password=""
database=""
startnow=$(date +"%Y-%m-%d %I:%M:%S %p")
mysql --user="$username" --password="$password" --database="$database" --execute="DELETE FROM our_thread_entry WHERE thread_id IN (SELECT th.id FROM our_thread as th
    INNER JOIN our_ticket as tk
    ON th.object_id = tk.ticket_id
    WHERE tk.number IN (SELECT number FROM our_ticket WHERE status_id = 3 AND SUBSTRING(created,1,4) < 2020 ));
    SELECT ROW_COUNT();"

endnow=$(date +"%Y-%m-%d %I:%M:%S %p")
echo "Step4: Successfully deleted closed thread entry records! Start: $startnow End: $endnow"
echo "Step4: Successfully deleted closed thread entry records! Start: $startnow End: $endnow" | mail -s "Step 4 Delete Thread Entry Records Table" sample@up.edu.ph
