-- q01_default_rate_by_credit_income_group.sql
-- Default rate за групами кредитного навантаження
-- Запит використовувався у ноутбуці 03_sql_tableau_data.ipynb

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