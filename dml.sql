--Add into COUNTRY
INSERT INTO Country VALUES('USA', 'United States');
INSERT INTO Country VALUES  ('GB', 'Great Brittain');
INSERT INTO Country VALUES  ('AUS', 'Australia');
INSERT INTO Country VALUES  ('CHI', 'China');
INSERT INTO Country VALUES  ('SA', 'South Africa');
INSERT INTO Country VALUES  ('BRZ', 'Brazil');
INSERT INTO Country VALUES  ('JAM', 'Jamaica');
INSERT INTO Country VALUES  ('SK', 'South Korea');

--Add into LOCATION
INSERT INTO Location VALUES  ('City of Sydney', 'District', NULL);
INSERT INTO Location VALUES  ('Inner West', 'Area', 'City of Sydney');

INSERT INTO Location VALUES  ('Glebe', 'Suburb', 'Inner West');

INSERT INTO Location VALUES  ('Western Suburbs', 'Area','City of Sydney');
INSERT INTO Location VALUES  ('Homebush','Suburb', 'Western Suburbs');
INSERT INTO Location VALUES  ('Newington', 'Suburb', 'Western Suburbs');
INSERT INTO Location VALUES  ('Parramatta', 'Suburb', 'Western Suburbs');

-- Add into PLACE
INSERT INTO Place VALUES  ('Stad Australia', 'Edwin Flack Ave, Sydney Olympic Park NSW 2127', -33.8506, 151.0670, 'Homebush');
INSERT INTO Place VALUES  ('Syd Acquatic Centre', 'Olympic Blvd, Sydney Olympic Park NSW 2127', -33.8471, 151.0634, 'Homebush');
INSERT INTO Place VALUES  ('Novatel Olymp Prk', '11 Olympic Blvd, Sydney Olympic Park NSW 2127', -33.8480, 151.0674, 'Homebush');
INSERT INTO Place VALUES  ('Olympic Villiage', NULL, -33.8293642, 151.0715256, 'Newington');
INSERT INTO Place VALUES  ('Park View Hotel', '253 Broadway, Glebe NSW 2037', -33.8974082, 151.1723617, 'Glebe');
INSERT INTO Place VALUES  ('International Regatta Centre', 'Gate A Old Castlereagh Rd, Castlereagh NSW 2749', -33.722459,150.6549704, 'Parramatta');


--sort to VENUE and ACCOMMODATION
INSERT INTO Venue VALUES('Stad Australia');
INSERT INTO Venue VALUES('Syd Acquatic Centre');
INSERT INTO Venue Values('International Regatta Centre');
INSERT INTO Accommodation VALUES('Novatel Olymp Prk');
INSERT INTO Accommodation VALUES('Olympic Villiage');
INSERT INTO Accommodation VALUES('Park View Hotel');

--Add into ATHLETE, OFFICIAL and STAFF
--Note that member is automatically populated by entries into these tables, then updated with extra information
INSERT INTO Athlete VALUES (1000000001);
INSERT INTO Athlete VALUES (1000000002);
INSERT INTO Athlete VALUES (1000000003);
INSERT INTO Athlete VALUES (1000000004);
INSERT INTO Athlete VALUES (1000000005);
INSERT INTO Athlete VALUES (1000000006);
INSERT INTO Athlete VALUES (1000000007);
INSERT INTO Athlete VALUES (1000000008);
INSERT INTO Athlete VALUES (1000000009);
INSERT INTO Athlete VALUES (1000000010);
INSERT INTO Athlete VALUES (1000000011);
INSERT INTO Athlete VALUES (1000000012);
INSERT INTO Official VALUES (1000000105);
INSERT INTO Official VALUES (1000000106);
INSERT INTO Official VALUES (1000000107);

INSERT INTO Staff VALUES (1000000208);
INSERT INTO Staff VALUES (1000000209);
INSERT INTO Staff VALUES (1000000210);

