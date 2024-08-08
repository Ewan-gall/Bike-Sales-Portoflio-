Select *
From BikeSales

--- Inital Look At Database

Alter Table BikeSales
Alter Column Date DATE

--Removing the 00:00:00 Time stamp on date 

Select Month , Sum(Profit) AS Monthly_Profit
From BikeSales
Group by Month
Order by Monthly_Profit desc

-- Understanding The most profitable months
-- Decemeber link to Christmas and June May April Beginning of Summer

Select Year , Sum(Profit) AS Yearly_Profit
From BikeSales
Group by Year
Order by Yearly_Profit desc

--- Checking Bike Sales In previous years
--- Sales Continuly rising positive trend

With DailyProfit AS 
(
 Select 
 Month(Day) As Month,
 DAY(Day) AS Day,
 Sum(Profit) AS Daily_Profit
 From BikeSales
 Group By MONTH(Day), DAY(Day)
) , 

MaxDailyProfit AS
(

Select Month,MAX(Daily_Profit)AS Max_Profit
From DailyProfit
Group By Month
)

SELECT dp.Month,dp.Day,dp.Daily_Profit AS Monthly_Profit
FROM DailyProfit dp

Join MaxDailyProfit mp 
On dp.Month = mp.Month And dp.Daily_Profit = mp.Max_Profit
Order By dp.Daily_Profit DESC

--- Checking the most profitable day by month
--- Usually End of Month 

Select Age_Group , Sum(Profit) AS Profit_by_age_group
From BikeSales
Group By Age_Group
Order by Profit_by_age_group desc

--The most profitable age group
-- Young Adults 25-34 and Adults 35-64 the key demographics 

Select Customer_Gender , Sum(Profit) AS Profit_by_gender
From BikeSales
Group By Customer_Gender
Order by Profit_by_gender desc

--- Checking the profit by gender
--- Males are slightly more profitable than Females but a good split

Select TOP 10 Product ,Age_Group,Customer_Gender, Sum(Profit) AS Profit_by_age_group
From BikeSales
Group By Product,Age_Group, Customer_Gender
Order by Profit_by_age_group desc

--- The most popular/profitable products and which age group likes it  
-- eg mountain 200 black is extremley popular among 25-34 and 35-64 with men

Select TOP 3 Product ,Customer_Gender, Sum(Profit) AS Profit_by_age_group
From BikeSales
Where Customer_Gender = 'M'
Group By Product, Customer_Gender
Order by Profit_by_age_group desc

Select TOP 3 Product ,Customer_Gender, Sum(Profit) AS Profit_by_age_group
From BikeSales
Where Customer_Gender = 'F'
Group By Product, Customer_Gender
Order by Profit_by_age_group desc

--- The most profitable products by gender each queries ran together
--- Women like the mountain 200

Select Customer_Gender , Age_Group, Sum(Profit) AS Profit
From BikeSales
Group By Customer_Gender , Age_Group
Order by Profit desc

-- Understanding which genders more profitable by age groups
--- Again 25-34 and 35-64 core demographic and the profit splits even between the genders
--- Youth and Seniors provide small profits in comparrison to these two

Select Country, Sum(Profit) AS Profit_By_Country
From BikeSales 
Group By Country
Order By Profit_By_Country desc

--- Profit by Country
--- USA the biggest market followed by Austrialia 

Select TOP 5  Age_Group,Country, Sum(Profit) AS Profit_By_Country
From BikeSales 
Group By Country, Age_Group
Order By Profit_By_Country desc

--- Checking the most profitable age groups across the world
--- USA's main profits come through Adults whereas Austrilla has an equal split

Select Product_Category , Sum(Profit) AS Profit_By_Product
From BikeSales
Group By Product_Category
Order By Profit_By_Product desc

--- Profit By Product Category
--- Unsurpsingly Bike Sales by far are the most profitable product

Select Sub_Category , Sum(Profit) AS Profit_Product
From BikeSales
Group by Sub_Category
Order By Profit_Product desc

--- Profit by Sub Ctegory
--- Road Bikes and Mountain Bikes are the most popular by a fine margin
--- Then it's acccesories linked to a bike eg helmets

Select Top 10  Product , Product_Category , Sub_Category , SUM(Profit) AS Profit_By_Product
From BikeSales
Group By Product , Product_Category , Sub_Category
Order By Profit_By_Product desc

-- Understanding the top 10 most profitable products
--- Majority of Mountain Bike sales come through Mountain 200 and Road 150 for Road Bikes

Select Sub_Category , Sum(Profit)AS Profit
From BikeSales
Where Sub_Category like '%Bike%'
Group By Sub_Category
Order By Profit desc

-- Comparing how popular/profitable the type of bikes
-- Road and Mountain bikes reign supreme but Touring bikes should be acknowledged

Select Product ,Sub_Category,  SUM(Profit)AS Profit_Check
From BikeSales
Group By Product , Sub_Category
Having SUM(Profit) <= 1000
Order By Profit_Check Asc

--- Understanding if theres any products with low or no profit

--Select Distinct Year, Product, Product_Category, Sub_Category , Profit
--From BikeSales 
--Where Cost > Revenue
--Order By Year , Profit desc

--- Seeing products that arent profitable ovet the years 
--- AWC Logo Cap and Short Sleeve Classic Jersery are continously unprofitable



--- KEY FINDINGS 

--- Bike Sales are on the rise yearly and advertising for bikes should begin in december and early summer/late spring

--- Bikes that should be advertised are Mountain 200 Series and Road 150 the most profitable Bikes
--- Putting Mountain and Road Bikes in customers view should be a pritoity for same reasons

--- Advertising should be markerted towards the Young Adults 25-34 and Adults 35-64 the key demographic of sales

--- Advertising should be mainly directed to the USA whilst also bringing a focus to Austrialla and UK to broaden the market

--- If there's room in budget a marketing campaign for touring bikes could garner a larger audience 

--- Alongside this the AWC Logo Cap and Short Sleeve Classic Jersery in all sizes should be discontinued they aren't profitable

--- END