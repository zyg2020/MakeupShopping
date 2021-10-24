-- SQLite



-- SELECT * FROM Malls LEFT JOIN mall_products ON Malls.id = mall_products.mall_id ;

 -- SELECT * from products WHERE name = "Perfecting Skin Tint";

-- SQLite
-- SELECT p.id as "Product ID", p.name, m.id as "Mall ID", m.name
-- FROM Malls m
-- JOIN mall_products mp ON m.id == mp.mall_id
-- JOIN Products p On p.id == mp.product_Id

SELECT * from brands WHERE name like "l%";