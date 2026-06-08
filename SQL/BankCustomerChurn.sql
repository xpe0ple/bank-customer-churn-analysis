SELECT *
FROM dbo.BankCustomerChurn

-- Overall Churn Rate
SELECT COUNT (*) AS TotalCustomers, 
	   SUM(CASE WHEN churn = 1 THEN 1 ELSE 0 END) AS ChurnedCustomers,
	   SUM(CASE WHEN churn = 0 THEN 1 ELSE 0 END) AS RetainedCustomers
FROM dbo.BankCustomerChurn

-- Gender vs Churn
SELECT
    COUNT(*) AS TotalCustomer,
    SUM(churn) AS TotalChurn,
    ROUND(
        SUM(churn) * 100.0 / COUNT(*),
        2
    ) AS ChurnRate
FROM BankCustomerChurn;

-- Gender vs ChurnRate
SELECT 
    gender,
    COUNT(*) AS TotalCustomer,
    SUM(churn) AS TotalChurn,
    ROUND(SUM(churn) * 100.0 / COUNT(*),2) AS ChurnRate
FROM BankCustomerChurn
GROUP BY gender
ORDER BY ChurnRate DESC;

-- Age Group vs Churn
SELECT 
CASE
    WHEN age <= 18 THEN '0-18'
    WHEN age <= 30 THEN '19-30'
    WHEN age <= 45 THEN '31-45'
    WHEN age <= 60 THEN '46-60'
    ELSE '60+'
END AS AgeGroup,
COUNT (*) AS TotalCustomer,
SUM (churn) AS TotalChurn,
ROUND(SUM(churn) * 100.0 / COUNT (*),2) AS ChurnRate
FROM BankCustomerChurn
GROUP BY 
CASE
    WHEN age <= 18 THEN '0-18'
    WHEN age <= 30 THEN '19-30'
    WHEN age <= 45 THEN '31-45'
    WHEN age <= 60 THEN '46-60'
    ELSE '60+'
END
ORDER BY AgeGroup;

-- Occupation vs Churn
SELECT occupation,
COUNT (*) AS TotalCustomer,
SUM (churn) AS TotalChurn,
ROUND(SUM(churn) * 100.0 / COUNT (*),2) AS ChurnRate
FROM BankCustomerChurn
GROUP BY occupation
ORDER BY ChurnRate DESC;

-- Balance vs Churn
SELECT churn,
AVG (CAST(current_balance AS float)) as AvgBalance
FROM BankCustomerChurn
GROUP BY churn;

-- Customer Category vs Churn
SELECT customer_nw_category,
COUNT (*) AS TotalCustomer,
SUM (churn) AS TotalChurn,
ROUND(SUM(churn) * 100.0 / COUNT (*),2) AS ChurnRate
FROM BankCustomerChurn
GROUP BY customer_nw_category
ORDER BY customer_nw_category;

-- Vintage vs Churn
SELECT churn,
AVG(CAST(vintage AS float)) AS AvgVintage
FROM BankCustomerChurn
GROUP BY churn;

-- Credit & Debit Activity vs Churn
SELECT churn,
AVG(CAST(current_month_credit AS float)) AS AvgCredit,
AVG(CAST(current_month_debit AS float)) AS AvgDebit
FROM BankCustomerChurn
GROUP BY churn;










