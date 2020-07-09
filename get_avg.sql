/* 1. Create a database procedure using Cursors to print the AVG score of all students.
a) The procedure has no Input parameters.
b) The procedure should print all the students AVG score.
c) The procedure should use database cursors to implement the logic.

SOURCE name_file.sql
CALL GET_AVG();
*/

DELIMITER $

DROP PROCEDURE IF EXISTS GET_AVG$

CREATE PROCEDURE GET_AVG()

BEGIN

	DECLARE l_avg float;
	DECLARE iam_done float DEFAULT 0;

	DECLARE avg_cursor CURSOR FOR
		SELECT AVG(score)
		FROM score
		GROUP BY student_id
		;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET iam_done=1;

	BEGIN
		OPEN avg_cursor;
			tbl_loop:LOOP

						FETCH avg_cursor INTO l_avg;

							IF iam_done = 1 THEN
								leave tbl_loop;
							END IF;

						SELECT l_avg;

			END LOOP tbl_loop;
		CLOSE avg_cursor;
	END;
END$

DELIMITER ;
