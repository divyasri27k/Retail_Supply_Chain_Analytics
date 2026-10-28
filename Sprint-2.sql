CREATE DATABASE retail_supply_chain;
USE retail_supply_chain;
SHOW DATABASES;
USE retail_supply_chain;

-- 1. Warehouse details
CREATE TABLE warehouses (
    warehouse_id VARCHAR(10) PRIMARY KEY,
    warehouse_name VARCHAR(150) NOT NULL,
    city VARCHAR(100) NOT NULL,
    warehouse_type VARCHAR(50) NOT NULL,
    storage_capacity_units INT NOT NULL,
    region VARCHAR(50) NOT NULL,
    opened_date DATE NOT NULL
);

-- 2. Supplier details
CREATE TABLE suppliers (
    supplier_id VARCHAR(10) PRIMARY KEY,
    supplier_name VARCHAR(150) NOT NULL,
    city VARCHAR(100) NOT NULL,
    supplier_category VARCHAR(50) NOT NULL,
    reliability_rating DECIMAL(3,2),
    contract_since DATE NOT NULL
);

-- 3. Staff details
CREATE TABLE staff (
    staff_id VARCHAR(10) PRIMARY KEY,
    staff_name VARCHAR(150) NOT NULL,
    hire_date DATE NOT NULL,
    rating DECIMAL(3,2),
    employment_type VARCHAR(50) NOT NULL,
    is_active VARCHAR(3) NOT NULL
);

-- 4. Vehicle details
CREATE TABLE vehicles (
    vehicle_id VARCHAR(10) PRIMARY KEY,
    vehicle_type VARCHAR(100) NOT NULL,
    fuel_type VARCHAR(50) NOT NULL,
    max_payload_kg DECIMAL(10,2) NOT NULL,
    depot_warehouse_id VARCHAR(10),
    last_service_date DATE,
    is_active VARCHAR(3) NOT NULL,

    CONSTRAINT fk_vehicle_warehouse
        FOREIGN KEY (depot_warehouse_id)
        REFERENCES warehouses(warehouse_id)
);

-- 5. Purchase order details
CREATE TABLE purchase_orders (
    po_id VARCHAR(15) PRIMARY KEY,
    warehouse_id VARCHAR(10) NOT NULL,
    supplier_id VARCHAR(10) NOT NULL,
    order_date DATE NOT NULL,
    product_category VARCHAR(100) NOT NULL,
    order_priority VARCHAR(50) NOT NULL,
    quantity_ordered INT NOT NULL,
    total_cost DECIMAL(14,2) NOT NULL,

    CONSTRAINT fk_po_warehouse
        FOREIGN KEY (warehouse_id)
        REFERENCES warehouses(warehouse_id),

    CONSTRAINT fk_po_supplier
        FOREIGN KEY (supplier_id)
        REFERENCES suppliers(supplier_id)
);

-- 6. Shipment details
CREATE TABLE shipments (
    shipment_id VARCHAR(15) PRIMARY KEY,
    po_id VARCHAR(15) NOT NULL,
    staff_id VARCHAR(10) NOT NULL,
    vehicle_id VARCHAR(10) NOT NULL,
    dispatch_date DATE NOT NULL,
    arrival_date DATE,
    status VARCHAR(30) NOT NULL,
    shipment_attempt INT NOT NULL,
    distance_km DECIMAL(10,2) NOT NULL,
    transit_duration_hrs INT NOT NULL,

    CONSTRAINT fk_shipment_po
        FOREIGN KEY (po_id)
        REFERENCES purchase_orders(po_id),

    CONSTRAINT fk_shipment_staff
        FOREIGN KEY (staff_id)
        REFERENCES staff(staff_id),

    CONSTRAINT fk_shipment_vehicle
        FOREIGN KEY (vehicle_id)
        REFERENCES vehicles(vehicle_id)
);

SHOW TABLES;
select * from purchase_orders;
select * from shipments;
select * from staff;
select * from suppliers;
select * from vehicles;
select * from warehouses;
DESCRIBE purchase_orders;
-- Verifying databases are correctly imported or not
SELECT 'warehouses' AS table_name, COUNT(*) AS total_records
FROM warehouses
UNION ALL
SELECT 'suppliers', COUNT(*) FROM suppliers
UNION ALL
SELECT 'staff', COUNT(*) FROM staff
UNION ALL
SELECT 'vehicles', COUNT(*) FROM vehicles
UNION ALL
SELECT 'purchase_orders', COUNT(*) FROM purchase_orders
UNION ALL
SELECT 'shipments', COUNT(*) FROM shipments;
