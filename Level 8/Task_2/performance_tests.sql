EXPLAIN SELECT * FROM Sales_Fact WHERE Total_Amount > 500;

SELECT Product_Dim.Product_Name, SUM(Sales_Fact*Total_Amount) AS Total_Sales
FROM Sales_Fact
JOIN Product_Dim ON Sales_Fact.Product_ID = Product_Dim.Product_ID
GROUP BY Product_Dim.Product_Name;

SELECT PC.Category_Name, P.Product_Name, SUM(SF.Total_Amount) AS Total_Sales
FROM Sales_Fact SF
JOIN Product_Dim P ON SF.Product_ID = P.Product_ID
JOIN Product_Category_Dim PC ON P.Category_ID = PC.Category_ID
GROUP BY PC.Category_Name, P.Product_Name;


SELECT C.Customer_Name, SUM(SF.Total_Amount) AS Total_Spent
FROM Sales_Fact SF
JOIN Customer_Dim C ON SF.Customer_ID = C.Customer_ID
GROUP BY C.Customer_Name;


SELECT table_name AS customers_list, 
       round((data_length + index_length) / 1024 / 1024, 2) AS TableSize_MB
FROM information_schema.tables 
WHERE table_schema = 'customers_list'
ORDER BY TableSize_MB DESC;

SHOW PROFILES;
