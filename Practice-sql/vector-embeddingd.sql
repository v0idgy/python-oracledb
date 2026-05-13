select tablespace_name,
       segment_space_management
  from dba_tablespaces;


create tablespace my_vector_ts
   datafile 'vector_data01.dbf' size 100M
   extent management local
segment space management auto;












create table product_embeddings (
   id           number primary key,
   product_name varchar2(100),
   embedding    vector (768,float32) -- A vector with 768 dimensions
);




select product_name 
from product_embeddings
order by vector_distance( embedding, :input_query_vector, cosine )
fetch first 5 rows only;




 create vector index product_idx on product_embeddings ( embedding ) 
 organization inmemory neighbor graph 
 distance cosine;