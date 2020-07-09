
DELIMITER $

DROP PROCEDURE IF EXISTS HANDLING_ERROR_DROP$

CREATE PROCEDURE HANDLING_ERROR_DROP(IN_TABLE_NAME VARCHAR(100))

BEGIN
	DECLARE table_exist  INT DEFAULT 0;
	DECLARE	sql_stmt 	 VARCHAR(100);
	DECLARE	table_name 	 VARCHAR(100);

	BEGIN

        SET @table_name = IN_TABLE_NAME;

        BEGIN
        	DECLARE EXIT HANDLER FOR 1051 SET table_exist = 1;

			SET @sql_stmt = CONCAT(
						'DROP TABLE '
                        ,@table_name
					     );
			SELECT @sql_stmt;
			PREPARE stmt FROM @sql_stmt;
			EXECUTE stmt;
		END;

	END;

	IF (table_exist = 1) THEN
		SELECT CONCAT('Error in dropping: ', @table_name , ', table that does not exist.') ERROR_MESSAGE;
	END IF;

END$

DELIMITER ;