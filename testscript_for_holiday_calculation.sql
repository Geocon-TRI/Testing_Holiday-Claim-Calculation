DEClARE
	 @Run		BIT = 1		--> 1 = run tests, 0 = only show databases in use
	,@Detail	BIT = 1		--> 1 = display comments in test results, 0 = show only test results

-- table for test cases
CREATE TABLE #TestCases (
	TestID			INT IDENTITY(1,1) PRIMARY KEY,
	ServerIP		VARCHAR(15),
	Base			VARCHAR(50),
	IDPERS			INT,
	Year			INT,
	ClaimGroup		INT,
	Comment			NVARCHAR(MAX),
	ExpectedResult	NUMERIC(7,2)
)

--------- TEST CASES ---------
------------------------------
INSERT INTO #TestCases (ServerIP, Base, IDPERS, Year, ClaimGroup, ExpectedResult, Comment)
VALUES 
	 ('192.168.1.14', 'Claim_TestCases_do_not_delete', 21309, 2024, 0, 16.5, '[SQL-31780]')
	,('192.168.1.14', 'Claim_TestCases_do_not_delete', 4211, 2024, 0, 33.0, '[SQL-31782]')
	,('192.168.1.14', 'Claim_TestCases_do_not_delete', 3758, 2024, 0, 32.0, '[SQL-31780]')
	,('192.168.1.14', '127100_GeoconPro_3877', 4680, 2024, 0, 16.0, '[SQL-31780 + SQL-31818], Mindestanspruch')
	,('192.168.1.14', '127100_GeoconPro_3877', 4596, 2024, 0, 4.0, '[SQL-31780]')
	,('192.168.1.14', '127100_GeoconPro_3877', 4667, 2024, 0, 20.0, '[SQL-31780 + SQL-31818], Mindestanspruch')
	,('192.168.1.14', 'Claim_TestCases_do_not_delete', 6096, 2024, 0, 22.0, '[SQL-31780]')
	,('192.168.1.14', 'Claim_TestCases_do_not_delete', 17483, 2024, 0, 27.5, '[SQL-31780]')
	,('192.168.1.14', 'Claim_TestCases_do_not_delete', 16853, 2024, 0, 25.0, '[SQL-31780]')
	,('192.168.1.14', '0699_38', 2261, 2024, 0, 30.0, '[SQL-31597]')
	,('192.168.1.14', '4808_Urlaub2', 21585, 2024, 0, 10.0, '[SQL-31780]')
	,('192.168.1.14', '7140_Urlaub', 1958, 2024, 0, 13.0, '[SQL-31707] Funktionstask: KD DB nutzt > 1 FDL, daher SQL-31314 notwendig')
	,('192.168.1.14', '7140_Urlaub', 1238, 2024, 0, 8.0, '[SQL-31707] Funktionstask: KD DB nutzt > 1 FDL, daher SQL-31314 notwendig')
	,('192.168.1.14', 'Claim_TestCases_do_not_delete', 2122, 2023, 0, 27.5, '[SQL-30675]')
	,('192.168.1.14', 'Claim_TestCases_do_not_delete', 12768, 2023, 0, 5.5, '[SQL-30646]')
	,('192.168.1.14', 'Claim_TestCases_do_not_delete', 12768, 2024, 0, 11.0, '[SQL-30646]')
	,('192.168.1.14', '5543_38', 3229, 2024, 0, 15.0, '[SQL-31825] Gesamt-Ergbnis korrekt allerdings anteilig falsche Berechnung 3,34 anstelle 3,33')
	,('192.168.1.14', 'Claim_TestCases_do_not_delete', 18406, 2024, 0, 22.50, 'Bsp. wg. 2x AZ-Historie')
	,('192.168.1.14', '127100_GeoconPro_3877', 4456, 2024, 0, 25.0, '[SQL-31248]')
	,('192.168.1.14', '127100_GeoconPro_3877', 4781, 2024, 0, 5.0, '[SQL-32003]')
	,('192.168.1.14', 'Claim_TestCases_do_not_delete', 17760, 2024, 0, 26.6, '[SQL-31589] original example')
	,('192.168.1.14', 'Claim_TestCases_do_not_delete', 9770, 2024, 0, 13.8, '[SQL-31589] change of occupation 1')
	,('192.168.1.14', 'Claim_TestCases_do_not_delete', 8157, 2024, 0, 11.8, '[SQL-31589] change of occupation 2')
	,('192.168.1.14', 'Claim_TestCases_do_not_delete', 3530, 2024, 0, 15.0, 'Wiedereintritt im aktuellen Jahr nach Austritt im letzen Jahr')
	,('192.168.1.14', 'Claim_TestCases_do_not_delete', 7714, 2024, 0, 19.3, 'Aus- und Wiedereintritt im selben Jahr')
	,('192.168.1.14', 'Claim_TestCases_do_not_delete', 13470, 2024, 0, 11.0, 'Austritt im aktuellen Jahr, Wiedereintritt im nächsten Jahr')
	,('192.168.1.14', 'Claim_TestCases_do_not_delete', 7935, 2024, 0, 13.8, 'zwei Aus- und Wiedereintritt im selben Jahr')
	,('192.168.1.14', 'Claim_TestCases_do_not_delete', 8052, 2024, 0, 8.30, '[SQL-31989] longe leave - false count of full month in long leave 1')
	,('192.168.1.14', 'Claim_TestCases_do_not_delete', 8113, 2024, 0, 2.80, '[SQL-31989] longe leave - false count of full month in long leave 2')
	,('192.168.1.14', 'Claim_TestCases_do_not_delete', 8218, 2024, 0, 5.50, '[SQL-31989] longe leave - false count of full month in long leave 3')
	,('192.168.1.14', 'Claim_TestCases_do_not_delete', 5035, 2024, 0, 24.80, '[SQL-31989] longe leave - false count of full month in long leave 4')
	,('192.168.1.14', 'Claim_TestCases_do_not_delete', 7697, 2024, 0, 22.0, '[SQL-31989] longe leave - false count of full month in long leave 5')
	,('192.168.1.14', '4715_38', 2225, 2024, 0, 11.0, '[SQL-31902] U-Berechnung nach Rahmenplan fehlerhaft!')
	,('192.168.1.14', '6457_38', 82849, 2024, 3, 3.0, '[SQL-31927] Urlaub aufgrund bei unvollständigem Jahr fehlerhaft')
	,('192.168.1.16', '5417_38', 40744, 2024, 0, 15.0, 'BRK 1: RP, Wiedereintritt - 15,23')
	,('192.168.1.16', '5417_38', 45726, 2024, 0, 30.0, 'BRK 2: RP, Komplett - 30,23')
	,('192.168.1.16', '5417_38', 45727, 2024, 0, 20.0, 'BRK 3: RP, Austritt - 20,19')
	,('192.168.1.16', '5417_38', 45728, 2024, 0, 30.0, 'BRK 4: RP, 1-Monat-Ausfall - 30,23')
	,('192.168.1.16', '5417_38', 45729, 2024, 0, 28.0, 'BRK 5: RP, 2-Monate-Ausfall - 27,58')
	,('192.168.1.16', '5417_38', 45770, 2024, 0, 14.0, 'BRK 6: RP, Eintritt - 14,08')
	,('192.168.1.16', '5417_38', 73955, 2024, 0, 30.0, 'BRK 7: 5TW, 1-Monat-Ausfall - 30')
	,('192.168.1.16', '5417_38', 73956, 2024, 0, 28.0, 'BRK 8: 5TW, 2-Monate-Ausfall - 27,5')
	,('192.168.1.16', '5417_38', 73957, 2024, 0, 30.0, 'BRK 9: 5TW, Komplett - 30')
	,('192.168.1.16', '5417_38', 73958, 2024, 0, 13.0, 'BRK 10: 5TW, Eintritt - 12,5')
	,('192.168.1.16', '5417_38', 73959, 2024, 0, 20.0, 'BRK 11: 5TW, Austritt - 20')
	,('192.168.1.16', '5417_38', 73960, 2024, 0, 15.0, 'BRK 12: 5TW, Wiedereintritt - 15')
	,('192.168.1.16', '5417_38', 73961, 2024, 0, 18.0, 'BRK 13: RP, Ein- + Austritt - 17,54')
	,('192.168.1.16', '5417_38', 73962, 2024, 0, 18.0, 'BRK 14: 5TW, Ein- + Austritt - 17,5')
	,('192.168.1.16', '5417_38', 73963, 2024, 0, 30.0, 'BRK 15: Wechsel, Modell RP --> 5TW - 15 + 15 = 30')
	,('192.168.1.16', '5417_38', 73964, 2024, 0, 20.0, 'BRK 16: 5TW, öfter Wiedereintritt - 20')
	,('192.168.1.16', '5417_38', 73967, 2024, 0, 26.0, 'BRK 17: RP, öfter Wiedereintritt - 25,96')
	,('192.168.1.16', '5417_38', 74007, 2024, 0, 30.0, 'BRK 18: Wechsel, Modell 5TW --> RP - 15 + 15,23 = 30,23')
	,('192.168.1.16', '5417_38', 75267, 2024, 0, 23.0, 'BRK 19: Wechsel, BV - 17,33 + 6,00 = 23,33')
	,('192.168.1.14', '4715_38', 1983, 2024, 0, 31.0, 'Einstellung Berechnung nach Tage - SQL-32005')

	-- Bitte die letzte Zeile kopieren, Erläuterung: 
	-- ,('Server-IP', 'DB-Name', IDPERS, Urlaubsjahr, (Angabe 0= Urlaub, 1= Zusatzurlaub, etc.), Urlaubstage Angabe mit PUNKT!, '[SQL-Nr.] Kurzbeschreibung')

