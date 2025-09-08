--DATABRICKS--

-- Creating Unity Catalog
CREATE CATALOG If NOT EXISTS my_sales_catalog;
MANAGED LOCATION 'abfss://<container-name>@<storage-account>.dfs.core.windows.net/salesdata/managed_catalog';

--Creating Schema
CREATE SCHEMA IF NOT EXISTS my_sales_catalog.sales_schema


--SYNAPSE--
-- Creating USer

CREATE USER [<storage-account>] FROM EXTERNAL PROVIDER;

-- Creating Roles
ALTER ROLE db_datareader ADD MEMBER [<storage-account>];
ALTER ROLE db_owner ADD MEMBER [<storage-account>];

-- Creating a view in Synapse and in the Script activity 

create or ALTER view dbo.salessummarynew
as
select * FROM
    OPENROWSET (
        bulk 'https://<storage-account>.dfs.core.windows.net/<container-name>/salesdata/cleaned/sales_summary/*.parquet',
        format = 'parquet'
    ) as [result]

