USE WAREHOUSE RESUME_SCREENER_WH;
USE DATABASE RESUME_SCREENER_DB;
USE SCHEMA RECRUITING;

--> Create a Table for placing/inputting in resume data
CREATE OR REPLACE TABLE RAW_RESUMES (
    RESUME_ID               NUMBER AUTOINCREMENT PRIMARY KEY,
    CANDIDATE_NAME          VARCHAR(150),
    CANDIDATE_EMAIL         VARCHAR(150),
    TARGET_JOB_TITLE        VARCHAR(150),
    RESUME_TEXT             TEXT,
    YEARS_OF_EXPERIENCE     NUMBER,
    SUBMITTED_AT            TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    STATUS                  VARCHAR(20) DEFAULT 'NEW'
);

--> Data
-- ============================================================
-- JOB 1: DATA ANALYST (5 candidates)
-- ============================================================

INSERT INTO RAW_RESUMES (CANDIDATE_NAME, CANDIDATE_EMAIL, TARGET_JOB_TITLE, YEARS_OF_EXPERIENCE, RESUME_TEXT) VALUES
(
'Jordan Mills', 'jordan.mills@gmail.com', 'Data Analyst', 5,
'SUMMARY
Results-driven Data Analyst with 5 years of experience transforming complex datasets into actionable business insights across SaaS and e-commerce environments. Proven track record of building executive dashboards, optimizing SQL pipelines, and leading A/B testing programs that directly influenced revenue growth.

EXPERIENCE
Senior Data Analyst — CloudMetrics Inc. (2021–Present)
- Designed and maintained 30+ Tableau dashboards used by C-suite for weekly KPI reviews across Sales, Marketing, and Operations
- Wrote complex SQL queries using CTEs, window functions, and subqueries against a Snowflake data warehouse processing 500M+ rows daily
- Led A/B testing framework that increased checkout conversion rate by 18%, generating $2.4M in incremental annual revenue
- Partnered with Data Engineering to define dimensional data models in dbt, reducing report generation time by 40%
- Presented weekly KPI summaries and quarterly business reviews to VP and C-suite stakeholders

Data Analyst — RetailEdge Corp. (2019–2021)
- Built Python ETL pipelines using pandas to automate weekly sales reporting, saving 8 hours of manual work per week
- Developed Power BI dashboards for 12 regional sales managers, improving visibility into territory performance
- Conducted cohort analysis and customer lifetime value modeling to support retention strategy

SKILLS
SQL (advanced — CTEs, window functions, performance tuning), Python (pandas, numpy, matplotlib), Tableau, Power BI, Snowflake, dbt, A/B Testing, Statistics, Data Modeling, Git

EDUCATION
B.S. Computer Science — University of Michigan, 2019

CERTIFICATIONS
Snowflake SnowPro Core (2023), Tableau Desktop Specialist (2021)'
),
(
'Priya Nair', 'priya.nair@outlook.com', 'Data Analyst', 3,
'SUMMARY
Analytical and detail-oriented Data Analyst with 3 years of experience in e-commerce analytics. Skilled in SQL and Looker with a strong foundation in translating data into business recommendations. Looking to grow into a senior analyst role at a data-driven organization.

EXPERIENCE
Data Analyst — ShopNow E-Commerce (2021–Present)
- Created and maintained SQL queries to extract sales, customer, and inventory data for weekly business reviews
- Built and owned 15+ Looker dashboards for Marketing and Operations teams tracking revenue, CAC, and churn
- Worked with large datasets in BigQuery, writing optimized queries to reduce dashboard load time by 35%
- Conducted funnel analysis to identify drop-off points in the checkout flow, leading to a 9% improvement in conversion
- Documented data definitions and onboarded 3 new analysts to the team reporting infrastructure

Junior Data Analyst — DataFirst Agency (2020–2021)
- Supported senior analysts with Excel-based client reporting across 8 accounts
- Learned SQL and Python independently, automating 4 manual monthly reports

SKILLS
SQL (intermediate-advanced), Looker, BigQuery, Python (basic pandas), Excel, Google Sheets, Data Visualization, Funnel Analysis

EDUCATION
B.A. Economics — Boston University, 2020'
),
(
'Marcus Webb', 'marcus.webb@gmail.com', 'Data Analyst', 4,
'SUMMARY
Digital marketing professional with 4 years of experience transitioning into data analytics. Strong background in campaign performance analysis and Excel-based reporting. Currently completing a SQL and Python bootcamp to formalize technical skills.

EXPERIENCE
Digital Marketing Analyst — BrandBoost Agency (2021–Present)
- Analyzed Google Analytics and Facebook Ads data to report on campaign performance for 20+ clients
- Built weekly performance dashboards in Excel and Google Data Studio for client presentations
- Used VLOOKUP, pivot tables, and basic formulas to track KPIs across marketing channels
- Coordinated with data team to pull reports from internal database using basic SQL queries
- Created PowerPoint presentations summarizing marketing insights for C-suite clients

Marketing Coordinator — LocalBiz Media (2019–2021)
- Tracked social media engagement metrics across platforms and compiled monthly reports
- Assisted with email marketing campaigns in Mailchimp, monitoring open rates and click-through rates

SKILLS
Google Analytics, Excel (intermediate), Google Data Studio, PowerPoint, Facebook Ads Manager, SQL (beginner — currently learning), Python (beginner)

EDUCATION
B.A. Marketing — Arizona State University, 2019

NOTE: Currently enrolled in SQL and Python bootcamp — completing June 2024'
),
(
'Derek Chance', 'derek.chance@yahoo.com', 'Data Analyst', 2,
'SUMMARY
Recent graduate with entry-level data experience seeking a data analyst opportunity. Background primarily in data entry and basic Excel reporting. Eager to learn and grow in a data environment.

EXPERIENCE
Data Entry Specialist — OfficeWorks Inc. (2022–Present)
- Entered customer and sales data into company CRM system with high accuracy
- Generated weekly summary reports using Excel templates provided by management
- Flagged data inconsistencies and escalated to senior team members for resolution
- Assisted with basic data cleaning tasks in Excel including deduplication and formatting

Administrative Assistant — TempStaff Agency (2021–2022)
- Maintained filing systems and organized records for client companies
- Prepared basic Word and Excel documents as requested by supervisors

SKILLS
Excel (basic), Microsoft Word, Data Entry, CRM systems (basic), PowerPoint

EDUCATION
Associate Degree — General Studies, Community College, 2021'
),
(
'Rachel Kim', 'rachel.kim@protonmail.com', 'Data Analyst', 7,
'SUMMARY
Senior Data Scientist with 7 years of experience in machine learning, statistical modeling, and large-scale data analysis. Applying for a Data Analyst role due to relocation and desire for better work-life balance. Brings deep technical expertise and strong stakeholder communication skills to any analytics team.

EXPERIENCE
Senior Data Scientist — MegaTech AI (2020–Present)
- Led a team of 5 data scientists building production ML models serving 10M+ daily active users
- Used SQL daily for data extraction, feature engineering, and exploratory analysis across Snowflake and Redshift
- Built executive dashboards in Looker to communicate model performance and business impact to C-suite
- Designed and analyzed hundreds of A/B experiments using rigorous statistical methods

Data Scientist — AnalyticsCo (2017–2020)
- Built customer segmentation models and cohort analyses that informed $5M in marketing spend allocation
- Created Tableau dashboards consumed by 200+ business stakeholders across 6 departments
- Wrote complex SQL queries and Python pipelines to process 1B+ row datasets

SKILLS
SQL (expert), Python (pandas, scikit-learn, numpy), R, Tableau, Looker, Snowflake, Redshift, A/B Testing, Statistical Modeling, Machine Learning, dbt

EDUCATION
Ph.D. Computer Science (ML focus) — Stanford University, 2017'
);

