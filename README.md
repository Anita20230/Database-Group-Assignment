
# BookStore Database System

![ER Diagram](/docs/ER_Diagram.png)

## 📚 Project Overview
MySQL database for managing bookstore operations including:
- Book/author/publisher catalog
- Customer orders and shipping
- Multi-address customer profiles
- Kenyan market specialization

## 🛠 Setup Instructions

### 1. Database Installation
```bash
mysql -u root -p < sql/schema.sql
mysql -u root -p BookStore < sql/sample_data.sql
```

### 2. User Accounts
| Role             | Username              | Password       | Access Level           |
|------------------|-----------------------|----------------|------------------------|
| Admin           | `manager@localhost`   | `BOOKPASS010`  | Full database control  |
| Staff Clerk     | `clerk@localhost`     | `staffpass456` | Order management       |
| Report Lead     | `report_lead@localhost`| `repo_456`    | Read-only analytics    |

**Password Rotation Policy:**
- Admin: Monthly
- Staff: Weekly
- Reports: Quarterly

## 📊 Sample Queries

### Kenyan Sales Report
```sql
SELECT 
    c.first_name, c.last_name,
    b.title, 
    SUM(ol.quantity * b.price) AS total_spent
FROM cust_order co
JOIN customer c ON co.customer_id = c.customer_id
JOIN order_line ol ON co.order_id = ol.order_id
JOIN book b ON ol.book_id = b.book_id
WHERE c.customer_id BETWEEN 10006 AND 10010  -- Kenyan customers
GROUP BY c.customer_id, b.book_id;
```

### Inventory Check
```sql
SELECT 
    b.title,
    p.name AS publisher,
    COUNT(ol.line_id) AS times_ordered
FROM book b
JOIN publisher p ON b.publisher_id = p.publisher_id
LEFT JOIN order_line ol ON b.book_id = ol.book_id
GROUP BY b.book_id
ORDER BY times_ordered DESC;
```

## 📁 File Structure
```
schema.sql          # All 15 table definitions
sample_data.sql     # Test data (including Kenyan entries)
bookstore_progress.sql # Save progress
kenyan_data.csv # Generated report
kenyan_queries.sql #Queries specifically for Kenyan data
/docs
  ER_Diagram.drawio   # Visual schema
  ER_Diagram.png      # Exported diagram
  ER_Diagram.pdf      # Exported pdf diagram
```

## 👥 Team
- Marks Abuto - Database Design
- Anita Mwangi - Order System
- Misheck Kamuya - User Management

📅 **Due:** 13/04/2025 11:59 pm EAT
```

### Key Features:
1. **Ready-to-Run** - Includes direct SQL commands
2. **Role-Based Access** - Clear permission matrix
3. **Localized Examples** - Kenyan-focused queries
4. **Maintenance Ready** - Backup/security instructions

