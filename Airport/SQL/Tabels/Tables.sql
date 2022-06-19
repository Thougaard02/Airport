CREATE TABLE Company
(
	Company_Id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Company_Name Varchar(256) UNIQUE
);
CREATE TABLE Route
(
	Route_Id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Company_CompanyId int,
	FOREIGN KEY (Company_CompanyId) REFERENCES Company(Company_Id)
);
CREATE TABLE AirPort
(
	IATA VARCHAR(3) PRIMARY KEY NOT NULL,
	Airport_Name VARCHAR(256) NOT NULL,
	Airport_Address VARCHAR(256) NOT NULL,
	CONSTRAINT CH_IATA CHECK (DATALENGTH(IATA) = 3 AND (upper(IATA) = IATA collate Latin1_General_BIN2))
);
CREATE TABLE Plane
(
	Serial_Number VARCHAR(256) PRIMARY KEY,
	Company_CompanyId int NOT NULL,
	Route_RouteId int NOT NULL,
	Airport_IATA VARCHAR(3) NOT NULL,
	FOREIGN KEY (Company_CompanyId) REFERENCES Company(Company_Id),
	FOREIGN KEY (Route_RouteId) REFERENCES Route(Route_Id),
	FOREIGN KEY (Airport_IATA) REFERENCES Airport(IATA)
);
CREATE TABLE Airport_Route
(
	Airport_IATA VARCHAR(3) NOT NULL,
	Route_RouteId INT NOT NULL,
	PRIMARY KEY(Airport_IATA, Route_RouteId),
	FOREIGN KEY (Route_RouteId) REFERENCES Route(Route_Id),
	FOREIGN KEY (Airport_IATA) REFERENCES Airport(IATA)
);