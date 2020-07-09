/*
Develop a database stored procedure
Using the query from Question1 and convert the query to write a database stored procedure and display the result.
The procedure should return the following output columns.

STUDENT_ID | EVENT_ID  | SUM(SCORE) | AVG(SCORE) | MIN(SCORE) | MAX(SCORE)
*/

DELIMITER $

DROP PROCEDURE IF EXISTS GEN_REPORT$

CREATE PROCEDURE GEN_REPORT()

BEGIN

DECLARE l_student_id int;

	BEGIN
			SELECT S.STUDENT_ID
				, EVENT_ID
				, SCORE
				, SUM(SCORE)
				, AVG(SCORE)
				, MIN(SCORE)
				, MAX(SCORE)
			FROM STUDENT AS S
			INNER JOIN SCORE AS SC
			WHERE S.STUDENT_ID = SC.STUDENT_ID
			GROUP BY S.STUDENT_ID, SC.EVENT_ID
			LIMIT 30
			;

	END;

END$

DELIMITER ;