-- ============================================================
-- JOB 2: DATA ENGINEER (5 candidates)
-- ============================================================

INSERT INTO RAW_RESUMES (CANDIDATE_NAME, CANDIDATE_EMAIL, TARGET_JOB_TITLE, YEARS_OF_EXPERIENCE, RESUME_TEXT) VALUES
(
'Aisha Thompson', 'aisha.thompson@gmail.com', 'Data Engineer', 6,
'SUMMARY
Senior Data Engineer with 6 years of experience designing and maintaining scalable ELT pipelines, cloud data warehouses, and real-time streaming infrastructure. Deep expertise in Snowflake, dbt, and Apache Airflow with a track record of reducing pipeline failures by 90% and cutting data warehouse costs by 35%.

EXPERIENCE
Senior Data Engineer — StreamlineData Inc. (2021–Present)
- Architected and maintained 50+ ELT pipelines using Python and Apache Airflow, processing 2TB of data daily across 15 source systems
- Designed Snowflake data warehouse including schema design, clustering keys, dynamic tables, and resource monitors — reduced monthly compute costs by 35%
- Built real-time streaming pipeline using Apache Kafka and Snowpipe that reduced data latency from 4 hours to under 5 minutes
- Implemented dbt transformation layer with 200+ models, full test coverage, and CI/CD deployment via GitHub Actions
- Mentored 2 junior data engineers and led weekly architecture review sessions

Data Engineer — FinTech Solutions LLC (2019–2021)
- Built Python-based ETL pipelines on AWS using Lambda, Glue, and S3 to consolidate data from 8 financial systems
- Migrated on-premise Oracle data warehouse to Snowflake, reducing query times by 60%
- Implemented data quality monitoring using Great Expectations, catching 99.8% of data issues before reaching production

SKILLS
Python, Snowflake (advanced — streams, tasks, dynamic tables), Apache Airflow, dbt (expert), Apache Kafka, Spark, AWS (Lambda, Glue, S3, RDS), Docker, Kubernetes, Terraform, Git, SQL (expert), Data Modeling

EDUCATION
B.S. Computer Engineering — Georgia Tech, 2019

CERTIFICATIONS
Snowflake SnowPro Core (2022), AWS Solutions Architect Associate (2021), dbt Certified Developer (2023)'
),
(
'Carlos Rivera', 'carlos.rivera@gmail.com', 'Data Engineer', 4,
'SUMMARY
Data Engineer with 4 years of experience building and maintaining data pipelines and cloud data infrastructure. Solid foundation in Python, SQL, and Snowflake with hands-on experience in Airflow orchestration and dbt transformations. Looking to grow into a senior engineering role.

EXPERIENCE
Data Engineer — GrowthCo Analytics (2021–Present)
- Built and maintained 20+ data pipelines using Python and Apache Airflow ingesting data from REST APIs, databases, and flat files
- Developed dbt models for the reporting layer serving 50+ business dashboards in Tableau
- Managed Snowflake data warehouse including user access, resource monitors, and query optimization
- Implemented data quality checks using dbt tests, reducing downstream reporting errors by 70%
- Collaborated with Data Analysts to understand reporting requirements and translate them into data models

Junior Data Engineer — TechStart Inc. (2020–2021)
- Supported senior engineers in building ETL pipelines using Python and SQL
- Maintained existing Airflow DAGs and resolved pipeline failures
- Wrote SQL queries to validate data transformations and support analyst requests

SKILLS
Python, SQL (advanced), Snowflake, Apache Airflow, dbt (intermediate), AWS (S3, Lambda, Glue), Git, Docker, Data Modeling, REST APIs

EDUCATION
B.S. Information Systems — University of Texas Austin, 2020'
),
(
'Natalie Brooks', 'natalie.brooks@outlook.com', 'Data Engineer', 3,
'SUMMARY
Software developer with 3 years of backend experience transitioning into data engineering. Strong Python and SQL skills with recent hands-on experience building data pipelines in personal projects. Completed the dbt Fundamentals certification and currently learning Apache Airflow.

EXPERIENCE
Backend Developer — AppWorks Inc. (2021–Present)
- Built and maintained REST APIs using Python and FastAPI serving 500K daily requests
- Wrote complex PostgreSQL queries and managed database schema migrations
- Built internal data export pipelines using Python to generate CSV reports for business teams
- Worked with AWS services including RDS, S3, and Lambda for application infrastructure

Software Engineer Intern — CodeBase LLC (2020–2021)
- Developed Python scripts to automate data processing tasks
- Maintained MySQL databases and wrote SQL queries for reporting

SKILLS
Python (advanced), SQL (advanced), PostgreSQL, AWS (S3, Lambda, RDS), FastAPI, Git, Docker, dbt (learning — certified), Apache Airflow (learning), Snowflake (basic)

EDUCATION
B.S. Software Engineering — Purdue University, 2020

CERTIFICATIONS
dbt Fundamentals Certification (2023)'
),
(
'Omar Hassan', 'omar.hassan@gmail.com', 'Data Engineer', 1,
'SUMMARY
Recent computer science graduate with strong academic foundation in databases and programming. Built two data pipeline projects during graduate coursework. Eager to start a career in data engineering and learn from experienced engineers in a collaborative team environment.

EXPERIENCE
Data Engineering Intern — LocalTech Corp. (Summer 2023)
- Assisted senior engineers in building Python scripts to extract data from REST APIs
- Wrote SQL queries in PostgreSQL to validate data loads
- Created basic Apache Airflow DAGs under supervision of senior engineer
- Documented pipeline processes and updated internal wiki pages

Teaching Assistant — University CS Department (2022–2023)
- Assisted professor in teaching Introduction to Databases course
- Graded SQL assignments and held office hours for 80 students

PROJECTS
Sales Data Pipeline (Personal Project)
- Built end-to-end pipeline using Python to extract data from public APIs, transform in pandas, and load into PostgreSQL
- Scheduled pipeline using cron jobs and built basic monitoring with email alerts

SKILLS
Python (intermediate), SQL (intermediate), PostgreSQL, Pandas, Git, Apache Airflow (basic), REST APIs, Docker (basic)

EDUCATION
M.S. Computer Science — University of Illinois, 2023
B.S. Computer Science — University of Illinois, 2022'
),
(
'Sandra Cole', 'sandra.cole@yahoo.com', 'Data Engineer', 8,
'SUMMARY
Experienced accountant and Excel power user with 8 years in financial reporting. No formal programming background but comfortable with Excel macros and some basic SQL learned on the job. Looking to transition into a data engineering role after completing an online bootcamp.

EXPERIENCE
Senior Financial Analyst — MidWest Corp. (2018–Present)
- Built complex Excel models with macros and VBA to automate monthly financial reporting
- Wrote basic SQL queries to extract data from company ERP system for analysis
- Managed large datasets in Excel with up to 500K rows using pivot tables and Power Query
- Coordinated with IT team on data extraction requests and report automation

Financial Analyst — RegionalBank Inc. (2015–2018)
- Prepared monthly financial reports and variance analyses for management
- Maintained Excel-based dashboards for department heads

SKILLS
Excel (advanced — VBA, macros, Power Query), SQL (basic), Financial Modeling, PowerPoint, SAP (basic)

EDUCATION
B.S. Accounting — Ohio State University, 2015

NOTE: Currently enrolled in Python and Data Engineering bootcamp'
);

