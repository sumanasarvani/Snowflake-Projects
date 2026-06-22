# Streamlit in Snowflake 

import streamlit as st
from snowflake.snowpark.context import get_active_session
import pandas as pd

session = get_active_session()
session.sql("USE DATABASE RESUME_SCREENER_DB").collect()
session.sql("USE SCHEMA RECRUITING").collect()
session.sql("USE WAREHOUSE RESUME_SCREENER_WH").collect()

st.set_page_config(layout="wide", page_title="Resume Screener")

st.markdown("""
<style>
    html, body, [class*="css"] { font-family: 'Segoe UI', sans-serif; }
    .app-header {
        background: linear-gradient(135deg, #0d1b2a 0%, #1b3a6b 100%);
        padding: 1.5rem 2rem; border-radius: 12px;
        margin-bottom: 1.5rem; color: white;
    }
    .app-title  { font-size:1.8rem; font-weight:700; color:white; margin:0; }
    .app-sub    { font-size:0.85rem; color:#a8c0e8; margin:0.2rem 0 0 0; }
    .panel-box  {
        background:#f7f9fc; border:1px solid #e2e8f0;
        border-radius:12px; padding:1.2rem;
    }
    .panel-title {
        font-size:0.68rem; font-weight:700; text-transform:uppercase;
        letter-spacing:1.5px; color:#1b3a6b; margin-bottom:0.6rem;
        border-bottom:2px solid #1b3a6b; padding-bottom:0.3rem;
    }
    .detail-row {
        display:flex; justify-content:space-between;
        padding:0.3rem 0; border-bottom:1px solid #edf2f7; font-size:0.81rem;
    }
    .dl { color:#718096; font-weight:500; }
    .dv { color:#1a202c; font-weight:600; text-align:right; }
    .skills-box {
        background:white; border:1px solid #e2e8f0; border-radius:8px;
        padding:0.6rem 0.8rem; font-size:0.79rem; color:#2d3748;
        line-height:1.6; margin-top:0.3rem;
    }
    .metrics-row { display:flex; gap:0.8rem; margin-bottom:1.2rem; }
    .mbox {
        flex:1; background:white; border:1px solid #e2e8f0;
        border-radius:10px; padding:0.8rem; text-align:center;
        box-shadow:0 1px 3px rgba(0,0,0,0.05);
    }
    .mnum  { font-size:1.7rem; font-weight:700; line-height:1; }
    .mlbl  { font-size:0.7rem; color:#718096; margin-top:0.25rem; font-weight:500; }
    .ccard {
        background:white; border:1px solid #e2e8f0; border-radius:12px;
        padding:1.1rem 1.3rem; margin-bottom:0.9rem;
        box-shadow:0 1px 4px rgba(0,0,0,0.05);
    }
    .ccard-sr { border-left:5px solid #2d6a4f; }
    .ccard-r  { border-left:5px solid #1b3a6b; }
    .ccard-c  { border-left:5px solid #d97706; }
    .ccard-dn { border-left:5px solid #c1121f; }
    .sc-circle {
        width:52px; height:52px; border-radius:50%;
        display:inline-flex; align-items:center; justify-content:center;
        font-size:1rem; font-weight:800; color:white;
    }
    .sc-hi { background:#2d6a4f; }
    .sc-mi { background:#d97706; }
    .sc-lo { background:#c1121f; }
    .badge {
        display:inline-block; padding:3px 11px; border-radius:20px;
        font-size:0.73rem; font-weight:600;
    }
    .b-sr { background:#d8f3dc; color:#1b4332; }
    .b-r  { background:#dbeafe; color:#1e3a5f; }
    .b-c  { background:#fef3c7; color:#92400e; }
    .b-dn { background:#fee2e2; color:#7f1d1d; }
    .bar-bg {
        background:#e2e8f0; border-radius:6px;
        height:6px; width:100%; margin-top:5px;
    }
    .bar-fill { height:6px; border-radius:6px; }
    .lbl {
        font-size:0.67rem; text-transform:uppercase;
        letter-spacing:0.8px; color:#a0aec0; font-weight:600;
        margin-bottom:0.2rem; margin-top:0.7rem;
    }
    .val { font-size:0.81rem; color:#2d3748; font-weight:500; }
    .ai-s {
        background:#f0fdf4; border-left:3px solid #2d6a4f;
        border-radius:7px; padding:0.6rem 0.8rem;
        font-size:0.8rem; line-height:1.55; color:#1a202c; margin-top:0.2rem;
    }
    .ai-g {
        background:#fffbeb; border-left:3px solid #d97706;
        border-radius:7px; padding:0.6rem 0.8rem;
        font-size:0.8rem; line-height:1.55; color:#1a202c; margin-top:0.2rem;
    }
    .res-card {
        background:white; border:1px solid #e2e8f0; border-radius:12px;
        padding:1.4rem; box-shadow:0 2px 8px rgba(0,0,0,0.06);
    }
    .res-score {
        font-size:3rem; font-weight:800; line-height:1;
    }
    .ai-k {
        background:#eff6ff; border-left:3px solid #1b3a6b;
        border-radius:7px; padding:0.6rem 0.8rem;
        font-size:0.8rem; line-height:1.55; color:#1a202c; margin-top:0.2rem;
    }
    .mbanner {
        border-radius:8px; padding:0.7rem 1rem;
        font-size:0.84rem; font-weight:600; margin-top:1rem;
    }
    .mb-str { background:#d8f3dc; color:#1b4332; }
    .mb-goo { background:#dbeafe; color:#1e3a5f; }
    .mb-par { background:#fef3c7; color:#92400e; }
    .mb-low { background:#fee2e2; color:#7f1d1d; }
    .checker-hdr {
        background:#f7f9fc; border:1px solid #e2e8f0;
        border-radius:10px; padding:0.9rem 1.3rem; margin-bottom:1.1rem;
        font-size:0.88rem; color:#2d3748;
    }
</style>
""", unsafe_allow_html=True)

