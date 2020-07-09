DELIMITER $

DROP PROCEDURE IF EXISTS HANDLING_ERROR_CREATE$

CREATE PROCEDURE HANDLING_ERROR_CREATE(IN_NAME VARCHAR(100)
                    , IN_GENDER VARCHAR(1)
					, IN_STUDENT_ID INT)

BEGIN
	DECLARE not_int 	INT DEFAULT 0;
	DECLARE	sql_stmt 	VARCHAR(1000);
	DECLARE name 	 	VARCHAR(100);
	DECLARE gender 	 	VARCHAR(1);
	DECLARE student_id  CHAR;

	BEGIN

        SET @name = IN_NAME;
        SET @gender = IN_GENDER;
        SET @student_id = IN_STUDENT_ID;

        BEGIN
        DECLARE EXIT HANDLER FOR 1366 SET not_int = 1;
			SET @student_id = 'fifty';
			SET @sql_stmt = CONCAT(
						'INSERT INTO STUDENT '
						,'(NAME,GENDER,STUDENT_ID) '
						, 'VALUES '
                        ,'( '
						,'? '
						,', ?'
						,', ?'
						')'
					     );
			SELECT @sql_stmt;
			PREPARE stmt FROM @sql_stmt;
			EXECUTE stmt USING @name, @gender, @student_id;
		END;

	END;

    IF (not_int = 1) THEN
		SELECT CONCAT('Is not possible to insert a STUDENT_ID: ', @student_id, ' that is not a integer type.') ERROR_MESSAGE;
    END IF;

END$

DELIMITER ;