DROP TABLE IF EXISTS Lives_in;
DROP TABLE IF EXISTS Trains_in;
DROP TABLE IF EXISTS Trainer;
DROP TABLE IF EXISTS Gym;
DROP TABLE IF EXISTS City;
DROP TABLE IF EXISTS Pokemon;
DROP TABLE IF EXISTS Color;
DROP TABLE IF EXISTS Stats;
DROP TABLE IF EXISTS Elemental_type;


# Create tables

CREATE TABLE Trainer (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  UNIQUE (id),
  UNIQUE (name),
  PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE City (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  UNIQUE (id),
  UNIQUE (name),
  PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE Color (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  UNIQUE (id),
  UNIQUE (name),
  PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE Elemental_type (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  UNIQUE (id),
  UNIQUE (name),
  PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE Pokemon (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  attack INT,
  defense INT,
  hp INT,
  PRIMARY KEY (id),
  color_id INT,
  FOREIGN KEY (color_id) REFERENCES Color(id) ON DELETE RESTRICT ON UPDATE CASCADE,
  elemental_id INT,
  FOREIGN KEY (elemental_id) REFERENCES Elemental_type(id) ON DELETE RESTRICT ON UPDATE CASCADE,
  UNIQUE (id),
  UNIQUE (name)
) ENGINE=InnoDB;

CREATE TABLE Gym (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  elemental_id INT NOT NULL,
  city_id INT NOT NULL,
  UNIQUE (id),
  UNIQUE (name),
  PRIMARY KEY (id),
  FOREIGN KEY (elemental_id) REFERENCES Elemental_type(id) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (city_id) REFERENCES City(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Lives_in (
  pokemon_id INT NOT NULL,
  city_id INT NOT NULL,
  FOREIGN KEY (pokemon_id) REFERENCES Pokemon(id) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (city_id) REFERENCES City(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Trains_in (
  trainer_id INT NOT NULL,
  city_id INT NOT NULL,
  FOREIGN KEY (trainer_id) REFERENCES Trainer(id) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (city_id) REFERENCES City(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

# Populate with some data

INSERT INTO Trainer (name)
VALUES ('Ash Ketchum'), ('Serena'), ('Steven Stone'), 
('May'), ('Misty'), ('Brendan'), 
('Dawn'), ('Jessie'), ('Brock'), 
('Wallace'), ('Shelly'), ('Cynthia'), 
('N'), ('Bonnie'), ('Clemont'), 
('James'), ('Archie'), ('Iris'), 
('Gary Oak'), ('Tabitha');

INSERT INTO City (name)
VALUES ('Petalburg City'), ('Mauville City'), ('Mossdeep City'), 
('Sootopolis City'), ('Cerulean City'), ('Castelia City'), ('Lumiose City'), 
('Lilycove City'), ('Slateport City'), ('Rustboro City'), ('Pewter City'), 
('Icirrus City'), ('Viridian City'), ('Vermillion City'), ('Celladon City'), 
('Glitch City'), ('Black City'), ('Oreburgh City'), ('Saffron City'), 
('Pallet Town');

INSERT INTO Color (name)
VALUES ('red'), ('blue'), ('yellow'), ('green'), ('black'),
('brown'), ('purple'), ('gray'), ('white'), ('pink');


INSERT INTO Elemental_type (name)
VALUES ('normal'), ('fire'), ('fighting'), ('water'), 
('flying'), ('grass'), ('poison'), ('electric'), ('ground'),
('psychic'), ('rock'), ('ice'), ('bug'), ('dragon'), ('ghost'),
('dark'), ('steel'), ('fairy'), ('???');

INSERT INTO Pokemon (name, attack, defense, hp, color_id, elemental_id)
VALUES ('Haunter', 50, 45, 45, 7, 15),
('Snorlax', 110, 65, 160, 2, 1),
('Suicune', 75, 115, 100, 2, 4),
('Articuno', 85, 100, 90, 2, 12),
('Metagross', 135, 130, 80, 2, 17),
('Zapdos', 90, 85, 90, 3, 8),
('Scyther', 110, 80, 70, 4, 14),
('Umbreon', 65, 110, 95, 5, 16),
('Entei', 115, 85, 115, 6, 2),
('Scizor', 130, 100, 70, 1, 13),
('Blaziken', 120, 70, 80, 1, 2),
('Tyranitar', 134, 110, 100, 8, 11);

######## REFERENCE ########
#
# COLORS:       ELEMENT:
# 1 - red       1 - normal
# 2 - blue      2 - fire
# 3 - yellow    3 - fighting
# 4 - green     4 - water
# 5 - black     5 - flying
# 6 - brown     6 - grass
# 7 - purple    7 - poison
# 8 - gray      8 - electric
# 9 - white     9 - ground
# 10- pink      10- psychic
#               11- rock
#               12- ice
#               13- bug
#               14- dragon
#               15- ghost
#               16- dark
#               17- steel
#               18- fairy
#               19- ???

INSERT INTO Gym (name, elemental_id, city_id)
VALUES ('Pewter Gym',11,11), ('Cerulean Gym',4,5), 
('Vermillion Gym',8,14), ('Saffron Gym',10,19);

INSERT INTO Lives_in (pokemon_id, city_id)
VALUES (1,3), (2,5), (3,8), (4,12), (5,1), (6,9), (7,10), 
(8,4), (9,7), (10,16);

INSERT INTO Trains_in (trainer_id, city_id)
VALUES (1,5), (2,3), (3,12), (4,14), (5,10), (6,1), (7,3), 
(8,8), (9,15), (10,14), (11,8), (12,7), (13,6);