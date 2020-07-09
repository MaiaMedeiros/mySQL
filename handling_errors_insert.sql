DELIMITER $

DROP PROCEDURE IF EXISTS HANDLING_ERROR_INSERT$

CREATE PROCEDURE HANDLING_ERROR_INSERT(IN_STUDENT_ID INT
					, IN_EVENT_ID INT
                    , IN_SCORE INT
					)

BEGIN
	DECLARE fk_error   INT DEFAULT 0;
	DECLARE	sql_stmt   VARCHAR(100);
	DECLARE	student_id INT;
	DECLARE	event_id   INT;
	DECLARE	score 	   INT;

	BEGIN

		SET @student_id = IN_STUDENT_ID;
		SET @event_id = IN_EVENT_ID;
        SET @score = IN_SCORE;

        BEGIN
        	DECLARE EXIT HANDLER FOR 1452 SET fk_error = 1;

			SET @sql_stmt = CONCAT(
					'INSERT INTO SCORE '
					,'(STUDENT_ID,EVENT_ID,SCORE)'
					, 'VALUES '
					,'('
					,' ? '
					,', ? '
					, ', ? '
					') '
				    );

			SELECT @sql_stmt;
			PREPARE stmt FROM @sql_stmt;
			EXECUTE stmt USING @student_id, @event_id, @score;
		END;

	END;

    IF (fk_error = 1) THEN
		SELECT CONCAT('You are trying to insert a child record for score table where STUDENT_ID: ', @l_student_id , ' and EVENT_ID: ' , @l_event_id,' is not present in the parent student table') ERROR_MESSAGE;
	END IF;

END$

DELIMITER ;