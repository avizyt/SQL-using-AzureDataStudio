--SQL Server Indexes
-- SQL Server Clustered Indexes

-- Create a new table named production.parts
/*
CREATE TABLE production.parts(
	part_id INT NOT NULL,

	part_name VARCHAR(100)
);
*/
-- Insert data into newly created table
/*
INSERT INTO
	production.parts(part_id,part_name)

VALUES
	(1,'Frame'),
    (2,'Head Tube'),
    (3,'Handlebar Grip'),
    (4,'Shock Absorber'),
    (5,'Fork');
*/

/*The production.parts table does not have a primary key, therefore, SQL Server stores its rows in an unordered structure called a heap.

When you query data from the production.parts table, the query optimizer needs to scan the whole table to locate the correct one.
*/


select part_id, part_name
from production.parts
where part_id = 5;