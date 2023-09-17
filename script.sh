#!/bin/bash

source .env

sed -e "s/\$MINIO_CLICKHOUSE_BACKUP_BUCKET/${MINIO_CLICKHOUSE_BACKUP_BUCKET}/g" \
    -e "s/\$MINIO_ACCESS_KEY_ID/${MINIO_ROOT_USER}/g" \
    -e "s/\$MINIO_SECRET_ACCESS_KEY/${MINIO_ROOT_PASSWORD}/g" \
    config_files/clickhouse/templates/storage-template.xml \
    > config_files/clickhouse/etc/clickhouse-server/config.d/storage.xml