-- ============================================================
-- JOB 3: FULL STACK DEVELOPER (5 candidates)
-- ============================================================

INSERT INTO RAW_RESUMES (CANDIDATE_NAME, CANDIDATE_EMAIL, TARGET_JOB_TITLE, YEARS_OF_EXPERIENCE, RESUME_TEXT) VALUES
(
'Liam Chen', 'liam.chen@gmail.com', 'Full Stack Developer', 5,
'SUMMARY
Full Stack Developer with 5 years of experience building scalable B2B SaaS applications from database through API to polished user interface. Expert in React and Node.js with a strong DevOps mindset and experience owning features end-to-end in fast-paced startup environments.

EXPERIENCE
Senior Full Stack Developer — SaaSFlow Inc. (2021–Present)
- Led development of core product features serving 50,000 B2B users using React, TypeScript, and Node.js
- Designed and optimized PostgreSQL database schemas handling 100M+ rows with sub-second query performance
- Built RESTful and GraphQL APIs consumed by web, mobile, and third-party integrations
- Implemented CI/CD pipelines using GitHub Actions and deployed containerized applications on AWS EKS
- Mentored 3 junior developers through code reviews and weekly 1:1 technical sessions
- Reduced page load time by 60% through lazy loading, code splitting, and CDN optimization

Full Stack Developer — StartupBase LLC (2019–2021)
- Built customer-facing dashboard from scratch using React and Redux, replacing legacy jQuery application
- Developed Python microservices for data processing and third-party API integrations
- Managed AWS infrastructure including EC2, RDS, S3, and CloudFront

SKILLS
React, TypeScript, JavaScript, Node.js, Python, PostgreSQL, GraphQL, REST APIs, AWS (EKS, EC2, RDS, S3), Docker, Kubernetes, GitHub Actions, Redis, Git, Tailwind CSS

EDUCATION
B.S. Computer Science — UC Berkeley, 2019'
),
(
'Elena Vasquez', 'elena.vasquez@outlook.com', 'Full Stack Developer', 3,
'SUMMARY
Full Stack Developer with 3 years of experience building web applications using React and Node.js. Comfortable working across the full stack with solid skills in both frontend development and backend API design. Looking to join a product-focused team where I can grow my architecture skills.

EXPERIENCE
Full Stack Developer — WebCraft Agency (2021–Present)
- Built and maintained 10+ client web applications using React, Node.js, and PostgreSQL
- Developed REST APIs and integrated third-party services including Stripe, Twilio, and SendGrid
- Wrote unit and integration tests using Jest and React Testing Library, maintaining 80%+ code coverage
- Deployed applications on AWS using EC2, RDS, and S3 with basic CI/CD using GitHub Actions
- Collaborated with designers to implement responsive UI components from Figma mockups

Junior Developer — DigitalEdge Inc. (2020–2021)
- Supported senior developers in building React components and Node.js API endpoints
- Fixed bugs and wrote unit tests for existing codebase
- Participated in daily standups and bi-weekly sprint planning sessions

SKILLS
React, JavaScript, Node.js, PostgreSQL, REST APIs, Jest, AWS (EC2, RDS, S3), Git, GitHub Actions, CSS, HTML, Figma

EDUCATION
B.S. Software Engineering — University of Washington, 2020'
),
(
'James Okafor', 'james.okafor@gmail.com', 'Full Stack Developer', 4,
'SUMMARY
Frontend-focused developer with 4 years of React experience looking to expand into full stack development. Strong UI skills and solid JavaScript foundation. Have been learning Node.js and PostgreSQL through personal projects over the past year and excited to apply these skills professionally.

EXPERIENCE
Frontend Developer — MediaTech Corp. (2020–Present)
- Built complex React applications with Redux state management for media streaming platform serving 2M users
- Developed reusable component library used across 5 product teams, reducing UI development time by 30%
- Integrated REST APIs built by backend team into frontend applications
- Optimized React rendering performance reducing unnecessary re-renders by 45%
- Collaborated closely with UX designers and backend engineers in agile sprints

UI Developer Intern — DesignFirst Agency (2019–2020)
- Built responsive web pages using HTML, CSS, and JavaScript
- Converted Figma designs to pixel-perfect React components

PERSONAL PROJECTS
Full Stack Todo App — React frontend, Node.js/Express backend, PostgreSQL database, deployed on Heroku

SKILLS
React (expert), JavaScript, TypeScript (intermediate), Redux, HTML, CSS, Node.js (learning), PostgreSQL (learning), REST APIs, Git

EDUCATION
B.S. Graphic Design & Computer Science — NYU, 2019'
),
(
'Fatima Al-Rashid', 'fatima.alrashid@protonmail.com', 'Full Stack Developer', 1,
'SUMMARY
Computer science graduate with strong academic foundation in algorithms, data structures, and web development. Built several full stack projects during university including a social networking app and an e-commerce platform. Looking for my first professional role where I can contribute and grow rapidly.

EXPERIENCE
Software Engineering Intern — LocalStartup Inc. (Summer 2023)
- Built 3 React components for company dashboard under supervision of senior developer
- Fixed 15 bug tickets across frontend and backend codebase
- Wrote unit tests for existing Node.js API endpoints
- Participated in sprint planning and daily standups

PROJECTS
Social Network App (University Capstone)
- Built full stack application using React, Node.js, Express, and MongoDB
- Implemented user authentication, real-time messaging using WebSockets, and photo uploads to AWS S3
- Deployed on AWS EC2 with Nginx reverse proxy

E-Commerce Platform (Personal Project)
- Built online store using React frontend and Node.js backend with PostgreSQL database
- Integrated Stripe payment processing and SendGrid email notifications

SKILLS
React, JavaScript, Node.js, Express, PostgreSQL, MongoDB, HTML, CSS, Git, AWS (S3, EC2 — basic), REST APIs

EDUCATION
B.S. Computer Science — University of Michigan, 2023'
),
(
'Robert Huang', 'robert.huang@gmail.com', 'Full Stack Developer', 10,
'SUMMARY
Retired military officer with 10 years of logistics and operations management experience. Career changer pursuing software development after completing a 6-month coding bootcamp in 2023. Strong leadership and problem-solving skills. Currently building first personal projects in JavaScript and React.

EXPERIENCE
Logistics Officer — US Army (2013–2023)
- Managed supply chain operations for 500-person battalion across 3 international deployments
- Led cross-functional teams of 20+ personnel in high-pressure environments
- Used Excel and Army logistics software to track inventory and generate operational reports
- Trained and mentored junior officers in operational planning and execution

PROJECTS (Post-Bootcamp)
Weather App — HTML, CSS, JavaScript, OpenWeather API
Calculator — HTML, CSS, Vanilla JavaScript

SKILLS
JavaScript (basic), HTML, CSS, React (beginner — completed 2 tutorials), Leadership, Project Management, Excel, Microsoft Office

EDUCATION
B.A. Political Science — West Point, 2013
Coding Bootcamp Certificate — DevLeap Academy, 2023'
);

