/*

Please create a function with the following specification in StudentDB database;
The function takes TWO input parameters for student Id’s, {start_student_id and end_student_id};

*/

DELIMITER $

DROP FUNCTION IF EXISTS GET_ID$

CREATE FUNCTION GET_ID()
RETURNS INT
BEGIN

DECLARE start_student_id INT;
DECLARE end_student_id INT;

		BEGIN

			SELECT S.STUDENT_ID,
			MIN(S.STUDENT_ID) INTO start_student_id,
			MAX(S.STUDENT_ID) INTO end_student_id
			FROM STUDENT AS S;

		END;

	RETURN end_student_id, start_student_id;

END$

DELIMITER ;
