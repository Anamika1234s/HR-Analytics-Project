CREATE DATABASE HR_PROJECT;

USE HR_PROJECT;

                                      /* Overview's KPIs */
/* Total Attrition */
SELECT COUNT(`EmployeeNumber`) AS TOTAL_ATTRITION
FROM HR_1
WHERE ATTRITION="YES";

/* TOTAL MALE EMPLOYEES */
SELECT COUNT(`EmployeeNumber`) AS MALE_EMPLOYEES
FROM HR_1
WHERE GENDER="MALE";

/* TOTAL FEMALE EMPLOYEES */
SELECT COUNT(`EmployeeNumber`) AS FEMALE_EMPLOYEES
FROM HR_1
WHERE GENDER="FEMALE";

/* TOTAL EMPLOYEES */
SELECT COUNT(`EmployeeNumber`)
FROM HR_1;

/* ATTRITION RATE */
SELECT CONCAT(ROUND(COUNT(`Attrition`)/(SELECT COUNT(`EmployeeNumber`) FROM HR_1)*100,1), "%") AS ATTRITION_RATE
FROM HR_1
WHERE `Attrition`="YES";

/* MALE ATTRITION */
SELECT COUNT(`EmployeeNumber`) AS MALE_ATTRITION
FROM HR_1
WHERE GENDER="MALE" AND ATTRITION="YES";

/* FEMALE ATTRITION */
SELECT COUNT(*)
FROM HR_1
WHERE GENDER="FEMALE" AND ATTRITION="YES";

/* MALE ATTRITION % */
SELECT CONCAT(ROUND(COUNT(GENDER)/(SELECT COUNT(`Attrition`) FROM hr_1 WHERE ATTRITION="YES")*100,2), "%") AS MALE_ATTRITION_RATE
FROM HR_1
WHERE GENDER="MALE" AND ATTRITION="YES";

/* FEMALE ATTRITION % */
SELECT CONCAT(ROUND(COUNT(GENDER)/(SELECT COUNT(ATTRITION) FROM HR_1 WHERE ATTRITION="YES")*100,2), "%") AS FEMALE_ATTRITION_RATE
FROM HR_1
WHERE GENDER="FEMALE" AND ATTRITION="YES";

/* ATTRITION RATE BY DEPARTMENT */
SELECT DEPARTMENT, (CONCAT(ROUND(COUNT(ATTRITION)/
(SELECT COUNT(*) FROM HR_1 WHERE ATTRITION="YES")*100,2), "%")) 
AS ATTRITION_RATE
FROM HR_1
WHERE ATTRITION="YES"
GROUP BY DEPARTMENT
ORDER BY DEPARTMENT;

/* MONTHLY INCOME VS ATTRITION RATE BY DEPARTMENT */
SELECT DEPARTMENT, 
	  (CONCAT(ROUND(COUNT(ATTRITION)/
      (SELECT COUNT(*) FROM HR_1 WHERE ATTRITION="YES")*100,2), "%")) 
      AS ATTRITION_RATE,
       Round(AVG(`MonthlyIncome`),0) As Avg_Monthly_Income
FROM HR_1 JOIN HR_2 
ON HR_1.EMPLOYEENUMBER=HR_2.`Employee ID`
WHERE ATTRITION="YES"
GROUP BY DEPARTMENT
ORDER BY DEPARTMENT; 

/* ATTRITION RATE VS YEAR SINCE LAST PROMOTION  */
SELECT ROUND(AVG(`YearsSinceLastPromotion`),0), (CONCAT(ROUND(COUNT(Attrition)/(select count(*) from hr_1)*100,1), "%")) as Attrition_rate
FROM HR_2 JOIN HR_1
ON HR_2.`Employee ID`=HR_1.EMPLOYEENUMBER
WHERE ATTRITION="YES";     

/* WORK LIFE BALANCE BY JOB ROLE */
SELECT JOBROLE, CONCAT(ROUND(SUM(WORKLIFEBALANCE)/1000,2), " K") AS WORKLIFEBALANCE
FROM HR_1 JOIN HR_2
ON HR_1.EMPLOYEENUMBER=HR_2.`Employee ID`
GROUP BY JOBROLE
ORDER BY JOBROLE;      

/* Average Hourly Rate of Male Research Scientist */
SELECT ROUND(AVG(HOURLYRATE),0) As "Avg Hourly Rate of Male Research Scientist"
FROM HR_1
WHERE JOBROLE="RESEARCH SCIENTIST" AND GENDER="MALE";

/* Male Research Scientist hourlyrate % */   
SELECT CONCAT(ROUND(SUM(HOURLYRATE)/(SELECT SUM(HOURLYRATE) FROM HR_1)*100,0), "%") AS TOTAL_RATE
FROM HR_1
WHERE JOBROLE="RESEARCH SCIENTIST";


                                        /* PROMOTION KPI's */

