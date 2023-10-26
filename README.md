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

### Analyzing the Data  

- To answer the questions, new database was created, which was named "Projects" to keep project tables and/or queries organized. Then, the "import flat file" option under the "Tasks" menu was used. This enabled the raw csv file to be imported into **SQL Server Management Studio** as a table named "2019 Data Analyst Jobs".

  <img width="439" alt="image" src="https://github.com/DestinyWyche/03_Proj_2019-Analyst-Jobs-Characteristics/assets/111715383/2ede9c75-0803-4bc0-88d1-0eac284fdb78">  

- Seven different queries were written to answer each question.  

  <img width="398" alt="image" src="https://github.com/DestinyWyche/03_Proj_2019-Analyst-Jobs-Characteristics/assets/111715383/6ce531d1-bb0a-4a05-9c53-d3a160611edf">  
**Complete queries can be viewed in file 02**

- To visualize the insights, **Tableau** was connected to the "Projects" database as a data source. This enabled queries to be written on the table "2019 Data Analyst Jobs" and stored as data tables in **Tableau**   

  <img width="743" alt="image" src="https://github.com/DestinyWyche/03_Proj_2019-Analyst-Jobs-Characteristics/assets/111715383/9cb79d52-ebbf-487d-8ef1-0a40f1045afa">

  **Complete workbook can be viewed in file 03**
  - Two dashboards were created for Applicant and Hiring Insights. Users are able to gain insights on applicant and hiring for the specific analyst job he/she is interested in using the filter on the top right.

  ![image](https://github.com/DestinyWyche/03_Proj_2019-Analyst-Jobs-Characteristics/assets/111715383/c4bba687-ddc8-4ac8-a6c5-18801e7c381d)

  ![image](https://github.com/DestinyWyche/03_Proj_2019-Analyst-Jobs-Characteristics/assets/111715383/f95a2e90-140b-4eea-90ce-984920faf2c0)





