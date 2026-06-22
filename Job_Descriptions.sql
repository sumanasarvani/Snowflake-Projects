USE WAREHOUSE RESUME_SCREENER_WH;
USE DATABASE RESUME_SCREENER_DB;
USE SCHEMA RECRUITING;

--> Create a TABLE
CREATE OR REPLACE TABLE JOB_DESCRIPTIONS (
    JOB_ID              NUMBER AUTOINCREMENT PRIMARY KEY,
    JOB_TITLE           VARCHAR(100),
    JOB_FAMILY          VARCHAR(100),
    ROLE                VARCHAR(150),
    SENIORITY_LEVEL     VARCHAR(50),
    LOCATION            VARCHAR(100),
    JOB_DESCRIPTION     TEXT,
    SKILLS_REQUIRED     TEXT,
    NICE_TO_HAVE_SKILLS TEXT,
    EXPERIENCE_MIN      NUMBER,
    EXPERIENCE_MAX      NUMBER,
    QUALIFICATION_LEVEL VARCHAR(50),
    SALARY_MIN          NUMBER,
    SALARY_MAX          NUMBER,
    STATUS              VARCHAR(20) DEFAULT 'OPEN',
    CREATED_AT          TIMESTAMP   DEFAULT CURRENT_TIMESTAMP()
);

-- ============================================================
-- JOB_DESCRIPTIONS TABLE + 20 US MARKET JOB POSTINGS
-- ============================================================

