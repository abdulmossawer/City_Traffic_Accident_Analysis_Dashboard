SELECT * FROM RoadAccidents


-- Accidents per Year
CREATE VIEW TotalAccidentByYear AS
SELECT 
	YEAR(AccidentDate) AS AccYear,
	COUNT(*) AS TotalAccidentByYear
FROM RoadAccidents
GROUP BY YEAR(AccidentDate)


-- Accidents per Month
CREATE VIEW TotalAccidentByMonth AS
SELECT
	DATENAME(MONTH, AccidentDate) AS AccMonth,
	COUNT(*) AS TotalAccidentByMonth
FROM RoadAccidents
GROUP BY DATENAME(MONTH, AccidentDate)


-- Accidents by Day of Week
CREATE VIEW TotalAccidentByDay AS
SELECT
	Day_of_Week,
	COUNT(*) AS TotalAccidentByDay
FROM RoadAccidents
GROUP BY Day_of_Week
ORDER BY TotalAccidentByDay DESC;


-- Accident Count by Severity
CREATE VIEW TotalSeverity AS
SELECT
	Accident_Severity,
	COUNT(*) AS TotalSeverity
FROM RoadAccidents
GROUP BY Accident_Severity
ORDER BY TotalSeverity DESC;


-- Average Casualties per Accident
CREATE VIEW AvgCasualties AS
SELECT
	AVG(TRY_CAST(Number_of_Casualties AS FLOAT)) AS TotalCasualties
FROM RoadAccidents;


-- Fatal Accidents by Month
CREATE VIEW FatalAccidentsByMonth AS
SELECT
	DATENAME(MONTH, AccidentDate) AS AccidentMonth,
	COUNT(*) AS FatalAccidentByMonth
FROM RoadAccidents
WHERE Accident_Severity = 'Fatal'
GROUP BY DATENAME(MONTH, AccidentDate)
ORDER BY FatalAccidentByMonth DESC;


-- Accidents by Road Surface
CREATE VIEW AccidentsByRoadSurface AS
SELECT
CASE
	WHEN TRIM(Road_Surface_Conditions) IS NULL THEN 'Unknown'
	ELSE Road_Surface_Conditions
END AS Road_Surface_Conditions,
	COUNT(*) AS SurfaceConditions
FROM RoadAccidents
GROUP BY Road_Surface_Conditions
ORDER BY SurfaceConditions DESC;


-- Weather Impact on Fatal Accidents
CREATE VIEW WeatherImpact AS
SELECT
CASE
	WHEN TRIM(Weather_Conditions) IS NULL THEN 'Unknown'
	ELSE Weather_Conditions
END AS Weather_Conditions,
	COUNT(*) FatalAcc
FROM RoadAccidents
WHERE Accident_Severity = 'Fatal'
GROUP BY Weather_Conditions
ORDER BY FatalAcc DESC;


-- Accidents by Lighting Condition
CREATE VIEW LightingCondition AS
SELECT
	Light_Conditions,
	COUNT(*) AS TotalAcc
FROM RoadAccidents
GROUP BY Light_Conditions
ORDER BY TotalAcc DESC;


-- Accidents by Vehicle Type
CREATE VIEW VehicleType AS
SELECT
	Vehicle_Type,
	COUNT(*) AS TotalAcc
FROM RoadAccidents
GROUP BY Vehicle_Type
ORDER BY TotalAcc DESC;


-- Severity by Vehicle Type
CREATE VIEW SeverityByVehicleType AS
SELECT
	Accident_Severity,
	Vehicle_Type,
	COUNT(*) AS Total
FROM RoadAccidents
GROUP BY Accident_Severity,Vehicle_Type
ORDER BY Total DESC


-- Average Casualties by Vehicle Type
CREATE VIEW AverageCasualtiesVehicle AS 
SELECT
	Vehicle_Type,
	AVG(TRY_CAST(Number_of_Casualties AS FLOAT)) AS AvgCasualties
FROM RoadAccidents
GROUP BY Vehicle_Type
ORDER BY AvgCasualties DESC;


-- Accidents by Region
CREATE VIEW AccidentsByRegion AS
SELECT
	Urban_or_Rural_Area,
	COUNT(*) AS Total
FROM RoadAccidents
GROUP BY Urban_or_Rural_Area
ORDER BY Total DESC;


-- Top Locations with Most Accidents
CREATE VIEW TopLocationsAccidents AS 
SELECT TOP 10
	Local_Authority_District,
	COUNT(*) TotalAccidents
FROM RoadAccidents
GROUP BY Local_Authority_District
ORDER BY TotalAccidents DESC;


-- Accidents by Speed Limit
CREATE VIEW AccidentsBySpeedLimit AS
SELECT 
	Speed_limit,
	COUNT(*) TotalAcc
FROM RoadAccidents
GROUP BY Speed_limit
ORDER BY TotalAcc DESC;

CREATE VIEW AvgSpeed AS
SELECT 
	AVG(Speed_limit) AvgSpeed
FROM RoadAccidents;


-- Accidents on Road Type
CREATE VIEW RoadType AS
SELECT
CASE
	WHEN TRIM(Road_Type) IS NULL THEN 'Unknown'
	ELSE Road_Type
END AS Road_Type,
	COUNT(*) AS TotalAcc
FROM RoadAccidents
GROUP BY Road_Type
ORDER BY TotalAcc DESC;


-- Peak Accident Hours
CREATE VIEW PeakAccidentHours AS
SELECT 
    DATEPART(HOUR, Time) AS HourOfDay,
    COUNT(*) AS TotalAccidents
FROM RoadAccidents
WHERE Time IS NOT NULL
GROUP BY DATEPART(HOUR, TRY_CAST(Time AS TIME))
ORDER BY TotalAccidents DESC;


-- Day vs Night Accidents
CREATE VIEW DayNightAccidents AS
SELECT
CASE
	WHEN DATEPART(HOUR, Time) BETWEEN 6 AND 18 THEN 'Day'
	ELSE 'Night'
END TimeOfDay,
	COUNT(*) AS TotalAccidents
FROM RoadAccidents
WHERE Time IS NOT NULL
GROUP BY DATEPART(HOUR, Time)
ORDER BY TotalAccidents DESC;


-- Accidents Hotspots by Lat/Long
CREATE VIEW AccidentsLatLong AS
SELECT 
	Latitude,
	Longitude,
	COUNT(*) AS TotalAccidents
FROM RoadAccidents
GROUP BY Latitude, Longitude
ORDER BY TotalAccidents DESC;


-- Fatality Rate per Year
CREATE VIEW FatalityRateYear AS
SELECT 
    YEAR(AccidentDate) AS AccYear,
    SUM(CASE WHEN Accident_Severity = 'Fatal' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS FatalityRate
FROM RoadAccidents
GROUP BY YEAR(AccidentDate)
ORDER BY FatalityRate DESC;