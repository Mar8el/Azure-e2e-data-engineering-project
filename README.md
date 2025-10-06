#  **End to End Data Engineering project in Azure**

**This project is a modern Azure data engineering pipeline designed to automate ingestion, transformation, governance, and reporting.
The architecture leverages Azure Data Factory (ADF) for orchestration, Azure Data Lake Storage (ADLS Gen2) for raw and curated storage, Azure Databricks with Unity Catalog for scalable transformations and governance, Delta Lake tables for reliable and ACID-compliant data storage, Azure Synapse Analytics for reporting, and Azure Key Vault for secure secret management.**



## Workflow:

###  Data Ingestion with ADF

- ADF pipeline pulls data from from the source in raw format.

- Dynamic expressions are used to automatically generate daily folders (yyyy-MM-dd) and rename files consistently.

- This ensures each day’s data is neatly partitioned for traceability and historical storage.

### Data Storage in ADLS Gen2

- Raw data is stored in ADLS, which provides scalable, cost-effective, and secure cloud storage.

- Daily folder partitioning makes it easier to manage incremental loads and downstream analytics.

### Data Processing with Databricks, Unity Catalog

- ADF orchestrates a Databricks notebook that reads the raw files.

- Databricks transforms and cleans the data, standardizing formats, creates joines and handling quality issues.

- Processed data is stored back in ADLS in Delta/Parquet format — enabling efficient queries. And partial of the data in CSV

### Data Consumption with Synapse

- ADF then runs a Synapse SQL script to create/update external tables or views.

- Business users and BI tools (like Power BI) can query clean, curated datasets with low latency.


