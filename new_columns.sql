/*
2. Create database cursor to add the following columns to the table as follows.
a) Add a column CREATE_DATE of datatype DATE to all the tables.
b) Add a column PROJECT_NAME of datatype VARCHAR(100) to STUDENT table.
c) Add a column GPA of datatype INT to SCORE table
d) Use database cursor to implement the above logic.

SOURCE name_file.sql
CALL CREATE_NEW_COLUMN();
*/
DELIMITER $

DROP PROCEDURE IF EXISTS CREATE_NEW_COLUMN$

CREATE PROCEDURE CREATE_NEW_COLUMN()

BEGIN


	DECLARE v_sql_stmt	 VARCHAR(500);
	DECLARE v_table_name VARCHAR(50);
	DECLARE iam_done     INT DEFAULT 0;

	DECLARE new_tbl_cursor CURSOR FOR
	-- accessing through INFORMATION_SCHEMA table
	-- selecting all tables
		SELECT TABLE_NAME
		FROM INFORMATION_SCHEMA.TABLES
		-- DATABASE
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
													, ' ADD COLUMN '
													, ' create_date DATE '
												);

						SELECT @v_sql_stmt;
						PREPARE stmt FROM @v_sql_stmt;
						EXECUTE stmt;

							IF v_table_name = 'student' THEN

									SET @v_sql_stmt = CONCAT(' ALTER TABLE '
															, v_table_name
															, ' ADD COLUMN '
															, ' project_name VARCHAR(100) '
														);

											SELECT @v_sql_stmt;
											PREPARE stmt FROM @v_sql_stmt;
											EXECUTE stmt;
							END IF;

							IF v_table_name = 'score' THEN

									SET @v_sql_stmt = CONCAT(' ALTER TABLE '
															, v_table_name
															, ' ADD COLUMN '
															, ' gpa INT'
														);

											SELECT @v_sql_stmt;
											PREPARE stmt FROM @v_sql_stmt;
											EXECUTE stmt;
							END IF;

				END LOOP;
			CLOSE new_tbl_cursor;
	END;
END$

DELIMITER ;
