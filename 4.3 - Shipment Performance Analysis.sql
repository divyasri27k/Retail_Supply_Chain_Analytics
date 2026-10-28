use retail_supply_chain;
-- 1. How many shipments are there for each shipment status?
SELECT status,
COUNT(*) AS total_shipments
FROM shipments
GROUP BY status
ORDER BY total_shipments DESC;
-- 2. Which suppliers have the highest numbers of delayed or damaged shipments?
SELECT
    s.supplier_name,
    COUNT(sh.shipment_id) AS problem_shipments
FROM suppliers s
JOIN purchase_orders p
    ON s.supplier_id = p.supplier_id
JOIN shipments sh
    ON p.po_id = sh.po_id
WHERE sh.status IN ('Delayed', 'Damaged')
GROUP BY s.supplier_id, s.supplier_name
ORDER BY problem_shipments DESC;
-- 3. What is the average transit duration for shipments?
SELECT 
    AVG(transit_duration_hrs) AS avg_transit_hours
FROM
    shipments;
-- 4. Which warehouses have the highest number of delayed shipments?
SELECT
    w.warehouse_name,
    COUNT(sh.shipment_id) AS delayed_shipments
FROM warehouses w
JOIN purchase_orders p
    ON w.warehouse_id = p.warehouse_id
JOIN shipments sh
    ON p.po_id = sh.po_id
WHERE sh.status = 'Delayed'
GROUP BY w.warehouse_id, w.warehouse_name
ORDER BY delayed_shipments DESC;
-- 5. How do shipment statuses change over time?
SELECT
    DATE_FORMAT(dispatch_date, '%Y-%m') AS dispatch_month,
    status,
    COUNT(*) AS total_shipments
FROM shipments
GROUP BY
    DATE_FORMAT(dispatch_date, '%Y-%m'),
    status
ORDER BY dispatch_month, status;
-- 6. Which shipment statuses have the longest average transit duration?
SELECT
    status,
    AVG(transit_duration_hrs) AS avg_transit_hours
FROM shipments
GROUP BY status
ORDER BY avg_transit_hours DESC;
