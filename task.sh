#! /bin/bash
DB_USER='backup'
DB_PASSWORD='P@ssw0rd'
mysqldumbp -u'backup' -p'P@ssw0rd' ShopDB > backup_full.sql
mysql -u'backup' -p'P@ssw0rd' ShopDBReserve < backup_full.sql
mysqldumbp -u'backup' -p'P@ssw0rd' ShopDB --no-create-db --no-create-info ShopDB > data_only_backup.sql
mysql -u'backup' -p'P@ssw0rd' ShopDBDevelopment < data_only_backup.sql
