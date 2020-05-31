-- Drop table if exists
DROP TABLE firepower;

-- Create new table to import data
CREATE TABLE firepower (
	country VARCHAR,
	ISO3 VARCHAR,
	rank INT,
	TotalPopulation INT,
	ManpowerAvailable INT,
	TotalMilitaryPersonnel INT,
	ActivePersonnel INT,
	ReservePersonnel INT,
	TotalAircraftStrength INT,
	FighterAircraft INT,
	AttackAircraft INT,
	TotalHelicopterStrength INT,
	AttackHelicopters INT
);

-- Import data from firepower.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM firepower;

--Find the rows that have a `ReservePersonnel` of 0 
--and remove these rows from the dataset.
DELETE FROM firepower
WHERE reservepersonnel = 0;
--* Every country in the world at least deserves one `FighterAircraft`—it only seems fair.
--Let's add one to each nation that has none.
UPDATE firepower
SET fighteraircraft = 1
WHERE fighteraircraft = 0;

-- Oh no! By updating this column, 
--the values within `TotalAircraftStrength` column are now off for those nations! We need to [add 1](https://stackoverflow.com/a/2680352) to the original number.
--FighterAircraft	AttackAircraft	TotalHelicopterStrength	AttackHelicopters
UPDATE firepower
SET TotalAircraftStrength = (FighterAircraft+AttackAircraft+TotalHelicopterStrength+AttackHelicopters)

--for `TotalMilitaryPersonnel`, `TotalAircraftStrength`, 
--`TotalHelicopterStrength`, and `TotalPopulation`, and rename the columns with their designated average.
SELECT AVG(TotalMilitaryPersonnel) as Avg_MilitaryPersonnel
	,AVG(TotalAircraftStrength) as Avg_AircraftStrength
	,AVG(TotalHelicopterStrength) as Avg_HelicopterStrength
	,AVG(TotalPopulation) as Avg_Population
from firepower;

--After creating your new nation and some parts of your military strategy, add the average values you calculated to the appropriate columns in the newly created rows. 
--Update their values in any way you wish!