/* DUE FOR PROMOTION EMPLOYEES */
SELECT COUNT(*) AS DUE_FOR_PROMOTION
FROM (SELECT *,
			   CASE WHEN `YearsSinceLastPromotion`>=10 THEN 'DUE FOR PROMOTION'
               ELSE 'NO DUE FOR PROMOTION'
               END AS PROMOTION_STATUS
               FROM HR_2) AS S1
WHERE PROMOTION_STATUS='DUE FOR PROMOTION';

/* NO DUE FOR PROMOTION BY EMPLOYEES */
SELECT COUNT(*) AS NO_DUE_FOR_PROMOTION
FROM (SELECT *,
              CASE WHEN `YearsSinceLastPromotion`>=10 THEN 'DUE FOR PROMOTION'
               ELSE 'NO DUE FOR PROMOTION'
               END AS PROMOTION_STATUS
               FROM HR_2) AS S1
WHERE PROMOTION_STATUS='NO DUE FOR PROMOTION';

/* DUE FOR PROMOTION % */
SELECT CONCAT(ROUND(COUNT(*)/(SELECT COUNT(*) FROM HR_2)*100,1), "%") AS PROMOTION_PERCENTAGE
FROM (SELECT *,
              CASE WHEN `YearsSinceLastPromotion`>=10 THEN 'DUE FOR PROMOTION'
               ELSE 'NO DUE FOR PROMOTION'
               END AS PROMOTION_STATUS
               FROM HR_2) AS S1
WHERE PROMOTION_STATUS='DUE FOR PROMOTION';

/* NO DUE FOR PROMOTION % */
SELECT CONCAT(ROUND(COUNT(*)/(SELECT COUNT(*) FROM HR_2)*100,1), "%") AS NO_PROMOTION_PERCENTAGE
FROM (SELECT *,
              CASE WHEN `YearsSinceLastPromotion`>=10 THEN 'DUE FOR PROMOTION'
               ELSE 'NO DUE FOR PROMOTION'
               END AS PROMOTION_STATUS
               FROM HR_2) AS S1
WHERE PROMOTION_STATUS='NO DUE FOR PROMOTION'; 

/* JOB LEVEL BY EMPLOYEES */
SELECT JOBLEVEL, COUNT(*)
FROM HR_1
GROUP BY JOBLEVEL
ORDER BY JOBLEVEL;

/* PROMOTION VS RETRENCHMENT BY DEPARTMENT */
SELECT DEPARTMENT,
COUNT(CASE WHEN PROMOTION_STATUS='DUE FOR PROMOTION' THEN 1 END) AS PROMOTION,
COUNT(CASE WHEN RETRENCHMENT_STATUS='WILL BE RETRENCHED' THEN 1 END) AS RETRENCHMENT
FROM HR_1 JOIN (SELECT *,
                         CASE WHEN `YearsSinceLastPromotion`>=10 THEN 'DUE FOR PROMOTION'
                         ELSE 'NO DUE FOR PROMOTION'
						 END AS PROMOTION_STATUS,
                         CASE WHEN `YearsAtCompany`>=18 THEN 'WILL BE RETRENCHED'
						 ELSE 'ON SERIVE'
                         END AS RETRENCHMENT_STATUS
                         FROM HR_2) AS S1
ON HR_1.EMPLOYEENUMBER=S1.`Employee ID`
GROUP BY DEPARTMENT
HAVING PROMOTION>0 AND RETRENCHMENT>0;
                

/* Avg. Work years for each Department */
SELECT DEPARTMENT,ROUND(AVG(`TotalWorkingYears`),2) AS "AVG. WORK YEAR"
FROM HR_1 JOIN HR_2
ON HR_1.EMPLOYEENUMBER=HR_2.`Employee ID`
GROUP BY DEPARTMENT
ORDER BY DEPARTMENT;

/* Distance from home */
SELECT DISTANCE_STATUS, CONCAT(ROUND(COUNT(*)/1000,1), " K") AS Total_employee
FROM (SELECT *,
                CASE WHEN `DistanceFromHome`>=20 THEN 'VERY FAR'
                WHEN `DistanceFromHome` >=10 THEN 'CLOSE'
                ELSE 'VERY CLOSE'
                END AS DISTANCE_STATUS
                FROM HR_1) AS S1
GROUP BY DISTANCE_STATUS
ORDER BY DISTANCE_STATUS;


                                            /* RETRENCHMENT KPI's */
                                            
/* Retrenched Employee */
SELECT COUNT(*) AS Retrenched_employees
FROM (SELECT *,
			CASE WHEN `YearsAtCompany`>=18 THEN 'WILL BE RETRENCHED'
			ELSE 'ON SERIVE'
			END AS RETRENCHMENT_STATUS
			FROM HR_2) AS S1