UPDATE member
SET (title, firstname, familyname, country_fk, accommodation_fk) =
('Mr', 'Usain', 'Bolt', 'JAM', 'Novatel Olymp Prk')
WHERE member_id = 1000000001;
UPDATE member
SET (title, firstname, familyname, country_fk, accommodation_fk) =
('Mr', 'Mo', 'Farrah', 'GB', 'Novatel Olymp Prk')
WHERE member_id = 1000000002;
UPDATE member
SET (title, firstname, familyname, country_fk, accommodation_fk) =
('Mrs', 'Cathy', 'Freeman', 'AUS', 'Novatel Olymp Prk')
WHERE member_id = 1000000003;
UPDATE member
SET (title, firstname, familyname, country_fk, accommodation_fk) =
('Mr', 'Michael', 'Phelps', 'USA', 'Olympic Villiage')
WHERE member_id = 1000000004;
UPDATE member
SET (title, firstname, familyname, country_fk, accommodation_fk) =
('Mr', 'Michael', 'Frater', 'JAM', 'Olympic Villiage')
WHERE member_id = 1000000005;
UPDATE member
SET (title, firstname, familyname, country_fk, accommodation_fk) =
('Mr', 'Asafa', 'Powell', 'JAM', 'Olympic Villiage')
WHERE member_id = 1000000006;
UPDATE member
SET (title, firstname, familyname, country_fk, accommodation_fk) =
('Mr', 'Nesta', 'Carter', 'JAM', 'Olympic Villiage')
WHERE member_id = 1000000007;
UPDATE member
SET (title, firstname, familyname, country_fk, accommodation_fk) =
('Mr', 'Justin', 'Gatlin', 'USA', 'Novatel Olymp Prk')
WHERE member_id = 1000000008;
UPDATE member
SET (title, firstname, familyname, country_fk, accommodation_fk) =
('Mrs', 'Kerry', 'Walsh Jennings', 'USA', 'Novatel Olymp Prk')
WHERE member_id = 1000000009;
UPDATE member
SET (title, firstname, familyname, country_fk, accommodation_fk) =
('Mrs', 'April', 'Ross', 'USA', 'Novatel Olymp Prk')
WHERE member_id = 1000000010;
UPDATE member
SET (title, firstname, familyname, country_fk, accommodation_fk) =
('Mrs', 'Mariafe', 'Artacho del Solar', 'AUS', 'Olympic Villiage')
WHERE member_id = 1000000011;
UPDATE member
SET (title, firstname, familyname, country_fk, accommodation_fk) =
('Ms', 'Nicole', 'Laird', 'AUS', 'Olympic Villiage')
WHERE member_id = 1000000012;
UPDATE member
SET (title, firstname, familyname, country_fk, accommodation_fk) =
('Mr', 'Lee', 'Hak-rae', 'SK', 'Park View Hotel')
WHERE member_id = 1000000105;
UPDATE member
SET (title, firstname, familyname, country_fk, accommodation_fk) =
('Mr', 'Terry', 'McDermott', 'USA', 'Olympic Villiage')
WHERE member_id = 1000000106;
UPDATE member
SET (title, firstname, familyname, country_fk, accommodation_fk) =
('Mr', 'Allen', 'Hak-Church', 'USA', 'Park View Hotel')
WHERE member_id = 1000000107;
UPDATE member
SET (title, firstname, familyname, country_fk, accommodation_fk) =
('Ms', 'Althea', 'Iligan', 'AUS', 'Novatel Olymp Prk')
WHERE member_id = 1000000208;
UPDATE member
SET (title, firstname, familyname, country_fk, accommodation_fk) =
('Mr', 'Daniel', 'Evans', 'AUS', 'Novatel Olymp Prk')
WHERE member_id = 1000000209;

UPDATE member
SET (title, firstname, familyname, country_fk, accommodation_fk) =
('Mr', 'Andrew', 'Singh', 'AUS', 'Park View Hotel')
WHERE member_id = 1000000210;

--add into SPORTS
INSERT INTO Sport VALUES ('Swimming');
INSERT INTO Sport VALUES ('Athletics');
INSERT INTO Sport VALUES ('Volleyball');

--add into Team
INSERT INTO TeamNames VALUES ('Jamaica 4x100');
INSERT INTO TeamNames VALUES ('USA BeachVoley');
INSERT INTO TeamNames VALUES ('AUS BeachVoley');

INSERT INTO Team VALUES ('Jamaica 4x100', 1000000001, 'JAM');
INSERT INTO Team VALUES ('Jamaica 4x100', 1000000005, 'JAM');
INSERT INTO Team VALUES ('Jamaica 4x100', 1000000006, 'JAM');
INSERT INTO Team VALUES ('Jamaica 4x100', 1000000007, 'JAM');

INSERT INTO Team VALUES ('USA BeachVoley', 1000000009, 'USA');
INSERT INTO Team VALUES ('USA BeachVoley', 1000000010, 'USA');
INSERT INTO Team VALUES ('AUS BeachVoley', 1000000011, 'AUS');
INSERT INTO Team VALUES ('AUS BeachVoley', 1000000012, 'AUS');

--add EVENT
INSERT INTO Event VALUES ('Mens 4x100 Relay Ath', 'time_seconds', 'Stad Australia', 'Athletics', '12:15:00', '2020-07-16');
INSERT INTO Event VALUES ('Womens 400m Ath', 'time_seconds', 'Stad Australia', 'Athletics', '11:15:00', '2020-07-16');
INSERT INTO Event VALUES ('Mens 50m Freestyle Swi', 'time_seconds', 'Syd Acquatic Centre', 'Swimming', '09:00:00', '2020-07-16');
INSERT INTO Event VALUES ('Mens 5000m Ath', 'time_seconds', 'Stad Australia', 'Athletics', '12:15:00', '2020-07-15');
INSERT INTO Event VALUES ('Mens 4x400 Relay Ath', 'time_seconds', 'Stad Australia', 'Athletics', '2:00:00', '2020-07-15');
INSERT INTO Event VALUES ('Mens 100m Ath', 'time_seconds', 'Stad Australia', 'Athletics', '11:15:00', '2020-07-16');
INSERT INTO Event VALUES ('Womens Beach Volleyball', 'score_points', 'International Regatta Centre', 'Volleyball', '11:15:00', '2020-07-16');


