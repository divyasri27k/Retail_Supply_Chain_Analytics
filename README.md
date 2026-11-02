# Retail Supply Chain Analytics

A MySQL-based business analytics project that analyzes purchase-order demand, warehouse ordering behavior, shipment performance, staff and vehicle performance, and shipment-related problems. The project uses operational data from six related datasets to understand business patterns, identify areas that may require improvement, and support better supply chain decisions.

Completed as part of the learning programme at **Innomatics Research Labs**.

## Table of Contents

- [Project Overview](#project-overview)
- [Business Scenario](#business-scenario)
- [Business Objectives](#business-objectives)
- [Dataset and Database](#dataset-and-database)
- [ER Diagram and Relationships](#er-diagram-and-relationships)
- [Tools and Technologies](#tools-and-technologies)
- [Key Analysis Areas](#key-analysis-areas)
- [Business Recommendations](#business-recommendations)
- [Repository Structure](#repository-structure)
- [How to Run](#how-to-run)
- [Acknowledgements](#acknowledgements)

## Project Overview

This project uses data from six related tables: **warehouses, suppliers, staff, vehicles, purchase_orders, and shipments**.

The project focuses on analyzing purchasing activity, warehouse operations, shipment delivery performance, and logistics resource utilization using MySQL and SQL queries.

The analysis helps understand purchase-order trends, compare warehouse ordering patterns, evaluate shipment statuses and transit duration, examine staff and vehicle usage, and identify shipment records that may need further investigation.

## Business Scenario

NorthPeak Retail Supply Co. is a retail supply chain business that manages product purchasing, warehouse operations, suppliers, staff, vehicles, and shipments.

The company receives products through purchase orders from different suppliers and manages its operations across multiple warehouses. Staff members and vehicles are involved in transporting shipments.

The company needs to understand its purchasing patterns, warehouse ordering activities, shipment performance, and delivery-related problems.

This project uses SQL queries to explore the available operational data and identify useful business patterns that can support better planning and decision-making.

## Business Objectives

The project focuses on five main business objectives.

### 1. Purchase Order Demand Analysis

- Analyze purchase-order volume across different product categories.
- Compare suppliers based on the number of purchase orders.
- Examine purchase-order demand across warehouses.
- Analyze order quantity and volume across different priority levels.
- Identify monthly purchase-order trends.
- Compare total purchase-order costs across product categories.

### 2. Warehouse Ordering Behavior

- Compare the number of purchase orders placed by each warehouse.
- Analyze total purchase-order costs across warehouses.
- Examine regional differences in ordering activity.
- Compare ordering patterns across different warehouse types.
- Calculate average order quantity for each warehouse.
- Analyze monthly ordering trends across warehouses.

### 3. Shipment Performance Analysis

- Analyze the distribution of delivered, delayed, damaged, and in-transit shipments.
- Compare suppliers based on shipment outcomes.
- Calculate average shipment transit duration.
- Identify warehouses with higher numbers of delayed shipments.
- Examine monthly shipment trends by status.
- Compare average transit duration across shipment statuses.

### 4. Staff and Vehicle Performance

- Compare the number of shipments handled by each staff member.
- Analyze average transit duration for staff-handled shipments.
- Examine shipment outcomes associated with staff members.
- Compare shipment usage across different vehicle types.
- Evaluate average transit duration across vehicle types.
- Analyze delayed and damaged shipment counts by vehicle type.

### 5. Shipment Problems Analysis

- Count shipment records with more than one recorded attempt.
- Analyze the distribution of shipment records by attempt number.
- Examine shipment statuses among records with repeated attempts.
- Compare warehouses based on repeated-attempt shipment records.
- Compare suppliers based on repeated-attempt shipment records.
- Analyze missing arrival dates by shipment status to identify records requiring review.

## Dataset and Database

The project uses six CSV datasets containing a total of **11,190 records**.

| Table | Records | Columns | Description |
|---|---:|---:|---|
| warehouses | 30 | 7 | Warehouse name, city, type, storage capacity, region, and opening date |
| suppliers | 150 | 6 | Supplier name, city, category, reliability rating, and contract date |
| staff | 120 | 6 | Staff name, hire date, rating, employment type, and active status |
| vehicles | 90 | 7 | Vehicle type, fuel type, payload capacity, depot, service date, and active status |
| purchase_orders | 5,000 | 8 | Warehouse, supplier, order date, product category, priority, quantity, and total cost |
| shipments | 5,800 | 10 | Purchase order, staff, vehicle, dispatch and arrival dates, status, attempts, distance, and transit duration |

**Total:** 11,190 records across 6 tables.

### Dataset Relationships

The six tables are connected through primary keys and foreign keys to support relational analysis.

## ER Diagram and Relationships

| Relationship | Type | Description |
|---|---|---|
| Warehouses to Purchase Orders | 1:M | One warehouse can have many purchase orders |
| Suppliers to Purchase Orders | 1:M | One supplier can be associated with many purchase orders |
| Purchase Orders to Shipments | 1:M | One purchase order can have multiple shipment records |
| Staff to Shipments | 1:M | One staff member can handle many shipment records |
| Vehicles to Shipments | 1:M | One vehicle can be used for many shipment records |
| Warehouses to Vehicles | 1:M | One warehouse can be the depot for multiple vehicles |

### Keys

| Table | Primary Key | Foreign Keys |
|---|---|---|
| warehouses | warehouse_id | None |
| suppliers | supplier_id | None |
| staff | staff_id | None |
| vehicles | vehicle_id | depot_warehouse_id |
| purchase_orders | po_id | warehouse_id, supplier_id |
| shipments | shipment_id | po_id, staff_id, vehicle_id |

The ER diagram represents how the six tables are connected and how information can be retrieved from multiple tables using SQL JOIN operations.

## Tools and Technologies

- **MySQL:** Database creation, table management, data import, and analysis.
- **SQL:** Data retrieval, filtering, aggregation, grouping, joining, and business analysis.
- **CSV:** Source format for the six datasets.
- **MySQL Workbench:** Database management and SQL query execution.
- **Microsoft PowerPoint:** Project presentation and explanation of analysis.

## Key Analysis Areas

The project explores the following business areas using SQL queries:

### Purchase Order Demand

- Purchase-order volume by product category.
- Supplier-wise and warehouse-wise order distribution.
- Order priority and monthly demand patterns.
- Purchase-order spending across product categories.

### Warehouse Ordering Behavior

- Warehouse-wise purchase-order counts.
- Warehouse-wise procurement costs.
- Regional and warehouse-type comparisons.
- Average order quantity and monthly ordering patterns.

### Shipment Performance

- Shipment status distribution.
- Supplier-wise shipment outcomes.
- Average transit duration.
- Warehouse-wise delayed shipments.
- Monthly shipment trends.

### Staff and Vehicle Performance

- Staff-wise shipment assignments.
- Staff-wise shipment outcomes and transit duration.
- Vehicle-type usage.
- Vehicle-wise transit duration and shipment problems.

### Shipment Problems

- Repeated shipment attempts.
- Shipment status patterns across attempts.
- Warehouse-wise and supplier-wise repeated attempts.
- Missing arrival-date records.

**Note:** The above points describe the analysis performed by the project. Add exact numerical findings after verifying the corresponding SQL query outputs.

## Business Recommendations

Based on the analysis areas, the company can consider the following actions:

- Monitor purchase-order demand across product categories and suppliers to support better purchasing plans.
- Review warehouses with unusually high or low ordering activity.
- Use monthly ordering trends to support warehouse procurement planning.
- Monitor shipment status and transit duration to identify delivery performance issues.
- Investigate suppliers and warehouses associated with higher delayed or damaged shipment counts.
- Review staff workload and shipment assignments for better resource planning.
- Evaluate vehicle utilization and maintenance information when planning transport operations.
- Investigate shipments with repeated attempts to understand possible delivery difficulties.
- Review missing arrival-date records to improve shipment data quality.

These recommendations are intended as possible improvement areas. Their effectiveness would need to be evaluated using additional operational data and follow-up analysis.

## Repository Structure

```text
Retail-Supply-Chain-Analytics/
│
├── Datafiles/
│   ├── warehouses.csv
│   ├── suppliers.csv
│   ├── staff.csv
│   ├── vehicles.csv
│   ├── purchase_orders.csv
│   └── shipments.csv
│
├── Retail_Supply_Chain_Analytics_Project.pptx
├── Retail_Supply_Chain_documentation.docx
├── db_creation.sql
├── data_exploration.sql
├── objective_4_1.sql
├── objective_4_2.sql
├── objective_4_3.sql
├── objective_4_4.sql
├── objective_4_5.sql
└── README.md
```



## How to Run

1. Install MySQL and a database client such as MySQL Workbench.
2. Download or clone this project repository.
3. Open MySQL Workbench and connect to your MySQL server.
4. Run `db_creation.sql` to create the database and tables.
5. Import the six CSV files into their corresponding tables.
6. Run `data_exploration.sql` to understand and validate the imported data.
7. Execute the SQL files for the five business objectives.
8. Review the query outputs and interpret the results.

## Acknowledgements

I would like to thank **Innomatics Research Labs** for providing the project opportunity and datasets.

This individual project helped me improve my understanding of MySQL, relational database design, SQL querying, and business data analysis.

---

**Project:** Retail Supply Chain Analytics  
**Technology:** MySQL and SQL  
**Project Type:** Individual Project  
**Author:** C. Divya Sri  
**Learning Programme:** Innomatics Research Labs
