1. Top Performing Products
 
SELECT 
    p.ProductName, 
    SUM(s.Quantity) AS Total_Qty_Sold, 
    SUM(s.FinalAmount) AS Total_Revenue
FROM SalesData s
JOIN ProductDim p ON s.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Total_Revenue DESC;

2. Regional Efficiency (Target vs Actual)


SELECT 
    s.Region, 
    SUM(s.FinalAmount) AS Actual_Sales,
    AVG(t.TargetAmount) AS Avg_Monthly_Target,
    (SUM(s.FinalAmount) / AVG(t.TargetAmount)) * 100 AS Achievement_Percentage
FROM SalesData s
CROSS JOIN Targets t 
GROUP BY s.Region;

3. Low Performing Products (Actionable Insight)


SELECT 
    p.ProductName, 
    SUM(s.FinalAmount) AS Revenue
FROM SalesData s
JOIN ProductDim p ON s.ProductID = p.ProductID
GROUP BY p.ProductName
HAVING Revenue < 1000000
ORDER BY Revenue ASC;


4. Discount Impact Analysis

SELECT 
    Discount, 
    COUNT(OrderID) AS Order_Count, 
    AVG(FinalAmount) AS Avg_Order_Value
FROM SalesData
GROUP BY Discount
ORDER BY Discount DESC;

Month-on-Month Growth (Advanced SQL)

SELECT 
    DATE_FORMAT(OrderDate, '%Y-%m') AS Month,
    SUM(FinalAmount) AS Current_Month_Sales,
    LAG(SUM(FinalAmount)) OVER (ORDER BY DATE_FORMAT(OrderDate, '%Y-%m')) AS Previous_Month_Sales
FROM SalesData
GROUP BY Month;