--> add additional test cases above this line!
------------------------------

DECLARE 
	@TestID				INT,
	@ServerIP			VARCHAR(15),
	@Base				VARCHAR(50),
	@Version			VARCHAR(10),
	@IDPERS				INT,
	@Fullname			VARCHAR(100),
	@Year				INT,
	@ClaimGroup			INT,
	@ExpectedResult		NUMERIC(7,2),
	@SQL				NVARCHAR(MAX),
	@ParmDefinition		NVARCHAR(500),
	@TestResult			NVARCHAR(20),
	@LinkedServerName	NVARCHAR(200),
	@FullDatabaseName	NVARCHAR(300),
	@Comment			NVARCHAR(max)
								   

-- table for test results
CREATE TABLE #TestResults (
	TestID			INT,
	ServerIP		VARCHAR(15),						 
	Base			VARCHAR(50),
	Version			VARCHAR(10),
	IDPERS			INT,
	Fullname		VARCHAR(100),
	Year			INT,
	ClaimGroup		INT,
	Comment			NVARCHAR(max),
	ExpectedResult	NUMERIC(7,2),
	ActualResult	NUMERIC(7,2),
	TestResult		NVARCHAR(max)
)

-- table for bases only
CREATE TABLE #TestBases (
	ServerIP		VARCHAR(15),						 
	Base			VARCHAR(50),
	Version			NVARCHAR(max)
)

