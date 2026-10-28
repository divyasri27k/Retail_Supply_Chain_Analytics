-- 1. How many shipment records have more than one shipment attempt?
SELECT
    COUNT(*) AS repeated_attempt_records
FROM shipments
WHERE shipment_attempt > 1;
-- 2. How many shipment records exist for each attempt number?
SELECT
    shipment_attempt,
    COUNT(*) AS total_shipments
FROM shipments
GROUP BY shipment_attempt
ORDER BY shipment_attempt;
-- 3. Which shipment statuses are most common among records with repeated attempts?
SELECT
    status,
    COUNT(*) AS total_shipments
FROM shipments
WHERE shipment_attempt > 1
GROUP BY status
ORDER BY total_shipments DESC;
-- 4. Which warehouses have the highest numbers of shipment records with repeated attempts?
SELECT
    w.warehouse_name,
    COUNT(sh.shipment_id) AS repeated_attempt_records
FROM warehouses w
JOIN purchase_orders p
    ON w.warehouse_id = p.warehouse_id
JOIN shipments sh
    ON p.po_id = sh.po_id
WHERE sh.shipment_attempt > 1
GROUP BY w.warehouse_id, w.warehouse_name
ORDER BY repeated_attempt_records DESC;
-- 5. Which suppliers have the highest numbers of shipment records with repeated attempts?
SELECT
    s.supplier_name,
    COUNT(sh.shipment_id) AS repeated_attempt_records
FROM suppliers s
JOIN purchase_orders p
    ON s.supplier_id = p.supplier_id
JOIN shipments sh
    ON p.po_id = sh.po_id
WHERE sh.shipment_attempt > 1
GROUP BY s.supplier_id, s.supplier_name
ORDER BY repeated_attempt_records DESC;
-- 6. How many shipments have a missing arrival date, and what are their recorded statuses?
SELECT
    status,
    COUNT(*) AS missing_arrival_records
FROM shipments
WHERE arrival_date IS NULL
GROUP BY status
ORDER BY missing_arrival_records DESC;