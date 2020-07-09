-- source gen_report_dyn.sql
-- call gen_report_dyn('SCORE');

DELIMITER $

DROP PROCEDURE IF EXISTS GEN_REPORT_DYN$

CREATE PROCEDURE GEN_REPORT_DYN( IN_TAB_NAME VARCHAR(20) )

BEGIN

	DECLARE sql_stmt VARCHAR(100);

	BEGIN

		SET @in_table = IN_TAB_NAME;
		SET @sql_stmt = CONCAT(' SELECT student_id, max(score), min(score), avg(score) FROM ' , @in_table, 
			' GROUP BY student_id');

		SELECT @sql_stmt;
		PREPARE stmt FROM @sql_stmt;
		EXECUTE stmt;

	END;

END$

DELIMITER ;

-- SELECT student_id FROM SCORE GROUP BY student_id;
-- STUDENTID| MAX_SCORE | MIN_SCORE | AVG_SCORE

