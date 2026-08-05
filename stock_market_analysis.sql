CREATE TABLE stock_data (
    date DATE,
    company VARCHAR(50),
    open NUMERIC,
    high NUMERIC,
    low NUMERIC,
    close NUMERIC,
    volume BIGINT,
    year INT,
    month VARCHAR(20),
    day INT,
    price_change NUMERIC,
    daily_return NUMERIC,
    ma20 NUMERIC,
    ma50 NUMERIC
);
SELECT COUNT(*)FROM stock_data;
SELECT*FROM stock_data LIMIT 10;

SELECT COUNT(DISTINCT company) AS total_companies
FROM stock_data;

--Record of Every Company
SELECT company, COUNT(*) AS total_records
FROM stock_data
GROUP BY company
ORDER BY total_records DESC;

--Highest Closing Price of Company
SELECT company,
       MAX(close) AS highest_close
FROM stock_data
GROUP BY company
ORDER BY highest_close DESC;

--Average Closing Price of Company
SELECT company,
       ROUND(AVG(close),2) AS average_close
FROM stock_data
GROUP BY company
ORDER BY average_close DESC;

--Total Trading Volume of Company
SELECT company,
       SUM(volume) AS total_volume
FROM stock_data
GROUP BY company
ORDER BY total_volume DESC;

--Year-wise Average Closing Price]
SELECT year,
       ROUND(AVG(close),2) AS avg_close
FROM stock_data
GROUP BY year
ORDER BY year;

--Monhly-wise Average Closing Price
SELECT month,
       ROUND(AVG(close),2) AS avg_close
FROM stock_data
GROUP BY month
ORDER BY MIN(date);

-- TOP 10 Highest Price Change Days
SELECT date,
       company,
       price_change
FROM stock_data
ORDER BY price_change DESC
LIMIT 10;

--Top 10 Dily Returns
SELECT date,
       company,
       daily_return
FROM stock_data
ORDER BY daily_return DESC
LIMIT 10;

--Highest Volume Trading Days
SELECT date,
       company,
       volume
FROM stock_data
ORDER BY volume DESC
LIMIT 10;

--Company-wise Average Daily
SELECT company,
       ROUND(AVG(daily_return),4) AS avg_daily_return
FROM stock_data
GROUP BY company
ORDER BY avg_daily_return DESC;
