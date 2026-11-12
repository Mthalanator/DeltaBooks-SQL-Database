# Delta Books — Relational Database & SQL Reporting

A relational SQL database implementation (`DeltaBooksDB`) modeled for **Delta Books**, featuring normalized schema creation, sample seed data, and 20 analytical, data-manipulation (DML), and schema-management (DDL) queries.

## Database Schema (`00_Setup_Database.sql`)
- **`locations`** — Branch offices across the US and Canada (`location_id`, `city`, `state_province`, `country_id`)
- **`departments`** — Organizational units (`Administration`, `Marketing`, `IT`, `Sales`, `Executive`, `Accounting`) linked to locations
- **`jobs`** — Role definitions with minimum and maximum salary bands
- **`employees`** — Staff records, hire dates, commission percentages, managers, and department assignments
- **`job_history`** — Historical role and department transitions

## Queries Implemented (`DATA1A_Summative_Queries.sql`)
- **Finance Reporting (Requests 1–8):** Pattern matching (`LIKE`), date filtering, multi-table `INNER JOIN`s across locations and departments, and aggregate calculations (`AVG`, `SUM`, `ROUND`).
- **HR Operations (Requests 9–14):** Departmental headcount grouping (`GROUP BY`, `HAVING`), `TOP 1 WITH TIES` filtering, subqueries (`NOT IN`), `INSERT`ing new job roles, and bulk salary `UPDATE`s.
- **Database Administration (Requests 16–20):** Schema metadata inspection via `INFORMATION_SCHEMA.COLUMNS`, dropping legacy tables (`DROP TABLE`), creating `SAL_HISTORY`, and migrating historical employee salary records (`INSERT INTO ... SELECT`).
