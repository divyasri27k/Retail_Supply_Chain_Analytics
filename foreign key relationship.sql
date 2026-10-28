USE retail_supply_chain;
-- Check foreign-key relationships
SELECT 'purchase_orders - warehouse' AS check_name, COUNT(*) AS invalid_records
FROM purchase_orders p
LEFT JOIN warehouses w ON p.warehouse_id = w.warehouse_id
WHERE w.warehouse_id IS NULL
UNION ALL
SELECT 'purchase_orders - supplier', COUNT(*)
FROM purchase_orders p
LEFT JOIN suppliers s ON p.supplier_id = s.supplier_id
WHERE s.supplier_id IS NULL
UNION ALL
SELECT 'shipments - purchase order', COUNT(*)
FROM shipments sh
LEFT JOIN purchase_orders p ON sh.po_id = p.po_id
WHERE p.po_id IS NULL

UNION ALL

SELECT 'shipments - staff', COUNT(*)
FROM shipments sh
LEFT JOIN staff st ON sh.staff_id = st.staff_id
WHERE st.staff_id IS NULL
UNION ALL
SELECT 'shipments - vehicle', COUNT(*)
FROM shipments sh
LEFT JOIN vehicles v ON sh.vehicle_id = v.vehicle_id
WHERE v.vehicle_id IS NULL
UNION ALL
SELECT 'vehicles - warehouse', COUNT(*)
FROM vehicles v
LEFT JOIN warehouses w ON v.depot_warehouse_id = w.warehouse_id
WHERE v.depot_warehouse_id IS NOT NULL
  AND w.warehouse_id IS NULL;