CREATE DATABASE Gallery;
----
CREATE TABLE ArtistInformation( 
              ArtistID INT NOT NULL PRIMARY KEY, 
              FirstName VARCHAR(100), 
              LastName VARCHAR(100), 
              BirthDate VARCHAR(100), 
              BirthPlace VARCHAR(100), 
              PhoneNumber INT, 
              Style VARCHAR(100),
			  Address VARCHAR(100),
              ZipCode VARCHAR(20),
);

CREATE TABLE CustomerInformation( 
              CustomerID INT NOT NULL PRIMARY KEY, 
              FirstName VARCHAR(100), 
              LastName VARCHAR(100), 
              PhoneNumber VARCHAR(15), 
              Address VARCHAR(100), 
              ZipCode VARCHAR(20),
			  email VARCHAR(20) 
);


CREATE TABLE ExhibitionInformation( 
              ExhibitionID INT NOT NULL PRIMARY KEY, 
              NameGallery VARCHAR(100), 
              Start_Date VARCHAR(100), 
              End_Date VARCHAR(100), 
              ZipCode VARCHAR(20)
);

CREATE TABLE Address( 
              ZipCode VARCHAR(20) PRIMARY KEY, 
              City VARCHAR(20),
);

CREATE TABLE CityInformation( 
              City VARCHAR(20) PRIMARY KEY,
              State VARCHAR(20), 
);

CREATE TABLE StateInformation( 
              State VARCHAR(20) PRIMARY KEY, 
              Country VARCHAR(20) 
);

CREATE TABLE Order_to_Buy( 
              OrderID INT NOT NULL PRIMARY KEY, 
              OrderPrice VARCHAR(20),
              OrderDate VARCHAR(20), 
              ArtID INT, 
              CustomerID INT 
);

CREATE TABLE Art_Exhibition( 
              ExhibitionID INT, 
              ArtID INT 
);

CREATE TABLE Rental( 
             RentalID INT NOT NULL PRIMARY KEY, 
             RentalStartDate VARCHAR(20), 
             RentalEndDate VARCHAR(20), 
             RentalPrice VARCHAR(20),
             ArtID INT, 
             CustomerID INT
);

CREATE TABLE ArtWork( 
             ArtID  INT NOT NULL PRIMARY KEY, 
             Year  INT, 
             Title  VARCHAR(20), 
             Price  VARCHAR(20), 
             Description  VARCHAR(200), 
             Type  VARCHAR(20), 
             ArtistID   INT, 
             OrderID  INT, 
             RentalID   INT 
);
-- FOREIGN KEYS --
ALTER TABLE Art_Exhibition 
ADD FOREIGN KEY (ExhibitionID) REFERENCES  ExhibitionInformation(ExhibitionID);

ALTER TABLE Art_Exhibition 
ADD FOREIGN KEY (ArtID)  REFERENCES ArtWork(ArtID);

ALTER TABLE Rental 
ADD FOREIGN KEY (ArtID) REFERENCES ArtWork(ArtID);

ALTER TABLE Order_to_Buy
ADD FOREIGN KEY (ArtID)  REFERENCES ArtWork(ArtID);

ALTER TABLE Rental 
ADD FOREIGN KEY (CustomerID)  REFERENCES CustomerInformation(CustomerID);

ALTER TABLE Order_to_Buy 
ADD FOREIGN KEY (CustomerID)  REFERENCES CustomerInformation(CustomerID);

ALTER TABLE ExhibitionInformation 
ADD FOREIGN KEY (ZipCode)  REFERENCES  Address(ZipCode);

ALTER TABLE ArtistInformation 
ADD FOREIGN KEY (ZipCode)  REFERENCES  Address(ZipCode);

ALTER TABLE CustomerInformation 
ADD FOREIGN KEY (ZipCode)  REFERENCES  Address(ZipCode);

ALTER TABLE Address 
ADD FOREIGN KEY (City)  REFERENCES  CityInformation(City);

ALTER TABLE CityInformation 
ADD FOREIGN KEY (State)  REFERENCES  StateInformation(State);


