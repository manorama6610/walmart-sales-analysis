# walmart-sales-analysis
## Project Overview

![Project Pipeline](https://github.com/manorama6610/walmart-sales-analysis/blob/main/walmart_project-piplelines.png)

This project is an end-to-end data analysis solution designed to extract critical business insights from Walmart sales data. We utilize Python for data processing and analysis, SQL for advanced querying, and structured problem-solving techniques to solve key business questions. The project is ideal for data analysts looking to develop skills in data manipulation, SQL querying, and data pipeline creation.

---

## Project Steps

### 1. Set Up the Environment
   - **Tools Used**: Visual Studio Code (VS Code), Python, SQL (MySQL and PostgreSQL)
   - **Goal**: Create a structured workspace within VS Code and organize project folders for smooth development and data handling.

### 2. Set Up Kaggle API
   - **API Setup**: Obtain your Kaggle API token from [Kaggle](https://www.kaggle.com/) by navigating to your profile settings and downloading the JSON file.
   - **Configure Kaggle**: 
      - Place the downloaded `kaggle.json` file in your local `.kaggle` folder.
      - Use the command `kaggle datasets download -d <dataset-path>` to pull datasets directly into your project.

### 3. Download Walmart Sales Data
   - **Data Source**: Use the Kaggle API to download the Walmart sales datasets from Kaggle.
   - **Dataset Link**: [Walmart Sales Dataset](https://www.kaggle.com/najir0123/walmart-10k-sales-datasets)
   - **Storage**: Save the data in the `data/` folder for easy reference and access.

### 4. Install Required Libraries and Load Data
   - **Libraries**: Install necessary Python libraries using:
     ```bash
     pip install pandas numpy sqlalchemy mysql-connector-python psycopg2
     ```
   - **Loading Data**: Read the data into a Pandas DataFrame for initial analysis and transformations.

### 5. Explore the Data
   - **Goal**: Conduct an initial data exploration to understand data distribution, check column names, types, and identify potential issues.
   - **Analysis**: Use functions like `.info()`, `.describe()`, and `.head()` to get a quick overview of the data structure and statistics.

### 6. Data Cleaning
   - **Remove Duplicates**: Identify and remove duplicate entries to avoid skewed results.
   - **Handle Missing Values**: Drop rows or columns with missing values if they are insignificant; fill values where essential.
   - **Fix Data Types**: Ensure all columns have consistent data types (e.g., dates as `datetime`, prices as `float`).
   - **Currency Formatting**: Use `.replace()` to handle and format currency values for analysis.
   - **Validation**: Check for any remaining inconsistencies and verify the cleaned data.

### 7. Feature Engineering
   - **Create New Columns**: Calculate the `Total Amount` for each transaction by multiplying `unit_price` by `quantity` and adding this as a new column.
   - **Enhance Dataset**: Adding this calculated field will streamline further SQL analysis and aggregation tasks.

### 8. Load Data into MySQL and PostgreSQL
   - **Set Up Connections**: Connect to MySQL and PostgreSQL using `sqlalchemy` and load the cleaned data into each database.
   - **Table Creation**: Set up tables in both MySQL and PostgreSQL using Python SQLAlchemy to automate table creation and data insertion.
   - **Verification**: Run initial SQL queries to confirm that the data has been loaded accurately.

### 9. SQL Analysis: Complex Queries and Business Problem Solving
   - **Business Problem-Solving**: Write and execute complex SQL queries to answer critical business questions, such as:
     - Revenue trends across branches and categories.
     - Identifying best-selling product categories.
     - Sales performance by time, city, and payment method.
     - Analyzing peak sales periods and customer buying patterns.
     - Profit margin analysis by branch and category.
   - **Documentation**: Keep clear notes of each query's objective, approach, and results.

### 10. Project Publishing and Documentation
   - **Documentation**: Maintain well-structured documentation of the entire process in Markdown or a Jupyter Notebook.
   - **Project Publishing**: Publish the completed project on GitHub or any other version control platform, including:
     - The `README.md` file (this document).
     - Jupyter Notebooks (if applicable).
     - SQL query scripts.
     - Data files (if possible) or steps to access them.

---

## Requirements

- **Python 3.8+**
- **SQL Databases**: MySQL, PostgreSQL
- **Python Libraries**:
  - `pandas`, `numpy`, `sqlalchemy`, `mysql-connector-python`, `psycopg2`
- **Kaggle API Key** (for data downloading)

## Getting Started

1. Clone the repository:
   ```bash
   git clone <repo-url>
   ```
2. Install Python libraries:
   ```bash
   pip install -r requirements.txt
   ```
3. Set up your Kaggle API, download the data, and follow the steps to load and analyze.

---

## Project Structure

```plaintext
|-- data/                     # Raw data and transformed data
|-- sql_queries/              # SQL scripts for analysis and queries
|-- notebooks/                # Jupyter notebooks for Python analysis
|-- README.md                 # Project documentation
|-- requirements.txt          # List of required Python libraries
|-- main.py                   # Main script for loading, cleaning, and processing data
```
---

## Results and Insights

### 💳 Payment Method Analysis (Q1 & Q4)
| Payment Method | Transactions |
|---------------|-------------|
| Credit Card | 4,256 |
| Ewallet | 3,881 |
| Cash | 1,832 |

- **Credit Card** is most preferred with 4,256 transactions (42.6%)
- **Cash** is least preferred — only 1,832 transactions (18.4%)
- Recommendation: Prioritize digital payment infrastructure

### ⭐ Category Ratings by Branch (Q2)
- Each branch shows different top-rated categories
- Rating analysis identifies customer satisfaction drivers 
  per location

### 📅 Busiest Days by Branch (Q3)
- Each branch has a distinct peak trading day
- Weekend transactions significantly higher than weekdays

### 🏙️ City & Category Rating Analysis (Q5)
- Rating variance analyzed across all cities and categories
- Identifies underperforming locations for targeted improvement

### 💰 Top Profitable Categories (Q6)
| Category | Total Profit |
|----------|-------------|
| Fashion Accessories | $192,314.89 |
| Home and Lifestyle | $192,213.64 |
| Electronic Accessories | $30,772.49 |

- **Fashion Accessories** most profitable at $192,314.89
- **Home and Lifestyle** closely follows at $192,213.64
- **Electronic Accessories** significantly lower at $30,772.49

### 🏪 Preferred Payment by Branch (Q7)
- Credit Card dominates across most branches
- Branch-level preferences guide targeted promotions

### ⏰ Sales Shift Analysis (Q8)
| Shift | Transactions |
|-------|-------------|
| Afternoon | 4,636 |
| Evening | 3,246 |
| Morning | 2,087 |

- **Afternoon** is peak period with 4,636 transactions
- **Morning** is slowest with only 2,087 transactions
- Staffing should be optimized for afternoon operations

### 📉 Top 5 Branches with Revenue Decline (Q9)
| Branch | 2022 Revenue | 2023 Revenue | Decrease % |
|--------|-------------|-------------|------------|
| WALM045 | $1,731 | $647 | 62.62% |
| WALM047 | $2,581 | $1,069 | 58.58% |
| WALM098 | $2,446 | $1,030 | 57.89% |
| WALM033 | $2,099 | $931 | 55.65% |
| WALM081 | $1,723 | $850 | 50.67% |

- **WALM045** showed highest decline of **62.62%**
- All 5 branches declined by more than **50%**
- Immediate intervention required for these locations

---

## 🔑 Key Business Recommendations
1. **Push Credit Card & Ewallet** — 81% prefer digital 
   payments, reduce cash handling costs
2. **Optimize afternoon staffing** — peak period with 
   4,636 transactions needs adequate resources  
3. **Invest in Fashion Accessories** — highest profit 
   at $192,314.89
4. **Investigate Electronic Accessories** — significant 
   profit gap vs top categories
5. **Urgent intervention for WALM045** — 62.62% revenue 
   decline is critical business risk

## Future Enhancements

Possible extensions to this project:
- Integration with a dashboard tool (e.g., Power BI or Tableau) for interactive visualization.
- Additional data sources to enhance analysis depth.
- Automation of the data pipeline for real-time data ingestion and analysis.

---

## License

This project is licensed under the MIT License. 

---

## Acknowledgments

- **Data Source**: Kaggle’s Walmart Sales Dataset
- **Inspiration**: Walmart’s business case studies on sales and supply chain optimization.

---
