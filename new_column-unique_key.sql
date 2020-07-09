/*
SOURCE new_column.sql;
CALL new_column();
*/

DELIMITER $

DROP PROCEDURE IF EXISTS new_column$

CREATE PROCEDURE new_column()

BEGIN

	DECLARE v_sql_stmt	 VARCHAR(500);
	DECLARE v_table_name VARCHAR(50);
	DECLARE iam_done     INT DEFAULT 0;

	DECLARE new_tbl_cursor CURSOR FOR
		SELECT TABLE_NAME
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_SCHEMA='studentdb';

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET iam_done=1;

	BEGIN
	OPEN new_tbl_cursor;
		tbl_loop:LOOP

		FETCH new_tbl_cursor INTO v_table_name;

		IF iam_done = 1 THEN
			leave tbl_loop;
		END IF;

			SET @v_sql_stmt = CONCAT(' ALTER TABLE '
									, v_table_name
									, ' ADD COLUMN 
									(create_by VARCHAR(100),
									update_by VARCHAR(100),
									last_update_date DATE,
									user_id INT) '
									);

				SELECT @v_sql_stmt;
				PREPARE stmt FROM @v_sql_stmt;
				EXECUTE stmt;

			SET @v_sql_stmt = CONCAT(' ALTER TABLE '
									, v_table_name
									, ' ADD UNIQUE (user_id) '
									);

				SELECT @v_sql_stmt;
				PREPARE stmt FROM @v_sql_stmt;
				EXECUTE stmt;	

		END LOOP;
	CLOSE new_tbl_cursor;

	END;
END$

DELIMITER ;

CALL new_column();


