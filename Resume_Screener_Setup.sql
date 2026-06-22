--> Create a Warehouse 
-- The compute engine that runs your queries
CREATE OR REPLACE WAREHOUSE RESUME_SCREENER_WH
WAREHOUSE_SIZE = 'X-SMALL'
AUTO_SUSPEND = 60
AUTO_RESUME = TRUE
COMMENT = 'Warehouse for Resume Screener project';

--> Create a Database
-- The top-level container
CREATE OR REPLACE DATABASE RESUME_SCREENER_DB
COMMENT = 'Database for Resume Screener project';

--> Create a Schema
-- This is the folder inside the database to hold your tables, views, etc.
CREATE OR REPLACE SCHEMA RESUME_SCREENER_DB.RECRUITING
COMMENT = 'Schema for all Tables, Views, and Objects for the Resume Screener project';

--> Add these to work with them in your your current worksheet
USE WAREHOUSE RESUME_SCREENER_WH;
USE DATABASE RESUME_SCREENER_DB;
USE SCHEMA RECRUITING;

--> Run this to verify if you are using the required setting in your worksheet/workspace
SELECT CURRENT_WAREHOUSE() AS active_warehouse,
CURRENT_DATABASE() AS active_database,
CURRENT_SCHEMA() AS active_schema;