WHERE RETRENCHMENT_STATUS='WILL BE RETRENCHED';
            
/* Active Worker */
SELECT COUNT(*) AS Active_Employees
FROM(SELECT *,
             CASE
             WHEN `YearsAtCompany`>=18 
             THEN 'Will Be Retrenchment'
             ELSE 'On Service'
             END AS Retrenchment_status
             FROM HR_2) AS S1
WHERE RETRENCHMENT_STATUS='ON SERVICE';

/* High Rating % */
SELECT CONCAT(ROUND(COUNT(RATING_STATUS)/(SELECT COUNT(*) FROM HR_2)*100,2), "%") AS HIGH_RATING
FROM (SELECT *,
               CASE WHEN `PerformanceRating`>=3 THEN 'LOW'
               ELSE 'HIGH'
               END AS RATING_STATUS
               FROM HR_2) AS S1
WHERE RATING_STATUS='HIGH';

/* Low Rating % */
SELECT CONCAT(ROUND(COUNT(RATING_STATUS)/(SELECT COUNT(*) FROM HR_2)*100,2), "%") AS LOW_RATING
FROM (SELECT *,
              CASE WHEN `PerformanceRating`>=3 THEN 'LOW'
              ELSE 'HIGH'
              END AS RATING_STATUS
              FROM HR_2) AS S1
WHERE RATING_STATUS='LOW';

/* Retrenched Employees by Department */
SELECT DEPARTMENT, 
COUNT(RETRENCHMENT_STATUS) AS RETRENCHED_EMPLOYEES
FROM HR_1 JOIN (SELECT *,
               CASE WHEN `YearsAtCompany`>=18 THEN 'WILL BE RETRENCHED'
			   ELSE 'ON SERIVE'
			   END AS RETRENCHMENT_STATUS
			   FROM HR_2) AS S1
ON HR_1.EMPLOYEENUMBER=S1.`Employee ID`
WHERE RETRENCHMENT_STATUS='WILL BE RETRENCHED'
GROUP BY DEPARTMENT
ORDER BY DEPARTMENT;

/* Active vs Retrenchment by gender */
SELECT GENDER,
    COUNT(CASE WHEN RETRENCHMENT_STATUS = 'WILL BE RETRENCHED' THEN 1 END) AS RETRENCHMENT,
    COUNT(CASE WHEN RETRENCHMENT_STATUS = 'ON SERVICE' THEN 1 END) AS ACTIVE_WORKERS
FROM HR_1 JOIN (SELECT *,
            CASE WHEN `YearsAtCompany` >= 18 THEN 'WILL BE RETRENCHED'
                ELSE 'ON SERVICE'
            END AS RETRENCHMENT_STATUS
     FROM HR_2) AS S1
ON HR_1.EMPLOYEENUMBER = S1.`Employee ID`
GROUP BY GENDER;

/* Service Year */
SELECT `YearsAtCompany` AS SERVICE_YEARS, COUNT(*) AS TOTAL_EMPLOYEES
FROM HR_2
GROUP BY `YearsAtCompany`
ORDER BY `YearsAtCompany`;

/* Active vs Retrenchment */
SELECT 
COUNT(CASE WHEN RETRENCHMENT_STATUS='WILL BE RETRENCHED' THEN 1 END) AS RETRENCHMENT,
COUNT(CASE WHEN RETRENCHMENT_STATUS='ON SERVICE' THEN 1 END) AS ACTIVE_WORKERS
FROM (SELECT *,
              CASE WHEN `YearsAtCompany` >= 18 THEN 'WILL BE RETRENCHED'
                ELSE 'ON SERVICE'
            END AS RETRENCHMENT_STATUS
     FROM HR_2) AS S1;
     
/* Retrenched Employee by age */
SELECT AGE_BUCKET, COUNT(Retrenchment_status) AS RETRENCHED_EMPLOYEES
FROM (SELECT *,
              CASE WHEN AGE<=20 THEN '0-20'
              WHEN AGE<=35 THEN '21-35'
              WHEN AGE<=50 THEN '36-50'
              ELSE '50 PLUS'
              END AS AGE_BUCKET
              FROM HR_1) AS S1
JOIN (SELECT *,
              CASE WHEN `YearsAtCompany` >= 18 THEN 'WILL BE RETRENCHED'
                   ELSE 'ON SERVICE'
              END AS RETRENCHMENT_STATUS
              FROM HR_2) AS S2
ON S1.EMPLOYEENUMBER=S2.`Employee ID`
WHERE RETRENCHMENT_STATUS='WILL BE RETRENCHED'
GROUP BY AGE_BUCKET
ORDER BY AGE_BUCKET;
