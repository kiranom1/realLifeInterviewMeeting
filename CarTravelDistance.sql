/* Program calculating how much distance travelled by each car per day */

CREATE TABLE tblCarTravelDistance (
    car varchar(80),
    day varchar(50),
    cumulative_distance integer
)
;

INSERT INTO tblCarTravelDistance VALUES
    ('Creta', 'Day1', 50);

INSERT INTO tblCarTravelDistance VALUES
      ('Creta', 'Day2', 100)
    , ('Creta', 'Day3', 200)
    ;
