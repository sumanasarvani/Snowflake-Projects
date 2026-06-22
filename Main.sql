USE WAREHOUSE RESUME_SCREENER_WH;
USE DATABASE RESUME_SCREENER_DB;
USE SCHEMA RECRUITING;

--> V_RESUME_EXTRACTED
CREATE OR REPLACE VIEW V_RESUME_EXTRACTED AS
SELECT
    r.RESUME_ID,
    r.CANDIDATE_NAME,
    r.CANDIDATE_EMAIL,
    r.TARGET_JOB_TITLE,
    r.YEARS_OF_EXPERIENCE,
    r.SUBMITTED_AT,

    SNOWFLAKE.CORTEX.AI_EXTRACT(
        r.RESUME_TEXT,
        {
            'top_skills'           : 'array of the top 5 most relevant technical or professional skills this candidate has based on their experience',
            'years_of_experience'  : 'estimated total years of professional work experience as a single integer',
            'highest_degree'       : 'the highest academic degree this candidate holds, return just the degree name and field',
            'most_recent_title'    : 'the most recent or current job title this candidate held',
            'most_recent_company'  : 'the most recent company or organization this candidate worked at',
            'key_responsibilities' : 'write exactly 2 sentences summarizing the most impressive responsibilities and achievements from this candidates work history',
            'certifications'       : 'list any professional certifications this candidate holds, or return None if none mentioned'
        }
    ) AS EXTRACTED_DATA
FROM RAW_RESUMES r;

--> Verify
SELECT
    RESUME_ID,
    CANDIDATE_NAME,
    TARGET_JOB_TITLE,
    EXTRACTED_DATA:response:top_skills::STRING           AS top_skills,
    EXTRACTED_DATA:response:years_of_experience::STRING  AS years_exp,
    EXTRACTED_DATA:response:highest_degree::STRING       AS highest_degree,
    EXTRACTED_DATA:response:most_recent_title::STRING    AS recent_title,
    EXTRACTED_DATA:response:most_recent_company::STRING  AS recent_company,
    EXTRACTED_DATA:response:key_responsibilities::STRING AS key_responsibilities,
    EXTRACTED_DATA:response:certifications::STRING       AS certifications,
    EXTRACTED_DATA:error                                 AS error_flag
FROM V_RESUME_EXTRACTED
ORDER BY TARGET_JOB_TITLE, RESUME_ID
LIMIT 10;


--> Create a V_RESUME_QUALITY for calssification
CREATE OR REPLACE VIEW V_RESUME_QUALITY AS
SELECT
    r.RESUME_ID,
    r.CANDIDATE_NAME,
    r.TARGET_JOB_TITLE,

    SNOWFLAKE.CORTEX.AI_COMPLETE(
        'llama3.1-8b',
        CONCAT(
            'You are an expert resume reviewer. Read the resume below and respond in valid JSON only with no extra text.\n',
            'Classify the resume into EXACTLY one of these four categories:\n',
            '- Highly Detailed\n',
            '- Adequately Detailed\n',
            '- Generic and Vague\n',
            '- Incomplete\n\n',
            'Use this exact JSON format:\n',
            '{"quality_label": "<category>", "confidence_score": <0.0 to 1.0>, "reason": "<one sentence>"}\n\n',
            'RESUME:\n', r.RESUME_TEXT
        )
    ) AS QUALITY_RAW
FROM RAW_RESUMES r;

 --> Verify
SELECT
    RESUME_ID,
    CANDIDATE_NAME,
    QUALITY_RAW
FROM V_RESUME_QUALITY
LIMIT 3;

--> Parse the JSON into clean columns
SELECT
    RESUME_ID,
    CANDIDATE_NAME,
    TARGET_JOB_TITLE,
    TRIM(PARSE_JSON(QUALITY_RAW):quality_label::STRING)    AS quality_label,
    PARSE_JSON(QUALITY_RAW):confidence_score::FLOAT        AS confidence_score,
    TRIM(PARSE_JSON(QUALITY_RAW):reason::STRING)           AS reason