-- ============================================================
-- JOB 4: HR MANAGER (5 candidates)
-- ============================================================

INSERT INTO RAW_RESUMES (CANDIDATE_NAME, CANDIDATE_EMAIL, TARGET_JOB_TITLE, YEARS_OF_EXPERIENCE, RESUME_TEXT) VALUES
(
'Vanessa Morgan', 'vanessa.morgan@gmail.com', 'HR Manager', 8,
'SUMMARY
Strategic HR Manager with 8 years of progressive experience leading people operations, employee relations, and talent programs at high-growth technology companies. Proven ability to scale HR functions from 50 to 500 employees while maintaining strong culture, compliance, and employee engagement scores above 85%.

EXPERIENCE
HR Manager — TechScale Inc. (2020–Present)
- Served as HR Business Partner for Engineering, Product, and Data teams totaling 180 employees across 3 offices
- Led company scaling from 150 to 400 employees over 3 years, building onboarding, performance management, and career leveling frameworks from scratch
- Reduced voluntary attrition from 22% to 11% through redesigned manager training, stay interviews, and compensation benchmarking program
- Managed complex employee relations matters including PIPs, investigations, and separations with zero legal escalations over 4 years
- Partnered with Finance on annual headcount planning and compensation budgeting cycles
- Built and presented quarterly people analytics dashboards to CEO and Board including headcount, attrition, DEI, and engagement metrics

HR Business Partner — GrowthStart LLC (2018–2020)
- Supported 3 business units across 120 employees as dedicated HRBP
- Designed and delivered manager effectiveness training program rolled out to 40 managers
- Led bi-annual engagement survey process and drove action planning across departments

SKILLS
HR Business Partnering, Employee Relations, Performance Management, Compensation Benchmarking, HRIS (Workday, BambooHR), People Analytics, DEI Programs, Employment Law (FMLA, ADA, EEO), Organizational Design, Talent Development

EDUCATION
B.S. Human Resources Management — Penn State University, 2016

CERTIFICATIONS
SHRM-SCP (2021), PHR (2018)'
),
(
'David Osei', 'david.osei@outlook.com', 'HR Manager', 5,
'SUMMARY
HR professional with 5 years of experience in HR generalist and business partner roles at mid-size companies. Strong foundation in employee relations, recruiting coordination, and HR compliance. Ready to step into a first HR Manager role and lead a small people operations team.

EXPERIENCE
Senior HR Generalist — MidCorp Industries (2021–Present)
- Managed employee relations for workforce of 250 employees across 2 locations
- Administered performance review cycle for entire company including calibration sessions with 15 managers
- Ensured compliance with federal and state employment law requirements including FMLA, ADA, and state leave laws
- Maintained HRIS in BambooHR including employee records, org charts, and reporting
- Partnered with Finance on monthly headcount reconciliation and annual merit increase planning
- Supported DEI committee with data analysis and program coordination

HR Generalist — SmallBiz Co. (2019–2021)
- Handled full employee lifecycle from onboarding through offboarding for 80-person company
- Coordinated recruiting process including job postings, interview scheduling, and offer letters
- Administered benefits enrollment and answered employee questions on health, 401k, and PTO

SKILLS
Employee Relations, HR Compliance, HRIS (BambooHR), Performance Management, Benefits Administration, Recruiting Coordination, Employment Law, People Analytics (basic), FMLA/ADA/EEO

EDUCATION
B.S. Psychology — University of Florida, 2019

CERTIFICATIONS
SHRM-CP (2021)'
),
(
'Isabella Fernandez', 'isabella.fernandez@gmail.com', 'HR Manager', 6,
'SUMMARY
Operations manager with 6 years of experience managing teams and business processes in retail and hospitality environments. Strong people management and conflict resolution skills. Completed SHRM-CP certification in 2023 to formalize HR knowledge and transition into a dedicated HR role.

EXPERIENCE
Operations Manager — RetailChain Corp. (2019–Present)
- Managed team of 45 hourly and salaried employees across 3 retail locations
- Handled employee scheduling, performance conversations, disciplinary actions, and terminations
- Conducted new hire onboarding and training for all store-level employees
- Resolved customer and employee complaints escalated from store managers
- Tracked attendance, turnover, and productivity metrics in Excel and reported to regional director
- Coordinated with corporate HR on benefits questions, leave requests, and policy compliance

Assistant Manager — HotelGroup Inc. (2017–2019)
- Supervised front desk team of 12 employees across day and night shifts
- Managed employee scheduling and handled basic HR tasks in absence of dedicated HR team

SKILLS
Team Management, Employee Relations, Scheduling, Performance Conversations, Onboarding, Conflict Resolution, Excel, Employment Law (basic), HRIS (basic — ADP)

EDUCATION
B.A. Business Administration — Florida State University, 2017

CERTIFICATIONS
SHRM-CP (2023)'
),
(
'Marcus Johnson', 'marcus.johnson@yahoo.com', 'HR Manager', 2,
'SUMMARY
Recent HR graduate with 2 years of HR coordinator experience seeking a growth opportunity in HR management. Strong academic foundation in HR theory, employment law, and organizational behavior. Eager to take on more responsibility and develop as an HR professional.

EXPERIENCE
HR Coordinator — StartupXYZ Inc. (2022–Present)
- Coordinated interview scheduling for 10-15 open roles simultaneously across Engineering and Business teams
- Managed new hire onboarding paperwork and orientation logistics for 5-10 new hires per month
- Maintained employee records in Workday HRIS and generated standard reports for HR leadership
- Answered employee questions on benefits, PTO, and company policies via HR inbox
- Assisted HR Manager with annual performance review administration and survey coordination

HR Intern — MegaCorp HR Department (Summer 2021)
- Supported HR team with filing, data entry, and onboarding document preparation
- Observed employee relations meetings and took notes for HR Business Partners

SKILLS
HRIS (Workday — basic), Interview Scheduling, Onboarding Coordination, HR Administration, Microsoft Office, Employment Law (academic knowledge), Benefits Administration (basic)

EDUCATION
B.S. Human Resources Management — Michigan State University, 2022'
),
(
'Kevin Park', 'kevin.park@gmail.com', 'HR Manager', 12,
'SUMMARY
Sales director with 12 years of experience leading large revenue teams in technology sales. Strong track record of people management, coaching, and talent development. No formal HR background but extensive experience managing performance, compensation, and team culture in a sales organization.

EXPERIENCE
Sales Director — Enterprisetech Corp. (2018–Present)
- Led team of 35 account executives and 5 sales managers generating $45M in annual revenue
- Managed performance review cycles, compensation planning, and promotion decisions for entire sales org
- Hired, onboarded, and developed 60+ salespeople over 6 years with 85% first-year retention rate
- Resolved interpersonal conflicts and performance issues within sales team
- Partnered with HR on compensation benchmarking, headcount planning, and termination processes

Regional Sales Manager — SoftwareCo Inc. (2012–2018)
- Managed 15 account executives across Northeast region
- Coached underperforming reps through structured PIPs in partnership with HR

SKILLS
People Management, Coaching and Development, Performance Management, Compensation Planning, Talent Acquisition (sales roles), Conflict Resolution, Excel, Salesforce

EDUCATION
B.A. Business Administration — Duke University, 2012'
);