CREATE OR REPLACE TABLE JOB_DESCRIPTIONS (
    JOB_ID              NUMBER AUTOINCREMENT PRIMARY KEY,
    JOB_TITLE           VARCHAR(100),
    JOB_FAMILY          VARCHAR(100),
    ROLE                VARCHAR(150),
    SENIORITY_LEVEL     VARCHAR(50),
    LOCATION            VARCHAR(100),
    JOB_DESCRIPTION     TEXT,
    SKILLS_REQUIRED     TEXT,
    NICE_TO_HAVE_SKILLS TEXT,
    EXPERIENCE_MIN      NUMBER,
    EXPERIENCE_MAX      NUMBER,
    QUALIFICATION_LEVEL VARCHAR(50),
    SALARY_MIN          NUMBER,
    SALARY_MAX          NUMBER,
    STATUS              VARCHAR(20) DEFAULT 'OPEN',
    CREATED_AT          TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

-- ============================================================
-- FAMILY 1: DATA & ANALYTICS (4 roles)
-- ============================================================

INSERT INTO JOB_DESCRIPTIONS (
    JOB_TITLE, JOB_FAMILY, ROLE, SENIORITY_LEVEL, LOCATION,
    JOB_DESCRIPTION, SKILLS_REQUIRED, NICE_TO_HAVE_SKILLS,
    EXPERIENCE_MIN, EXPERIENCE_MAX, QUALIFICATION_LEVEL,
    SALARY_MIN, SALARY_MAX
) VALUES (
'Data Analyst',
'Data & Analytics',
'Business Intelligence & Reporting Analyst',
'Mid',
'Austin, TX (Hybrid)',
'We are seeking a Data Analyst to join our Business Intelligence team and help transform raw data into actionable insights that drive strategic decisions across the organization.

Responsibilities:
- Design, build, and maintain dashboards and reports for business stakeholders across Sales, Marketing, and Operations
- Write complex SQL queries including CTEs, window functions, and subqueries against our Snowflake data warehouse
- Partner with Data Engineering to define and validate data models and ensure data quality
- Conduct ad hoc analysis to answer business questions and present findings to non-technical audiences
- Define and track KPIs in collaboration with department leads
- Identify trends, anomalies, and opportunities within large datasets and communicate findings clearly

Requirements:
- 2+ years of professional experience in a data analyst or similar role
- Advanced SQL skills — must be comfortable with window functions, CTEs, and performance tuning
- Experience with at least one BI tool such as Tableau, Power BI, or Looker
- Proficiency in Python or R for data manipulation and statistical analysis
- Experience working with cloud data warehouses such as Snowflake, BigQuery, or Redshift
- Strong written and verbal communication skills for presenting insights to leadership

Preferred Qualifications:
- Experience with dbt for data transformation
- Familiarity with A/B testing and statistical significance
- Prior experience in a SaaS or e-commerce environment
- Knowledge of data modeling concepts such as star schema and dimensional modeling',
'SQL, Tableau or Power BI, Python or R, Snowflake or BigQuery, Data Visualization, Communication',
'dbt, A/B Testing, Statistics, Looker, Star Schema Modeling',
2, 6, 'Bachelors', 75000, 110000
);

INSERT INTO JOB_DESCRIPTIONS (
    JOB_TITLE, JOB_FAMILY, ROLE, SENIORITY_LEVEL, LOCATION,
    JOB_DESCRIPTION, SKILLS_REQUIRED, NICE_TO_HAVE_SKILLS,
    EXPERIENCE_MIN, EXPERIENCE_MAX, QUALIFICATION_LEVEL,
    SALARY_MIN, SALARY_MAX
) VALUES (
'Senior BI Analyst',
'Data & Analytics',
'Senior Business Intelligence & Analytics Analyst',
'Senior',
'New York, NY (Hybrid)',
'We are looking for a Senior BI Analyst to lead the design and delivery of enterprise-wide reporting solutions and mentor junior analysts on our growing data team.

Responsibilities:
- Own end-to-end development of executive dashboards and self-service analytics platforms
- Lead requirements gathering sessions with VP and C-suite stakeholders to translate business needs into technical specifications
- Architect scalable data models and define best practices for BI development across the team
- Manage and optimize complex SQL pipelines in Snowflake, ensuring performance at scale
- Mentor and code review junior analysts, establishing team standards and documentation
- Collaborate with Data Engineering on warehouse design, partitioning strategy, and data governance

Requirements:
- 5+ years of experience in business intelligence, analytics, or data engineering
- Expert-level SQL skills with deep experience in Snowflake or a comparable cloud warehouse
- Advanced proficiency in Tableau or Power BI including calculated fields, LOD expressions, and data source optimization
- Strong Python skills for automation, data wrangling, and pipeline support
- Experience defining and managing data models using dbt or similar transformation tools
- Proven ability to communicate complex analytical findings to executive audiences

Preferred Qualifications:
- Experience with Snowflake Cortex or similar AI/ML integrations
- Background in building self-service analytics programs
- Experience in financial services, healthcare, or enterprise SaaS
- Snowflake SnowPro Core certification',
'SQL (Expert), Snowflake, Tableau or Power BI, Python, dbt, Data Modeling, Stakeholder Management',
'Snowflake Cortex, Self-Service Analytics, SnowPro Certification, Looker',
5, 10, 'Bachelors', 115000, 160000
);

INSERT INTO JOB_DESCRIPTIONS (
    JOB_TITLE, JOB_FAMILY, ROLE, SENIORITY_LEVEL, LOCATION,
    JOB_DESCRIPTION, SKILLS_REQUIRED, NICE_TO_HAVE_SKILLS,
    EXPERIENCE_MIN, EXPERIENCE_MAX, QUALIFICATION_LEVEL,
    SALARY_MIN, SALARY_MAX
) VALUES (
'Data Engineer',
'Data & Analytics',
'Data Pipeline & Warehouse Engineer',
'Mid',
'Seattle, WA (Hybrid)',
'We are hiring a Data Engineer to design and maintain the data infrastructure that powers our analytics and machine learning teams. You will own pipelines from ingestion through transformation and delivery.

Responsibilities:
- Build, maintain, and monitor scalable ELT/ETL pipelines using Python and Apache Airflow
- Design and implement data models in Snowflake optimized for analytical workloads
- Ensure data quality and reliability through automated testing, monitoring, and alerting
- Collaborate with Data Analysts and Data Scientists to understand data requirements and deliver clean, reliable datasets
- Implement data governance standards including lineage tracking, access controls, and documentation
- Optimize query performance through clustering, partitioning, and warehouse sizing strategies

Requirements:
- 3+ years of experience in data engineering or a closely related role
- Strong Python skills for pipeline development and automation
- Deep experience with Snowflake including stages, pipes, streams, tasks, and dynamic tables
- Proficiency with workflow orchestration tools such as Apache Airflow or Prefect
- Solid understanding of data modeling concepts including star schema, normalized models, and data vault
- Experience with cloud platforms such as AWS, GCP, or Azure

Preferred Qualifications:
- Experience with dbt for transformation layer management
- Familiarity with Kafka or other streaming data platforms
- Knowledge of Snowflake Cortex or AI-enhanced pipeline patterns
- Experience with infrastructure as code tools such as Terraform',
'Python, Snowflake, Apache Airflow, ELT/ETL, SQL, Data Modeling, AWS or GCP',
'dbt, Kafka, Terraform, Snowflake Streams and Tasks, Data Vault',
3, 8, 'Bachelors', 110000, 150000
);

INSERT INTO JOB_DESCRIPTIONS (
    JOB_TITLE, JOB_FAMILY, ROLE, SENIORITY_LEVEL, LOCATION,
    JOB_DESCRIPTION, SKILLS_REQUIRED, NICE_TO_HAVE_SKILLS,
    EXPERIENCE_MIN, EXPERIENCE_MAX, QUALIFICATION_LEVEL,
    SALARY_MIN, SALARY_MAX
) VALUES (
'Analytics Engineer',
'Data & Analytics',
'Analytics Engineering & Data Transformation Specialist',
'Mid',
'Remote (US)',
'We are seeking an Analytics Engineer to sit at the intersection of Data Engineering and Business Intelligence — owning the transformation layer that turns raw warehouse data into trusted, documented, and reusable datasets.

Responsibilities:
- Build and maintain dbt models that serve as the single source of truth for all business metrics
- Define and enforce data quality tests, documentation standards, and model governance across the dbt project
- Partner with Data Analysts to understand reporting requirements and translate them into clean, performant data models
- Maintain the Snowflake data warehouse including schema design, access management, and cost monitoring
- Drive adoption of analytics engineering best practices including version control, CI/CD for data, and semantic layer design
- Collaborate with Data Engineering on upstream pipeline design and data contracts

Requirements:
- 2+ years of experience in analytics engineering, data engineering, or a senior data analyst role
- Expert-level dbt skills including advanced Jinja, macros, packages, and model materialization strategies
- Strong SQL skills in Snowflake or a comparable cloud warehouse
- Experience with Git-based workflows and CI/CD pipelines for data
- Strong understanding of dimensional modeling and metrics layer concepts
- Excellent collaboration skills working across technical and non-technical teams

Preferred Qualifications:
- Experience with the dbt Semantic Layer or MetricFlow
- Familiarity with data observability tools such as Monte Carlo or Elementary
- Python experience for custom dbt integrations or pipeline support
- Experience with Snowflake features including dynamic tables and Cortex AI functions',
'dbt (Expert), SQL, Snowflake, Git, Dimensional Modeling, CI/CD for Data',
'dbt Semantic Layer, Monte Carlo, Python, Snowflake Dynamic Tables, Cortex AI',
2, 7, 'Bachelors', 105000, 145000
);

-- ============================================================
-- FAMILY 2: SOFTWARE ENGINEERING (4 roles)
-- ============================================================

INSERT INTO JOB_DESCRIPTIONS (
    JOB_TITLE, JOB_FAMILY, ROLE, SENIORITY_LEVEL, LOCATION,
    JOB_DESCRIPTION, SKILLS_REQUIRED, NICE_TO_HAVE_SKILLS,
    EXPERIENCE_MIN, EXPERIENCE_MAX, QUALIFICATION_LEVEL,
    SALARY_MIN, SALARY_MAX
) VALUES (
'Frontend Developer',
'Software Engineering',
'Frontend Web Application Developer',
'Mid',
'San Francisco, CA (Hybrid)',
'We are looking for a Frontend Developer to build fast, accessible, and visually polished user interfaces for our SaaS platform used by over 500,000 users worldwide.

Responsibilities:
- Develop responsive, high-performance web applications using React and TypeScript
- Collaborate with UX designers to implement pixel-perfect interfaces from Figma designs
- Write unit and integration tests using Jest and React Testing Library to ensure component reliability
- Optimize application performance through code splitting, lazy loading, and bundle analysis
- Participate in code reviews, maintain coding standards, and contribute to frontend architecture decisions
- Work closely with backend engineers to design and consume REST and GraphQL APIs

Requirements:
- 3+ years of professional frontend development experience
- Expert proficiency in React including hooks, context, and state management with Redux or Zustand
- Strong TypeScript skills with experience in type-safe component design
- Experience with CSS-in-JS solutions or Tailwind CSS for styling
- Solid understanding of browser performance, accessibility standards, and cross-browser compatibility
- Familiarity with CI/CD pipelines and Git-based workflows

Preferred Qualifications:
- Experience with Next.js for server-side rendering and static site generation
- Familiarity with GraphQL and Apollo Client
- Experience with Storybook for component documentation
- Knowledge of web analytics integration such as Segment or Mixpanel',
'React, TypeScript, JavaScript, CSS, REST APIs, Git, Jest',
'Next.js, GraphQL, Tailwind CSS, Redux, Storybook, Figma',
3, 7, 'Bachelors', 120000, 165000
);

INSERT INTO JOB_DESCRIPTIONS (
    JOB_TITLE, JOB_FAMILY, ROLE, SENIORITY_LEVEL, LOCATION,
    JOB_DESCRIPTION, SKILLS_REQUIRED, NICE_TO_HAVE_SKILLS,
    EXPERIENCE_MIN, EXPERIENCE_MAX, QUALIFICATION_LEVEL,
    SALARY_MIN, SALARY_MAX
) VALUES (
'Backend Developer',
'Software Engineering',
'Backend API & Services Developer',
'Mid',
'Chicago, IL (Hybrid)',
'We are hiring a Backend Developer to design and build the APIs, microservices, and data systems that power our platform. You will work on systems that process millions of transactions daily.

Responsibilities:
- Design and implement scalable RESTful and GraphQL APIs using Python and FastAPI or Node.js
- Build and maintain microservices deployed on AWS using containerized architectures with Docker and Kubernetes
- Design relational and NoSQL database schemas and optimize query performance
- Implement authentication, authorization, and security best practices across all services
- Write comprehensive unit and integration tests and participate in on-call rotations
- Collaborate with frontend engineers and data teams to define API contracts and data models

Requirements:
- 3+ years of backend development experience in Python, Node.js, or Java
- Strong understanding of REST API design principles and microservices architecture
- Experience with relational databases such as PostgreSQL or MySQL and query optimization
- Hands-on experience with Docker and Kubernetes for containerized deployments
- Proficiency with AWS services including Lambda, RDS, S3, and API Gateway
- Experience with message queuing systems such as RabbitMQ or Kafka

Preferred Qualifications:
- Experience with GraphQL API design and implementation
- Familiarity with Terraform for infrastructure as code
- Knowledge of gRPC for inter-service communication
- Experience with Redis for caching and session management',
'Python or Node.js, REST APIs, PostgreSQL, Docker, Kubernetes, AWS, Microservices',
'GraphQL, Kafka, Redis, Terraform, gRPC, FastAPI',
3, 8, 'Bachelors', 125000, 170000
);

INSERT INTO JOB_DESCRIPTIONS (
    JOB_TITLE, JOB_FAMILY, ROLE, SENIORITY_LEVEL, LOCATION,
    JOB_DESCRIPTION, SKILLS_REQUIRED, NICE_TO_HAVE_SKILLS,
    EXPERIENCE_MIN, EXPERIENCE_MAX, QUALIFICATION_LEVEL,
    SALARY_MIN, SALARY_MAX
) VALUES (
'Full Stack Developer',
'Software Engineering',
'Full Stack Web Application Developer',
'Mid',
'Boston, MA (Hybrid)',
'We are seeking a Full Stack Developer who can own features end-to-end — from database schema through API layer to polished UI — on our rapidly growing B2B SaaS platform.

Responsibilities:
- Build full-stack features using React on the frontend and Node.js or Python on the backend
- Design database schemas in PostgreSQL and write optimized queries for analytical and transactional workloads
- Deploy and monitor applications on AWS using CI/CD pipelines with GitHub Actions
- Collaborate with product managers to scope, estimate, and deliver features on schedule
- Participate in architecture discussions and contribute to technical roadmap decisions
- Write clean, well-tested, and well-documented code across the entire application stack

Requirements:
- 3+ years of full-stack development experience
- Strong proficiency in React and at least one backend language such as Node.js or Python
- Experience with relational databases and ORM frameworks
- Hands-on experience with AWS or GCP for deployment and cloud infrastructure
- Solid Git workflow experience including branching, pull requests, and code review
- Ability to own and deliver features independently from design through deployment

Preferred Qualifications:
- Experience with TypeScript across the full stack
- Familiarity with GraphQL for flexible API design
- Knowledge of containerization with Docker and Kubernetes
- Experience with real-time features using WebSockets or Server-Sent Events',
'React, Node.js or Python, PostgreSQL, AWS, REST APIs, Git, CI/CD',
'TypeScript, GraphQL, Docker, Kubernetes, WebSockets, GitHub Actions',
3, 8, 'Bachelors', 115000, 160000
);

INSERT INTO JOB_DESCRIPTIONS (
    JOB_TITLE, JOB_FAMILY, ROLE, SENIORITY_LEVEL, LOCATION,
    JOB_DESCRIPTION, SKILLS_REQUIRED, NICE_TO_HAVE_SKILLS,
    EXPERIENCE_MIN, EXPERIENCE_MAX, QUALIFICATION_LEVEL,
    SALARY_MIN, SALARY_MAX
) VALUES (
'DevOps Engineer',
'Software Engineering',
'DevOps & Cloud Infrastructure Engineer',
'Senior',
'Denver, CO (Remote)',
'We are looking for a DevOps Engineer to own our cloud infrastructure, CI/CD platform, and reliability engineering practices as we scale to support enterprise customers.

Responsibilities:
- Design and maintain cloud infrastructure on AWS using Terraform and infrastructure as code best practices
- Build and optimize CI/CD pipelines using GitHub Actions, Jenkins, or CircleCI to enable fast, reliable deployments
- Manage containerized workloads using Kubernetes and Helm charts across development, staging, and production environments
- Implement observability solutions including centralized logging, distributed tracing, and alerting using Datadog or Prometheus
- Lead incident response, post-mortems, and reliability improvements to achieve and maintain SLA targets
- Collaborate with development teams to embed security and reliability practices into the software development lifecycle

Requirements:
- 5+ years of experience in DevOps, platform engineering, or site reliability engineering
- Expert proficiency with AWS services including EKS, RDS, S3, CloudFront, and IAM
- Strong Terraform skills for infrastructure provisioning and state management
- Deep Kubernetes experience including cluster management, networking, and security policies
- Experience building and maintaining CI/CD pipelines at scale
- Strong scripting skills in Python or Bash for automation

Preferred Qualifications:
- AWS certifications such as Solutions Architect or DevOps Engineer
- Experience with service mesh technologies such as Istio or Linkerd
- Familiarity with GitOps workflows using ArgoCD or Flux
- Experience with database DevOps including schema migration automation',
'AWS, Terraform, Kubernetes, CI/CD, Docker, Python or Bash, Monitoring',
'ArgoCD, Istio, Helm, Datadog, Prometheus, AWS Certifications',
5, 12, 'Bachelors', 140000, 190000
);

-- ============================================================
-- FAMILY 3: HR & RECRUITING (4 roles)
-- ============================================================

INSERT INTO JOB_DESCRIPTIONS (
    JOB_TITLE, JOB_FAMILY, ROLE, SENIORITY_LEVEL, LOCATION,
    JOB_DESCRIPTION, SKILLS_REQUIRED, NICE_TO_HAVE_SKILLS,
    EXPERIENCE_MIN, EXPERIENCE_MAX, QUALIFICATION_LEVEL,
    SALARY_MIN, SALARY_MAX
) VALUES (
'HR Manager',
'HR & Recruiting',
'Human Resources Manager — People Operations',
'Senior',
'Atlanta, GA (Hybrid)',
'We are seeking an experienced HR Manager to lead people operations for a 300-person organization, partnering with senior leadership to build a high-performance, inclusive culture.

Responsibilities:
- Serve as the primary HR business partner for three business units, advising managers on performance, compensation, and employee relations matters
- Lead the full employee lifecycle including onboarding, performance management, promotion cycles, and offboarding
- Design and implement HR programs including manager training, DEI initiatives, and engagement surveys
- Manage HR compliance across federal and state employment law requirements and maintain up-to-date policy documentation
- Partner with Talent Acquisition on workforce planning and headcount forecasting
- Analyze people data and present HR metrics dashboards to the executive leadership team quarterly

Requirements:
- 6+ years of progressive HR experience with at least 2 years in a manager or business partner role
- Deep knowledge of US employment law, FMLA, ADA, and EEO compliance
- Experience with HRIS platforms such as Workday, BambooHR, or ADP
- Proven ability to manage sensitive employee relations matters with discretion and professionalism
- Strong analytical skills for interpreting people data and presenting to senior leadership
- SHRM-CP or PHR certification strongly preferred

Preferred Qualifications:
- Experience supporting a high-growth technology company through scaling phases
- Background in compensation benchmarking and total rewards design
- Familiarity with people analytics tools or HR data dashboards
- Experience with organizational design and workforce restructuring',
'HR Business Partnering, Employment Law, HRIS (Workday or BambooHR), Employee Relations, People Analytics, SHRM-CP or PHR',
'Compensation Benchmarking, Organizational Design, DEI Program Design, HR Data Dashboards',
6, 12, 'Bachelors', 95000, 135000
);

INSERT INTO JOB_DESCRIPTIONS (
    JOB_TITLE, JOB_FAMILY, ROLE, SENIORITY_LEVEL, LOCATION,
    JOB_DESCRIPTION, SKILLS_REQUIRED, NICE_TO_HAVE_SKILLS,
    EXPERIENCE_MIN, EXPERIENCE_MAX, QUALIFICATION_LEVEL,
    SALARY_MIN, SALARY_MAX
) VALUES (
'Talent Acquisition Specialist',
'HR & Recruiting',
'Technical Talent Acquisition & Sourcing Specialist',
'Mid',
'Austin, TX (Hybrid)',
'We are hiring a Talent Acquisition Specialist to own full-cycle recruiting for technical and business roles, helping us scale our team from 150 to 300 employees over the next 18 months.

Responsibilities:
- Manage full-cycle recruiting for 10-15 open roles simultaneously across engineering, data, and business functions
- Build and maintain proactive talent pipelines using LinkedIn Recruiter, Boolean search, and community sourcing
- Partner with hiring managers to define role requirements, craft compelling job descriptions, and design structured interview processes
- Coordinate and facilitate debrief sessions, ensuring hiring decisions are grounded in structured, bias-free evaluation
- Track and report recruiting metrics including time-to-fill, source quality, offer acceptance rate, and pipeline diversity
- Manage and optimize the ATS (Greenhouse or Lever) to ensure data integrity and process compliance

Requirements:
- 3+ years of full-cycle recruiting experience, preferably in a technology or high-growth environment
- Proven sourcing skills using LinkedIn Recruiter, GitHub, and Boolean search techniques
- Experience managing ATS platforms such as Greenhouse, Lever, or Workday Recruiting
- Strong data literacy — comfortable tracking recruiting metrics and presenting pipeline reports
- Excellent communication and relationship-building skills with both candidates and hiring managers
- Knowledge of fair hiring practices and structured interviewing techniques

Preferred Qualifications:
- Experience recruiting for data engineering, analytics, or software engineering roles
- Familiarity with employer branding and candidate experience programs
- Background in diversity sourcing strategies and inclusive hiring practices
- Experience with recruiting analytics tools or dashboards',
'Full-Cycle Recruiting, LinkedIn Recruiter, ATS (Greenhouse or Lever), Sourcing, Recruiting Metrics, Structured Interviewing',
'Diversity Sourcing, Employer Branding, GitHub Sourcing, Recruiting Analytics',
3, 7, 'Bachelors', 70000, 100000
);

INSERT INTO JOB_DESCRIPTIONS (
    JOB_TITLE, JOB_FAMILY, ROLE, SENIORITY_LEVEL, LOCATION,
    JOB_DESCRIPTION, SKILLS_REQUIRED, NICE_TO_HAVE_SKILLS,
    EXPERIENCE_MIN, EXPERIENCE_MAX, QUALIFICATION_LEVEL,
    SALARY_MIN, SALARY_MAX
) VALUES (
'HR Data Analyst',
'HR & Recruiting',
'People Analytics & HR Data Analyst',
'Mid',
'Remote (US)',
'We are looking for an HR Data Analyst to build the people analytics function from the ground up, turning raw HR data into insights that drive hiring, retention, and workforce planning decisions.

Responsibilities:
- Design and maintain people analytics dashboards covering headcount, attrition, time-to-hire, engagement, and compensation equity
- Write SQL queries against HR data in Snowflake to answer ad hoc people questions from HR leadership and the C-suite
- Conduct statistical analyses to identify drivers of attrition, engagement, and performance across employee segments
- Build and automate recurring HR reports replacing manual Excel processes currently consuming 10+ hours per week
- Partner with HR Business Partners to define metrics, interpret data, and translate findings into actionable recommendations
- Ensure compliance with data privacy regulations when handling sensitive employee data

Requirements:
- 2+ years of experience in HR analytics, people analytics, or a data analyst role with HR data exposure
- Strong SQL skills for querying and transforming data from HRIS systems
- Proficiency in Tableau, Power BI, or a comparable BI tool for dashboard development
- Working knowledge of statistics including regression, correlation, and significance testing
- Experience working with HRIS platforms such as Workday or BambooHR
- High degree of discretion and professionalism when handling confidential employee data

Preferred Qualifications:
- Experience with Python or R for advanced statistical modeling
- Familiarity with organizational network analysis or survey analytics
- Background in compensation equity analysis
- Experience with Snowflake or a cloud data warehouse for HR data',
'SQL, Tableau or Power BI, HR Analytics, Statistics, HRIS (Workday), Data Privacy',
'Python or R, Snowflake, Compensation Equity Analysis, Survey Analytics, Organizational Network Analysis',
2, 6, 'Bachelors', 80000, 115000
);

INSERT INTO JOB_DESCRIPTIONS (
    JOB_TITLE, JOB_FAMILY, ROLE, SENIORITY_LEVEL, LOCATION,
    JOB_DESCRIPTION, SKILLS_REQUIRED, NICE_TO_HAVE_SKILLS,
    EXPERIENCE_MIN, EXPERIENCE_MAX, QUALIFICATION_LEVEL,
    SALARY_MIN, SALARY_MAX
) VALUES (
'Compensation & Benefits Analyst',
'HR & Recruiting',
'Total Rewards & Compensation Analyst',
'Mid',
'Dallas, TX (Hybrid)',
'We are seeking a Compensation and Benefits Analyst to support the design, administration, and analysis of our total rewards programs for a workforce of 1,200 employees across 15 US states.

Responsibilities:
- Conduct market pricing analyses using compensation survey data from Radford, Mercer, or Willis Towers Watson to ensure competitive pay positioning
- Maintain and update the job architecture including job levels, salary bands, and grade structures
- Administer annual compensation cycles including merit increases, bonus payouts, and equity refresh grants
- Analyze benefits utilization data and cost trends to support benefits plan renewal and design decisions
- Ensure compensation programs comply with FLSA, pay equity regulations, and state-specific requirements
- Build compensation models and scenario analyses in Excel and present recommendations to HR leadership

Requirements:
- 3+ years of experience in compensation analysis, total rewards, or HR finance
- Proficiency in Excel for financial modeling including pivot tables, VLOOKUP, and advanced formulas
- Experience with compensation survey participation and market pricing methodology
- Working knowledge of FLSA classification, pay equity analysis, and compensation compliance
- Strong analytical and problem-solving skills with attention to detail
- Experience with HRIS platforms for compensation administration such as Workday or SAP SuccessFactors

Preferred Qualifications:
- Certified Compensation Professional (CCP) designation
- Experience with equity compensation administration including RSUs and stock options
- Familiarity with pay transparency laws and multi-state compliance
- Background in data visualization for compensation reporting',
'Compensation Analysis, Market Pricing, Excel (Advanced), HRIS (Workday), Pay Equity, FLSA Compliance',
'CCP Certification, Equity Compensation, Pay Transparency, Radford or Mercer Surveys, Data Visualization',
3, 7, 'Bachelors', 75000, 110000
);

-- ============================================================
-- FAMILY 4: FINANCE & BUSINESS (4 roles)
-- ============================================================

INSERT INTO JOB_DESCRIPTIONS (
    JOB_TITLE, JOB_FAMILY, ROLE, SENIORITY_LEVEL, LOCATION,
    JOB_DESCRIPTION, SKILLS_REQUIRED, NICE_TO_HAVE_SKILLS,
    EXPERIENCE_MIN, EXPERIENCE_MAX, QUALIFICATION_LEVEL,
    SALARY_MIN, SALARY_MAX
) VALUES (
'Financial Analyst',
'Finance & Business',
'Corporate Financial Planning & Analysis Analyst',
'Mid',
'New York, NY (Hybrid)',
'We are hiring a Financial Analyst to support our Corporate FP&A function, helping build the financial models, forecasts, and analyses that inform executive decision-making at a $2B revenue company.

Responsibilities:
- Build and maintain three-statement financial models, rolling forecasts, and scenario analyses in Excel
- Prepare monthly variance analysis comparing actuals to budget and prior year, with narrative commentary for senior leadership
- Support the annual budgeting process by coordinating inputs from 12 business units and consolidating into a company-wide plan
- Develop financial dashboards in Tableau or Power BI for CFO and executive team review
- Conduct ad hoc financial analyses including ROI models, business case development, and M&A support
- Partner with Accounting to ensure alignment between management reporting and GAAP financials

Requirements:
- 2+ years of financial analysis experience in corporate finance, investment banking, or management consulting
- Expert Excel skills including financial modeling, pivot tables, INDEX/MATCH, and sensitivity analysis
- Experience with financial planning tools such as Anaplan, Adaptive Insights, or Hyperion
- Strong understanding of financial statements and accounting principles
- Proficiency in SQL for extracting and validating financial data
- Excellent written and verbal communication skills for presenting to senior leadership

Preferred Qualifications:
- CFA Level 1 or progress toward CFA designation
- Experience with Tableau or Power BI for financial reporting
- Background in SaaS metrics including ARR, churn, LTV, and CAC
- Investment banking or Big 4 accounting firm experience',
'Excel (Financial Modeling), SQL, Financial Statements, FP&A, Variance Analysis, PowerPoint',
'Tableau or Power BI, Anaplan, CFA, SaaS Metrics, M&A Analysis',
2, 6, 'Bachelors', 85000, 125000
);

INSERT INTO JOB_DESCRIPTIONS (
    JOB_TITLE, JOB_FAMILY, ROLE, SENIORITY_LEVEL, LOCATION,
    JOB_DESCRIPTION, SKILLS_REQUIRED, NICE_TO_HAVE_SKILLS,
    EXPERIENCE_MIN, EXPERIENCE_MAX, QUALIFICATION_LEVEL,
    SALARY_MIN, SALARY_MAX
) VALUES (
'FP&A Analyst',
'Finance & Business',
'Financial Planning & Analysis Specialist',
'Mid',
'Chicago, IL (Hybrid)',
'We are seeking an FP&A Analyst to be a key contributor to our financial planning function, owning the forecasting and reporting processes for two business segments with combined revenue of $400M.

Responsibilities:
- Own the monthly financial close reporting package including P&L variance analysis, KPI tracking, and executive commentary
- Maintain and enhance the long-range financial plan and annual operating budget models
- Build driver-based forecasting models that tie operational metrics to financial outcomes
- Create and automate recurring financial reports using Python and SQL, reducing manual effort across the team
- Support strategic initiatives including pricing analysis, capacity planning, and new market entry models
- Present financial results and forward-looking guidance to finance leadership and business unit partners

Requirements:
- 3+ years of FP&A experience in a corporate or divisional finance function
- Advanced Excel and financial modeling skills with experience building driver-based forecast models
- SQL proficiency for querying financial databases and automating data pulls
- Experience with enterprise FP&A platforms such as Anaplan, Adaptive Insights, or Workday Adaptive
- Strong business partnering skills with the ability to translate financial data into business narratives
- High attention to detail and ability to manage multiple deliverables against tight deadlines

Preferred Qualifications:
- Python skills for financial automation and reporting
- Experience with Tableau or Power BI for financial visualization
- Background in SaaS, retail, or manufacturing FP&A
- MBA or CPA in progress or completed',
'FP&A, Excel (Advanced Modeling), SQL, Anaplan or Adaptive Insights, Variance Analysis, Business Partnering',
'Python, Tableau, MBA or CPA, Driver-Based Forecasting, SaaS Metrics',
3, 8, 'Bachelors', 90000, 130000
);

INSERT INTO JOB_DESCRIPTIONS (
    JOB_TITLE, JOB_FAMILY, ROLE, SENIORITY_LEVEL, LOCATION,
    JOB_DESCRIPTION, SKILLS_REQUIRED, NICE_TO_HAVE_SKILLS,
    EXPERIENCE_MIN, EXPERIENCE_MAX, QUALIFICATION_LEVEL,
    SALARY_MIN, SALARY_MAX
) VALUES (
'Business Analyst',
'Finance & Business',
'Business Systems & Process Analyst',
'Mid',
'Minneapolis, MN (Hybrid)',
'We are looking for a Business Analyst to bridge the gap between business stakeholders and technical teams, translating complex business needs into clear requirements and data-driven recommendations.

Responsibilities:
- Elicit, document, and validate business requirements from stakeholders across Operations, Finance, and Sales
- Conduct current-state process analysis and develop future-state recommendations with measurable ROI
- Write user stories, acceptance criteria, and process flow diagrams to guide development teams
- Perform data analysis using SQL and Excel to validate solutions, identify gaps, and measure process improvements
- Lead UAT coordination including test planning, defect tracking, and stakeholder sign-off
- Maintain project documentation including BRDs, FRDs, and process maps using Confluence and JIRA

Requirements:
- 3+ years of business analysis experience in a technology, financial services, or operations environment
- Strong requirements elicitation and documentation skills including user stories, use cases, and process maps
- Proficiency in SQL for data querying and validation
- Experience with project management and documentation tools such as JIRA, Confluence, and Visio
- Strong analytical and critical thinking skills with a structured approach to problem solving
- Excellent communication and facilitation skills for leading cross-functional workshops

Preferred Qualifications:
- CBAP or PMI-PBA certification
- Experience with Agile and Scrum frameworks
- Background in ERP or CRM system implementations such as Salesforce or SAP
- Familiarity with data visualization tools for presenting analytical findings',
'Business Requirements, SQL, Process Mapping, JIRA and Confluence, User Stories, Stakeholder Management',
'CBAP Certification, Agile/Scrum, Salesforce or SAP, Data Visualization, Visio',
3, 7, 'Bachelors', 80000, 115000
);

INSERT INTO JOB_DESCRIPTIONS (
    JOB_TITLE, JOB_FAMILY, ROLE, SENIORITY_LEVEL, LOCATION,
    JOB_DESCRIPTION, SKILLS_REQUIRED, NICE_TO_HAVE_SKILLS,
    EXPERIENCE_MIN, EXPERIENCE_MAX, QUALIFICATION_LEVEL,
    SALARY_MIN, SALARY_MAX
) VALUES (
'Risk & Compliance Analyst',
'Finance & Business',
'Enterprise Risk & Regulatory Compliance Analyst',
'Senior',
'Washington, DC (Hybrid)',
'We are hiring a Risk and Compliance Analyst to support enterprise risk management and regulatory compliance programs at a federally regulated financial institution.

Responsibilities:
- Maintain and update the enterprise risk register, coordinating with business units to assess and document operational, financial, and compliance risks
- Monitor regulatory developments including SEC, FINRA, and OCC guidance and assess impact on internal policies and procedures
- Conduct compliance testing and controls assessment across key business processes, documenting findings and remediation plans
- Support internal and external audit processes by preparing documentation, evidence packages, and management responses
- Develop and deliver compliance training programs for business unit employees and new hires
- Produce quarterly risk reporting for the Board Risk Committee and executive leadership

Requirements:
- 5+ years of experience in risk management, compliance, or internal audit at a regulated financial institution
- Deep knowledge of financial services regulatory frameworks including SOX, BSA/AML, and SEC regulations
- Strong analytical skills for risk assessment, controls testing, and data analysis
- Experience with GRC platforms such as RSA Archer, ServiceNow GRC, or MetricStream
- Excellent written communication skills for regulatory documentation and board-level reporting
- CRCM, CAMS, CIA, or comparable professional certification

Preferred Qualifications:
- JD or advanced degree in Finance, Law, or Risk Management
- Experience with model risk management or quantitative risk assessment
- Familiarity with data analytics tools for compliance monitoring and surveillance
- Background in cybersecurity risk or third-party risk management',
'Risk Management, Regulatory Compliance, SOX, BSA/AML, GRC Platforms, Audit, Financial Services',
'CRCM or CAMS Certification, Model Risk, Cybersecurity Risk, Third-Party Risk, Data Analytics',
5, 12, 'Bachelors', 100000, 145000
);

-- ============================================================
-- FAMILY 5: MARKETING & PRODUCT (4 roles)
-- ============================================================

INSERT INTO JOB_DESCRIPTIONS (
    JOB_TITLE, JOB_FAMILY, ROLE, SENIORITY_LEVEL, LOCATION,
    JOB_DESCRIPTION, SKILLS_REQUIRED, NICE_TO_HAVE_SKILLS,
    EXPERIENCE_MIN, EXPERIENCE_MAX, QUALIFICATION_LEVEL,
    SALARY_MIN, SALARY_MAX
) VALUES (
'Product Manager',
'Marketing & Product',
'Senior Product Manager — Platform',
'Senior',
'San Francisco, CA (Hybrid)',
'We are looking for a Product Manager to lead the product strategy and roadmap for our core platform, working at the intersection of engineering, design, and business to ship products that users love.

Responsibilities:
- Own the end-to-end product lifecycle for the platform squad — from discovery and definition through delivery and iteration
- Conduct user research, competitive analysis, and data analysis to identify the highest-impact opportunities
- Write clear, detailed product requirements and user stories that enable engineering teams to build with confidence
- Define and track product KPIs, running A/B experiments and analyzing results to drive data-informed decisions
- Collaborate with Design, Engineering, Sales, and Customer Success to align on priorities and ship on schedule
- Present product strategy, roadmap, and results to executive leadership and key customers

Requirements:
- 5+ years of product management experience at a technology company
- Proven track record of shipping successful B2B SaaS products from 0 to 1 and at scale
- Strong data analysis skills — comfortable writing SQL queries and analyzing product metrics
- Experience running A/B tests and making decisions based on statistical results
- Excellent written communication skills for PRDs, roadmaps, and executive presentations
- Deep empathy for users with experience conducting qualitative and quantitative research

Preferred Qualifications:
- Experience with developer-facing or platform products
- Background in data products, analytics tooling, or API-first platforms
- MBA from a top program
- Familiarity with AI/ML product integration and use case development',
'Product Management, SQL, A/B Testing, User Research, Roadmapping, Agile, B2B SaaS',
'AI/ML Product Experience, Developer Products, MBA, Platform Strategy, Mixpanel or Amplitude',
5, 12, 'Bachelors', 150000, 210000
);

INSERT INTO JOB_DESCRIPTIONS (
    JOB_TITLE, JOB_FAMILY, ROLE, SENIORITY_LEVEL, LOCATION,
    JOB_DESCRIPTION, SKILLS_REQUIRED, NICE_TO_HAVE_SKILLS,
    EXPERIENCE_MIN, EXPERIENCE_MAX, QUALIFICATION_LEVEL,
    SALARY_MIN, SALARY_MAX
) VALUES (
'Marketing Analyst',
'Marketing & Product',
'Digital Marketing & Performance Analytics Analyst',
'Mid',
'Remote (US)',
'We are seeking a Marketing Analyst to measure and optimize marketing performance across all digital channels, helping our team allocate a $10M annual marketing budget with precision and confidence.

Responsibilities:
- Build and maintain marketing performance dashboards in Tableau or Looker covering paid search, social, email, SEO, and content channels
- Analyze campaign performance data to identify trends, optimize spend allocation, and improve ROAS across channels
- Own marketing attribution modeling — evaluate first-touch, last-touch, and multi-touch attribution approaches
- Conduct cohort analyses, funnel analyses, and customer lifetime value calculations to inform acquisition strategy
- Partner with the Demand Generation team to design and analyze A/B tests on landing pages, email campaigns, and ad creative
- Present weekly and monthly performance reports to the VP of Marketing with clear recommendations

Requirements:
- 2+ years of experience in marketing analytics, digital analytics, or a data analyst role with marketing focus
- Proficiency in SQL for pulling and transforming marketing data from warehouse sources
- Experience with Tableau, Looker, or Power BI for marketing dashboard development
- Working knowledge of digital marketing platforms including Google Ads, Meta Ads, and email platforms
- Understanding of marketing attribution models and their tradeoffs
- Strong communication skills for translating data into marketing strategy recommendations

Preferred Qualifications:
- Experience with Python for marketing data automation or modeling
- Familiarity with Segment, Rudderstack, or CDP platforms for customer data
- Google Analytics 4 certification
- Background in SaaS or e-commerce marketing analytics',
'SQL, Tableau or Looker, Google Ads, Meta Ads, Marketing Attribution, A/B Testing, Digital Analytics',
'Python, Segment or CDP, GA4 Certification, SaaS Marketing, Customer Lifetime Value Modeling',
2, 6, 'Bachelors', 75000, 110000
);

INSERT INTO JOB_DESCRIPTIONS (
    JOB_TITLE, JOB_FAMILY, ROLE, SENIORITY_LEVEL, LOCATION,
    JOB_DESCRIPTION, SKILLS_REQUIRED, NICE_TO_HAVE_SKILLS,
    EXPERIENCE_MIN, EXPERIENCE_MAX, QUALIFICATION_LEVEL,
    SALARY_MIN, SALARY_MAX
) VALUES (
'Growth Marketing Manager',
'Marketing & Product',
'Growth Marketing & Demand Generation Manager',
'Senior',
'New York, NY (Hybrid)',
'We are hiring a Growth Marketing Manager to own our demand generation engine and drive measurable pipeline growth across inbound and outbound channels for our B2B SaaS company.

Responsibilities:
- Develop and execute integrated demand generation programs across SEO, paid media, email, content, and events to generate qualified pipeline
- Own the marketing technology stack including HubSpot, Google Ads, LinkedIn Campaign Manager, and attribution tools
- Build and optimize lead scoring models, nurture sequences, and MQL-to-SQL conversion programs in partnership with Sales
- Design and run growth experiments across channels, using rigorous A/B testing to identify scalable tactics
- Report weekly on pipeline contribution, CAC, ROAS, and channel efficiency to the VP of Marketing and CMO
- Manage relationships with agencies and contractors for SEO, paid media, and content production

Requirements:
- 5+ years of growth marketing or demand generation experience in B2B SaaS
- Deep expertise in HubSpot or Marketo for marketing automation and lead management
- Hands-on experience managing paid search and paid social campaigns with proven ROAS improvement track record
- Strong analytical skills with SQL proficiency and experience with marketing attribution platforms
- Experience designing and analyzing A/B and multivariate tests at scale
- Proven ability to collaborate with Sales on pipeline strategy and lead quality improvement

Preferred Qualifications:
- Experience with account-based marketing (ABM) platforms such as Demandbase or 6sense
- Background in product-led growth (PLG) motion and freemium conversion optimization
- Google Ads and HubSpot certifications
- Experience scaling demand generation from $0 to $10M+ in pipeline contribution',
'Demand Generation, HubSpot or Marketo, Paid Search, Paid Social, SQL, A/B Testing, Pipeline Reporting',
'ABM (Demandbase or 6sense), PLG, Google Ads Certification, HubSpot Certification, SEO',
5, 12, 'Bachelors', 120000, 165000
);

INSERT INTO JOB_DESCRIPTIONS (
    JOB_TITLE, JOB_FAMILY, ROLE, SENIORITY_LEVEL, LOCATION,
    JOB_DESCRIPTION, SKILLS_REQUIRED, NICE_TO_HAVE_SKILLS,
    EXPERIENCE_MIN, EXPERIENCE_MAX, QUALIFICATION_LEVEL,
    SALARY_MIN, SALARY_MAX
) VALUES (
'Product Marketing Manager',
'Marketing & Product',
'Product Marketing Manager — B2B SaaS',
'Senior',
'Austin, TX (Hybrid)',
'We are seeking a Product Marketing Manager to own the go-to-market strategy for our core product line, crafting messaging that resonates with enterprise buyers and enabling our Sales team to win competitive deals.

Responsibilities:
- Develop and maintain product positioning, messaging frameworks, and value propositions for three product lines targeting enterprise and mid-market buyers
- Lead go-to-market planning and execution for new product launches, coordinating across Product, Sales, and Customer Success
- Conduct competitive intelligence research and maintain battle cards, objection handling guides, and win/loss analysis
- Create and deliver sales enablement content including pitch decks, one-pagers, demo scripts, and ROI calculators
- Partner with Demand Generation on campaign messaging and content strategy to drive pipeline
- Gather and synthesize customer and market insights through interviews, win/loss analysis, and analyst relations

Requirements:
- 5+ years of product marketing experience in B2B SaaS with a track record of successful product launches
- Exceptional written communication and storytelling skills for translating technical capabilities into business value
- Experience conducting competitive analysis and building sales enablement programs
- Strong cross-functional collaboration skills working with Product, Sales, and Marketing leadership
- Data-driven approach to measuring marketing program effectiveness and iterating on messaging
- Experience with enterprise sales cycles and complex buying committees

Preferred Qualifications:
- Background in data, analytics, or developer tools product marketing
- Experience with analyst relations including Gartner and Forrester briefings
- Familiarity with sales tools such as Salesforce, Highspot, or Seismic
- MBA from a top program',
'Product Marketing, Go-to-Market Strategy, Competitive Intelligence, Sales Enablement, Messaging, B2B SaaS, Storytelling',
'Data Product Marketing, Analyst Relations, Salesforce, Highspot, MBA',
5, 12, 'Bachelors', 130000, 175000
);

--> Verify the Table data after the insertions
SELECT
    JOB_ID,
    JOB_TITLE,
    JOB_FAMILY,
    SENIORITY_LEVEL,
    LOCATION,
    SALARY_MIN,
    SALARY_MAX,
    STATUS
FROM JOB_DESCRIPTIONS
ORDER BY JOB_FAMILY, JOB_ID;