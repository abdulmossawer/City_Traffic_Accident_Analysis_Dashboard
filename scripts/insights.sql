SELECT * FROM RoadAccidents


-- Accidents per Year
SELECT 
	YEAR(AccidentDate) AS AccYear,
	COUNT(*) AS TotalAccidentByYear
FROM RoadAccidents
GROUP BY YEAR(AccidentDate)
ORDER BY TotalAccidentByYear DESC;


-- Accidents per Month
SELECT
	DATENAME(MONTH, AccidentDate) AS AccMonth,
	COUNT(*) AS TotalAccidentByMonth
FROM RoadAccidents
GROUP BY DATENAME(MONTH, AccidentDate)
ORDER BY TotalAccidentByMonth DESC;


-- Accidents by Day of Week
SELECT
	Day_of_Week,
	COUNT(*) AS TotalAccidentByDay
FROM RoadAccidents
GROUP BY Day_of_Week
ORDER BY TotalAccidentByDay DESC;


-- Accident Count by Severity
SELECT
	Accident_Severity,
	COUNT(*) AS TotalSeverity
FROM RoadAccidents
GROUP BY Accident_Severity
ORDER BY TotalSeverity DESC;


-- Average Casualties per Accident
SELECT
	AVG(Number_of_Casualties) AS TotalCasualties
FROM RoadAccidents;


-- Fatal Accidents by Month
SELECT
	DATENAME(MONTH, AccidentDate) AS AccMonth,
	COUNT(*) AS TotalAccidentByMonth
FROM RoadAccidents
WHERE Accident_Severity = 'Fatal'
GROUP BY DATENAME(MONTH, AccidentDate)
ORDER BY TotalAccidentByMonth DESC;


-- Accidents by Road Surface
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
SELECT
	Light_Conditions,
	COUNT(*) AS TotalAcc
FROM RoadAccidents
GROUP BY Light_Conditions
ORDER BY TotalAcc DESC;


-- Accidents by Vehicle Type
SELECT
	Vehicle_Type,
	COUNT(*) AS TotalAcc
FROM RoadAccidents
GROUP BY Vehicle_Type
ORDER BY TotalAcc DESC;


-- Severity by Vehicle Type
SELECT
	Accident_Severity,
	Vehicle_Type,
	COUNT(*) AS Total
FROM RoadAccidents
GROUP BY Accident_Severity,Vehicle_Type
ORDER BY Total DESC


-- Accidents by Region
SELECT
	Urban_or_Rural_Area,
	COUNT(*) AS Total
FROM RoadAccidents
GROUP BY Urban_or_Rural_Area
ORDER BY Total DESC;


-- Top Locations with Most Accidents
SELECT TOP 10
	Local_Authority_District,
	COUNT(*) Total
FROM RoadAccidents
GROUP BY Local_Authority_District
ORDER BY Total DESC;