-- cursor for iterating through test cases
DECLARE TestCursor CURSOR FOR 
SELECT TestID, ServerIP, Base, IDPERS, Year, ClaimGroup, Comment, ExpectedResult
FROM #TestCases

OPEN TestCursor
FETCH NEXT FROM TestCursor INTO @TestID, @ServerIP, @Base, @IDPERS, @Year, @ClaimGroup, @Comment, @ExpectedResult

WHILE @@FETCH_STATUS = 0
BEGIN

    -- determine the linked server name
	IF @ServerIP = (SELECT TOP 1 local_net_address FROM sys.dm_exec_connections WHERE session_id = @@SPID)
        SET @LinkedServerName = ''
    ELSE
    BEGIN
        -- check if the linked server already exists
        IF NOT EXISTS (SELECT 1 FROM sys.servers WHERE name = 'LS_' + @ServerIP)
        BEGIN
            -- create linked server if it does not exist
            DECLARE @AddLinkedServerSQL NVARCHAR(MAX)
            SET @AddLinkedServerSQL = N'
            EXEC master.dbo.sp_addlinkedserver 
                @server = N''LS_' + @ServerIP + ''', 
                @srvproduct=N'''', 
                @provider=N''SQLNCLI'', 
                @datasrc=N''' + @ServerIP + ''''
            EXEC(@AddLinkedServerSQL)
        END
        SET @LinkedServerName = QUOTENAME('LS_' + @ServerIP) + '.'
    END

    -- full database name
    SET @FullDatabaseName = @LinkedServerName + QUOTENAME(@Base)
	
    -- prepare procedure call
    SET @SQL = N'EXEC ' + @FullDatabaseName + N'.dbo.DP_RECALCS_updOtpClaim @IDPERS, @Year, @ClaimGroup, 9999900, 1'
    SET @ParmDefinition = N'@IDPERS INT, @Year INT, @ClaimGroup INT'
	
	IF @Run = 1 -- execute the test run
	BEGIN
		BEGIN TRY
			-- call procedure
			EXEC sp_executesql @SQL, @ParmDefinition, @IDPERS, @Year, @ClaimGroup
						  
			-- query and result storage
			SET @SQL = N'
			INSERT INTO #TestResults (TestID, ServerIP, Base, Version, IDPERS, Fullname, Year, ClaimGroup, Comment, ExpectedResult, ActualResult, TestResult)
			SELECT 
				@TestID,
				@ServerIP,
				@Base,
				VERSION = (
						SELECT TOP 1
							LEFT(IDVERSION, 3) + ''.'' + DESCRIPTION
						FROM
							' + @FullDatabaseName + N'.dbo.VERSLOGS
						ORDER BY
							IDVERSION desc, DESCRIPTION desc
					),
				IDPERS,
				FULLNAME,
				YEAR,
				IDGRPCLAIM,
				CASE @Detail when 1 then @Comment else '''' end,
				@ExpectedResult,
				CLAIM,
				CASE 
					WHEN ABS(CLAIM - @ExpectedResult) < 0.1 THEN ''OK''
					ELSE ''FAILED''
				END
			FROM ' + @FullDatabaseName + N'.dbo.UPLANCLAIMS u
			CROSS APPLY (SELECT FULLNAME FROM ' + @FullDatabaseName + N'.dbo.PERSONAL WHERE IDPERS = u.IDPERS) p
			WHERE IDPERS = @IDPERS
			AND YEAR = @Year
			AND IDGRPCLAIM = @ClaimGroup'

			SET @ParmDefinition = N'@TestID INT, @ServerIP VARCHAR(15), @Base VARCHAR(50), @IDPERS INT, @Year INT,
								  @ClaimGroup INT, @Comment NVARCHAR(max), @ExpectedResult NUMERIC(7,2), @Detail BIT'
			 
			EXEC sp_executesql @SQL, @ParmDefinition, @TestID, @ServerIP, @Base, @IDPERS, @Year, @ClaimGroup, @Comment, @ExpectedResult, @Detail
		END TRY
		BEGIN CATCH
		    INSERT INTO #TestResults (TestID, ServerIP, Base, IDPERS, Year, ClaimGroup, Comment, ExpectedResult, ActualResult, TestResult)
		    VALUES (@TestID, @ServerIP, @Base, @IDPERS, @Year, @ClaimGroup, IIF(@Detail = 1, @Comment, NULL), @ExpectedResult, NULL, 'ERROR: ' + ERROR_MESSAGE())
		END CATCH
	END
	ELSE BEGIN TRY
			-- query and result storage
			SET @SQL = N'
			INSERT INTO #TestBases (ServerIP, Base, Version)
			SELECT 
				@ServerIP,
				@Base,
				VERSION = (
						SELECT TOP 1
							LEFT(IDVERSION, 3) + ''.'' + DESCRIPTION
						FROM
							' + @FullDatabaseName + N'.dbo.VERSLOGS
						ORDER BY
							IDVERSION desc, DESCRIPTION desc
					)'


			SET @ParmDefinition = N'@ServerIP VARCHAR(15), @Base VARCHAR(50)'
			 
			EXEC sp_executesql @SQL, @ParmDefinition, @ServerIP, @Base
	END TRY
	BEGIN CATCH
		INSERT INTO #TestBases (ServerIP, Base, Version)
		VALUES (@ServerIP, @Base, 'ERROR: ' + ERROR_MESSAGE())
	END CATCH


    FETCH NEXT FROM TestCursor INTO @TestID, @ServerIP, @Base, @IDPERS, @Year, @ClaimGroup, @Comment, @ExpectedResult
END

CLOSE TestCursor
DEALLOCATE TestCursor

-- show results
IF @Run = 1 BEGIN
	SELECT * FROM #TestResults r
END
ELSE BEGIN
	SELECT DISTINCT * FROM #TestBases
END

-- clean up
DROP TABLE #TestCases
DROP TABLE #TestResults
DROP TABLE #TestBases
