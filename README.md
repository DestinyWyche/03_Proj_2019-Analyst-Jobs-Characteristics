# 2019 Analyst Jobs Characteristics

## Purpose of the Project

For this project, I explored a dataset from the website Kaggle on analyst jobs, similar to the dataset found at this [link](https://www.kaggle.com/datasets/anjolaoluwaajayi/analysis-of-2019-data-analyst-jobs-in-the-us), to gain applicant and hiring insights.

## Data Analysis Process

### Asking the Question

In this project, I answered the following questions about applicants and hiring:  

- Applicants
  - Which state is the most competitive?
  - Which ananlyst titles are most competitive?
  - Which quarter is most competitive?

- Hiring
  - Which state has most hiring success?
  - Which analyst role had the most hiring success?
  - Which easy apply analyst role had the most success?
  - Which quarter had the most hiring success?

### Preparing the Data

Data was downloaded as a csv file (**can be view in file 01**) and saved locally to be used later in **SQL Server Management Studio**.

### Processing the Data

- Raw data was viewed in **Excel** to look for any duplicates or changes that needed to be made. There were no modifications made.
  - Noticed that the "Hired" and "Easy Apply" columns were boolean data type. This was helpful to keep in mind for when querying the data.

    ![image](https://github.com/DestinyWyche/03_Proj_2019-Analyst-Jobs-Characteristics/assets/111715383/d27f4e30-ceb2-4c04-9b02-1f58a12d8efe)

### Analyzing the Data  

- To answer the questions, new database was created, which was named "Projects" to keep project tables and/or queries organized. Then, the "import flat file" option under the "Tasks" menu was used. This enabled the raw csv file to be imported into **SQL Server Management Studio** as a table named "2019 Data Analyst Jobs".

  ![image](https://github.com/DestinyWyche/03_Proj_2019-Analyst-Jobs-Characteristics/assets/111715383/fbd53fc2-c790-453c-873e-dfb13bc21e43)

- Seven different queries were written to answer each question.  

  ![image](https://github.com/DestinyWyche/03_Proj_2019-Analyst-Jobs-Characteristics/assets/111715383/bafe3bd8-41c0-429e-a00f-ded4525ed1fe)
**Complete queries can be viewed in file 02**

- To visualize the insights, **Tableau** was connected to the "Projects" database as a data source. This enabled queries to be written on the table "2019 Data Analyst Jobs" and stored as data tables in **Tableau**   

  ![image](https://github.com/DestinyWyche/03_Proj_2019-Analyst-Jobs-Characteristics/assets/111715383/2752e0d0-c753-482f-b89e-8a1b7f45afa4)

  **Complete workbook can be viewed in file 03**
  - Two dashboards were created for Applicant and Hiring Insights. Users are able to gain insights on applicant and hiring for the specific analyst job he/she is interested in using the filter on the top right.

  ![image](https://github.com/DestinyWyche/03_Proj_2019-Analyst-Jobs-Characteristics/assets/111715383/6fd8c20a-2a5e-466b-8e62-d1ede7ec856c)

  ![image](https://github.com/DestinyWyche/03_Proj_2019-Analyst-Jobs-Characteristics/assets/111715383/d1eb9dfe-371c-417b-8f1d-3bc3849c78e6)