-- ============================================================
-- JOB 5: FINANCIAL ANALYST (5 candidates)
-- ============================================================

INSERT INTO RAW_RESUMES (CANDIDATE_NAME, CANDIDATE_EMAIL, TARGET_JOB_TITLE, YEARS_OF_EXPERIENCE, RESUME_TEXT) VALUES
(
'Sofia Delgado', 'sofia.delgado@gmail.com', 'Financial Analyst', 5,
'SUMMARY
Financial Analyst with 5 years of experience in corporate FP&A at Fortune 500 companies. Expert financial modeler with deep experience in three-statement modeling, variance analysis, and executive reporting. Strong SQL skills for data extraction and Python automation for reporting workflows.

EXPERIENCE
Senior Financial Analyst — GlobalCorp Finance (2021–Present)
- Built and maintained three-statement financial models and rolling 18-month forecasts for $1.2B business unit
- Prepared monthly CFO reporting package including P&L variance analysis with narrative commentary for 12 business units
- Developed Tableau dashboards for executive team tracking revenue, gross margin, and operating expense KPIs
- Automated month-end reporting using Python scripts, reducing close reporting time from 5 days to 2 days
- Supported annual budgeting process coordinating inputs from 8 department heads into consolidated plan
- Conducted M&A due diligence support including financial model review and synergy analysis for 2 acquisitions

Financial Analyst — RegionalBank Corp. (2019–2021)
- Built financial models in Excel to support commercial lending decisions totaling $200M in annual loan volume
- Wrote SQL queries against Oracle database to extract and validate financial data for reporting
- Prepared quarterly board presentations summarizing portfolio performance and risk metrics

SKILLS
Excel (expert — financial modeling, VBA, pivot tables), SQL (intermediate), Python (pandas, automation), Tableau, PowerPoint, Financial Modeling, Variance Analysis, FP&A, M&A Support, Anaplan (basic)

EDUCATION
B.S. Finance — NYU Stern School of Business, 2019

CERTIFICATIONS
CFA Level 2 (2023), Snowflake SnowPro Core (2023)'
),
(
'Benjamin Scott', 'benjamin.scott@outlook.com', 'Financial Analyst', 3,
'SUMMARY
Financial Analyst with 3 years of corporate finance experience focused on FP&A and management reporting. Solid Excel and financial modeling skills with growing proficiency in SQL and data visualization. Looking to join a data-forward finance team where analytics and modeling are equally valued.

EXPERIENCE
Financial Analyst — TechGrowth Inc. (2021–Present)
- Prepared monthly financial reporting package including income statement variance analysis for CFO and business unit leaders
- Built and maintained annual operating budget model in Excel consolidating inputs from 6 departments
- Created Power BI dashboards for Finance leadership tracking revenue, headcount costs, and operating expenses
- Wrote SQL queries to extract financial data from Snowflake for ad hoc analysis requests
- Supported quarterly forecasting process updating revenue and expense projections based on actuals

Junior Financial Analyst — ConsultingFirm LLC (2020–2021)
- Built financial models for client engagements including DCF valuations and LBO models
- Prepared client-ready PowerPoint presentations summarizing financial analysis findings

SKILLS
Excel (advanced — financial modeling, pivot tables, INDEX/MATCH), SQL (basic-intermediate), Power BI, PowerPoint, Financial Modeling, Variance Analysis, Forecasting, Snowflake (basic)

EDUCATION
B.S. Finance — University of Virginia, 2020'
),
(
'Amara Diallo', 'amara.diallo@gmail.com', 'Financial Analyst', 5,
'SUMMARY
Experienced accountant with 5 years in public accounting and audit at a Big 4 firm. Strong understanding of financial statements, GAAP, and internal controls. Transitioning into a corporate FP&A analyst role to apply accounting expertise in a forward-looking, strategic finance context.

EXPERIENCE
Senior Auditor — BigFour Accounting LLP (2019–Present)
- Led financial statement audits for 8 public company clients across Technology and Healthcare sectors with revenues up to $500M
- Reviewed and tested internal controls for SOX compliance across financial reporting processes
- Analyzed financial statement line items for material misstatements using analytical procedures and data sampling
- Coached 4 junior auditors on audit methodology and client communication

Audit Associate — BigFour Accounting LLP (2019–2021)
- Executed audit procedures across balance sheet and income statement accounts
- Prepared workpapers documenting audit evidence and conclusions

SKILLS
Financial Statement Analysis, GAAP, Audit, SOX Compliance, Excel (advanced), Internal Controls, PowerPoint, Financial Modeling (basic), SQL (beginner)

EDUCATION
B.S. Accounting — University of Notre Dame, 2019

CERTIFICATIONS
CPA (2021)'
),
(
'Tyler Brooks', 'tyler.brooks@yahoo.com', 'Financial Analyst', 1,
'SUMMARY
Recent finance graduate seeking entry-level financial analyst position. Strong academic performance with coursework in financial modeling, corporate finance, and accounting. Completed two finance internships and built several financial models during university.

EXPERIENCE
Finance Intern — MidSize Corp. (Summer 2023)
- Assisted financial analysts with data gathering for monthly reporting package
- Updated budget vs actual tracking spreadsheet weekly using data from ERP system
- Built basic Excel model to track departmental headcount costs under supervision of senior analyst

Finance Intern — LocalBank Inc. (Summer 2022)
- Supported commercial lending team with data entry and loan document preparation
- Ran basic financial ratio analyses on loan applicants using Excel

PROJECTS
DCF Valuation Model — Built three-statement financial model and DCF valuation for Apple as part of Investment Analysis course

SKILLS
Excel (intermediate — financial modeling, pivot tables, VLOOKUP), PowerPoint, Financial Modeling (academic), Basic Accounting, Bloomberg Terminal (university access)

EDUCATION
B.S. Finance — Indiana University Kelley School of Business, 2023
GPA: 3.8/4.0'
),
(
'Grace Williams', 'grace.williams@protonmail.com', 'Financial Analyst', 15,
'SUMMARY
CFO with 15 years of experience in financial leadership at PE-backed and public companies. Extensive background in financial planning, capital markets, M&A, and board-level reporting. Seeking a Financial Analyst role after stepping back from executive responsibilities to focus on individual contributor work in a collaborative team setting.

EXPERIENCE
CFO — PrivateEquity Portfolio Co. (2018–Present)
- Led all financial planning, reporting, treasury, and accounting functions for $300M revenue company
- Built and presented quarterly board packages to PE sponsors and independent directors
- Led 3 successful M&A transactions totaling $450M in deal value including financial modeling, due diligence, and integration
- Implemented Anaplan FP&A platform replacing Excel-based planning processes across 12 business units

VP Finance — MidCap Public Corp. (2012–2018)
- Managed FP&A team of 8 analysts supporting $800M public company
- Led annual budgeting and quarterly earnings reporting processes

SKILLS
Financial Modeling, FP&A, M&A, Board Reporting, Anaplan, Excel (expert), PowerPoint, SQL (basic), Capital Markets, Treasury, GAAP

EDUCATION
MBA — Harvard Business School, 2009
B.S. Economics — Yale University, 2007

CERTIFICATIONS
CPA (2009), CFA (2011)'
);