# Helper Functions
def card_css(rec):
    return {"Strongly Recommend":"ccard-sr","Recommend":"ccard-r",
            "Consider":"ccard-c","Do Not Recommend":"ccard-dn"}.get(rec,"ccard-c")

def badge_css(rec):
    return {"Strongly Recommend":"b-sr","Recommend":"b-r",
            "Consider":"b-c","Do Not Recommend":"b-dn"}.get(rec,"b-c")

def badge_icon(rec):
    return {"Strongly Recommend":"⭐","Recommend":"✅",
            "Consider":"🔶","Do Not Recommend":"❌"}.get(rec,"")

def sc_css(s):
    return "sc-hi" if s>=7 else "sc-mi" if s>=5 else "sc-lo"

def bar_color(s):
    return "#2d6a4f" if s>=7 else "#d97706" if s>=5 else "#c1121f"

# Loaders 
def load_jobs():
    return session.sql("""
        SELECT DISTINCT JOB_TITLE
        FROM RESUME_SCREENER_DB.RECRUITING.JOB_DESCRIPTIONS
        WHERE STATUS='OPEN' ORDER BY JOB_TITLE
    """).to_pandas()['JOB_TITLE'].tolist()

def load_jd(t):
    return session.sql(f"""
        SELECT JOB_TITLE,JOB_FAMILY,SENIORITY_LEVEL,LOCATION,
               SALARY_MIN,SALARY_MAX,EXPERIENCE_MIN,EXPERIENCE_MAX,
               QUALIFICATION_LEVEL,SKILLS_REQUIRED,NICE_TO_HAVE_SKILLS
        FROM RESUME_SCREENER_DB.RECRUITING.JOB_DESCRIPTIONS
        WHERE JOB_TITLE='{t}' LIMIT 1
    """).to_pandas()

def load_candidates(t):
    return session.sql(f"""
        SELECT RANK_WITHIN_JOB,RESUME_ID,CANDIDATE_NAME,CANDIDATE_EMAIL,
               FIT_SCORE,RECOMMENDATION,SENIORITY_LEVEL,YEARS_OF_EXPERIENCE,
               MOST_RECENT_TITLE,MOST_RECENT_COMPANY,HIGHEST_DEGREE,
               CERTIFICATIONS,TOP_SKILLS,STRENGTHS,GAPS,KEY_RESPONSIBILITIES
        FROM RESUME_SCREENER_DB.RECRUITING.V_FINAL_RANKING
        WHERE TARGET_JOB_TITLE='{t}'
        ORDER BY RANK_WITHIN_JOB, FIT_SCORE DESC
    """).to_pandas()

