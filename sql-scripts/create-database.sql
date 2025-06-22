
-- Create a database
CREATE OR REPLACE DATABASE playground;

-- to switch to a database
USE DATABASE playground;

-- to create a schema in the database
-- make sure that you are in the correct database before executing this command
-- by default the database would use the public schema
CREATE OR REPLACE SCHEMA humanresources;

CREATE OR REPLACE TABLE employee (
    first_name STRING,
    last_name STRING,
    email STRING,
    street_address STRING,
    city STRING,
    start_data DATE
);


-- Find the current warehouse that is connected to
SELECT CURRENT_WAREHOUSE();



PUT file:/data/getting-startedemployees0*.csv  @sf_tuts.humanresources.%employee;


-- Stage the files as internal 
-- local path and local context of table didn't work
PUT file:/data/getting-started/employees0*.csv %employee;


PUT file:///Users/anton/Documents/projects/snowflakeprojects/snowflake-playground/data/getting-started/employees0*.csv  @playground.humanresources.%employee;


-- List the files in the stage table
LIST @playground.humanresources.%employee;


-- Copy the data
COPY INTO employee
  FROM @%employee
  FILE_FORMAT = (type = csv field_optionally_enclosed_by='"')
  PATTERN = '.*employees0[1-4].csv.gz'
  ON_ERROR = 'skip_file';

-- Copy the last file
COPY INTO employee
  FROM @%employee
  FILE_FORMAT = (type = csv field_optionally_enclosed_by='"')
  PATTERN = '.*employees05.csv.gz'
  ON_ERROR = 'skip_file';


-- This appends the new records

