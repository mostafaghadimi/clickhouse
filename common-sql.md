# Common SQL commands in Clickhouse

## Version

```sql
SELECT version()
```

## Tables list

```sql
select * from system.tables
```

## TimeZones

```sql
SELECT * FROM system.time_zones;
```

## Top executed queries

```sql
SELECT
    COUNT(*) as query_count,
    query
FROM system.query_log
GROUP BY query
ORDER BY query_count DESC ;
```
