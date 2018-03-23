DROP VIEW IF EXISTS AllAthlete;
DROP TABLE IF EXISTS Results;
DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS Journey;
DROP TABLE IF EXISTS Vehicle;
DROP TABLE IF EXISTS OfficialEvent;
DROP TABLE IF EXISTS TeamEvent;
DROP TABLE IF EXISTS IndividualEvent;
DROP TABLE IF EXISTS Event;
DROP TABLE IF EXISTS Sport;
DROP TABLE IF EXISTS Team;
DROP TABLE IF EXISTS TeamNames;
DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS Official;
DROP TABLE IF EXISTS Athlete;
DROP TABLE IF EXISTS Member;
DROP TABLE IF EXISTS Accommodation;
DROP TABLE IF EXISTS Venue;
DROP TABLE IF EXISTS Place;
DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS Country;

CREATE TABLE Country (
  code VARCHAR(3),
  name VARCHAR(20) NOT NULL,
  PRIMARY KEY (code)
);

CREATE TABLE Location (
  name      VARCHAR(20),
  type      VARCHAR(20),
  parent_fk VARCHAR(20),
  PRIMARY KEY (name),
  FOREIGN KEY (parent_fk) REFERENCES Location (name) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT valid_type CHECK (type IN ('Suburb', 'Area', 'District'))
);

