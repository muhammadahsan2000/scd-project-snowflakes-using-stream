-- Ingesting Data in the tables
---------------------------------
use role accountadmin;
grant create integration on account to sysadmin;
use role sysadmin;
create warehouse if not exists COMPUTE_WH with warehouse_size = 'XSMALL' auto_suspend = 120;

USE DATABASE SCD_DEMO;

USE SCHEMA SCD_DEMO.SCD2;


-- Creting Storage Integration
CREATE OR REPLACE STORAGE INTEGRATION s3_init_real_time
TYPE = EXTERNAL_STAGE
STORAGE_PROVIDER = S3
ENABLED = TRUE
STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::851725404692:role/s3-integration-scd-datawarehousing-role'
STORAGE_ALLOWED_LOCATIONS = ('s3://scd-datawarehouse-st');

DESC STORAGE INTEGRATION s3_init_real_time;

-- Creating Stage
CREATE OR REPLACE STAGE customer_ext_stage
url = 's3://scd-datawarehouse-st'
STORAGE_INTEGRATION = s3_init_real_time;

SHOW STAGES;
LIST @customer_ext_stage;

-- Creating File Format
CREATE OR REPLACE FILE FORMAT csv
TYPE = CSV
FIELD_DELIMITER = ','
SKIP_HEADER = 1;

-- Creating Snowpipe
CREATE OR REPLACE PIPE customer_s3_pipe
AUTO_INGEST = TRUE
AS
COPY INTO CUSTOMER_RAW
FROM @customer_ext_stage
FILE_FORMAT = CSV;

-- Check pipes details to get the notification channel
SHOW PIPES;

-- Check current status of pipe
SELECT SYSTEM$PIPE_STATUS('customer_s3_pipe');


SELECT COUNT(*) FROM customer_raw;

SELECT * FROM customer_raw;
