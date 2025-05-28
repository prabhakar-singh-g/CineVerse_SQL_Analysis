# CineVerse: SQL-Based Movie Streaming Analysis

![MIT License](https://img.shields.io/badge/License-MIT-green.svg)
![MySQL](https://img.shields.io/badge/Database-MySQL-blue)
![SQL](https://img.shields.io/badge/Language-SQL-orange)
![Project Level](https://img.shields.io/badge/Difficulty-Beginner--to--Advanced-yellow)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

**CineVerse** is a simulated movie streaming platform designed to demonstrate practical SQL-based data analysis. The project ranges from database design to advanced business queries, generating insights around user activity, content trends, and revenue patterns.

---

## 📊 Project Overview

This project replicates the backend of an OTT platform using MySQL and includes:

- 🎯 A fully normalized relational schema with 5 connected tables  
- 🧠 12 thoughtfully constructed SQL queries (basic to advanced)  
- 📈 Insights into revenue, content performance, and user behavior  
- 🔍 Strong focus on clean, business-relevant query writing  

---

## 🧱 Database Schema

| Table          | Description                              |
| -------------- | ---------------------------------------- |
| `User`         | User profiles and registration details   |
| `Movie`        | Movie metadata (genre, rating, etc.)     |
| `WatchHistory` | User viewing activity                    |
| `Subscription` | Subscription plans and payment records   |
| `Review`       | User-generated ratings and reviews       |

> 📌 Refer to **[EER_Diagram.png](EER_Diagram.png)** for a visual representation.

---

## 🗂️ Project Structure

```
movie-streaming-sql-analysis/
├── CineVerse_CreateTables.sql   # SQL schema creation (DDL)
├── CineVerse_Queries.sql        # SQL queries with detailed explanations
├── EER_Diagram.png              # Entity-Relationship Diagram
├── Questions.pdf                # List of SQL questions
├── CineVerse_Dataset.zip        # Sample dataset (CSV files)
├── LICENSE                      # MIT License file
└── README.md                    # Project documentation
```

---

## 📌 SQL Query Breakdown

- ✅ 4 Basic queries  
- ✅ 5 Intermediate queries  
- ✅ 3 Advanced queries  

The queries involve key SQL concepts like:  
- `JOIN`s & `GROUP BY`  
- Aggregate functions  
- Window functions (`RANK`, `ROW_NUMBER`)  
- Common Table Expressions (CTEs)

> 🔍 See **[Questions.pdf](Questions.pdf)** for the problem statements.

---

## 🔧 Tools & Technologies

- 💾 **MySQL** — core relational database  
- 🧰 **MySQL Workbench** — for modeling and querying  
- 🧠 **SQL** — used for DDL, DML & business analysis  
- 🖼️ **EER Diagram** — schema design visualization  

---

## 📥 How to Get Started

1. Clone this repository  
2. Open `CineVerse_CreateTables.sql` in MySQL Workbench  
3. Use the "Table Data Import Wizard" to load CSVs from `CineVerse_Dataset.zip`  
4. Run `CineVerse_Queries.sql` to explore the insights  

---

## 👨‍💻 Author

**Prabhakar Singh**  
SQL | Data Analytics | Business Intelligence  
🔗 [GitHub: prabhakar-singh-g](https://github.com/prabhakar-singh-g)

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

> ✅ **Ideal for portfolio building, resume enhancement, and interview preparation for Data Analyst / BI roles.**
