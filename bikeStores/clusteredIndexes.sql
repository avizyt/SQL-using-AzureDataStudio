/*
CREATE TABLE production.parts(
	part_id INT NOT NULL,

	part_name VARCHAR(100)
);
*/

/*
Because the production.parts table has only five rows, the query will execute very fast. However, if the table contains a large number of rows, It will take a lot of time and resources to search for data.

To resolve this issue, SQL Server provides a dedicated structure to speed up retrieval of rows from a table called index.

SQL Server has two types of indexes: clustered index and non-clustered index. We will focus on the clustered index in this tutorial.

A clustered index stores data rows in a sorted structure based on its key values. Each table has only one clustered index because data rows can be only sorted in one order. The table that has a clustered index is called a clustered table.
*/

/*
A clustered index organizes data using a special structured so-called B-tree (or balanced tree) which enables searches, inserts, updates, and deletes in logarithmic amortized time.

In this structure, the top node of the B-tree is called the root node. The nodes at the bottom level are called the leaf nodes. Any index levels between the root and the leaf nodes are known as intermediate levels.

In the B-Tree, the root node and intermediate level nodes contain index pages that hold index rows. The leaf nodes contain the data pages of the underlying table. The pages in each level of the index are linked using another structure called a doubly-linked list.
*/

--SQL Server Clustered Index and Primary key constraint.

--When we create a table with a Primary key, SQL server automatically create a clustered index based on columns included in the primary key.

-- Create a new table called production.part_prices with a primary key.

/* create table named production.part_prices
CREATE TABLE production.part_prices(
	part_id INT,
	valid_from DATE,
	price DECIMAL(18, 4) NOT NULL,
	PRIMARY KEY(part_id, valid_from)

);
*/

/* add PK to production.parts
ALTER TABLE production.parts
ADD PRIMARY KEY(part_id);
*/

--Using SQL Server CREATE CLUSTERED INDEX statement to create a clustered index.
--syntax

/*
CREATE CLUSTERED INDEX index_name
ON schema_name.table_name (column_list);
*/