CREATE TABLE Place (
  name        VARCHAR(50),
  address     VARCHAR(50),
  latitude    FLOAT,
  longitude   FLOAT,
  location_fk VARCHAR(20),
  PRIMARY KEY (name),
  FOREIGN KEY (location_fk) REFERENCES Location(name) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Venue (
  name VARCHAR(50),
  PRIMARY KEY (name),
  FOREIGN KEY (name) REFERENCES Place (name) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Accommodation (
  name VARCHAR(50),
  PRIMARY KEY (name),
  FOREIGN KEY (name) REFERENCES Place (name) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Member (
  member_id        INTEGER,
  title            VARCHAR(10),
  firstname        VARCHAR(20) NOT NULL,
  familyname       VARCHAR(20) NOT NULL,
  country_fk       VARCHAR(3),
  accommodation_fk VARCHAR(50),
  PRIMARY KEY (member_id),
  FOREIGN KEY (country_fk) REFERENCES Country (code) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (accommodation_fk) REFERENCES Accommodation (name)ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT member_id_10_digits CHECK (member_id BETWEEN 999999999 AND 9999999999)
);

CREATE TABLE Athlete (
  member_id     INTEGER,
  PRIMARY KEY (member_id),
  FOREIGN KEY (member_id) REFERENCES Member (member_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Official (
  member_id INTEGER,
  PRIMARY KEY (member_id),
  FOREIGN KEY (member_id) REFERENCES Member (member_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Staff (
  member_id INTEGER,
  PRIMARY KEY (member_id),
  FOREIGN KEY (member_id) REFERENCES Member (member_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE TeamNames (
  team_name VARCHAR(20),
  PRIMARY KEY (team_name)
);

CREATE TABLE Team (
  team_name     VARCHAR(20),
  member_id     INTEGER,
  country_fk    VARCHAR(3) NOT NULL,
  PRIMARY KEY (team_name, member_id),
  FOREIGN KEY (team_name) REFERENCES TeamNames (team_name) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (member_id) REFERENCES Athlete (member_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (country_fk) REFERENCES Country (code) ON DELETE RESTRICT ON UPDATE CASCADE
  );

CREATE TABLE Sport (
  sport_name VARCHAR(20),
  PRIMARY KEY (sport_name)
);

CREATE TABLE Event (
  event_name  VARCHAR(50),
  result_type VARCHAR(20),
  venue_fk    VARCHAR(50) NOT NULL,
  sport_fk    VARCHAR(20) NOT NULL,
  start_time  TIME,
  start_date  DATE,
  PRIMARY KEY (event_name),
  FOREIGN KEY (venue_fk) REFERENCES Venue (name) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (sport_fk) REFERENCES Sport (sport_name) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT result_type_check CHECK (result_type IN ('time_seconds', 'distance_metres', 'score_points'))

);

CREATE TABLE IndividualEvent (
  event_name   VARCHAR(50),
  member_id    INTEGER,
  result       FLOAT,
  medal        VARCHAR(6),
  PRIMARY KEY (event_name, member_id),
  FOREIGN KEY (event_name) REFERENCES Event (event_name) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (member_id) REFERENCES Athlete (member_id) ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE TeamEvent (
  event_name VARCHAR(50),
  team_fk    VARCHAR(20) UNIQUE ,
  result     FLOAT,
  medal      VARCHAR(6),
  PRIMARY KEY (event_name, team_fk),
  FOREIGN KEY (event_name) REFERENCES Event (event_name) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (team_fk) REFERENCES TeamNames (team_name) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE OfficialEvent (
  event_name    VARCHAR(50),
  official_fk   INTEGER,
  role          VARCHAR(20),
  PRIMARY KEY (event_name, official_fk),
  FOREIGN KEY (event_name) REFERENCES Event (event_name) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (official_fk) REFERENCES Official (member_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Vehicle (
  vehicle_code VARCHAR(8), -- add regex
  capacity     INTEGER,
  PRIMARY KEY (vehicle_code),
  CONSTRAINT vehicle_code_length CHECK (length(vehicle_code) = 8),
  CONSTRAINT no_special_char_vehicle_code CHECK (vehicle_code ~* '^[A-Za-z0-9]*$')
);

CREATE TABLE Journey (
  to_place     VARCHAR(50),
  from_place   VARCHAR(50),
  start_time   TIME,
  start_date   DATE,
  vehicle_code VARCHAR(8),
  nbooked      INTEGER,
  PRIMARY KEY (to_place, from_place, start_time, start_date, vehicle_code),
  FOREIGN KEY (to_place) REFERENCES Place (name) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (from_place) REFERENCES Place (name) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (vehicle_code) REFERENCES Vehicle (vehicle_code) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Bookings (
  member_id         INTEGER,
  to_fk             VARCHAR(50),
  from_fk           VARCHAR(50),
  start_time        TIME,
  start_date        DATE,
  vehicle_fk        VARCHAR(8),
  bookedby_staff_fk INTEGER,
  booked_at_date    TIMESTAMP,
  PRIMARY KEY (member_id, to_fk, from_fk, start_time, start_date, vehicle_fk),
  FOREIGN KEY (member_id) REFERENCES Member (member_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (bookedby_staff_fk) REFERENCES Staff (member_id) ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (to_fk, from_fk, start_time, start_date, vehicle_fk)
  REFERENCES Journey (to_place, from_place, start_time, start_date, vehicle_code) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Results (
  athlete_id INTEGER,
  event_name VARCHAR(50),
  result      FLOAT,
  result_type VARCHAR(20),
  medal       VARCHAR(6),
  PRIMARY KEY (athlete_id, event_name),
  FOREIGN KEY (athlete_id) REFERENCES Athlete (member_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (event_name) REFERENCES Event (event_name) ON DELETE CASCADE ON UPDATE CASCADE
);

--triggers to populate Member table with member_ids from Athlete/Official/Staff tables
--user never inserts to member directly (only updates)
--this ensures total participation between member & child tables and disjoint between Athlete/Official/Staff
CREATE OR REPLACE FUNCTION addMembers() RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO Member VALUES (new.member_id, NULL, 'to be confirmed','to be confirmed',NULL,NULL);
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER addStaff
BEFORE INSERT ON Staff
FOR EACH ROW EXECUTE PROCEDURE addMembers();

CREATE TRIGGER addAthlete
BEFORE INSERT ON Athlete
FOR EACH ROW EXECUTE PROCEDURE addMembers();

CREATE TRIGGER addOfficial
BEFORE INSERT ON Official
FOR EACH ROW EXECUTE PROCEDURE addMembers();

--trigger to maintain nbookings in journey table to be consistent with bookings table
CREATE OR REPLACE FUNCTION nbookings() RETURNS TRIGGER AS $$
BEGIN
   IF (tg_op = 'INSERT')
    THEN
      UPDATE Journey
      SET nbooked = nbooked + 1
      WHERE new.to_fk = journey.to_place
            AND new.from_fk = journey.from_place
            AND new.start_time = journey.start_time
            AND new.start_date = journey.start_date
            AND new.vehicle_fk = journey.vehicle_code;
  ELSEIF (tg_op = 'DELETE')
  THEN
    UPDATE Journey
    SET nbooked = nbooked - 1
    WHERE old.to_fk = journey.to_place
          AND old.from_fk = journey.from_place
          AND old.start_time = journey.start_time
          AND old.start_date = journey.start_date
          AND old.vehicle_fk = journey.vehicle_code;
  ELSEIF (tg_op = 'UPDATE')
    THEN
      UPDATE Journey
      SET nbooked = nbooked + 1
      WHERE new.to_fk = journey.to_place
            AND new.from_fk = journey.from_place
            AND new.start_time = journey.start_time
            AND new.start_date = journey.start_date
            AND new.vehicle_fk = journey.vehicle_code;
      UPDATE Journey
      SET nbooked = nbooked - 1
      WHERE old.to_fk = journey.to_place
            AND old.from_fk = journey.from_place
            AND old.start_time = journey.start_time
            AND old.start_date = journey.start_date
            AND old.vehicle_fk = journey.vehicle_code;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER nBookings
AFTER INSERT OR UPDATE OR DELETE ON bookings FOR EACH ROW
EXECUTE PROCEDURE nBookings();

--assertion to ensure nbookings in journey always matches corresponding number of entries in bookings table
--CREATE ASSERTION EnrollmentAssert
--CHECK (
--    NOT EXISTS(SELECT nbooked
--                   FROM Journey J
--                   WHERE nbooked != (SELECT COUNT(*)
--                                     FROM Bookings B
--                                     WHERE J.to_place = B.to_fk
--                                           AND J.from_place= B.from_fk
--                                           AND J.start_time = B.start_time
--                                           AND J.start_date = B.start_date
--                                           AND J.vehicle_code = B.vehicle_fk
--                   )
-- )
--);

--trigger to populate results table with data from the individual event table
CREATE OR REPLACE FUNCTION resultIndividual() RETURNS TRIGGER AS $BODY$
BEGIN
  INSERT INTO
    Results (athlete_id, event_name, result, result_type, medal)
  VALUES (NEW.member_id, NEW.event_name, NEW.result,
          (SELECT result_type FROM Event WHERE event_name = new.event_name),
          NEW.medal);
  RETURN NEW;
END
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER addIndividualResults
AFTER INSERT OR UPDATE ON IndividualEvent FOR EACH ROW
EXECUTE PROCEDURE resultIndividual();

--trigger to populate results table with data from the teamevent table
CREATE OR REPLACE FUNCTION resultTeam()
  RETURNS TRIGGER AS $BODY$
BEGIN
  INSERT INTO results (SELECT
                         member_id,
                         event_name,
                         result,
                         result_type,
                         medal
                       FROM teamevent te
                         JOIN Event USING (event_name)
                         JOIN team t ON (te.team_fk = t.team_name)
                       WHERE event_name = new.event_name AND te.team_fk = new.team_fk);
  RETURN NEW;
END
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER addTeamResults
AFTER INSERT OR UPDATE ON TeamEvent FOR EACH ROW
EXECUTE PROCEDURE resultTeam();

--triggers to ensure that venue and accommodation are disjoint
CREATE OR REPLACE FUNCTION abort_venue() RETURNS TRIGGER AS $$
BEGIN
  IF (SELECT COUNT(*)
      FROM Accommodation A
      WHERE A.name = NEW.name)
  THEN RAISE EXCEPTION 'Place is already assigned to an Accommodation';
  END IF;
  RETURN NEW;
END
$$ LANGUAGE plpgsql;

CREATE TRIGGER venueCheck
BEFORE INSERT ON Venue FOR EACH ROW
EXECUTE PROCEDURE abort_venue();

CREATE OR REPLACE FUNCTION abort_accom() RETURNS TRIGGER AS $BODY$
BEGIN
  IF (SELECT COUNT(*)
      FROM Venue V
      WHERE V.name = NEW.name)
  THEN RAISE EXCEPTION 'Place is already assigned to a Venue';
  END IF;
  RETURN NEW;
END
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER accomCheck
BEFORE INSERT ON Accommodation FOR EACH ROW
EXECUTE PROCEDURE abort_accom();

--assertion to ensure that team and individual events are disjoint
--CREATE ASSERTION EventAssert
--CHECK(
--    NOT EXISTS(SELECT *
--                FROM IndividualEvent I JOIN TeamEvent T USING(event_name))
--);

--triggers to ensure that team and individual events are disjoint
CREATE OR REPLACE FUNCTION abort_teamEvent() RETURNS TRIGGER AS $$
BEGIN
  IF EXISTS(SELECT 1
      FROM IndividualEvent I
      WHERE I.event_name = NEW.event_name)
  THEN RAISE EXCEPTION 'Event is already assigned to an Individual Event';
  END IF;
  RETURN NEW;
END
$$ LANGUAGE plpgsql;

CREATE TRIGGER teamEventCheck
BEFORE INSERT ON TeamEvent FOR EACH ROW
EXECUTE PROCEDURE abort_teamEvent();

CREATE OR REPLACE FUNCTION abort_indEvent() RETURNS TRIGGER AS $BODY$
BEGIN
  IF EXISTS(SELECT 1
      FROM TeamEvent T
      WHERE T.event_name = NEW.event_name)
  THEN RAISE EXCEPTION 'Event is already assigned to a Team Event';
  END IF;
  RETURN NEW;
END
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER indEventCheck
BEFORE INSERT ON IndividualEvent FOR EACH ROW
EXECUTE PROCEDURE abort_indEvent();

---DROP TRIGGER IncrementBookings ON bookings;
---DROP TRIGGER DecrementBookings ON bookings;
---DROP TRIGGER addIndividualResults ON results;
---DROP TRIGGER accomCheck ON Accommodation;
---DROP TRIGGER venueCheck ON Venue;
---DROP TRIGGER teamEventCheck on TeamEvent;
---DROP TRIGGER indEventCheck on IndividualEvent;

CREATE OR REPLACE VIEW AllAthlete AS
  SELECT A.member_id, M.title, M.firstname, M.familyname, M.country_fk, M.accommodation_fk,
    count(CASE R.medal WHEN 'GOLD' THEN 1 ELSE NULL END) AS Gold,
    count(CASE R.medal WHEN 'SILVER' THEN 1 ELSE NULL END) AS Silver,
    count(CASE R.medal WHEN 'BRONZE' THEN 1 ELSE NULL END) AS Bronze
  FROM Athlete A NATURAL JOIN Member M LEFT JOIN Results R ON (R.athlete_id = M.member_id)
  GROUP BY A.member_id, M.title, M.firstname, M.familyname, M.country_fk, M.accommodation_fk
  ORDER BY A.member_id;
