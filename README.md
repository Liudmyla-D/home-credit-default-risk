# Home Credit Default Risk Analysis

![Python](https://img.shields.io/badge/Python-3.12-blue)
![SQL](https://img.shields.io/badge/SQL-DuckDB-4B8BBE)
![Tableau](https://img.shields.io/badge/Tableau-Public-E97627)
![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-F37626)
![Dataset](https://img.shields.io/badge/Dataset-Kaggle-20BEFF)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen)
![Project](https://img.shields.io/badge/Portfolio-Data%20Analytics-purple)

Client default risk analysis based on the Kaggle Home Credit Default Risk dataset.  
The project covers data preparation, EDA, SQL analysis, hypothesis testing, baseline modeling and Tableau dashboards.

## 📌 Project Overview

This project analyzes the **Home Credit Default Risk** dataset from Kaggle to identify client segments and previous application patterns associated with a higher probability of default.

The analysis follows a full analytical workflow: data preparation, exploratory data analysis, SQL-based aggregation, hypothesis testing, a baseline machine learning model and Tableau dashboards for business interpretation.

The main goal is not only to build a model, but also to understand which factors may indicate higher credit risk and how these insights can support risk segmentation.

---

## 🔗 Quick Links

- [Interactive Tableau Dashboard](https://public.tableau.com/app/profile/liudmyl.sibikovska/viz/home_credit_default_risk_dashboard/ClientsRiskOverview)
- [Python Notebooks](notebooks/)
- [SQL Queries](sql/)
- [Dashboard Screenshots](visuals/)

---

## 📊 Project Status

| Component | Status |
|---|---|
| Data preparation and feature engineering | ✅ Complete |
| Exploratory data analysis | ✅ Complete |
| Previous applications analysis | ✅ Complete |
| SQL analysis with DuckDB | ✅ Complete |
| Hypothesis testing | ✅ Complete |
| Baseline machine learning model | ✅ Complete |
| Tableau dashboards | ✅ Published |
| GitHub documentation | ✅ Complete |

---

## ⭐ Project Highlights

| Area | Result |
|---|---|
| Dataset size | 307,511 client applications |
| Overall default rate | 8.07% |
| Highest risk age segment | Clients aged 20–29 |
| Key financial signal | Credit-to-income ratio groups 2–3× and 3–5× |
| Previous application signal | Refused history and revolving products are associated with higher default risk |
| Final outputs | 5 notebooks, 3 SQL queries, 2 Tableau dashboards |

---

## 📁 Dataset

Dataset: **Home Credit Default Risk**  
Source: Kaggle

Main tables used in this project:

- `application_train.csv` — current loan applications and client characteristics;
- `previous_application.csv` — historical applications of the same clients.

Raw data is not uploaded to this repository due to dataset size and Kaggle usage rules.

---

## ❓ Key Analytical Questions

This project answers the following questions:

- What is the overall default rate?
- Which client segments have the highest default risk?
- Is credit-to-income ratio related to default risk?
- How does default risk differ by age and education level?
- Are previous refused applications associated with higher current default risk?
- Does previous revolving loan history indicate higher risk?
- How does offer gap in previous applications relate to current default risk?
- Can a simple baseline machine learning model identify default risk patterns?

---

## 🛠 Tools and Technologies

- **Python** — data preparation, EDA, hypothesis testing and baseline modeling;
- **pandas / numpy** — data manipulation;
- **matplotlib / seaborn** — exploratory visualizations;
- **DuckDB SQL** — analytical SQL queries inside Python notebooks;
- **statsmodels** — hypothesis testing;
- **scikit-learn** — baseline machine learning model;
- **Tableau Public** — interactive dashboards;
- **Git / GitHub** — project version control and documentation.

---

## 🗂 Project Structure

```text
home-credit-default-risk/
├── data/
│   ├── raw/
│   └── processed/
├── notebooks/
│   ├── 01_data_preparation.ipynb
│   ├── 02_eda_previous_applications.ipynb
│   ├── 03_sql_tableau_data.ipynb
│   ├── 04_hypothesis_and_modeling.ipynb
│   └── 05_key_insights_recommendations.ipynb
├── sql/
│   ├── q01_default_rate_by_credit_income_group.sql
│   ├── q02_default_rate_by_previous_applications_count.sql
│   └── q03_default_rate_by_previous_status_and_product_type.sql
├── visuals/
│   ├── client_risk_overview.png
│   └── previous_applications_impact.png
├── requirements.txt
├── README.md
└── .gitignore
```

---

## 📓 Notebooks

### `01_data_preparation.ipynb`

Initial data loading, structure review, data quality checks, basic cleaning and feature engineering.

Main steps:

- loading the main datasets;
- checking table size, data types and missing values;
- reviewing key columns and target distribution;
- handling special values;
- creating analytical features such as age, employment years, credit-to-income ratio and grouped segments;
- saving prepared datasets for further analysis.

### `02_eda_previous_applications.ipynb`

Exploratory analysis of previous applications and their relationship with current default status.

Main focus:

- previous application status;
- previous contract type;
- number of previous applications per client;
- refused previous applications;
- revolving loan history;
- offer gap between requested and approved credit amount.

### `03_sql_tableau_data.ipynb`

SQL analysis using DuckDB and preparation of datasets for Tableau dashboards.

Main outputs:

- SQL-based default rate analysis;
- client-level dataset for Tableau;
- dashboard-ready fields and grouped dimensions.

### `04_hypothesis_and_modeling.ipynb`

Statistical hypothesis testing and a simple baseline machine learning model.

Main focus:

- checking whether previous refused applications are associated with default risk;
- preparing features for modeling;
- training a baseline model;
- evaluating basic model performance.

### `05_key_insights_recommendations.ipynb`

Final summary of key insights, business interpretation and recommendations based on the analysis.

---

## 🧮 SQL Analysis

SQL queries are stored separately in the `sql/` folder.

The SQL part includes:

1. **Default rate by credit-to-income group**  
   File: `q01_default_rate_by_credit_income_group.sql`

2. **Default rate by number of previous applications**  
   File: `q02_default_rate_by_previous_applications_count.sql`

3. **Default rate by previous application status and product type**  
   File: `q03_default_rate_by_previous_status_and_product_type.sql`

These queries were executed with DuckDB inside the Python notebook.

---

## 📊 Tableau Dashboard

Interactive dashboard is available on Tableau Public:

[View interactive dashboard on Tableau Public](https://public.tableau.com/app/profile/liudmyl.sibikovska/viz/home_credit_default_risk_dashboard/ClientsRiskOverview)

The Tableau workbook contains two dashboards:

### 1. Client Risk Overview

This dashboard shows default risk by key client characteristics:

- age group;
- credit-to-income ratio;
- age × credit-to-income ratio combination;
- education type;
- gender, education and income filters.

![Client Risk Overview](visuals/client_risk_overview.png)

### 2. Previous Applications Impact

This dashboard focuses on how previous credit history is related to current default risk:

- refused previous applications;
- previous revolving loan history;
- number of previous applications;
- offer gap in previous applications;
- combined risk view for refused history and revolving products.

![Previous Applications Impact](visuals/previous_applications_impact.png)

---

## 🔍 Key Insights

- The overall default rate is **8.07%**.
- The highest default risk is observed among clients aged **20–29**.
- Medium credit-to-income ratio groups, especially **2–3×** and **3–5×**, show higher default risk.
- Clients with previous refused applications have a higher default rate than clients without refused history.
- Clients with previous revolving loan history also show higher default risk.
- The riskiest previous-application segment combines refused application history and revolving product history.
- Previous application behavior provides useful risk signals, but it should be combined with financial and demographic client-level indicators.

---

## 🧪 Hypothesis Testing

Several analytical hypotheses were tested to check whether previous application history and financial indicators are associated with default risk.

The goal of this section was not only to calculate differences, but also to understand which factors may be useful for risk segmentation.

| Hypothesis | Method / Comparison | Result | Business Interpretation |
|---|---|---|---|
| Clients with previous refused applications have a higher default risk than clients without refused history. | Compared default rate between clients with and without refused previous applications. | Supported | Previous refused applications can be used as an additional risk signal. |
| Clients with previous revolving loan history have a higher default risk. | Compared default rate for clients with and without previous revolving products. | Supported | Revolving loan history may indicate higher credit risk and should be monitored. |
| Credit-to-income ratio is related to default risk. | Compared default rate across credit-to-income ratio groups. | Supported | Medium credit-to-income load groups showed higher default risk than the lowest groups. |
| Age group is associated with default risk. | Compared default rate across client age groups. | Supported | Younger clients, especially age 20–29, showed the highest default rate. |
| Previous application behavior provides additional segmentation value. | Combined previous refused history, revolving product history and offer gap groups. | Supported | Previous application patterns help identify higher-risk client segments when combined with financial indicators. |

---

## 🤖 Baseline Machine Learning Model

A simple baseline machine learning model was built to test whether selected client-level and previous-application features can be used for default prediction.

The model is used as a baseline analytical step, not as a production-ready credit scoring model.

Main purpose:

- validate whether selected features contain predictive signal;
- create a simple benchmark for future model improvements;
- connect business analysis with basic machine learning.

---

## 💡 Business Recommendations

Based on the analysis, the following recommendations can be considered:

- Pay closer attention to younger clients, especially the **20–29** age group.
- Monitor clients with medium credit-to-income load, especially **2–3×** and **3–5×** groups.
- Use previous refused applications as an additional risk signal.
- Consider previous revolving loan history as a potential indicator of higher default risk.
- Combine client financial indicators with previous application behavior for better segmentation.
- Use dashboards to explore risk patterns by client segment before making business decisions.

---

## ▶️ How to Run the Project

1. Clone the repository:

```bash
git clone https://github.com/Liudmyla-D/home-credit-default-risk.git
```

2. Install required libraries:

```bash
pip install -r requirements.txt
```

3. Download the **Home Credit Default Risk** dataset from Kaggle.

4. Place raw CSV files into:

```text
data/raw/
```

5. Run notebooks in order:

```text
01_data_preparation.ipynb
02_eda_previous_applications.ipynb
03_sql_tableau_data.ipynb
04_hypothesis_and_modeling.ipynb
05_key_insights_recommendations.ipynb
```

---

## 📝 Repository Notes

- Raw data files are not included in the repository.
- Processed data files are also excluded from Git tracking.
- Dashboard screenshots are stored in the `visuals/` folder.
- SQL queries are stored separately in the `sql/` folder for readability.

---

## 👤 Author

**Liudmyla Sibikovska**  
Data Analyst