def score_resume(resume_text, job_title):
    import json

    # Trim resume to first 2000 chars to avoid token limits
    trimmed_resume = resume_text[:2000]
    safe_resume    = trimmed_resume.replace("'", "''")
    safe_title     = job_title.replace("'", "''")

    result = session.sql(f"""
        SELECT PARSE_JSON(
            SNOWFLAKE.CORTEX.AI_COMPLETE(
                'llama3.1-70b',
                CONCAT(
                    'You are a recruiter. Score this resume against the job description.\\n',
                    'Reply with ONLY a JSON object, nothing else, no explanation.\\n',
                    'JSON format: {{"fit_score":5,"recommendation":"Consider","strengths":"text","gaps":"text","skills_to_add":"text"}}\\n\\n',
                    'JOB:\\n', LEFT(jd.JOB_DESCRIPTION, 800), '\\n\\nRESUME:\\n', '{safe_resume}'
                )
            )
        ) AS RESULT
        FROM RESUME_SCREENER_DB.RECRUITING.JOB_DESCRIPTIONS jd
        WHERE JOB_TITLE = '{safe_title}'
        LIMIT 1
    """).to_pandas()

    raw = result['RESULT'][0]

    if isinstance(raw, dict):
        return raw

    return json.loads(str(raw))


# Header
st.markdown("""
<div class="app-header">
    <p class="app-title">🧠 Intelligent Resume Screener</p>
    <p class="app-sub">Powered by Snowflake Cortex AI &nbsp;·&nbsp;
    Candidate Ranking &amp; Resume Fit Checker</p>
</div>
""", unsafe_allow_html=True)

job_titles = load_jobs()
tab1, tab2 = st.tabs(["👥  Recruiter Dashboard","📄  Resume Fit Checker"])


