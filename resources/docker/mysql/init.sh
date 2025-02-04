#!/bin/bash

mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "
    CREATE DATABASE IF NOT EXISTS $APP_DATABASE;
    CREATE USER '$APP_USER'@'%' IDENTIFIED BY '$APP_PASSWORD';
    GRANT ALL PRIVILEGES ON $APP_DATABASE.* TO '$APP_USER'@'%';

    CREATE DATABASE IF NOT EXISTS $TELESCOPE_DATABASE;
    CREATE USER '$TELESCOPE_USER'@'%' IDENTIFIED BY '$TELESCOPE_PASSWORD';
    GRANT ALL PRIVILEGES ON $TELESCOPE_DATABASE.* TO '$TELESCOPE_USER'@'%';

    FLUSH PRIVILEGES;
"
