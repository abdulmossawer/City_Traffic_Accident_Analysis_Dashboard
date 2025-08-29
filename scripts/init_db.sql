USE master;
GO

-- Drop and recreate the 'CityTrafficDB' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'CityTrafficDB')
BEGIN
    ALTER DATABASE CityTrafficDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE CityTrafficDB;
END;
GO

-- Create the 'CityTrafficDB' database
CREATE DATABASE CityTrafficDB;
GO

USE CityTrafficDB;


IF OBJECT_ID('dbo.RoadAccidents', 'U') IS NOT NULL
    DROP TABLE dbo.RoadAccidents;
GO

-- Create table with bigger columns to avoid "column too long" error
CREATE TABLE dbo.RoadAccidents (
    Accident_Index            NVARCHAR(100) NULL,   -- don't force PK yet
    AccidentDate              NVARCHAR(50)  NULL,
    Day_of_Week               NVARCHAR(50)  NULL,
    Junction_Control          NVARCHAR(200) NULL,
    Junction_Detail           NVARCHAR(200) NULL,
    Accident_Severity         NVARCHAR(50)  NULL,
    Latitude                  NVARCHAR(100) NULL,
    Light_Conditions          NVARCHAR(200) NULL,
    Local_Authority_District  NVARCHAR(200) NULL,
    Carriageway_Hazards       NVARCHAR(200) NULL,
    Longitude                 NVARCHAR(100) NULL,
    Number_of_Casualties      NVARCHAR(50)  NULL,
    Number_of_Vehicles        NVARCHAR(50)  NULL,
    Police_Force              NVARCHAR(200) NULL,
    Road_Surface_Conditions   NVARCHAR(200) NULL,
    Road_Type                 NVARCHAR(200) NULL,
    Speed_limit               NVARCHAR(50)  NULL,
    Time                      NVARCHAR(50)  NULL,
    Urban_or_Rural_Area       NVARCHAR(200) NULL,
    Weather_Conditions        NVARCHAR(200) NULL,
    Vehicle_Type              NVARCHAR(200) NULL
);
GO

-- Bulk insert from CSV
BULK INSERT dbo.RoadAccidents
FROM 'C:\Users\SADIQ\Downloads\Road Accident Data.csv'
WITH (
    FORMAT = 'CSV',              -- SQL 2017+ (else comment this line)
    FIRSTROW = 2,                -- skip header
    FIELDTERMINATOR = ',',       -- comma separated
    ROWTERMINATOR = '0x0a',      -- Unix LF line ending (try '0x0d0a' if Windows CRLF)
    CODEPAGE = '65001',          -- UTF-8
    TABLOCK,
    KEEPNULLS,
    MAXERRORS = 5000             -- allow skipping bad rows
);
GO

SELECT * FROM RoadAccidents;

-- Check the duplicates

SELECT 
	Accident_Index,
	COUNT(*) AS DuplicateVal
FROM RoadAccidents
GROUP BY Accident_Index
HAVING COUNT(*) > 1;

-- Removing the duplicates

WITH CTE AS (
	SELECT 
		*,
		ROW_NUMBER() OVER(PARTITION BY Accident_Index ORDER BY (SELECT NULL)) AS rn
	FROM RoadAccidents
)
DELETE FROM CTE WHERE rn > 1;


-- Converting DataTypes

ALTER TABLE RoadAccidents
ALTER COLUMN Accident_Index NVARCHAR(50) NOT NULL;

ALTER TABLE RoadAccidents
ALTER COLUMN AccidentDate DATE;

ALTER TABLE RoadAccidents
ALTER COLUMN Latitude FLOAT;

ALTER TABLE RoadAccidents
ALTER COLUMN Longitude FLOAT;

ALTER TABLE RoadAccidents
ALTER COLUMN Number_of_Casualties INT;

ALTER TABLE RoadAccidents
ALTER COLUMN Number_of_Vehicles INT;

ALTER TABLE RoadAccidents
ALTER COLUMN Speed_limit INT;

ALTER TABLE RoadAccidents
ALTER COLUMN Time TIME;

-- Assign Primary Key

ALTER TABLE RoadAccidents
ADD CONSTRAINT PK_RoadAccidents PRIMARY KEY (Accident_Index);