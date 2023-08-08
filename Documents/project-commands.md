```bash
mysql -u root -p project < unnormalized_table.sql
mysql -u root -p
```

```SQL
-- show table
use project;
desc unnormalized;
select * from unnormalized;

-- populate
LOAD DATA LOCAL INFILE 'dummy_data.tsv'
INTO TABLE unnormalized
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n';

-- load tables
source normalized_tables.sql;

-- query
source queries.sql;
```