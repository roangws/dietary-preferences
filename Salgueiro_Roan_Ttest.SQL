# Roan G W Salgueiro 
# Selecting the price and sum all the diet preferences, make it proportional to price and make a test with the price Version 2 - Explained
# Formula used: --------> t -test = (sample mean 1 – sample mean 2)/[ sqrt ( s1^2/n1 + s2^2/n2) ] <--------
# I have 2 query, one explained with details and one with the final result

# Select the X and Y
SELECT 
# X
(vegan + glutenfree + ketofriendly + vegetarian + organic + dairyfree + sugarconscious + paleofriendly + wholefoodsdiet + lowsodium + kosher + lowfat + engine2) as X,
# X proportion
(price-((price/13)*(vegan + glutenfree + ketofriendly + vegetarian + organic + dairyfree + sugarconscious + paleofriendly + wholefoodsdiet + lowsodium + kosher + lowfat + engine2))) as 'x proportion',
# Y
case when price = 0 then - 1 else price end as Y,

#X-Y
(price-((price/13)*(vegan + glutenfree + ketofriendly + vegetarian + organic + dairyfree + sugarconscious + paleofriendly + wholefoodsdiet + lowsodium + kosher + lowfat + engine2))) -
case when price = 0 then - 1 else price end as 'X - Y', 

#X-Y Total
(SELECT sum((price-((price/13)*(vegan + glutenfree + ketofriendly + vegetarian + organic + dairyfree + sugarconscious + paleofriendly + wholefoodsdiet + lowsodium + kosher + lowfat + engine2))) -
case when price = 0 then - 1 else price end)
FROM ddmban_data
WHERE (category = 'Dairy and Eggs' or category = 'Produce' or category = 'Meat' or category = 'Prepared Foods' or category = 'Bread Rolls & Bakery' or category = 'Desserts' or category = 'supplements' or category = 'Frozen Foods' or category = 'Beverages')
and price > 0) as 'X - Y Total',

#X2
POWER((price-((price/13)*(vegan + glutenfree + ketofriendly + vegetarian + organic + dairyfree + sugarconscious + paleofriendly + wholefoodsdiet + lowsodium + kosher + lowfat + engine2))),2) as 'X2',

#X2 Total
(SELECT SUM(POWER((price-((price/13)*(vegan + glutenfree + ketofriendly + vegetarian + organic + dairyfree + sugarconscious + paleofriendly + wholefoodsdiet + lowsodium + kosher + lowfat + engine2))),2))
FROM ddmban_data
WHERE (category = 'Dairy and Eggs' or category = 'Produce' or category = 'Meat' or category = 'Prepared Foods' or category = 'Bread Rolls & Bakery' or category = 'Desserts' or category = 'supplements' or category = 'Frozen Foods' or category = 'Beverages')
and price > 0) 'X 2 Total',

#Y2
POWER(price,2) as 'Y2',


#Y2 Total
(SELECT SUM(POWER(price,2))
FROM ddmban_data
WHERE (category = 'Dairy and Eggs' or category = 'Produce' or category = 'Meat' or category = 'Prepared Foods' or category = 'Bread Rolls & Bakery' or category = 'Desserts' or category = 'supplements' or category = 'Frozen Foods' or category = 'Beverages')
and price > 0) as 'Y 2 Total',

#SQRT X2 total + Y2 total / N

(SELECT SQRT(
# x2 total
#POWER((price-((price/13)*(vegan + glutenfree + ketofriendly + vegetarian + organic + dairyfree + sugarconscious + paleofriendly + wholefoodsdiet + lowsodium + kosher + lowfat + engine2))),2) + 
((SELECT SUM(POWER((price-((price/13)*(vegan + glutenfree + ketofriendly + vegetarian + organic + dairyfree + sugarconscious + paleofriendly + wholefoodsdiet + lowsodium + kosher + lowfat + engine2))),2))
FROM ddmban_data
WHERE (category = 'Dairy and Eggs' or category = 'Produce' or category = 'Meat' or category = 'Prepared Foods' or category = 'Bread Rolls & Bakery' or category = 'Desserts' or category = 'supplements' or category = 'Frozen Foods' or category = 'Beverages')
and price > 0)

# More
+

# y2 Total
(SELECT SUM(POWER(price,2))
FROM ddmban_data
WHERE (category = 'Dairy and Eggs' or category = 'Produce' or category = 'Meat' or category = 'Prepared Foods' or category = 'Bread Rolls & Bakery' or category = 'Desserts' or category = 'supplements' or category = 'Frozen Foods' or category = 'Beverages')
and price > 0
LIMIT 1) )
#Divide by N
/
(SELECT count(*)
FROM ddmban_data
WHERE (category = 'Dairy and Eggs' or category = 'Produce' or category = 'Meat' or category = 'Prepared Foods' or category = 'Bread Rolls & Bakery' or category = 'Desserts' or category = 'supplements' or category = 'Frozen Foods' or category = 'Beverages')
and price > 0)
)
FROM ddmban_data
WHERE (category = 'Dairy and Eggs' or category = 'Produce' or category = 'Meat' or category = 'Prepared Foods' or category = 'Bread Rolls & Bakery' or category = 'Desserts' or category = 'supplements' or category = 'Frozen Foods' or category = 'Beverages')
and price > 0
Limit 1) as 'SQRT X2 + Y2 total / N',


