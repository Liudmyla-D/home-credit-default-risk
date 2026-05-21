-- 01_analysis_queries.sql
-- SQL-запити, використані у проєкті Home Credit Default Risk
-- Запити виконувались через DuckDB у ноутбуці 03_sql_tableau_data.ipynb


-- 8.1 Default rate за групами кредитного навантаження

SELECT
    credit_income_group,
    COUNT(*) AS clients_count,
    SUM(TARGET) AS default_clients,
    ROUND(AVG(TARGET) * 100, 2) AS default_rate
FROM app_clean
WHERE credit_income_group IS NOT NULL
GROUP BY credit_income_group
ORDER BY
    CASE credit_income_group
        WHEN '0-1' THEN 1
        WHEN '1-2' THEN 2
        WHEN '2-3' THEN 3
        WHEN '3-5' THEN 4
        WHEN '5-10' THEN 5
        WHEN '10+' THEN 6
    END;


-- 8.2 Default rate залежно від кількості попередніх заявок клієнта

WITH previous_applications_count AS (
    SELECT
        SK_ID_CURR,
        COUNT(*) AS previous_applications_count
    FROM prev_clean
    GROUP BY SK_ID_CURR
),

app_with_prev AS (
    SELECT
        a.SK_ID_CURR,
        a.TARGET,
        COALESCE(p.previous_applications_count, 0) AS previous_applications_count
    FROM app_clean AS a
    LEFT JOIN previous_applications_count AS p
        ON a.SK_ID_CURR = p.SK_ID_CURR
),

prev_groups AS (
    SELECT
        CASE
            WHEN previous_applications_count = 0 THEN '0'
            WHEN previous_applications_count = 1 THEN '1'
            WHEN previous_applications_count BETWEEN 2 AND 3 THEN '2-3'
            WHEN previous_applications_count BETWEEN 4 AND 5 THEN '4-5'
            ELSE '6+'
        END AS previous_applications_group,

        CASE
            WHEN previous_applications_count = 0 THEN 1
            WHEN previous_applications_count = 1 THEN 2
            WHEN previous_applications_count BETWEEN 2 AND 3 THEN 3
            WHEN previous_applications_count BETWEEN 4 AND 5 THEN 4
            ELSE 5
        END AS sort_order,

        TARGET
    FROM app_with_prev
)

SELECT
    previous_applications_group,
    COUNT(*) AS clients_count,
    CAST(SUM(TARGET) AS INTEGER) AS default_clients,
    ROUND(AVG(TARGET) * 100, 2) AS default_rate
FROM prev_groups
GROUP BY previous_applications_group, sort_order
ORDER BY sort_order;


-- 8.3 Default rate за комбінацією статусу попередньої заявки та типу кредитного продукту

SELECT
    p.NAME_CONTRACT_STATUS AS previous_status,
    p.NAME_CONTRACT_TYPE AS previous_contract_type,
    COUNT(p.SK_ID_PREV) AS applications_count,
    CAST(SUM(a.TARGET) AS INTEGER) AS default_applications,
    ROUND(AVG(a.TARGET) * 100, 2) AS default_rate
FROM prev_clean AS p
INNER JOIN app_clean AS a
    ON p.SK_ID_CURR = a.SK_ID_CURR
WHERE p.NAME_CONTRACT_TYPE != 'XNA'
GROUP BY
    p.NAME_CONTRACT_STATUS,
    p.NAME_CONTRACT_TYPE
HAVING COUNT(p.SK_ID_PREV) >= 1000
ORDER BY default_rate DESC;