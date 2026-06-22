# 🧠 Intelligent Resume Screener & Candidate Ranking Engine
> An end-to-end AI-powered recruiting platform built entirely inside Snowflake
> using Cortex LLM functions, Snowflake SQL, and Streamlit in Snowflake.
> No external APIs. No RAG. No custom model training.

---

## 📌 Project Overview

This project automates the resume screening and candidate ranking process
using Snowflake Cortex AI. It has two sides:

- 👥 **Recruiter Dashboard** — automatically screens and ranks candidates
  against any open role using AI-generated fit scores, strengths analysis,
  and gap identification
- 📄 **Resume Fit Checker** — candidates paste their resume and receive
  an instant AI score against any of 20 open roles with specific,
  actionable feedback

Everything runs natively inside Snowflake. The entire pipeline — from raw
resume text to ranked candidate output — is built in SQL and Python
without leaving the Snowflake environment.

---

## 🖥️ Dashboard Preview

**Tab 1 — Recruiter Dashboard**
![Recruiter Dashboard](screenshots/tab1.png)

**Tab 2 — Resume Fit Checker**
![Resume Fit Checker](screenshots/tab2.png)

---

## 🏗️ Architecture
---
```text
JOB_DESCRIPTIONS                 RAW_RESUMES
(20 jobs, 5 families)           (30 candidates, 6 roles)
         │                              │
         └──────────────┬───────────────┘
                        │
                        ▼

V_RESUME_EXTRACTED
AI_EXTRACT
(skills, degree, experience, certifications,
most recent title, key responsibilities)

                        │
                        ▼

V_RESUME_SENIORITY
AI_COMPLETE (llama3.1-8b)
(Junior / Mid-Level / Senior)

                        │
                        ▼

V_RESUME_SCORED
AI_COMPLETE (llama3.1-70b)
(fit score, recommendation,
strengths, gaps)

                        │
                        ▼

V_FINAL_RANKING
RANK() Window Function
(unified ranking per job title)

                        │
                        ▼

Streamlit in Snowflake
├── Recruiter Dashboard
└── Resume Fit Checker
```

## 🤖 Snowflake Cortex Functions Used

| Function | Model | Purpose |
|---|---|---|
| `AI_EXTRACT` | Managed | Extracts structured profile data from unstructured resume text |
| `AI_COMPLETE` | llama3.1-8b | Classifies candidate seniority — cheap model for simple task |
| `AI_COMPLETE` | llama3.1-70b | Scores resume fit vs job description — capable model for reasoning |

---

## 📁 Project Files

| File | Purpose |
|---|---|
| `Resume_Screener_Setup.sql` | Creates warehouse, database, and schema |
| `Job_Descriptions.sql` | Creates JOB_DESCRIPTIONS table with 20 US market job postings |
| `Raw_Resumes_Table.sql` | Creates RAW_RESUMES table with 30 handcrafted candidate resumes |
| `Main.sql` | Creates all 4 Cortex AI enrichment views and final ranking view |
| `streamlit_app.py` | Full two-tab Streamlit in Snowflake dashboard |

---

## 📦 Snowflake Objects

| Object | Type | Purpose |
|---|---|---|
| `RESUME_SCREENER_WH` | Warehouse | X-Small compute, auto-suspend 60s |
| `RESUME_SCREENER_DB` | Database | Top-level container |
| `RECRUITING` | Schema | All project objects live here |
| `JOB_DESCRIPTIONS` | Table | 20 open roles across 5 job families |
| `RAW_RESUMES` | Table | 30 candidates across 6 roles with rich resume text |
| `V_RESUME_EXTRACTED` | View | AI_EXTRACT — structured profile parsing |
| `V_RESUME_SENIORITY` | View | AI_COMPLETE — seniority classification |
| `V_RESUME_SCORED` | View | AI_COMPLETE — fit scoring vs job description |
| `V_FINAL_RANKING` | View | Unified ranked output with window functions |

---

## 🗂️ Job Families Covered

| Family | Roles |
|---|---|
| Data & Analytics | Data Analyst, Senior BI Analyst, Data Engineer, Analytics Engineer |
| Software Engineering | Frontend Developer, Backend Developer, Full Stack Developer, DevOps Engineer |
| HR & Recruiting | HR Manager, Talent Acquisition Specialist, HR Data Analyst, Compensation & Benefits Analyst |
| Finance & Business | Financial Analyst, FP&A Analyst, Business Analyst, Risk & Compliance Analyst |
| Marketing & Product | Product Manager, Marketing Analyst, Growth Marketing Manager, Product Marketing Manager |

---

## 🖥️ Dashboard Features

**Tab 1 — Recruiter Dashboard**
- Job selector dropdown with full JD metadata — salary, location,
  experience range, required skills, nice-to-have skills
- Summary metrics bar — total candidates, recommendation breakdown,
  average fit score, all color coded
- Ranked candidate cards with color-coded left border by recommendation
- Per card — score circle, recommendation badge, progress bar,
  seniority, experience, education, email, top skills, certifications,
  AI-generated strengths and gaps

**Tab 2 — Resume Fit Checker**
- Select any of 20 open roles from the dropdown
- Paste resume text into the input box
- Click Analyze — Cortex AI scores the resume against the full
  job description in real time
- Results show fit score out of 10, recommendation, strengths,
  gaps, and top 3 skills to add to the resume
- Color-coded match banner — Strong Match, Good Match,
  Partial Match, or Low Match

---

## 🚀 How to Run

### Prerequisites
- Snowflake account (trial account works)
- Cortex AI functions enabled in your region
- llama3.1-8b and llama3.1-70b available in your region

### Setup Steps

```sql
-- Step 1: Run Resume_Screener_Setup.sql
-- Creates the warehouse, database, and schema

-- Step 2: Run Job_Descriptions.sql
-- Creates the JOB_DESCRIPTIONS table and inserts 20 job postings

-- Step 3: Run Raw_Resumes_Table.sql
-- Creates the RAW_RESUMES table and inserts 30 candidate resumes

-- Step 4: Run Main.sql
-- Creates all Cortex AI enrichment views and the final ranking view
```

### Streamlit Setup
### Step 1: Open Streamlit in Snowflake

In Snowflake, navigate to:

```text
Left Sidebar
└── Streamlit
```

---

### Step 2: Create a New Streamlit App

Click:

```text
+ Streamlit App
```

---

### Step 3: Configure the Application

Use the following settings:

| Setting | Value |
|----------|---------|
| App Name | Resume Screener |
| Warehouse | RESUME_SCREENER_WH |
| Database | RESUME_SCREENER_DB |
| Schema | RECRUITING |

---

### Step 4: Remove Default Code

Delete all boilerplate code automatically generated by Snowflake.

---

### Step 5: Add Application Code

Copy and paste the full contents of:

```text
streamlit_app.py
```

into the Streamlit editor.

---

### Step 6: Run the Application

Click:

```text
Run
```

Snowflake will build and launch the application.