-- ============================================================
-- JOB 6: PRODUCT MANAGER (5 candidates)
-- ============================================================

INSERT INTO RAW_RESUMES (CANDIDATE_NAME, CANDIDATE_EMAIL, TARGET_JOB_TITLE, YEARS_OF_EXPERIENCE, RESUME_TEXT) VALUES
(
'Noah Bennett', 'noah.bennett@gmail.com', 'Product Manager', 6,
'SUMMARY
Senior Product Manager with 6 years of experience leading platform and core product development at B2B SaaS companies. Proven track record of shipping products from 0 to 1, running data-driven A/B experiments, and aligning engineering, design, and business stakeholders around a clear product vision.

EXPERIENCE
Senior Product Manager — PlatformCo SaaS (2021–Present)
- Owned end-to-end product roadmap for core platform serving 200,000 B2B users across 500+ enterprise customers
- Shipped 4 major product launches in 2 years, each driving 15-25% increase in feature adoption and measurable NPS improvement
- Defined and tracked 12 product KPIs using SQL queries against Snowflake and Amplitude dashboards
- Ran 50+ A/B experiments using rigorous statistical methods, achieving 95% confidence intervals before shipping decisions
- Wrote detailed PRDs and user stories enabling engineering team to ship with minimal ambiguity
- Presented quarterly roadmap and results to C-suite and board including product vision and growth metrics

Product Manager — GrowthApp Inc. (2019–2021)
- Led discovery, definition, and delivery of 3 core product features that increased paid conversion by 22%
- Conducted 100+ user interviews and synthesized findings into product requirements
- Partnered with Data team to define product analytics instrumentation and self-serve reporting

SKILLS
Product Management, SQL (intermediate), A/B Testing, User Research, Roadmapping, PRD Writing, Agile/Scrum, Amplitude, Mixpanel, Figma, Stakeholder Management, B2B SaaS, Go-to-Market

EDUCATION
B.S. Computer Science — Carnegie Mellon University, 2019'
),
(
'Zara Ahmed', 'zara.ahmed@outlook.com', 'Product Manager', 4,
'SUMMARY
Product Manager with 4 years of experience across mobile and web products at consumer technology companies. Strong user research and data analysis skills with a track record of shipping user-loved features on time and within scope. Looking to transition into B2B SaaS product management.

EXPERIENCE
Product Manager — ConsumerApp Co. (2021–Present)
- Owned product roadmap for mobile app with 1M+ downloads across iOS and Android
- Shipped 6 major features in 18 months including redesigned onboarding flow that improved D7 retention by 18%
- Conducted weekly user interviews and synthesized qualitative insights into product decisions
- Analyzed product metrics using Mixpanel and SQL queries to identify drop-off points and prioritize improvements
- Wrote user stories and acceptance criteria for engineering team of 8 developers

Associate Product Manager — StartupLaunch Inc. (2020–2021)
- Supported senior PM on B2B project management tool used by 5,000 businesses
- Ran competitive analysis and market research to inform product positioning decisions
- Coordinated sprint planning and backlog grooming sessions

SKILLS
Product Management, SQL (basic), User Research, A/B Testing, Mixpanel, Mobile Products, Agile, User Stories, Competitive Analysis, Figma, Roadmapping

EDUCATION
B.A. Psychology — University of Michigan, 2020'
),
(
'Samuel Wright', 'samuel.wright@gmail.com', 'Product Manager', 7,
'SUMMARY
Engineering manager with 7 years of software engineering and team leadership experience looking to transition into product management. Deep technical background in system design and API architecture combined with growing product skills developed through close collaboration with PM counterparts.

EXPERIENCE
Engineering Manager — TechCorp Inc. (2020–Present)
- Led engineering team of 12 building developer-facing API platform used by 3,000 developers
- Collaborated closely with product managers on roadmap prioritization, technical feasibility, and sprint planning
- Drove technical discovery for new product initiatives, writing technical design documents and API specifications
- Defined engineering KPIs and presented team performance metrics to VP Engineering quarterly

Senior Software Engineer — APIFirst Co. (2017–2020)
- Built scalable microservices and REST APIs handling 50M daily requests
- Participated in product planning sessions and contributed to feature prioritization discussions

SKILLS
Technical Product Management, API Design, System Architecture, SQL (advanced), Agile/Scrum, Roadmapping, Technical Writing, Python, Java, Engineering Leadership, Stakeholder Communication

EDUCATION
B.S. Computer Science — MIT, 2017'
),
(
'Aaliyah Washington', 'aaliyah.washington@gmail.com', 'Product Manager', 1,
'SUMMARY
Recent MBA graduate with a concentration in Technology Management and Strategy. Completed a product management internship and a PM fellowship program. Passionate about building user-centered products and eager to start a career in B2B SaaS product management.

EXPERIENCE
Product Manager Intern — SaaSStartup Inc. (Summer 2023)
- Assisted senior PM with user research including scheduling and note-taking for 20 customer interviews
- Wrote user stories for 2 minor features shipped during internship
- Created competitive analysis deck comparing 5 competitors across 12 product dimensions
- Participated in sprint planning, daily standups, and retrospectives

PM Fellowship — ProductSchool Fellowship Program (2023)
- Completed 12-week intensive PM training program including mock PRDs, roadmap exercises, and case studies
- Built and presented product pitch for fictional B2B analytics tool to panel of senior PMs

SKILLS
Product Management (learning), User Research, Competitive Analysis, User Stories (basic), Agile/Scrum, PowerPoint, Excel, Figma (basic), SQL (beginner — learning)

EDUCATION
MBA — Northwestern Kellogg School of Management, 2023
B.A. Communications — Howard University, 2021'
),
(
'Patrick O Brien', 'patrick.obrien@yahoo.com', 'Product Manager', 20,
'SUMMARY
Retired professor of philosophy with 20 years of academic experience in logic, ethics, and critical thinking. Career changer interested in product management after attending a 3-day PM workshop. Strong communication and analytical thinking skills from academic career.

EXPERIENCE
Professor of Philosophy — State University (2003–2023)
- Taught undergraduate and graduate courses in logic, ethics, and philosophy of technology
- Published 12 peer-reviewed papers on technology ethics and human-computer interaction
- Managed department curriculum, advised 30+ graduate students annually
- Presented research at international academic conferences

Philosophy Department Chair (2015–2020)
- Led department of 15 faculty members and managed annual budget of $2M
- Coordinated hiring process for 4 new faculty positions over 5 years

SKILLS
Critical Thinking, Written Communication, Public Speaking, Research, Academic Writing, Logic, Microsoft Office, Budget Management

EDUCATION
Ph.D. Philosophy — Oxford University, 2003
B.A. Philosophy — Cambridge University, 1999

NOTE: Attended 3-day Product Management Workshop — ProductCon 2023'
);

SELECT
    TARGET_JOB_TITLE,
    COUNT(*) AS candidate_count
FROM RAW_RESUMES
GROUP BY TARGET_JOB_TITLE
ORDER BY TARGET_JOB_TITLE;

SELECT COUNT(*) AS total_resumes FROM RAW_RESUMES;