#X - Y Total/ SQRT ((X2 total + Y2 total) / N)
(SELECT sum((price-((price/13)*(vegan + glutenfree + ketofriendly + vegetarian + organic + dairyfree + sugarconscious + paleofriendly + wholefoodsdiet + lowsodium + kosher + lowfat + engine2))) -
case when price = 0 then - 1 else price end)/

#SQRT
(SELECT SQRT(
# x2 total
#POWER((price-((price/13)*(vegan + glutenfree + ketofriendly + vegetarian + organic + dairyfree + sugarconscious + paleofriendly + wholefoodsdiet + lowsodium + kosher + lowfat + engine2))),2) + 
((SELECT SUM(POWER((price-((price/13)*(vegan + glutenfree + ketofriendly + vegetarian + organic + dairyfree + sugarconscious + paleofriendly + wholefoodsdiet + lowsodium + kosher + lowfat + engine2))),2))
FROM ddmban_data
WHERE (category = 'Dairy and Eggs' or category = 'Produce' or category = 'Meat' or category = 'Prepared Foods' or category = 'Bread Rolls & Bakery' or category = 'Desserts' or category = 'supplements' or category = 'Frozen Foods' or category = 'Beverages')
and price > 0)

# More
+

# y2 Total
(SELECT SUM(POWER(price,2))
FROM ddmban_data
WHERE (category = 'Dairy and Eggs' or category = 'Produce' or category = 'Meat' or category = 'Prepared Foods' or category = 'Bread Rolls & Bakery' or category = 'Desserts' or category = 'supplements' or category = 'Frozen Foods' or category = 'Beverages')
and price > 0
LIMIT 1) )
#Divide by N
/
(SELECT count(*)
FROM ddmban_data
WHERE (category = 'Dairy and Eggs' or category = 'Produce' or category = 'Meat' or category = 'Prepared Foods' or category = 'Bread Rolls & Bakery' or category = 'Desserts' or category = 'supplements' or category = 'Frozen Foods' or category = 'Beverages')
and price > 0)
)
FROM ddmban_data
WHERE (category = 'Dairy and Eggs' or category = 'Produce' or category = 'Meat' or category = 'Prepared Foods' or category = 'Bread Rolls & Bakery' or category = 'Desserts' or category = 'supplements' or category = 'Frozen Foods' or category = 'Beverages')
and price > 0
Limit 1)
FROM ddmban_data
WHERE (category = 'Dairy and Eggs' or category = 'Produce' or category = 'Meat' or category = 'Prepared Foods' or category = 'Bread Rolls & Bakery' or category = 'Desserts' or category = 'supplements' or category = 'Frozen Foods' or category = 'Beverages')
and price > 0) as 'X - Y / SQRT ((X2 total + Y2 total) / N)'


FROM ddmban_data
WHERE (category = 'Dairy and Eggs' or category = 'Produce' or category = 'Meat' or category = 'Prepared Foods' or category = 'Bread Rolls & Bakery' or category = 'Desserts' or category = 'supplements' or category = 'Frozen Foods' or category = 'Beverages')
and price > 0
and price < 59900
;


######################################### End

# Selecting the price and sum all the diet preferences Version 2 - Reumed

