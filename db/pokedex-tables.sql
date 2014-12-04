DROP TABLE IF EXISTS Pokemon;
DROP TABLE IF EXISTS Color;
DROP TABLE IF EXISTS Stats;
DROP TABLE IF EXISTS Elemental_type;
DROP TABLE IF EXISTS Gym;
DROP TABLE IF EXISTS Trainer;
DROP TABLE IF EXISTS City;
DROP TABLE IF EXISTS Lives_in;
DROP TABLE IF EXISTS Trains_in;

CREATE TABLE Pokemon (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE (id),
  UNIQUE (name)
) ENGINE=InnoDB;

CREATE TABLE Color (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  pokemon_id INT NOT NULL,
  UNIQUE (id),
  UNIQUE (name),
  PRIMARY KEY (id),
  FOREIGN KEY (pokemon_id) REFERENCES Pokemon(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Stats (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  pokemon_id INT NOT NULL,
  defense INT,
  attack INT,
  hp INT,
  UNIQUE (id),
  UNIQUE (name),
  PRIMARY KEY (id),
  FOREIGN KEY (pokemon_id) REFERENCES Pokemon(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Elemental_type (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  pokemon_id INT NOT NULL,
  UNIQUE (id),
  UNIQUE (name),
  PRIMARY KEY (id),
  FOREIGN KEY (pokemon_id) REFERENCES Pokemon(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Gym (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  elemental_id INT NOT NULL,
  UNIQUE (id),
  UNIQUE (name),
  PRIMARY KEY (id),
  FOREIGN KEY (elemental_id) REFERENCES Elemental_type(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

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
  gym_id INT NOT NULL,
  UNIQUE (id),
  UNIQUE (name),
  PRIMARY KEY (id),
  FOREIGN KEY (gym_id) REFERENCES Gym(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Lives_in (
  pokemon_id INT NOT NULL,
  city_id INT NOT NULL,
  UNIQUE (pokemon_id),
  UNIQUE (city_id),
  FOREIGN KEY (pokemon_id) REFERENCES Pokemon(id) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (city_id) REFERENCES City(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Trains_in (
  trainer_id INT NOT NULL,
  city_id INT NOT NULL,
  UNIQUE (trainer_id),
  UNIQUE (city_id),
  FOREIGN KEY (trainer_id) REFERENCES Trainer(id) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (city_id) REFERENCES City(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;