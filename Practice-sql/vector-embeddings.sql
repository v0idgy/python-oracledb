-- This SQL script demonstrates the use of vector embeddings in Oracle Database.
-- It includes creating a tablespace, defining a table with a vector column, inserting data,
-- and performing similarity search using vector distance functions.
-- Note: Ensure that the Oracle Database version supports vector data types and functions.
create tablespace vector_ts
   datafile 'vector_data.dbf' size 100M
   autoextend on
   extent management local
segment space management auto;

-- Create a table to store product information along with vector embeddings for similarity search.
-- The 'v_embedding' column is defined as a vector of 3 float32 values, which can be used for cosine similarity calculations.
-- The table is created in the 'vector_ts' tablespace to optimize storage for vector data.
-- The 'description' column is defined as CLOB to allow for longer text descriptions of products.
-- The 'id' column is the primary key for the table, ensuring that each product has a unique identifier.
-- Insert sample data into the 'product_catalog' table, including product names, descriptions, and their corresponding vector embeddings.

create table product_catalog (
   id           number primary key,
   product_name varchar2(100),
   description  clob,
   v_embedding  vector(3,float32)
)
tablespace vector_ts; -- Explicitly using the ASSM tablespace

-- Insert sample product data with vector embeddings representing their features.
-- The vector embeddings are hypothetical and should be generated based on the actual features of the products in a real application.
-- The 'v_embedding' values are represented as strings in the format '[x,y,z]', where x, y, and z are the float32 values of the vector.
insert into product_catalog values ( 1,'Solar Charger','Portable solar panel for camping','[0.12,0.88,0.45]' );
insert into product_catalog values ( 2,'Flashlight','Waterproof LED tactical light','[0.15,0.85,0.4]' );
insert into product_catalog values ( 3,'Winter Jacket','Heavy down coat for sub-zero temps','[0.91,0.11,0.22]' );
commit;


-- Perform a similarity search to find products that are most similar to a given query vector.
-- The 'vector_distance' function calculates the cosine distance between the product embeddings and the input query
-- The results are ordered by distance, with the closest matches appearing first.
-- The 'fetch first 3 rows only' clause limits the output to the top 3 most similar products based on the cosine distance.
-- The query vector '[0.1,0.9,0.4]' is an example input that represents the features of a product or user preference.
select product_name, vector_distance(v_embedding,'[0.1,0.9,0.4]', cosine) as distance
from product_catalog
order by distance
fetch first 3 rows only;








select vector_embedding(my_model using 'A high-quality camping gear') as auto_vector from dual;


-- Check the tablespace settings to confirm that the 'vector_ts' tablespace is using automatic segment space management (ASSM).
-- This is important for optimizing the performance of vector data storage and retrieval.
-- The query retrieves the name of the tablespace and its segment space management type, filtering for those that are set to 'AUTO'.
select tablespace_name,
       segment_space_management
  from dba_tablespaces
 where segment_space_management = 'AUTO';



 create tablespace json_ts
   datafile 'json_data.dbf' size 100M
   autoextend on
   extent management local
segment space management auto;









