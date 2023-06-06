# Finding the number of unique Id's in the daily-activity table and renaming aliase as "daily_activity"

SELECT DISTINCT Id

FROM `bellabeat-capstone-389013.bellabeat_data_v1.daily_activity` AS daily_activity
# determined that there are 33 distince Id's and therefore 33 surverers in this study

; 

# Finding the number of unique Id's in the sleep_log table and renanaming aliase as sleep_log
SELECT DISTINCT Id
FROM bellabeat-capstone-389013.bellabeat_data_v1.sleep_log AS sleep_log
# determining that there are 24 unique Id's and therefore 24 surveyers that recorded there sleep during the duration of they survey

;

# Finding the number of unique Id's in the weight_log and renaming the aliase as weight_log
SELECT DISTINCT Id
FROM bellabeat-capstone-389013.bellabeat_data_v1.weight_log AS weight_log
# determined that there are 8 unique Id's and there were only 8 participants who logged their weight during the survey

;

# Examined how many weight reports were manual vs automatic reports 
SELECT IsManualReport, COUNT(*) AS reportcount
FROM `bellabeat_data_v1.weight_log`
GROUP BY IsManualReport
# Councluded taht 41 of the total 67 reports were manual and 26 were not. 

;

# determining if there were any duplicate entries in the daily_activity table
SELECT ID, Activity_Date, COUNT(*) AS dups
FROM `bellabeat_data_v1.daily_activity`
GROUP BY ID, Activity_Date 
HAVING dups > 1
# determined that there were 0 duplicates

;

# Determining if there were any duplicate entries within the sleep_log table
SELECT ID, SleepDay , COUNT(*) AS dups
FROM `bellabeat_data_v1.sleep_log`
GROUP BY ID, SleepDay 
HAVING dups > 1
# Identified 3 duplicates

;

# determining if there are any weight log duplicates
SELECT Id, Date, LogId, COUNT(*) AS dups
FROM `bellabeat_data_v1.weight_log`
GROUP BY Id, Date, LogId
HAVING dups > 1
# determined that there are no duplicates within the weight log

;

# Inner joining all 3 tables to determined how many daily records contained, sleep, activity and weight recorded
SELECT *
FROM `bellabeat_data_v1.daily_activity` AS da 
JOIN `bellabeat_data_v1.sleep_log` AS sl
ON da.Activity_Date = sl.SleepDay AND da.Id = sl.Id
JOIN `bellabeat_data_v1.weight_log` AS wl
ON sl.SleepDay = wl.Date AND sl.Id = wl.Id
ORDER BY da.Id, Date
# Only 35 rows returned with all 3 recorded

;

# determined how many Unique Id's that are in daily activity were also present in the weight_log table and the sleep_log table
SELECT DISTINCT Id
FROM `bellabeat_data_v1.daily_activity`
WHERE Id IN (
	SELECT da.Id
	FROM `bellabeat_data_v1.daily_activity` AS da 
	JOIN `bellabeat_data_v1.sleep_log` AS sl
	ON da.Activity_Date = sl.SleepDay AND da.Id = sl.Id
	JOIN `bellabeat_data_v1.weight_log` AS wl
	ON sl.SleepDay = wl.Date AND sl.Id = wl.Id)
  # Only 5 of the 33 unique Id's were present in all 3 tables pointing to a lack of presences in recording all 3 metrics
  
