-- Table creation
   CREATE TABLE RegionSales (
       Region VARCHAR(50),
       TotalSales DECIMAL(12,2)
   );

   -- Clear table before reload (idempotency)
   TRUNCATE TABLE RegionSales;

   -- Validate loaded data
   SELECT * FROM RegionSales;