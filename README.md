# OSTicket-Notes

### Optimizing OSTicket 1.14 versions Database
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
### Add Sign In Navigation Osticket 1.15 above
```
/upload/include/class.nav.php
Line 355: $navs['signin']=array('desc'=>__('Sign In'),'href'=>'login.php','title'=>'Sign In');

/upload/login.php
Line 149:  else {
               $nav = new UserNav();
               $nav->setActiveNav('signin');
            }
```
### Database OSTicket 1.15 above
```
//Plugin Status
SELECT name,isactive FROM ilcd_plugin;
UPDATE ilcd_plugin SET isactive='0' WHERE name='LDAP Authentication and Lookup';
//Update Base URL
SELECT value FROM ilcd_config WHERE `id`=2;
UPDATE ilcd_config SET value = 'http://beta.helpdesk.dilc.info' WHERE `id`=2;
//Show Current URL
SELECT `id`,`key`,`value` from ilcd_config WHERE `key` like '%string-char-of-existing-url%';
```
### Manual Uninstall a Plugin OSticket 1.15 above
```
UPDATE ilcd_plugin SET isactive='0' WHERE name='LDAP Authentication and Lookup';
DELETE FROM ilcd_plugin where id=2;//LDAP Authentication and Lookup;

rm - r /upload/include/plugins/auth-ldap.phar
```
