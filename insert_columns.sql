DELIMITER $

DROP PROCEDURE IF EXISTS DY_INSERT_COL$

CREATE PROCEDURE DY_INSERT_COL( IN_COL_NAME VARCHAR(20),
							  IN_COL_TYPE VARCHAR(20),
							  IN_TAB_NAME VARCHAR(20) )

BEGIN

	BEGIN

		set @in_name  = IN_COL_NAME;
		set @in_col   = IN_COL_TYPE;
		set @in_table = IN_TABLE_NAME;

		SET @sql_stmt = CONCAT(' ALTER TABLE ' , @in_table,
		' ADD ', @in_name, ' ', @in_col, ' NOT NULL '
      );

		SELECT @sql_stmt;
		PREPARE stmt FROM @sql_stmt;
		EXECUTE stmt;

	END;

END$

DELIMITER ;
