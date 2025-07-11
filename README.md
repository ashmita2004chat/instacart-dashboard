# 🛒 Instacart Analytics: Orders, Reorders & Customer Insights 📊📆

This project delivers an end-to-end data analysis and dashboard solution using the **Instacart Online Grocery Shopping Dataset**. The goal is to uncover behavioral patterns in customer purchases, reorder tendencies, and departmental preferences through structured querying and powerful data visualization.

---

## 📂 Dataset Source

The dataset was sourced from **[Kaggle - Instacart Market Basket Analysis](https://www.kaggle.com/c/instacart-market-basket-analysis/data)**.
It includes data on:

* 3 million+ grocery orders
* 200K+ unique users
* Products, departments, and aisles

---

## 📄 Tools Used

* **MySQL** – for data storage and querying
* **Power BI** – for building the interactive dashboard
* **DAX (Data Analysis Expressions)** – for deriving KPIs and custom measures

---

## 📅 Data Processing in MySQL

1. **Imported CSV files** into MySQL using `LOAD DATA INFILE` or Workbench import tools.
2. **Created and related the tables** using foreign keys:

   * `orders`, `order_products__prior`, `order_products__train`
   * `products`, `departments`, `aisles`, `users`
3. **Pre-joined key datasets** using SQL joins and CTEs:

   * Combined prior and train order data
   * Aggregated user-wise total orders and total items
4. **Exported the cleaned and joined tables** as `.csv` for Power BI use.

---

## 📊 Dashboard Development in Power BI

### ⚙️ KPIs

* 👤 **Total Unique Users**: 63K
* 📦 **Total Orders**: 1M
* 🌎 **Most Active Day**: Sunday

### 📈 Visuals

| Visual Type        | Description                                                           |
| ------------------ | --------------------------------------------------------------------- |
| Bar Chart          | Top 10 Most Reordered Products                                        |
| Scatter Plot       | Reorder Ratio vs Order Count                                          |
| Bar Chart          | Most Frequently Shopped Aisles                                        |
| Line Chart         | Weekly Ordering Pattern                                               |
| Donut Chart        | Loyalty Category Breakdown                                            |
| Combo Chart        | Department-wise Orders & Reorders                                     |
| KPI Cards          | User Count, Order Count, Most Active Day                              |
| Decomposition Tree | Order breakdown by Day, Department, Reorder, Loyalty                  |
| Table              | User Activity Summary (Orders, Items, Avg. Items/Order, Reorder Rate) |

---

## 📒 Page-wise Layout

### 📄 Page 1: Overview Dashboard

* Visualizes product reorder trends, aisle popularity, and user loyalty patterns
* Highlights fresh produce as top category
* Identifies Sunday as peak order day

### 📔 Page 2: Decomposition Tree

* Breaks down total orders by order day, department, reorder status, and loyalty
* Shows deeper patterns in beverage and dairy reordering by loyalty category

---

## 🔍 Insights Derived

* 🍌 **Banana** is the most reordered item
* 🥝 **Fresh fruits and vegetables** dominate user demand
* ⏰ **Sunday** is the most active shopping day
* 🤝 High loyalty users tend to reorder more consistently
* 🍼 **Dairy & Beverages** departments show higher reorder rates

---

## 🚀 Conclusion

This Instacart analytics dashboard effectively combines MySQL-driven data processing with interactive Power BI storytelling. It enables a detailed understanding of customer behavior and product movement, empowering data-driven decisions in marketing, inventory, and customer retention.

---

## 👩‍💼 Author

**Ashmita Chatterjee**
MSc Economics, Symbiosis School of Economics
Kolkata → Pune

---

Feel free to explore the `.pbix` file and the supporting SQL queries in this repository!

