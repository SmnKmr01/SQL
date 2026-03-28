CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100)
);

CREATE TABLE regions (
    region_id INT PRIMARY KEY,
    region_name VARCHAR(50)
);

CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY,
    supplier_id INT,
    region_id INT,
    delivery_date DATE,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id),
    FOREIGN KEY (region_id) REFERENCES regions(region_id)
);

INSERT INTO suppliers VALUES
(1, 'ABC Corp'),
(2, 'XYZ Ltd'),
(3, 'Global Supplies');

INSERT INTO regions VALUES
(1, 'North'),
(2, 'South'),
(3, 'East'),
(4, 'West');

INSERT INTO deliveries VALUES
-- Supplier 1 delivers to all regions
(101, 1, 1, '2024-01-01'),
(102, 1, 2, '2024-01-02'),
(103, 1, 3, '2024-01-03'),
(104, 1, 4, '2024-01-04'),

-- Supplier 2 missing one region
(105, 2, 1, '2024-01-01'),
(106, 2, 2, '2024-01-02'),
(107, 2, 3, '2024-01-03'),

-- Supplier 3 delivers to all regions
(108, 3, 1, '2024-01-01'),
(109, 3, 2, '2024-01-02'),
(110, 3, 3, '2024-01-03'),
(111, 3, 4, '2024-01-04');

select * from suppliers
select * from regions
select * from deliveries


---Identify suppliers who delivered to all regions


SELECT s.supplier_id, s.supplier_name
FROM suppliers s
JOIN deliveries d ON s.supplier_id = d.supplier_id
GROUP BY s.supplier_id, s.supplier_name
HAVING COUNT(DISTINCT d.region_id) = 
       (SELECT COUNT(*) FROM regions);