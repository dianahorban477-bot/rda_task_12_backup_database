#! /bin/bash
DB_USER='backup'@'%'
DB_PASSWORD='P@ssw0rd'
mysqldumb -u'backup'@'%' -p'P@ssw0rd' ShopBD > backup_full.sql
mysql -u'backup'@'%' -p'P@ssw0rd' ShopDBRevers < backup_full.sql
mysqldumb -u'backup'@'%' -p'P@ssw0rd' ShopDB --no_create_db --no_create_info --result-file=data_only_backup.sql
mysql -u'backup'@'%' -p'P@ssw0rd' ShopDBDevelopment < data_only_backup.sql