# TAB 1
with tab1:
    c_left, c_right = st.columns([1,3], gap="large")

    with c_left:
        selected = st.selectbox("Select Job Opening", job_titles, key="t1")
        jd_df    = load_jd(selected)

        if not jd_df.empty:
            jd = jd_df.iloc[0]
            s_min = f"${int(jd['SALARY_MIN']):,}"
            s_max = f"${int(jd['SALARY_MAX']):,}"
            st.markdown(f"""
            <div class="panel-box">
                <div class="panel-title">📋 Job Details</div>
                <div class="detail-row">
                    <span class="dl">Family</span>
                    <span class="dv">{jd['JOB_FAMILY']}</span>
                </div>
                <div class="detail-row">
                    <span class="dl">Seniority</span>
                    <span class="dv">{jd['SENIORITY_LEVEL']}</span>
                </div>
                <div class="detail-row">
                    <span class="dl">Location</span>
                    <span class="dv">{jd['LOCATION']}</span>
                </div>
                <div class="detail-row">
                    <span class="dl">Experience</span>
                    <span class="dv">{int(jd['EXPERIENCE_MIN'])}–{int(jd['EXPERIENCE_MAX'])} yrs</span>
                </div>
                <div class="detail-row">
                    <span class="dl">Salary</span>
                    <span class="dv">{s_min} – {s_max}</span>
                </div>
                <div class="detail-row">
                    <span class="dl">Education</span>
                    <span class="dv">{jd['QUALIFICATION_LEVEL']}</span>
                </div>
            </div>
            """, unsafe_allow_html=True)
            st.markdown(" ")
            st.markdown(f"""
            <div class="panel-box">
                <div class="panel-title">🎯 Required Skills</div>
                <div class="skills-box">{jd['SKILLS_REQUIRED']}</div>
                <br/>
                <div class="panel-title">✨ Nice to Have</div>
                <div class="skills-box">{jd['NICE_TO_HAVE_SKILLS']}</div>
            </div>
            """, unsafe_allow_html=True)

    with c_right:
        st.markdown(f"#### 🏆 Candidate Rankings — {selected}")
        df = load_candidates(selected)

        if df.empty:
            st.warning("No candidates found for this job.")
        else:
            total = len(df)
            sr  = (df['RECOMMENDATION']=='Strongly Recommend').sum()
            rec = (df['RECOMMENDATION']=='Recommend').sum()
            con = (df['RECOMMENDATION']=='Consider').sum()
            dn  = (df['RECOMMENDATION']=='Do Not Recommend').sum()
            avg = df['FIT_SCORE'].mean()

            st.markdown(f"""
            <div class="metrics-row">
                <div class="mbox">
                    <div class="mnum" style="color:#1b3a6b">{total}</div>
                    <div class="mlbl">Total Candidates</div>
                </div>
                <div class="mbox">
                    <div class="mnum" style="color:#2d6a4f">{sr}</div>
                    <div class="mlbl">⭐ Strongly Recommend</div>
                </div>
                <div class="mbox">
                    <div class="mnum" style="color:#1b3a6b">{rec}</div>
                    <div class="mlbl">✅ Recommend</div>
                </div>
                <div class="mbox">
                    <div class="mnum" style="color:#d97706">{con}</div>
                    <div class="mlbl">🔶 Consider</div>
                </div>
                <div class="mbox">
                    <div class="mnum" style="color:#c1121f">{dn}</div>
                    <div class="mlbl">❌ Do Not Recommend</div>
                </div>
                <div class="mbox">
                    <div class="mnum" style="color:#1b3a6b">{avg:.1f}</div>
                    <div class="mlbl">Avg Fit Score</div>
                </div>
            </div>
            """, unsafe_allow_html=True)

            for _, row in df.iterrows():
                # Clean array strings into readable comma-separated text
                import re
                def clean_array(val):
                    if not val or str(val) in ['None','nan']:
                        return 'N/A'
                    cleaned = re.sub(r'[\[\]"]', '', str(val))
                    return cleaned.strip()
            
                top_skills = clean_array(row['TOP_SKILLS'])
                certs      = clean_array(row['CERTIFICATIONS'])
                sc    = int(row['FIT_SCORE'])
                rec_v = str(row['RECOMMENDATION'])
                pct   = sc * 10
                bc    = bar_color(sc)
                cc    = card_css(rec_v)
                bclass= badge_css(rec_v)
                bi    = badge_icon(rec_v)
                scc   = sc_css(sc)

                # Header row of card
                st.markdown(f"""
                <div class="ccard {cc}">
                    <div style="display:flex;justify-content:space-between;
                                align-items:flex-start">
                        <div>
                            <div style="font-size:0.68rem;font-weight:700;
                                        text-transform:uppercase;letter-spacing:1px;
                                        color:#718096">
                                Rank #{int(row['RANK_WITHIN_JOB'])}
                            </div>
                            <div style="font-size:1.05rem;font-weight:700;
                                        color:#1a202c;margin:0.1rem 0">
                                {row['CANDIDATE_NAME']}
                            </div>
                            <div style="font-size:0.79rem;color:#718096">
                                {row['MOST_RECENT_TITLE']}
                                &nbsp;·&nbsp;
                                {row['MOST_RECENT_COMPANY']}
                            </div>
                        </div>
                        <div style="text-align:center;flex-shrink:0">
                            <div class="sc-circle {scc}">{sc}/10</div>
                            <div style="margin-top:5px">
                                <span class="badge {bclass}">
                                    {bi} {rec_v}
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="bar-bg" style="margin-top:0.7rem">
                        <div class="bar-fill"
                             style="width:{pct}%;background:{bc}">
                        </div>
                    </div>
                </div>
                """, unsafe_allow_html=True)

                # Details below card header — using Streamlit columns
                # to avoid deep HTML nesting issues
                with st.container():
                    d1, d2, d3 = st.columns(3)
                    with d1:
                        st.markdown(f"""
                        <div class="lbl">Seniority</div>
                        <div class="val">{row['SENIORITY_LEVEL']}</div>
                        <div class="lbl">Experience</div>
                        <div class="val">{int(row['YEARS_OF_EXPERIENCE'])} years</div>
                        <div class="lbl">Education</div>
                        <div class="val">{row['HIGHEST_DEGREE']}</div>
                        """, unsafe_allow_html=True)
                    with d2:
                        cert_html = (
                        f'<div class="lbl">Certifications</div>'
                        f'<div class="val">{certs}</div>'
                        if certs and certs != 'N/A' else ''
                        )
                        st.markdown(f"""
                        <div class="lbl">Email</div>
                        <div class="val">{row['CANDIDATE_EMAIL']}</div>
                        <div class="lbl">Top Skills</div>
                        <div class="val">{top_skills}</div>
                        {cert_html}
                        """, unsafe_allow_html=True)
                    with d3:
                        st.markdown(f"""
                        <div class="lbl">✅ Strengths</div>
                        <div class="ai-s">{row['STRENGTHS']}</div>
                        <div class="lbl">⚠️ Gaps</div>
                        <div class="ai-g">{row['GAPS']}</div>
                        """, unsafe_allow_html=True)

                st.markdown("<hr style='border:none;border-top:1px solid #edf2f7;"
                            "margin:0.2rem 0 0.8rem 0'>", unsafe_allow_html=True)

