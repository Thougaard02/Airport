CREATE OR ALTER PROCEDURE SP_InsertIntoAirport 
	@IATA VARCHAR(3),
	@Airport_Name VARCHAR(64),
	@Airport_Address VARCHAR(256)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO AirPort VALUES(@IATA, @Airport_Name, @Airport_Name)
END
GO

CREATE OR ALTER PROCEDURE SP_InsertIntoCompany 
	@Company_Name VARCHAR(256)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Company VALUES(@Company_Name)
END
GO
 
CREATE OR ALTER PROCEDURE SP_GetAllAirportIATA
AS
BEGIN
	SET NOCOUNT ON;
	SELECT AirPort.IATA FROM AirPort 
END
GO

CREATE OR ALTER PROCEDURE SP_CreateRoute 

	@Company_Name VARCHAR(64)
AS
BEGIN
	DECLARE @Company_Id INT
	SET NOCOUNT ON;
	SET @Company_Id = (SELECT Company.Company_Id FROM Company WHERE Company.Company_Name = @Company_Name);

	INSERT INTO Route VALUES(@Company_Id);
	
END
GO

CREATE OR ALTER PROCEDURE SP_CreateAirportRoute
	@IATA VARCHAR(3),
	@Company_Name VARCHAR(64)
AS
BEGIN
	DECLARE @Route_Id INT
	DECLARE @Company_Id INT
	SET NOCOUNT ON;
	
	SET @IATA = (SELECT AirPort.IATA FROM AirPort WHERE AirPort.IATA = @IATA);
	
	SET @Company_Id = (SELECT Company.Company_Id FROM Company WHERE Company.Company_Name = @Company_Name);

	SET @Route_Id = (SELECT Route.Route_Id FROM Route WHERE Route.Company_CompanyId = @Company_Id)

	INSERT INTO AirPort_Route VALUES(@IATA, @Route_Id);
END
GO

-- EXEC
--EXEC SP_InsertIntoAirport 'CPH', 'Copenhagen', 'Bomba' 

--EXEC SP_InsertIntoCompany 'SAS';

--EXEC SP_CreateRoute 'SAS';

--EXEC SP_CreateAirportRoute 'CPH', 'SAS';

--EXEC SP_GetAllAirportIATA