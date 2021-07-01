# OSTicket-Notes

### Optimizing OSTicket Database
```
Delete closed tickets by year and Migrate all blob files in the database to filesystem

step1_delete_chunkfile_table.sh
step2_delete_file_table.sh
step3_delete_attachment_table.sh
step4_delete_thread_entry_table.
step5_delete_thread_table.sh
step6_delete_ticket_cdata.sh
step7_delete_ticket.sh
step8_migrate_db_blob_to_file.sh

Note: Step 8 --limit= is the total rows of chunk files to be converted
      Step 8 requires Attachment on the Filesystem plugin
```
### Add Sign In Navigation
```
/upload/include/class.nav.php
Line 355: $navs['signin']=array('desc'=>__('Sign In'),'href'=>'login.php','title'=>'Sign In');

/upload/login.php
Line 149:  else {
               $nav = new UserNav();
               $nav->setActiveNav('signin');
            }
```
