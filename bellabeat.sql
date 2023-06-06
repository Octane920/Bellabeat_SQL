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

# determining if there are any wright log duplicates
SELECT Id, Date, LogId, COUNT(*) AS dups
FROM `bellabeat_data_v1.weight_log`
GROUP BY Id, Date, LogId
HAVING dups > 1
# determined that there are no duplicates within the weight log

;

# Looking for IDs in DailyActivity with more or less than 10 characters
SELECT Id
FROM DailyActivity
WHERE LENGTH(Id) > 10 
OR LENGTH(Id) < 10
# No values returned; all IDs in DailyActivity have 10 characters
;

# Looking for IDs in SleepLog with more or less than 10 characters
SELECT Id
FROM SleepLog
WHERE LENGTH(Id) > 10 
OR LENGTH(Id) < 10
# No values returned; all IDs in SleepLog have 10 characters
;

# Looking for IDs in WeightLog with more or less than 10 characters
SELECT Id
FROM WeightLog
WHERE LENGTH(Id) > 10 
OR LENGTH(Id) < 10
# No values returned; all IDs in WeightLog have 10 characters

# Inner joining all 3 tables to determined how many daily records contained, sleep, activity and weight recorded
SELECT *
FROM DailyActivity AS d 
JOIN SleepLog AS s
ON d.ActivityDate = s.SleepDay AND d.Id = s.Id
JOIN WeightLog AS w
ON s.SleepDay = w.Date AND s.Id = w.Id
ORDER BY d.Id, Date
# Only 35 rows returned with all 3 recorded



