/* Program calculating how much distance travelled by each car per day */

CREATE TABLE tblCarTravelDistance (
    car varchar(80),
    day varchar(50),
    cumulative_distance integer
)
;

INSERT INTO tblCarTravelDistance VALUES
    ('Creta', 'Day1', 50);