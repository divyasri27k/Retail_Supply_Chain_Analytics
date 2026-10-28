use retail_supply_chain;
-- 1. How many shipments are assigned to each staff member?
SELECT
    st.staff_id,
    st.staff_name,
    COUNT(sh.shipment_id) AS total_shipments
FROM staff st
JOIN shipments sh
    ON st.staff_id = sh.staff_id
GROUP BY st.staff_id, st.staff_name
ORDER BY total_shipments DESC;
-- 2. What is the average transit duration for shipments handled by each staff member?
SELECT
    st.staff_name,
    AVG(sh.transit_duration_hrs) AS avg_transit_hours
FROM staff st
JOIN shipments sh
    ON st.staff_id = sh.staff_id
GROUP BY st.staff_id, st.staff_name
ORDER BY avg_transit_hours;
-- 3.How many delivered, delayed, and damaged shipments are associated with each staff member?
SELECT
    st.staff_name,
    sh.status,
    COUNT(*) AS total_shipments
FROM staff st
JOIN shipments sh
    ON st.staff_id = sh.staff_id
GROUP BY st.staff_id, st.staff_name, sh.status
ORDER BY st.staff_name, total_shipments DESC;
-- 4. How many shipments are handled by each vehicle type?
SELECT
    v.vehicle_type,
    COUNT(sh.shipment_id) AS total_shipments
FROM vehicles v
JOIN shipments sh
    ON v.vehicle_id = sh.vehicle_id
GROUP BY v.vehicle_type
ORDER BY total_shipments DESC;
-- 5. What is the average transit duration for each vehicle type?
SELECT
    v.vehicle_type,
    AVG(sh.transit_duration_hrs) AS avg_transit_hours
FROM vehicles v
JOIN shipments sh
    ON v.vehicle_id = sh.vehicle_id
GROUP BY v.vehicle_type
ORDER BY avg_transit_hours;
-- 6. Which vehicle types have the highest numbers of delayed or damaged shipments?
SELECT
    v.vehicle_type,
    COUNT(sh.shipment_id) AS problem_shipments
FROM vehicles v
JOIN shipments sh
    ON v.vehicle_id = sh.vehicle_id
WHERE sh.status IN ('Delayed', 'Damaged')
GROUP BY v.vehicle_type
ORDER BY problem_shipments DESC;