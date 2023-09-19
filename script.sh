#!/bin/bash

source .env

echo "Start executing the script..."

sed -e "s/\$MINIO_CLICKHOUSE_BACKUP_BUCKET/${MINIO_CLICKHOUSE_BACKUP_BUCKET}/g" \
    -e "s/\$MINIO_ACCESS_KEY_ID/${MINIO_ROOT_USER}/g" \
    -e "s/\$MINIO_SECRET_ACCESS_KEY/${MINIO_ROOT_PASSWORD}/g" \
    config_files/clickhouse/templates/storage-template.xml \
    > config_files/clickhouse/etc/clickhouse-server/config.d/storage.xml

sed -e "s/\$CLICKHOUSE_ADMIN_USER_PASSWORD/${CLICKHOUSE_ADMIN_USER_PASSWORD}/g" \
    -e "s/\$CLICKHOUSE_BUSINESS_INTELLIGENCE_USER_PASSWORD/${CLICKHOUSE_BUSINESS_INTELLIGENCE_USER_PASSWORD}/g" \
    config_files/clickhouse/templates/users.xml \
    > config_files/clickhouse/etc/clickhouse-server/config.d/users.xml

echo "Successfully executed the script"
