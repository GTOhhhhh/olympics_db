--to test the following violations, please populate the database by running dml.sql first

--ERROR, VIOLATE PK CONSTRAINT
INSERT INTO Country VALUES ('SA', 'Cuba');

--ERROR, CANNOT HAVE 2 DIFFERENT COUNTRY_CODES REFERENCING THE SAME COUNTRY
INSERT INTO Country VALUES ('UK', 'Great Brittain');

--ERROR, PLACE CANNOT BE BOTH VENUE AND ACCOMMODATION
INSERT INTO accommodation Values('International Regatta Centre');
INSERT INTO venue VALUES('Novatel Olymp Prk');

--ERROR, EVENT CANNOT BE TEAM & INDIVIDUAL
INSERT INTO TeamEvent VALUES ('Mens 100m Ath', 'Jamaica 4x100', '36.84', 'GOLD');
INSERT INTO IndividualEvent VALUES ('Womens Beach Volleyball', 1000000002, '36.84', 'GOLD');

--ERROR, MEMBER CANNOT BE ATHLETE AND STAFF MEMBER
INSERT INTO Athlete VALUES (1000000208); --(staff member with this id added in dml.sql)



