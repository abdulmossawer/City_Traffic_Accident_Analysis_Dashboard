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

