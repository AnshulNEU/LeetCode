# Write your MySQL query statement below



WITH NodeTypes AS (
    SELECT
        t.id,
        CASE
            WHEN t.p_id IS NULL THEN 'Root'
            WHEN NOT EXISTS (
                SELECT 1
                FROM Tree t2
                WHERE t2.p_id = t.id
            ) THEN 'Leaf'
            ELSE 'Inner'
        END AS node_type
    FROM Tree t
)
SELECT id, node_type as type
FROM NodeTypes;
