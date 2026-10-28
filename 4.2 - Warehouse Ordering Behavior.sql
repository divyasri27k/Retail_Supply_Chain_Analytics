use retail_supply_chain;
-- 1. How many purchase orders does each warehouse place?
SELECT w.warehouse_name,
COUNT(p.po_id) AS total_orders
FROM warehouses w
LEFT JOIN purchase_orders p
ON w.warehouse_id = p.warehouse_id
GROUP BY w.warehouse_id, w.warehouse_name
ORDER BY total_orders DESC;
-- 2. What is the total purchase-order cost for each warehouse?
SELECT w.warehouse_name,SUM(p.total_cost) AS total_order_cost
FROM warehouses w
JOIN purchase_orders p
ON w.warehouse_id = p.warehouse_id
GROUP BY w.warehouse_id, w.warehouse_name
ORDER BY total_order_cost DESC;
-- 3. Which region has the highest number of purchase orders?
SELECT w.region,
COUNT(p.po_id) AS total_orders
FROM warehouses w
JOIN purchase_orders p
ON w.warehouse_id = p.warehouse_id
GROUP BY w.region
ORDER BY total_orders DESC;
-- 4. How does ordering activity differ by warehouse type?
SELECT w.warehouse_type,
COUNT(p.po_id) AS total_orders,
SUM(p.total_cost) AS total_order_cost
FROM warehouses w
LEFT JOIN purchase_orders p
ON w.warehouse_id = p.warehouse_id
GROUP BY w.warehouse_type
ORDER BY total_orders DESC;
-- 5. Which warehouses have the highest average order quantity?
SELECT w.warehouse_name,
AVG(p.quantity_ordered) AS avg_order_quantity
FROM warehouses w
JOIN purchase_orders p
ON w.warehouse_id = p.warehouse_id
GROUP BY w.warehouse_id, w.warehouse_name
ORDER BY avg_order_quantity DESC;
-- 6. How does warehouse ordering activity change each month?
SELECT
    w.warehouse_name,
    DATE_FORMAT(p.order_date, '%Y-%m') AS order_month,
    COUNT(p.po_id) AS total_orders
FROM warehouses w
JOIN purchase_orders p
    ON w.warehouse_id = p.warehouse_id
GROUP BY
    w.warehouse_id,
    w.warehouse_name,
    DATE_FORMAT(p.order_date, '%Y-%m')
ORDER BY order_month, total_orders DESC;