--add INDIVIDUALEVENT
INSERT INTO IndividualEvent VALUES ('Womens 400m Ath', 1000000003, '49.11', 'GOLD');
INSERT INTO IndividualEvent VALUES ('Mens 100m Ath', 1000000001, '9.81', 'GOLD');
INSERT INTO IndividualEvent VALUES ('Mens 100m Ath', 1000000006, '9.93');
INSERT INTO IndividualEvent VALUES ('Mens 100m Ath', 1000000007, '10.04');
INSERT INTO IndividualEvent VALUES ('Mens 100m Ath', 1000000008, '9.89', 'SILVER');
INSERT INTO IndividualEvent VALUES ('Mens 5000m Ath', 1000000002, '13.03', 'GOLD');

--add TEAMEVENTS
INSERT INTO TeamEvent VALUES ('Mens 4x100 Relay Ath', 'Jamaica 4x100', '36.84', 'GOLD');
INSERT INTO TeamEvent VALUES ('Womens Beach Volleyball', 'AUS BeachVoley', '43', 'GOLD');
INSERT INTO TeamEvent VALUES ('Womens Beach Volleyball', 'USA BeachVoley', '35', 'SILVER');



--add OFFICIALEVENT
INSERT INTO OfficialEvent VALUES ('Mens 100m Ath', 1000000105, 'Timekeeper');
INSERT INTO OfficialEvent VALUES ('Mens 100m Ath', 1000000106, 'Timekeeper');
INSERT INTO OfficialEvent VALUES ('Mens 100m Ath', 1000000107, 'Head Timekeeper');
INSERT INTO OfficialEvent VALUES ('Mens 4x100 Relay Ath', 1000000107, 'Head Timekeeper');


--add into Vehicle
INSERT INTO Vehicle VALUES ('5GZCZ43D', 20);
INSERT INTO Vehicle VALUES ('0ZZZ99ZT', 50);

--add into JOURNEY
INSERT INTO Journey VALUES ('Olympic Villiage', 'Stad Australia', '11:00:00', '2018-06-01', '0ZZZ99ZT', 0);
INSERT INTO Journey VALUES ('Stad Australia', 'Olympic Villiage', '12:00:00', '1/6/2018', '5GZCZ43D', 0);
INSERT INTO Journey VALUES ('Olympic Villiage', 'Novatel Olymp Prk', '21:00:00', '1/6/2018', '0ZZZ99ZT', 0);

--add into Bookings
INSERT INTO Bookings VALUES (1000000001, 'Olympic Villiage', 'Stad Australia', '11:00:00', '2018-06-01', '0ZZZ99ZT', 1000000208, CURRENT_TIMESTAMP);
INSERT INTO Bookings VALUES (1000000002, 'Olympic Villiage', 'Stad Australia', '11:00:00', '2018-06-01', '0ZZZ99ZT', 1000000208, CURRENT_TIMESTAMP);
INSERT INTO Bookings VALUES (1000000003, 'Olympic Villiage', 'Stad Australia', '11:00:00', '2018-06-01', '0ZZZ99ZT', 1000000210, CURRENT_TIMESTAMP);
INSERT INTO Bookings VALUES (1000000004, 'Olympic Villiage', 'Stad Australia', '11:00:00', '2018-06-01', '0ZZZ99ZT', 1000000208, CURRENT_TIMESTAMP);

INSERT INTO Bookings VALUES (1000000001, 'Stad Australia', 'Olympic Villiage', '12:00:00', '1/6/2018', '5GZCZ43D', 1000000209, CURRENT_TIMESTAMP);
INSERT INTO Bookings VALUES (1000000002, 'Stad Australia', 'Olympic Villiage', '12:00:00', '1/6/2018', '5GZCZ43D', 1000000210, CURRENT_TIMESTAMP);
INSERT INTO Bookings VALUES (1000000003, 'Stad Australia', 'Olympic Villiage', '12:00:00', '1/6/2018', '5GZCZ43D', 1000000210, CURRENT_TIMESTAMP);

--update Bookings
UPDATE bookings
SET member_id    = 1000000003,
  to_fk             = 'Olympic Villiage',
  from_fk           = 'Novatel Olymp Prk',
  start_time        = '21:00:00',
  start_date        = '1/6/2018',
  vehicle_fk        = '0ZZZ99ZT',
  bookedby_staff_fk = 1000000210,
  booked_at_date    = CURRENT_TIMESTAMP
WHERE
  bookings.member_id = 1000000001 AND bookings.to_fk = 'Olympic Villiage' AND bookings.from_fk = 'Stad Australia'
  AND bookings.start_time = '11:00:00' AND bookings.start_date = '2018-06-01' AND bookings.vehicle_fk = '0ZZZ99ZT';

--remove from Bookings
DELETE FROM bookings
WHERE bookings.to_fk = 'Olympic Villiage';
