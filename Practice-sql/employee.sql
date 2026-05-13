CREATE TABLE IF NOT EXISTS fdp_participants (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR2(50),
    is_active BOOLEAN,
    joined_date DATE ANNOTATIONS (Format 'DD-MON-YYYY')
);

INSERT INTO fdp_participants (name, is_active, joined_date)
VALUES ('Dr. Smith', TRUE, sysdate),
       ('Prof. Jones', FALSE, sysdate - 10);

-- No FROM DUAL and Alias in Group By
SELECT is_active AS status, count(*) 
FROM fdp_participants 
GROUP BY status;