# TAB 2
with tab2:
    st.markdown("""
    <div class="checker-hdr">
        <strong>📄 Resume Fit Checker</strong> &nbsp;—&nbsp;
        Paste your resume, select a target role, and get an instant
        AI-powered fit score with actionable feedback.
    </div>
    """, unsafe_allow_html=True)

    ca, cb = st.columns([1,1], gap="large")

    with ca:
        target  = st.selectbox("🎯 Target Role", job_titles, key="t2")
        resume  = st.text_area("Paste Your Resume", height=420,
                    placeholder="Paste your full resume here...")
        btn     = st.button("🚀 Analyze My Resume",
                    type="primary", use_container_width=True)

    with cb:
        if btn:
            if not resume.strip():
                st.error("Please paste your resume before analyzing.")
            elif len(resume.strip()) < 100:
                st.error("Resume too short. Please paste your full resume.")
            else:
                with st.spinner("Cortex AI is analyzing your resume..."):
                    try:
                        res   = score_resume(resume, target)
                        sc    = res['fit_score']
                        rec_v = res['recommendation']
                        pct   = sc * 10
                        bc    = bar_color(sc)
                        bclass= badge_css(rec_v)
                        bi    = badge_icon(rec_v)

                        if sc >= 8:
                            mb,mt = "mb-str","🟢 Strong Match — You are a competitive candidate. Apply with confidence."
                        elif sc >= 6:
                            mb,mt = "mb-goo","🔵 Good Match — Address the gaps above to strengthen your application."
                        elif sc >= 4:
                            mb,mt = "mb-par","🟡 Partial Match — Build the missing skills before applying."
                        else:
                            mb,mt = "mb-low","🔴 Low Match — Consider roles that better fit your background."

                        st.markdown(f"""
                        <div class="res-card">
                            <div style="display:flex;justify-content:space-between;
                                        align-items:center;margin-bottom:0.8rem">
                                <div>
                                    <div class="lbl">Fit Score</div>
                                    <div class="res-score" style="color:{bc}">
                                        {sc}
                                        <span style="font-size:1.1rem;
                                               color:#a0aec0">/10</span>
                                    </div>
                                    <div class="bar-bg" style="width:160px;margin-top:6px">
                                        <div class="bar-fill"
                                             style="width:{pct}%;background:{bc}">
                                        </div>
                                    </div>
                                </div>
                                <div style="text-align:center">
                                    <div class="lbl">Recommendation</div>
                                    <span class="badge {bclass}"
                                          style="font-size:0.82rem;padding:5px 14px">
                                        {bi} {rec_v}
                                    </span>
                                </div>
                            </div>
                            <div class="lbl">✅ Strengths for This Role</div>
                            <div class="ai-s">{res['strengths']}</div>
                            <div class="lbl">⚠️ Gaps to Address</div>
                            <div class="ai-g">{res['gaps']}</div>
                            <div class="lbl">🚀 Skills to Add to Your Resume</div>
                            <div class="ai-k">{res['skills_to_add']}</div>
                            <div class="mbanner {mb}">{mt}</div>
                        </div>
                        """, unsafe_allow_html=True)

                    except Exception as e:
                        st.error(f"Something went wrong: {str(e)}")
        else:
            st.markdown("""
            <div style="padding:2.5rem;text-align:center;color:#a0aec0">
                <div style="font-size:3rem;margin-bottom:1rem">📋</div>
                <div style="font-size:0.95rem;font-weight:600;
                            color:#4a5568;margin-bottom:0.6rem">
                    Paste your resume and click Analyze
                </div>
                <div style="font-size:0.81rem;line-height:2;color:#718096">
                    🎯 Fit score out of 10<br/>
                    ⭐ Hiring recommendation<br/>
                    ✅ Your strengths for this role<br/>
                    ⚠️ Gaps to address<br/>
                    🚀 Top skills to add
                </div>
            </div>
            """, unsafe_allow_html=True)
        
