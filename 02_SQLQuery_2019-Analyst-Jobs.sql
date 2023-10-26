/*Find total number of applicants by analyst job title*/
SELECT 
		Job_Title
		,COUNT(ID) AS Applicants
FROM [Projects].[dbo].[01_Data-Analyst-Jobs - raw data]
GROUP BY
	Job_Title
ORDER BY 
	Applicants DESC 


/*Find total number of applicants by job title and job state*/
SELECT 
		Job_Title
		,RIGHT(Job_Location,2) AS Job_State
		,COUNT(ID) AS Applicants
FROM [Projects].[dbo].[01_Data-Analyst-Jobs - raw data]
GROUP BY
	Job_Title
	,RIGHT(Job_Location,2)
ORDER BY 
	Job_State
	,Applicants DESC


/*Find total number of applicants by job title and quarter*/
SELECT
	Job_Title
	,COUNT(ID) AS Applicants
	,CASE
	WHEN MONTH(Date) IN (1,2,3) THEN 'Q1'
	WHEN MONTH(Date) IN (4,5,6) THEN 'Q2'
	WHEN MONTH(Date) IN (7,8,9) THEN 'Q3'
	ELSE 'Q4'
	END AS Job_Quarter
FROM [Projects].[dbo].[01_Data-Analyst-Jobs - raw data]
GROUP BY
	Job_Title
	,CASE
	WHEN MONTH(Date) IN (1,2,3) THEN 'Q1'
	WHEN MONTH(Date) IN (4,5,6) THEN 'Q2'
	WHEN MONTH(Date) IN (7,8,9) THEN 'Q3'
	ELSE 'Q4'
	END
ORDER BY Job_Title, Applicants DESC


/*Find hiring rate by quarter*/
SELECT 
	Job_Title
	,CASE
		WHEN MONTH(Date) IN (1,2,3) THEN 'Q1'
		WHEN MONTH(Date) IN (4,5,6) THEN 'Q2'
		WHEN MONTH(Date) IN (7,8,9) THEN 'Q3'
		ELSE 'Q4'
		END AS Job_Quarter
	,SUM(CAST(Hired AS INT)) AS ApplicantsHired
	,COUNT(ID) AS TotalApplicants
	,CAST((ROUND(SUM(CAST(Hired AS INT)) * 100.0/COUNT(ID),1)) AS FLOAT) AS HiringRate
FROM [Projects].[dbo].[01_Data-Analyst-Jobs - raw data]
GROUP BY 
		Job_Title,
		CASE
			WHEN MONTH(Date) IN (1,2,3) THEN 'Q1'
			WHEN MONTH(Date) IN (4,5,6) THEN 'Q2'
			WHEN MONTH(Date) IN (7,8,9) THEN 'Q3'
			ELSE 'Q4'
			END
ORDER BY Job_Title, HiringRate DESC


/*Find hiring rate by job title*/
SELECT 
	Job_Title
	,SUM(CAST(Hired AS INT)) AS ApplicantsHired
	,COUNT(ID) AS TotalApplicants
	,CAST((ROUND(SUM(CAST(Hired AS INT)) * 100.0/COUNT(ID),1)) AS FLOAT) AS HiringRate
FROM [Projects].[dbo].[01_Data-Analyst-Jobs - raw data]
GROUP BY Job_Title
ORDER BY HiringRate DESC


/*Find hiring rate by job state*/
SELECT 
	Job_Title
	,RIGHT(Job_Location,2) AS Job_State
	,SUM(CAST(Hired AS INT)) AS ApplicantsHired
	,COUNT(ID) AS TotalApplicants
	,CAST((ROUND(SUM(CAST(Hired AS INT)) * 100.0/COUNT(ID),1)) AS FLOAT) AS HiringRate
FROM [Projects].[dbo].[01_Data-Analyst-Jobs - raw data]
GROUP BY Job_Title, RIGHT(Job_Location,2)
ORDER BY Job_Title, HiringRate DESC


/* Find hiring rate for easy apply applicants by job title*/
SELECT 
	Job_Title
	,SUM(CAST(Easy_Apply AS INT)) AS EasyApplyHired
	,COUNT(ID) AS TotalApplicants
	,CAST((ROUND(SUM(CAST(Easy_Apply AS INT)) * 100.0/COUNT(ID),1)) AS FLOAT) AS HiringRate
FROM [Projects].[dbo].[01_Data-Analyst-Jobs - raw data]
GROUP BY Job_Title
ORDER BY HiringRate DESC


/*Find quarter with maximum and minimum number of applicants by analyst job title*/
WITH max_applicants AS
	(
	SELECT
		Job_Title
		,COUNT(ID) AS Applicants
		,CASE
		WHEN MONTH(Date) IN (1,2,3) THEN 'Q1'
		WHEN MONTH(Date) IN (4,5,6) THEN 'Q2'
		WHEN MONTH(Date) IN (7,8,9) THEN 'Q3'
		ELSE 'Q4'
		END AS Job_Quarter
		,ROW_NUMBER() OVER (PARTITION BY Job_Title ORDER BY COUNT(ID) DESC) AS RN
	FROM [Projects].[dbo].[01_Data-Analyst-Jobs - raw data]
	GROUP BY
		Job_Title
		,CASE
		WHEN MONTH(Date) IN (1,2,3) THEN 'Q1'
		WHEN MONTH(Date) IN (4,5,6) THEN 'Q2'
		WHEN MONTH(Date) IN (7,8,9) THEN 'Q3'
		ELSE 'Q4'
		END),
	min_applicants AS 
	(
	SELECT
		Job_Title
		,COUNT(ID) AS Applicants
		,CASE
		WHEN MONTH(Date) IN (1,2,3) THEN 'Q1'
		WHEN MONTH(Date) IN (4,5,6) THEN 'Q2'
		WHEN MONTH(Date) IN (7,8,9) THEN 'Q3'
		ELSE 'Q4'
		END AS Job_Quarter
		,ROW_NUMBER() OVER (PARTITION BY Job_Title ORDER BY COUNT(ID)) AS RN
	FROM [Projects].[dbo].[01_Data-Analyst-Jobs - raw data]
	GROUP BY
		Job_Title
		,CASE
		WHEN MONTH(Date) IN (1,2,3) THEN 'Q1'
		WHEN MONTH(Date) IN (4,5,6) THEN 'Q2'
		WHEN MONTH(Date) IN (7,8,9) THEN 'Q3'
		ELSE 'Q4'
		END
		)

SELECT *
FROM max_applicants
WHERE RN=1
UNION
SELECT *
FROM min_applicants
WHERE RN=1
ORDER BY Job_Title, Applicants DESC