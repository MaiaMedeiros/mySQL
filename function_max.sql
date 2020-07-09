/*

The function should return the student’s MAX score as a RETURN value who has achieved 
a maximum score;
getMaxScore(first_student_id INT, second_student_id INT)
*/

DELIMITER $

DROP FUNCTION IF EXISTS GET_ID_MAX$

CREATE FUNCTION GET_ID_MAX()
RETURNS INT
BEGIN

DECLARE max_score INT;

		BEGIN

			SELECT MAX(MAX_SCORE) INTO max_score
			FROM (SELECT MAX(SCORE) MAX_SCORE, S.STUDENT_ID
			FROM STUDENT AS S, SCORE AS SC
			WHERE S.STUDENT_ID = SC.STUDENT_ID
			AND S.STUDENT_ID BETWEEN 1 AND 5
			GROUP BY S.STUDENT_ID
			) T;

		END;

	RETURN max_score;

END$

DELIMITER ;
