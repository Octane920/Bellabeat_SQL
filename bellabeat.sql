# Finding the number of unique Id's in daily activity and renaming table as "daily_activity"

SELECT DISTINCT Id

FROM `bellabeat-capstone-389013.bellabeat_data_v1.daily_activity` AS daily_activity
# determined that there are 33 distince Id's and therefore 33 surverers in this study

; 

# Finding the number of unique Id's in the sleep_log table and renanaming table as sleep_log
SELECT DISTINCT Id
FROM bellabeat-capstone-389013.bellabeat_data_v1.sleep_log AS sleep_log
# determining that there are 24 unique Id's and therefore 24 surveyers that recorded there sleep during the duration of they survey

;

