/*******************************************************/
-- Sam Nasr, MCSA, MVP             
-- NIS Technologies (www.nistechnologies.com)                
-- 14 T-SQL Functions Demo
-- Requires SSMS 2012 or later (any edition)
/*******************************************************/


/****************************************/
--Demo #1 Conversion Functions 
/****************************************/
select Parse ('03042011' as float) AS NewResult
select Parse ('03-31-2011' as datetime2 using 'en-US' ) AS NewResult
select Parse ('03-31-2011' as datetime2 using 'en-AU' ) AS NewResult  --Error

select Parse ('18;03;2011' as datetime2 using 'en-AU' ) AS NewResult
select Parse ('03-2011' as datetime2 using 'en-US' ) AS NewResult

--TRY_PARSE() converts string type to Date/Numeric type ONLY
SELECT TRY_PARSE('08/18/2012' AS datetime2 USING 'en-US') AS NewResult
SELECT TRY_PARSE('13/18/2012' AS datetime2 USING 'en-US') AS NewResult  --NULL
SELECT TRY_PARSE('SQLSaturday' AS datetime2 USING 'en-US') AS NewResult --NULL

--PARSE() vs. TRY_PARSE(): ERROR vs. NULL
SELECT PARSE('08/18/2012' AS datetime2 USING 'en-US') AS NewResult
SELECT PARSE('13/18/2012' AS datetime2 USING 'en-US') AS NewResult  --Error
SELECT PARSE('SQLSaturday' AS datetime2 USING 'en-US') AS NewResult --Error

SELECT TRY_PARSE('08/18/2012' AS datetime2 USING 'en-US') AS NewResult
SELECT TRY_PARSE('13/18/2012' AS datetime2 USING 'en-US') AS NewResult  --NULL
SELECT TRY_PARSE('SQLSaturday' AS datetime2 USING 'en-US') AS NewResult --NULL
------

select TRY_CONVERT(datetime2, '08/18/2012') as NewResult
select TRY_CONVERT(varchar(3), '12345') as NewResult
select TRY_CONVERT(xml, 4) as NewResult
select TRY_CONVERT(xml, '4') as NewResult
select TRY_CONVERT(varchar(9), '12345678') as NewResult