FROM V_RESUME_QUALITY
ORDER BY TARGET_JOB_TITLE, RESUME_ID;

CREATE OR REPLACE VIEW V_RESUME_SENIORITY AS
SELECT
    r.RESUME_ID,
    r.CANDIDATE_NAME,
    r.TARGET_JOB_TITLE,
    r.YEARS_OF_EXPERIENCE,

    SNOWFLAKE.CORTEX.AI_COMPLETE(
        'llama3.1-8b',
        CONCAT(
            'You are a recruiting expert. Read this resume and classify the candidate seniority level.\n',
            'Choose EXACTLY one: Junior, Mid-Level, or Senior.\n',
            'Junior = 0-2 years experience or recent grad.\n',
            'Mid-Level = 3-6 years experience with solid track record.\n',
            'Senior = 7+ years OR significant leadership OR advanced credentials.\n\n',
            'Respond in this exact JSON format only:\n',
            '{"seniority": "<level>", "reason": "<one short sentence>"}\n\n',
            'RESUME:\n', r.RESUME_TEXT
        )
    ) AS SENIORITY_RAW

FROM RAW_RESUMES r;

SELECT
    RESUME_ID,
    CANDIDATE_NAME,
    TARGET_JOB_TITLE,
    YEARS_OF_EXPERIENCE,
    TRIM(PARSE_JSON(SENIORITY_RAW):seniority::STRING) AS seniority_level,
    TRIM(PARSE_JSON(SENIORITY_RAW):reason::STRING)    AS reason
FROM V_RESUME_SENIORITY
ORDER BY TARGET_JOB_TITLE, RESUME_ID;

-->> Create a resume screener
CREATE OR REPLACE VIEW V_RESUME_SCORED AS
SELECT
    r.RESUME_ID,
    r.CANDIDATE_NAME,
    r.CANDIDATE_EMAIL,
    r.TARGET_JOB_TITLE,
    r.YEARS_OF_EXPERIENCE,
    j.JOB_ID,
    j.JOB_FAMILY,
    j.SENIORITY_LEVEL      AS JOB_SENIORITY,
    j.SALARY_MIN,
    j.SALARY_MAX,
    j.LOCATION,

    SNOWFLAKE.CORTEX.AI_COMPLETE(
        'llama3.1-70b',
        CONCAT(
            'You are a senior recruiter. Score this candidate against the job description below.\n',
            'Respond in valid JSON only with no extra text.\n\n',
            'Use this exact format:\n',
            '{\n',
            '  "fit_score": <integer 1-10>,\n',
            '  "recommendation": "<Strongly Recommend|Recommend|Consider|Do Not Recommend>",\n',
            '  "strengths": "<2 sentences on what makes this candidate strong for this role>",\n',
            '  "gaps": "<2 sentences on what this candidate is missing for this role>"\n',
            '}\n\n',
            '--- JOB DESCRIPTION ---\n',
            j.JOB_DESCRIPTION, '\n\n',
            '--- CANDIDATE RESUME ---\n',
            r.RESUME_TEXT
        )
    ) AS FIT_SCORE_RAW

FROM RAW_RESUMES r
JOIN JOB_DESCRIPTIONS j
    ON UPPER(TRIM(j.JOB_TITLE)) = UPPER(TRIM(r.TARGET_JOB_TITLE));


SELECT
    RESUME_ID,
    CANDIDATE_NAME,
    TARGET_JOB_TITLE,
    JOB_FAMILY,
    YEARS_OF_EXPERIENCE,
    PARSE_JSON(FIT_SCORE_RAW):fit_score::INTEGER            AS fit_score,
    TRIM(PARSE_JSON(FIT_SCORE_RAW):recommendation::STRING)  AS recommendation,
    TRIM(PARSE_JSON(FIT_SCORE_RAW):strengths::STRING)       AS strengths,
    TRIM(PARSE_JSON(FIT_SCORE_RAW):gaps::STRING)            AS gaps
