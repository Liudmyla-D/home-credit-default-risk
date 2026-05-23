-- q03_default_rate_by_previous_status_and_product_type.sql
-- Default rate за комбінацією статусу попередньої заявки та типу кредитного продукту
-- Запит використовувався у ноутбуці 03_sql_tableau_data.ipynb

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
ORDER BY default_rate DESC