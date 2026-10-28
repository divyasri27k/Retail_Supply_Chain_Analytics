USE retail_supply_chain;
-- 1. How many warehouses are there?
SELECT COUNT(*) AS total_warehouses
FROM warehouses;
-- 2.How many purchase orders are there?
SELECT COUNT(*) AS total_purchase_orders
FROM purchase_orders;
-- 3.How many shipment records are there?
SELECT COUNT(*) AS total_shipments
FROM shipments;
-- 4.What product categories have been ordered?
SELECT product_category,COUNT(*) AS total_orders
FROM purchase_orders
GROUP BY product_category
ORDER BY total_orders DESC;
-- 5.How many staff members are active?
SELECT is_active, COUNT(*) AS total_staff
FROM staff
GROUP BY is_active;
-- To see the actual values in  data
SELECT DISTINCT is_active
FROM staff;
-- 6.What vehicle types are available?
SELECT vehicle_type, COUNT(*) AS total_vehicles
FROM vehicles
GROUP BY vehicle_type
ORDER BY total_vehicles DESC;
-- 7.What is the total purchase-order cost?
SELECT SUM(total_cost) AS total_purchase_order_cost
FROM purchase_orders;
-- 8.What is the average quantity ordered?
SELECT AVG(quantity_ordered) AS average_quantity_ordered
FROM purchase_orders;