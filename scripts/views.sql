-- Accidents per Year
SELECT * FROM TotalAccidentByYear
ORDER BY TotalAccidentByYear DESC;

-- Accidents per Month
SELECT * FROM TotalAccidentByMonth
ORDER BY TotalAccidentByMonth DESC;

-- Accidents by Day of Week
SELECT * FROM TotalAccidentByDay
ORDER BY TotalAccidentByDay DESC;

-- Accident Count by Severity
SELECT * FROM TotalSeverity
ORDER BY TotalSeverity DESC;

-- Average Casualties per Accident
SELECT * FROM AvgCasualties

-- Fatal Accidents by Month
SELECT * FROM FatalAccidentsByMonth
ORDER BY FatalAccidentByMonth DESC;

-- Accidents by Road Surface
SELECT * FROM AccidentsByRoadSurface
ORDER BY SurfaceConditions DESC;

-- Weather Impact on Fatal Accidents
SELECT * FROM WeatherImpact
ORDER BY FatalAcc DESC;

-- Accidents by Lighting Condition
SELECT * FROM LightingCondition
ORDER BY TotalAcc DESC;

-- Accidents by Vehicle Type
SELECT * FROM VehicleType
ORDER BY TotalAcc DESC;

-- Severity by Vehicle Type
SELECT * FROM SeverityByVehicleType
ORDER BY Total DESC;

-- Average Casualties by Vehicle Type
SELECT * FROM AverageCasualtiesVehicle
ORDER BY AvgCasualties DESC;

-- Accidents by Region
SELECT * FROM AccidentsByRegion
ORDER BY Total DESC;

-- Top Locations with Most Accidents
SELECT * FROM TopLocationsAccidents
ORDER BY TotalAccidents DESC;

-- Accidents by Speed Limit
SELECT * FROM AccidentsBySpeedLimit
ORDER BY TotalAcc DESC;

SELECT * FROM AvgSpeed;

-- Accidents on Road Type
SELECT * FROM RoadType
ORDER BY TotalAcc DESC;

-- Peak Accident Hours
SELECT * FROM PeakAccidentHours
ORDER BY TotalAccidents DESC;

-- Day vs Night Accidents
SELECT * FROM DayNightAccidents
ORDER BY TotalAccidents DESC;

-- Accidents Hotspots by Lat/Long
SELECT * FROM AccidentsLatLong
ORDER BY TotalAccidents DESC;

-- Fatality Rate per Year
SELECT * FROM FatalityRateYear
ORDER BY FatalityRate DESC;