SET GLOBAL log_bin_trust_function_creators = 1;
DROP FUNCTION IF EXISTS `split`;
CREATE FUNCTION `split`(
	str VARCHAR(255) ,
	delim VARCHAR(12) ,
	pos INT
) RETURNS varchar(255) CHARSET utf8mb4
RETURN REPLACE(
	SUBSTRING(
		SUBSTRING_INDEX(str , delim , pos) ,
		CHAR_LENGTH(
			SUBSTRING_INDEX(str , delim , pos - 1)
		) + 1
	) ,
	delim ,
	''
) 