#X - Y Total/ SQRT ((X2 total + Y2 total) / N)
Select
(SELECT sum((price-((price/13)*(vegan + glutenfree + ketofriendly + vegetarian + organic + dairyfree + sugarconscious + paleofriendly + wholefoodsdiet + lowsodium + kosher + lowfat + engine2))) -
case when price = 0 then - 1 else price end)/

#SQRT
(SELECT SQRT(
# x2 total
#POWER((price-((price/13)*(vegan + glutenfree + ketofriendly + vegetarian + organic + dairyfree + sugarconscious + paleofriendly + wholefoodsdiet + lowsodium + kosher + lowfat + engine2))),2) + 
((SELECT SUM(POWER((price-((price/13)*(vegan + glutenfree + ketofriendly + vegetarian + organic + dairyfree + sugarconscious + paleofriendly + wholefoodsdiet + lowsodium + kosher + lowfat + engine2))),2))
FROM ddmban_data
WHERE (category = 'Dairy and Eggs' or category = 'Produce' or category = 'Meat' or category = 'Prepared Foods' or category = 'Bread Rolls & Bakery' or category = 'Desserts' or category = 'supplements' or category = 'Frozen Foods' or category = 'Beverages')
and price > 0)

# More
+

# y2 Total
(SELECT SUM(POWER(price,2))
FROM ddmban_data
WHERE (category = 'Dairy and Eggs' or category = 'Produce' or category = 'Meat' or category = 'Prepared Foods' or category = 'Bread Rolls & Bakery' or category = 'Desserts' or category = 'supplements' or category = 'Frozen Foods' or category = 'Beverages')
and price > 0
LIMIT 1) )
#Divide by N
/
(SELECT count(*)
FROM ddmban_data
WHERE (category = 'Dairy and Eggs' or category = 'Produce' or category = 'Meat' or category = 'Prepared Foods' or category = 'Bread Rolls & Bakery' or category = 'Desserts' or category = 'supplements' or category = 'Frozen Foods' or category = 'Beverages')
and price > 0)
)
FROM ddmban_data
WHERE (category = 'Dairy and Eggs' or category = 'Produce' or category = 'Meat' or category = 'Prepared Foods' or category = 'Bread Rolls & Bakery' or category = 'Desserts' or category = 'supplements' or category = 'Frozen Foods' or category = 'Beverages')
and price > 0
Limit 1)
FROM ddmban_data
WHERE (category = 'Dairy and Eggs' or category = 'Produce' or category = 'Meat' or category = 'Prepared Foods' or category = 'Bread Rolls & Bakery' or category = 'Desserts' or category = 'supplements' or category = 'Frozen Foods' or category = 'Beverages')
and price > 0) as 'T-Test',

Case
When
#aqi vai a funcao
(SELECT sum((price-((price/13)*(vegan + glutenfree + ketofriendly + vegetarian + organic + dairyfree + sugarconscious + paleofriendly + wholefoodsdiet + lowsodium + kosher + lowfat + engine2))) -
case when price = 0 then - 1 else price end)/

#SQRT
(SELECT SQRT(
# x2 total
#POWER((price-((price/13)*(vegan + glutenfree + ketofriendly + vegetarian + organic + dairyfree + sugarconscious + paleofriendly + wholefoodsdiet + lowsodium + kosher + lowfat + engine2))),2) + 
((SELECT SUM(POWER((price-((price/13)*(vegan + glutenfree + ketofriendly + vegetarian + organic + dairyfree + sugarconscious + paleofriendly + wholefoodsdiet + lowsodium + kosher + lowfat + engine2))),2))
FROM ddmban_data
WHERE (category = 'Dairy and Eggs' or category = 'Produce' or category = 'Meat' or category = 'Prepared Foods' or category = 'Bread Rolls & Bakery' or category = 'Desserts' or category = 'supplements' or category = 'Frozen Foods' or category = 'Beverages')
and price > 0)

# More
+

# y2 Total
(SELECT SUM(POWER(price,2))
FROM ddmban_data
WHERE (category = 'Dairy and Eggs' or category = 'Produce' or category = 'Meat' or category = 'Prepared Foods' or category = 'Bread Rolls & Bakery' or category = 'Desserts' or category = 'supplements' or category = 'Frozen Foods' or category = 'Beverages')
and price > 0
LIMIT 1) )
#Divide by N
/
(SELECT count(*)
FROM ddmban_data
WHERE (category = 'Dairy and Eggs' or category = 'Produce' or category = 'Meat' or category = 'Prepared Foods' or category = 'Bread Rolls & Bakery' or category = 'Desserts' or category = 'supplements' or category = 'Frozen Foods' or category = 'Beverages')
and price > 0)
)
FROM ddmban_data
WHERE (category = 'Dairy and Eggs' or category = 'Produce' or category = 'Meat' or category = 'Prepared Foods' or category = 'Bread Rolls & Bakery' or category = 'Desserts' or category = 'supplements' or category = 'Frozen Foods' or category = 'Beverages')
and price > 0
Limit 1)
FROM ddmban_data
WHERE (category = 'Dairy and Eggs' or category = 'Produce' or category = 'Meat' or category = 'Prepared Foods' or category = 'Bread Rolls & Bakery' or category = 'Desserts' or category = 'supplements' or category = 'Frozen Foods' or category = 'Beverages')
and price > 0)
 >= 0.05
then "H0= dietary preferences do not effect price"
else "H1= dietary preferences do effect price"
end as "Conclusion"

FROM ddmban_data
WHERE (category = 'Dairy and Eggs' or category = 'Produce' or category = 'Meat' or category = 'Prepared Foods' or category = 'Bread Rolls & Bakery' or category = 'Desserts' or category = 'supplements' or category = 'Frozen Foods' or category = 'Beverages')
# clean the outliers
and price > 0
and price < 59900
Limit 1
;