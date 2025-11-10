# 🚀 End-to-End ELT Data Engineering Project using dbt + PostgreSQL

[![dbt](https://img.shields.io/badge/dbt-1.10+-FF694B?logo=dbt&logoColor=white)](https://www.getdbt.com/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Database-336791?logo=postgresql)](https://www.postgresql.org/)
[![Python](https://img.shields.io/badge/Python-3.12-blue?logo=python)](https://www.python.org/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](#)

This project demonstrates an **end-to-end ELT (Extract, Load, Transform)** workflow using **dbt (Data Build Tool)** and **PostgreSQL**.  
It simulates a real-world data pipeline following the **Bronze → Silver → Gold** architecture to transform raw data into business-ready insights.

---

## 🦯 Project Overview

The pipeline ingests raw data into **PostgreSQL**, applies transformations using **dbt**, and produces analytics models in three layers:

- 🔤 **Bronze Layer:** Raw data ingestion & staging  
- ⚪ **Silver Layer:** Data cleaning, validation, standardization  
- 🟡 **Gold Layer:** Aggregations, business KPIs, and analytics models  

Each layer is materialized in its respective PostgreSQL schema.

---

## 🗁 Folder Structure

```
DataEngineering_demo_with_dbt/
│
├── etl/
│   ├── models/
│   │   ├── Bronze/
│   │   ├── Silver/
│   │   ├── Gold/
│   ├── snapshots/
│   ├── macros/
│   ├── tests/
│   ├── dbt_project.yml
│   └── requirements.txt
│
├── server/
│   ├── dev_database_setup.sql
│   └── prod_database_setup.sql
│
└── README.md
```

---

## 🧱 Architecture Diagram

```
        ┌──────────────┐
        │  Source Data │
        └──────┬───────┘
               │
               ▼
         🟤 Bronze Layer
        (Raw → Staged)
               │
               ▼
         ⚪ Silver Layer
     (Cleaned → Validated)
               │
               ▼
         🟡 Gold Layer
   (Aggregated → Analytics)
```

---

## ⚙️ Setup Instructions

### 🧩 Step 1 — Create PostgreSQL Databases
Inside the `server/` folder, you’ll find:
- `dev_database_setup.sql` → Creates **ETL_dev**
- `prod_database_setup.sql` → Creates **ETL_prod**

Run them in **pgAdmin** or **psql**:

```bash
\i 'path_to_project/server/dev_database_setup.sql'
\i 'path_to_project/server/prod_database_setup.sql'
```

These scripts create all schemas (`raw`, `geo`, `hr`, `inventory`, etc.) and sample data.

---

### 💻 Step 2 — Set Up Virtual Environment

```bash
cd etl
python -m venv .venv
.venv\Scripts\activate        # On Windows
# or
source .venv/bin/activate     # On Mac/Linux
```

Then install dependencies:
```bash
pip install -r requirements.txt
```

---

### 🧰 Step 3 — Configure dbt Profiles

Create a file named **`profiles.yml`** (in your `etl/` folder or global dbt folder):

```yaml
etl:
  outputs:
    dev:
      database: ETL_dev
      host: localhost
      user: postgres
      pass: your_password
      port: 5432
      schema: default
      threads: 1
      type: postgres

    prod:
      database: ETL_prod
      host: localhost
      user: postgres
      pass: your_password
      port: 5432
      schema: default
      threads: 1
      type: postgres

  target: dev
```

---

### 🧩 Step 4 — Modify `source.yml` and Snapshots for Development

During **development**, dbt needs explicit database reference.  
Ensure:
```yaml
database: "{{ target.database }}"
```
is included in your `source.yml` and `snapshot` configs.

Then run:
```bash
dbt debug
dbt parse
dbt build
```

✅ This will build and test all models in the **dev** environment.

---

### 🧪 Step 5 — Validate Tests

Run all tests to confirm data quality:
```bash
dbt test
```

---

### 🚀 Step 6 — Deploy to Production

After successful development:

- Remove the `database:` field from your `source.yml` and snapshots.  
- Set your target to **prod** in `profiles.yml`:
  ```yaml
  target: prod
  ```

Then deploy:
```bash
dbt build --target prod
```

✅ This runs all models (Bronze → Silver → Gold), snapshots, and tests on the production database.

---

### 📊 Step 7 — View Documentation

Generate and view dbt docs:
```bash
dbt docs generate
dbt docs serve
```
Open [http://localhost:8080](http://localhost:8080) to explore lineage graphs and model details.

---

## 🧠 Key dbt Commands Reference

| Command | Purpose |
|----------|----------|
| `dbt debug` | Validate connection & setup |
| `dbt parse` | Validate structure |
| `dbt run` | Run models only |
| `dbt test` | Run all data tests |
| `dbt snapshot` | Apply snapshots |
| `dbt build` | Run models + tests + snapshots |
| `dbt build --target prod` | Deploy to production |
| `dbt docs serve` | Serve docs locally |

---

## 🔐 Security Note

Your `profiles.yml` contains credentials — **never commit it**.  
- Add it to `.gitignore`  
- Keep it locally only  
- If accidentally committed, remove and rotate credentials immediately  

---

## 🧩 Quick Summary

```bash
# Create Databases
psql -U postgres -f server/dev_database_setup.sql
psql -U postgres -f server/prod_database_setup.sql

# Setup Environment
cd etl
python -m venv .venv
.venv\Scripts\activate
pip install -r requirements.txt

# Develop in Dev
dbt build

# Deploy to Prod
dbt build --target prod
```

---

## 👨‍💻 Author

**Subhajit Nath**  
💼 Data Engineer | Building reliable data pipelines with dbt  📊  PostgreSQL  💻  SQL  
🔗 [LinkedIn Profile](https://www.linkedin.com/in/subajitnath)

---

## 🌟 If you found this useful
Give this repository a ⭐ on GitHub — it helps others discover it and supports continued learning!

---

### 🏁 Happy Building & Transforming Data with dbt!

