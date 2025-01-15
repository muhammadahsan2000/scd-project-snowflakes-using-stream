# Slowly Changing Dimensions in Snowflake Using Streams and Tasks
This project demonstrates the implementation of Slowly Changing Dimensions (SCD) in Snowflake using Snowpipe for automated data ingestion, Streams for capturing changes in staging data, and Tasks for processing and applying those changes to target tables.
# Diagram
Below is a visual representation of the pipeline:
![Slowlychangingdimension drawio](https://github.com/user-attachments/assets/04ae6b4e-e351-433b-8da7-d6c27d539ab6)

# Pipeline Overview
# Amazon S3:
Holds raw data files.
# Snowpipe:
Automatically loads data from S3 into Snowflake's staging tables.

# Snowflake Stream:
Monitors changes (inserts, updates, deletes) in the staging table.

# Snowflake Tasks:
Automates the processing and loading of data into final dimension tables.
# Key Components
# S3:
The source location for raw data.

# Snowpipe:
Automatically ingests data into Snowflake.

# Streams:
Tracks data changes for managing Slowly Changing Dimensions (SCD).

# Tasks:
Automates data processing on a schedule.

# Snowflake Tables:
Stores the final, processed data.

# Use Case
This project is ideal for environments where data is frequently updated, and tracking changes (SCD) is necessary for data warehouse management.

# Technologies Used
Amazon S3 for storage Snowflake (with Snowpipe, Streams, and Tasks) Docker for containerized applications Apache NiFi for data flow management Jupyter Notebook for data analysis and scripts

# How to Run the Pipeline
Clone this project repository. Set up your Snowflake environment. Use the provided setup scripts to configure Snowpipe, Streams, and Tasks. Run the pipeline and monitor the SCD behavior in Snowflake's tables.
