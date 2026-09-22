-- Write your query below
SELECT student_id, exam_id, score
FROM (
    SELECT student_id, exam_id, score, row_number
    , MIN(row_number) OVER(PARTITION BY student_id)
    FROM (
        SELECT student_id, exam_id, score, 
        DENSE_RANK() OVER(PARTITION BY student_id ORDER BY score DESC)
        , ROW_NUMBER() OVER(PARTITION BY student_id ORDER BY exam_id)
        FROM exam_results
    ) AS t
    WHERE t.dense_rank = 1
) AS p
WHERE row_number = min