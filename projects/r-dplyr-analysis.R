# DSS 665 | R Package Presentation
# dplyr: Seven Coffee Shop Sales Analyses

# Data: Coffee Shop Sales (Maven Analytics Data Playground)
# Source: https://mavenanalytics.io/data-playground/coffee-shop-sales

# Install the dplyr package only once:
#install.packages("dplyr")

library(dplyr)

# Import the dataset

sales <- read.csv("C:/Users/marti/OneDrive/Documents/DSS 665 R Programming/Lecture Datasets/Coffee_Shop_Sales.csv", header = TRUE)

# View the dataset

head (sales)

dim(sales)

names(sales)

# 1. Find products costing more than $4
# Function: filter()
# Explanation: Find transactions with products costing more than $4.

filter(sales, unit_price > 4)


# 2. Find all coffee purchases
# Function: filter()
# Explanation: Keep transactions from the Coffee category only.

filter(sales, product_category == "Coffee")


# 3. Calculate revenue for each transaction
# Function: mutate()
# Explanation: Multiply price by quantity to create a revenue column.

mutate(sales, revenue = unit_price * transaction_qty)


# 4. Find total revenue by product category
# Functions: mutate(), group_by(), summarise()
# Explanation: Group transactions by category and sum revenue.

summarise(
  group_by(
    mutate(sales, revenue = unit_price * transaction_qty),
    product_category
  ),
  total_revenue = sum(revenue)
)


# 5. Find average price by product category
# Functions: group_by(), summarise()
# Explanation: Average the unit prices within each category.

summarise(
  group_by(sales, product_category),
  average_price = round(mean(unit_price), 2)
)



# 6. Find best-selling products by quantity
# Functions: group_by(), summarise(), arrange(), desc()
# Explanation: Sum units sold by product, highest first.

arrange(
  summarise(
    group_by(sales, product_detail),
    units_sold = sum(transaction_qty)
  ),
  desc(units_sold)
)


# 7. Compare total units sold across coffee shop locations
# Functions: group_by(), summarise()
# Explanation: Total the number of items sold at each store.

summarise(
  group_by(sales, store_location),
  total_units = sum(transaction_qty)
)