FROM V_RESUME_SCORED
ORDER BY TARGET_JOB_TITLE, fit_score DESC;

CREATE OR REPLACE VIEW V_FINAL_RANKING AS
SELECT
    -- Candidate Identity
    s.RESUME_ID,
    s.CANDIDATE_NAME,
    s.CANDIDATE_EMAIL,
    s.TARGET_JOB_TITLE,
    s.JOB_FAMILY,
    s.YEARS_OF_EXPERIENCE,
    s.JOB_ID,
    s.LOCATION             AS JOB_LOCATION,
    s.SALARY_MIN,
    s.SALARY_MAX,

    -- Fit Scoring (from V_RESUME_SCORED)
    PARSE_JSON(s.FIT_SCORE_RAW):fit_score::INTEGER              AS FIT_SCORE,
    TRIM(PARSE_JSON(s.FIT_SCORE_RAW):recommendation::STRING)    AS RECOMMENDATION,
    TRIM(PARSE_JSON(s.FIT_SCORE_RAW):strengths::STRING)         AS STRENGTHS,
    TRIM(PARSE_JSON(s.FIT_SCORE_RAW):gaps::STRING)              AS GAPS,

    -- Seniority (from V_RESUME_SENIORITY)
    TRIM(PARSE_JSON(sn.SENIORITY_RAW):seniority::STRING)        AS SENIORITY_LEVEL,
    TRIM(PARSE_JSON(sn.SENIORITY_RAW):reason::STRING)           AS SENIORITY_REASON,

    -- Extracted Profile (from V_RESUME_EXTRACTED)
    TRIM(ex.EXTRACTED_DATA:response:top_skills::STRING)         AS TOP_SKILLS,
    COALESCE(
        ex.EXTRACTED_DATA:response:years_of_experience::STRING,
        CAST(s.YEARS_OF_EXPERIENCE AS STRING)
    )                                                           AS EXTRACTED_YEARS_EXP,
    TRIM(ex.EXTRACTED_DATA:response:highest_degree::STRING)     AS HIGHEST_DEGREE,
    TRIM(ex.EXTRACTED_DATA:response:most_recent_title::STRING)  AS MOST_RECENT_TITLE,
    TRIM(ex.EXTRACTED_DATA:response:most_recent_company::STRING) AS MOST_RECENT_COMPANY,
    COALESCE(
        TRIM(ex.EXTRACTED_DATA:response:key_responsibilities::STRING),
        'Insufficient resume detail provided'
    )                                                           AS KEY_RESPONSIBILITIES,
    TRIM(ex.EXTRACTED_DATA:response:certifications::STRING)     AS CERTIFICATIONS,

    -- Ranking within each job title
    RANK() OVER (
        PARTITION BY s.TARGET_JOB_TITLE
        ORDER BY PARSE_JSON(s.FIT_SCORE_RAW):fit_score::INTEGER DESC
    )                                                           AS RANK_WITHIN_JOB,

    -- Overall ranking across all jobs
    RANK() OVER (
        ORDER BY PARSE_JSON(s.FIT_SCORE_RAW):fit_score::INTEGER DESC
    )                                                           AS OVERALL_RANK,

    -- Submission timestamp
    ex.SUBMITTED_AT

FROM V_RESUME_SCORED s
JOIN V_RESUME_SENIORITY sn ON s.RESUME_ID = sn.RESUME_ID
JOIN V_RESUME_EXTRACTED ex  ON s.RESUME_ID = ex.RESUME_ID;

SELECT
    RANK_WITHIN_JOB,
    RESUME_ID,
    CANDIDATE_NAME,
    TARGET_JOB_TITLE,
    FIT_SCORE,
    RECOMMENDATION,
    SENIORITY_LEVEL,
    MOST_RECENT_TITLE,
    HIGHEST_DEGREE,
    CERTIFICATIONS
FROM V_FINAL_RANKING
ORDER BY TARGET_JOB_TITLE, RANK_WITHIN_JOB;