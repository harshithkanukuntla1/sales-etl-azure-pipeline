# Sales ETL Pipeline — Azure Data Factory

A simple end-to-end data pipeline built on Azure to practice core data engineering concepts.

## Architecture

CSV file → Azure Data Lake Storage Gen2 (raw container) → Azure Data Factory (Copy Data pipeline) → Azure SQL Database → validated with SQL queries

## What it does

1. A raw sales CSV (Region, Sales columns) is uploaded to an ADLS Gen2 `raw` container.
2. An Azure Data Factory pipeline (`pipeline1`) uses a Copy Data activity to read the CSV and load it into an Azure SQL Database table (`RegionSales`), mapping the source `Sales` column to the destination `TotalSales` column.
3. Data is validated directly in Azure SQL using the Query editor.

## Files in this repo

- `pipeline1.json` — exported Data Factory pipeline definition
- `sql_scripts.sql` — table creation, truncate, and validation queries
- `query_result.png` — screenshot of the loaded data, queried directly from Azure SQL

## What I learned / debugged

- Azure storage account names must be globally unique
- Azure SQL blocks public network access by default — had to enable "Allow Azure services" under server networking settings for Data Factory to connect
- Source-to-destination column mapping in Data Factory must be set explicitly when column names differ (`Sales` → `TotalSales`)
- Insert-only write behavior duplicates data on repeated pipeline runs — added a TRUNCATE step before load to keep results idempotent