--TRY_CONVERT() allows for style option (https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-2017#xml-styles)
Select Getdate()  as NewResult
select TRY_CONVERT(varchar(50), GETDATE(), 1) as NewResult
select TRY_CONVERT(varchar(50), GETDATE(), 2) as NewResult
select TRY_CONVERT(varchar(50), GETDATE(), 3) as NewResult
select TRY_CONVERT(varchar(50), GETDATE(), 4) as NewResult
select TRY_CONVERT(varchar(50), GETDATE(), 5) as NewResult
select TRY_CONVERT(varchar(50), GETDATE(), 6) as NewResult
select TRY_CONVERT(varchar(50), GETDATE(), 7) as NewResult
select TRY_CONVERT(varchar(50), GETDATE(), 8) as NewResult
select TRY_CONVERT(varchar(50), GETDATE(), 9) as NewResult
select TRY_CONVERT(varchar(50), GETDATE(), 10) as NewResult
select TRY_CONVERT(varchar(50), GETDATE(), 11) as NewResult
select TRY_CONVERT(varchar(50), GETDATE(), 12) as NewResult
select TRY_CONVERT(varchar(50), GETDATE(), 13) as NewResult
select TRY_CONVERT(varchar(50), GETDATE(), 14) as NewResult
select TRY_CONVERT(varchar(50), GETDATE(), 101) as NewResult

select TRY_CONVERT(varchar(50), GETDATE(), 10000091) as NewResult  --Invalid Style = NULL
select TRY_CONVERT(varchar(50), GETDATE(), NULL) as NewResult      --NULL style = NULL

/****************************************/
--Demo #2: Date and time Functions 
/****************************************/

--     DATEFROMPARTS ( year, month, day)
SELECT DATEFROMPARTS ( 2012,     8,  18) AS NewDateValue

SELECT DATEFROMPARTS (2012,      08, 20) AS NewDateValue
SELECT DATEFROMPARTS ( 1985,     13, 26) AS NewDateValue


--     DATETIMEFROMPARTS ( year, month, day, hour, minute, seconds, milliseconds )        
SELECT DATETIMEFROMPARTS ( 2012,    08,  18,   16,     01,      39,  09             ) AS NewDateValue


--     DATETIME2FROMPARTS ( year, month, day, hour, minute, seconds, fractions, precision )        
SELECT DATETIME2FROMPARTS ( 2012,     8,  18,   14,     23,      44,         5,         1 ) AS NewDateValue
SELECT DATETIME2FROMPARTS ( 2012,     8,  18,   14,     23,      44,         50,        2 ) AS NewDateValue
SELECT DATETIME2FROMPARTS ( 2012,     8,  18,   14,     23,      44,         5,         7 ) AS NewDateValue

SELECT DATETIME2FROMPARTS ( 2012,     8,  18,   14,     23,      44,         50,        1 ) AS NewDateValue
SELECT DATETIME2FROMPARTS ( 2012,     8,  18,   14,     23,      44,         5,         8 ) AS NewDateValue


--     DATETIMEOFFSETFROMPARTS ( year, month, day, hour, minute, seconds, fractions, hour_offset, minute_offset, precision )
SELECT DATETIMEOFFSETFROMPARTS ( 2011,     8,  18,   14,     30,      00,         5,          12,            30,         1 ) AS NewDateValue
SELECT DATETIMEOFFSETFROMPARTS ( 2011,     8,  18,   14,     30,      00,        50,          12,            30,         2 ) AS NewDateValue
SELECT DATETIMEOFFSETFROMPARTS ( 2011,     8,  18,   14,     30,      00,       500,          12,            30,         3 ) AS NewDateValue


--     EOMONTH (start_date [, month_to_add])
SELECT EOMONTH ('08/18/2012') AS NewDateValue
SELECT EOMONTH ('08/18/2012', 6) AS NewDateValue

SELECT EOMONTH ('08/18/2012', -15.1) AS NewDateValue
SELECT EOMONTH ('08/18/2012', -15) AS NewDateValue
SELECT EOMONTH ('08/18/2012', 0.49) AS NewDateValue
SELECT EOMONTH ('08/18/2012', 1.99) AS NewDateValue

SELECT EOMONTH ('13/08/2012', 6) AS NewDateValue

SELECT EOMONTH (GetDate(), 1) AS NewDateValue
SELECT EOMONTH ('2002-08-30', 1) AS NewDateValue
SELECT EOMONTH ('2002-30-08', 1) AS NewDateValue


--     SMALLDATETIMEFROMPARTS ( year, month, day, hour, minute)
SELECT SMALLDATETIMEFROMPARTS ( 2011,     8,  18,   14,     30) AS NewDateValue

SELECT SMALLDATETIMEFROMPARTS ( 2011,     8, null,   14,     30) AS NewDateValue
SELECT SMALLDATETIMEFROMPARTS ( 2011,     13,  18,   14,     30) AS NewDateValue


--     TIMEFROMPARTS ( hour, minute, seconds, fractions, precision )        
SELECT TIMEFROMPARTS (   14,     23,      44,       500,         3 ) AS NewDateValue
SELECT TIMEFROMPARTS (   14,     23,      44.612,   500,         3 ) AS NewDateValue  --Only INT values are used
SELECT TIMEFROMPARTS (   14, 000000,      44,       500,         3 ) AS NewDateValue

SELECT TIMEFROMPARTS (   14,     21,      44,       500,        -3 ) AS NewDateValue
SELECT TIMEFROMPARTS (   14,     21,      44,       null,        3 ) AS NewDateValue
SELECT TIMEFROMPARTS (   14,     21,      44,       500,      null ) AS NewDateValue

SELECT TIMEFROMPARTS (   23.23232,     21,      44,       500,      7 ) AS NewDateValue

/****************************************/
--Demo #3: Logical Functions
/****************************************/
SELECT CHOOSE ( 3, 'Manager', 'Director', 'Developer', 'Tester' ) AS NewResult;

SELECT CHOOSE ( 3, 08/18/2012, 4.3233, 'Director', 'Developer', 'Tester' ) AS NewResult;
SELECT CHOOSE ( 1, 'Director', 'Developer', '45', '08/18/2012', 42.325 ) AS NewResult;
SELECT CHOOSE ( 33, 'Manager', 'Director', 'Developer', 'Tester' ) AS NewResult;

DECLARE @a int = 2;
SELECT CHOOSE (@a, (select 'a'), (select 456), (select NULL)) as newresult

DECLARE @a int = 45;
DECLARE @b int = 40;
SELECT IIF ( @a > @b, 'TRUE_value', 'FALSE_Value' ) AS NewResult;

SELECT IIF ( @a > @b, IIF ( @a > @b, 'False', 'True' ), 'FALSE' ) AS NewResult;

/****************************************/
--Demo #4: String Functions
/****************************************/
SELECT CONCAT ('Happy ', 'Birthday ', 11, '/', '25' ) AS NewResult

SELECT CONCAT ('Happy', null, null, 'Birthday') AS NewResult
SELECT CONCAT (null, null, null, null) AS NewResult
SELECT CONCAT ('Happy ') AS NewResult


SELECT CONCAT ('Happy ', N'Birthday ', (SELECT CONCAT ('Happy ', N'Birthday ', 11, '/', '25' ) AS NewResult),    11, '/', '25' ) AS NewResult


--DateTime Format Strings: https://docs.microsoft.com/en-us/dotnet/standard/base-types/custom-date-and-time-format-strings
DECLARE @Date DATETIME = '08/18/2012';
SELECT FORMAT ( @Date, 'd', 'en-US' ) AS AmericanDate;
SELECT FORMAT ( @Date, 'd', 'en-AU' ) AS AustralianDate;

DECLARE @CurrentDate DATETIME = GETDATE()
SELECT FORMAT( @CurrentDate, 'MM') AS NewDate
SELECT FORMAT( @CurrentDate, 'MMM', 'en-AU') AS NewDate
