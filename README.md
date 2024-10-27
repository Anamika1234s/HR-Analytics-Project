# HR Analytics Project

## Table of Contents
- [Project Overview](#project-overview)
- [Technologies Used](#technologies-used)
- [Features](#features)
- [Dataset Description](#dataset-description)
- [Power BI Dashboard Details](#power-bi-dashboard-details)
- [Tableau Dashboard Details](#tableau-dashboard-details)
- [Excel Dashboard Details](#excel-dashboard-details)
- [SQL KPIs](#sql-kpis)
- [Usage](#usage)
- [License](#license)
- [Contact](#contact)

## Project Overview
This HR Analytics project provides in-depth insights into employee data using interactive and visually appealing dashboards. The goal is to analyze various aspects of human resources such as attrition rates, employee demographics, work-life balance, departmental performance, promotions, and more. This analysis aims to assist HR departments in making data-driven decisions to improve workforce satisfaction, optimize resource allocation, and reduce turnover rates.

This project includes:
- **Three Power BI Dashboards** with comprehensive visualizations.
- **Tableau Dashboard** for interactive and customizable analytics.
- **Excel Dashboard** for a quick summary and easy data manipulation.
- **SQL KPIs** to derive specific metrics for business intelligence.

## Technologies Used
- **Power BI**: Used for creating interactive and detailed dashboards with drill-through functionality and customizable visualizations.
- **Tableau**: Allows advanced data visualization with drag-and-drop features, enhancing data interactivity.
- **Excel**: Utilized for initial data preprocessing, basic calculations, and creating quick summaries.
- **SQL**: Employed to calculate specific KPIs and perform data transformations on raw datasets.

## Features
1. **Comprehensive Employee Analysis**: Visualization of key HR metrics such as total employees, attrition rate, gender distribution, monthly income vs. attrition rate, and work-life balance.
2. **Employee Demographics and Retention Insights**: Breakdown of promotion vs. retrenchment, service years, attrition by age and gender, and job-level data.
3. **Departmental Analysis**: Insight into each department’s performance with metrics like average work years, department-wise promotion rates, and education levels.
4. **Gender-Specific Metrics**: Analysis of male vs. female promotion rates, work years, and retrenchment statistics.
5. **KPI Calculation in SQL**: Essential business KPIs calculated using SQL queries for accuracy and integration in dashboards.

## Dataset Description
The dataset consists of HR records with the following key attributes:
- **Employee ID**: Unique identifier for each employee.
- **Gender**: Male or Female.
- **Age**: Employee’s age.
- **Department**: Department in which the employee works (e.g., Sales, HR, R&D).
- **Job Role**: Specific role within the department.
- **Monthly Income**: Salary details.
- **Attrition**: Indicates if the employee has left the company.
- **Work-Life Balance**: Rated from 1 to 5.
- **Service Years**: Total years of service in the company.
- **Promotion**: Whether the employee has been promoted.

The data has been anonymized and sanitized to protect employee privacy.

## Power BI Dashboard Details
The Power BI dashboard comprises three detailed views:

1. **Dashboard 1**:
   - **Total Employees**: Total number of employees in the company.
   - **Attrition Rate**: Percentage of employees who left the company.
   - **Gender Distribution**: Number of male and female employees.
   - **Monthly Income vs. Attrition Rate**: Comparison of income levels with attrition rates across job roles.
   - **Attrition by Department**: Shows the attrition rate per department.
   - **Work-Life Balance by Job Role**: Indicates work-life balance ratings for each job role.

2. **Dashboard 2**:
   - **Average Work Years**: Displays the average tenure for each department.
   - **Hourly Rate for Male Research Scientists**: Highlights the average hourly pay rate.
   - **Promotion Data**: Number of employees due for promotion and those who have been promoted.
   - **Promotion vs. Retrenchment by Department**: Breakdown of promotions and retrenchments by department.
   - **Educational Background**: Distribution of employees' educational qualifications (e.g., Technical Degree, Marketing, Life Sciences).

3. **Dashboard 3**:
   - **Retrenched vs. Active Employees**: Counts of retrenched vs. active employees.
   - **Service Years Distribution**: Shows service years across the workforce.
   - **Active vs. Retrenchment by Job Level**: Illustrates the retention and retrenchment rate by job level.
   - **Retrenchment by Age and Gender**: Breakdown of retrenchment by employee age and gender.
   - **Departmental Retrenchment**: Comparison of retrenchment vs. active employees by department.

## Tableau Dashboard Details
The Tableau dashboard provides a streamlined view of HR analytics, offering:
- **Attrition Trends**: An interactive line graph showcasing attrition trends over time.
- **Employee Satisfaction and Performance**: A scatter plot that visualizes work-life balance vs. job performance.
- **Department Analysis**: Filtered views for department-wise analysis of work-life balance, promotions, and retrenchments.
- **Interactive Filters**: Allows users to drill down into data based on age, job role, department, and gender.

## Excel Dashboard Details
The Excel dashboard includes:
- **Quick KPI Overview**: Summary of key metrics such as total employees, gender split, and attrition rate.
- **Pivot Tables**: Customizable tables for department-wise or role-based metrics.
- **Basic Charts**: Visual representation of attrition rate, promotion data, and department performance.

## SQL KPIs
Some KPIs were derived using SQL queries, which include:
- **Attrition Rate Calculation**: Percentage of employees who left the company.
- **Average Work-Life Balance**: Calculated average work-life balance rating by department.
- **Promotion Rate**: Percentage of employees promoted over the last year.
- **Retrenchment Analysis**: Number of retrenched employees by age and department.
- **Monthly Income Analysis**: Summary of average income by department and job role.

## Usage
1. **Power BI**: Open the `.pbix` files in Power BI Desktop to explore interactive visualizations.
2. **Tableau**: Open the `.twbx` files in Tableau Public/Desktop for customizable insights.
3. **Excel**: Open the Excel file for quick data summaries and pivot tables.
4. **SQL Scripts**: Use the SQL scripts in your database environment to replicate KPI calculations.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.


