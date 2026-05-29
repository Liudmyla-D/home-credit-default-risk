-- q02_default_rate_by_previous_applications_count.sql
-- Default rate залежно від кількості попередніх заявок клієнта
-- Запит використовувався у ноутбуці 03_sql_tableau_data.ipynb

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