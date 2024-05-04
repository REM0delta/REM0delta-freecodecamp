camper: /project$ psql --username=freecodecamp --dbname=postgres
Border style is 2.
Pager usage is off.
psql (12.17 (Ubuntu 12.17-1.pgdg22.04+1))
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
Type "help" for help.

postgres=> CREATE DATABASE universe;
CREATE DATABASE
postgres=> \c universe;
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
You are now connected to database "universe" as user "freecodecamp".
universe=> CREATE TABLE galaxy (galaxy_id SERIAL PRIMARY KEY NOT NULL, size FLOAT, density VARCHAR(255), general info VARCHAR(255))
universe-> /d
universe-> CREATE TABLE galaxy (galaxy_id SERIAL PRIMARY KEY NOT NULL, size FLOAT, density VARCHAR(255), general info VARCHAR(255));
ERROR:  syntax error at or near "VARCHAR"
LINE 1: ...L, size FLOAT, density VARCHAR(255), general info VARCHAR(25...
                                                             ^
universe=> CREATE TABLE galaxy (galaxy_id SERIAL PRIMARY KEY NOT NULL, size FLOAT, density VARCHAR(255), "general info" VARCHAR(255));
CREATE TABLE
universe=> /d
universe-> \d
                     List of relations
+--------+----------------------+----------+--------------+
| Schema |         Name         |   Type   |    Owner     |
+--------+----------------------+----------+--------------+
| public | galaxy               | table    | freecodecamp |
| public | galaxy_galaxy_id_seq | sequence | freecodecamp |
+--------+----------------------+----------+--------------+
(2 rows)

universe-> \c universe
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
You are now connected to database "universe" as user "freecodecamp".
universe-> \d galaxy
                                           Table "public.galaxy"
+--------------+------------------------+-----------+----------+-------------------------------------------+
|    Column    |          Type          | Collation | Nullable |                  Default                  |
+--------------+------------------------+-----------+----------+-------------------------------------------+
| galaxy_id    | integer                |           | not null | nextval('galaxy_galaxy_id_seq'::regclass) |
| size         | double precision       |           |          |                                           |
| density      | character varying(255) |           |          |                                           |
| general info | character varying(255) |           |          |                                           |
+--------------+------------------------+-----------+----------+-------------------------------------------+
Indexes:
    "galaxy_pkey" PRIMARY KEY, btree (galaxy_id)

universe-> CREATE TABLE star (star_id SERIAL PRIMARY KEY NOT NULL, name
ERROR:  syntax error at or near "/" NOT NULL; mass FLOAT NOT NULL, CONST
LINE 1: /dalaxy FOREIGN KEY(galaxy_id) REFERENCES galaxy(galaxy_id));
        ^
universe=> CREATE TABLE star (star_id SERIAL PRIMARY KEY NOT NULL, name VARCHAR(255) NOT NULL
; radius FLOAT NOT NULL; mass FLOAT NOT NULL, CONSTRAINT fk_galaxy FOREIGN KEY(galaxy_id) REF
ERENCES galaxy(galaxy_id));
ERROR:  syntax error at or near ";"
LINE 1: ...L PRIMARY KEY NOT NULL, name VARCHAR(255) NOT NULL; radius F...
                                                             ^
universe=> CREATE TABLE star (star_id SERIAL PRIMARY KEY NOT NULL, name VARCHAR(255) NOT NULL; radius FLOAT NOT NULL; mass FLOAT NOT NULL, CONSTRAINT fk_galaxy FOREIGN KEY(galaxy_id) REF
ERENCES galaxy(galaxy_id));
ERROR:  syntax error at or near ";"
LINE 1: ...L PRIMARY KEY NOT NULL, name VARCHAR(255) NOT NULL; radius F...
                                                             ^
universe=> CREATE TABLE star (star_id SERIAL PRIMARY KEY NOT NULL, name VARCHAR(255) NOT NULL
; radius FLOAT NOT NULL; mass FLOAT NOT NULL, CONSTRAINT fk_galaxy FOREIGN KEY(galaxy_id) REF
ERENCES galaxy(galaxy_id));
ERROR:  syntax error at or near ";"
LINE 1: ...L PRIMARY KEY NOT NULL, name VARCHAR(255) NOT NULL; radius F...
                                                             ^
universe=> CREATE TABLE star (star_id SERIAL PRIMARY KEY NOT NULL, name VARCHAR(255) NOT NULL
, radius FLOAT NOT NULL, mass FLOAT NOT NULL, CONSTRAINT fk_galaxy FOREIGN KEY(galaxy_id) REF
ERENCES galaxy(galaxy_id));
ERROR:  column "galaxy_id" referenced in foreign key constraint does not exist
universe=> CREATE TABLE star (star_id SERIAL PRIMARY KEY NOT NULL, name VARCHAR(255) NOT NULL, radius FLOAT NOT NULL, mass FLOAT NOT NULL, galaxy_id INT, CONSTRAINT fk_galaxy FOREIGN KEY(galaxy_id) REFERENCES galaxy(galaxy_id));
CREATE TABLE
universe=> \c star
connection to server at "127.0.0.1", port 5432 failed: FATAL:  database "star" does not exist
Previous connection kept
universe=> \d 
                     List of relations
+--------+----------------------+----------+--------------+
| Schema |         Name         |   Type   |    Owner     |
+--------+----------------------+----------+--------------+
| public | galaxy               | table    | freecodecamp |
| public | galaxy_galaxy_id_seq | sequence | freecodecamp |
| public | star                 | table    | freecodecamp |
| public | star_star_id_seq     | sequence | freecodecamp |
+--------+----------------------+----------+--------------+
(4 rows)

universe=> \d star
                                         Table "public.star"
+-----------+------------------------+-----------+----------+---------------------------------------+
|  Column   |          Type          | Collation | Nullable |                Default                |
+-----------+------------------------+-----------+----------+---------------------------------------+
| star_id   | integer                |           | not null | nextval('star_star_id_seq'::regclass) |
| name      | character varying(255) |           | not null |                                       |
| radius    | double precision       |           | not null |                                       |
| mass      | double precision       |           | not null |                                       |
| galaxy_id | integer                |           |          |                                       |
+-----------+------------------------+-----------+----------+---------------------------------------+
Indexes:
    "star_pkey" PRIMARY KEY, btree (star_id)
Foreign-key constraints:
    "fk_galaxy" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)

universe=> ALTER TABLE galxy ADD COLMUN name VARCHAR(255) NOT NULL;
ERROR:  syntax error at or near "VARCHAR"
LINE 1: ALTER TABLE galxy ADD COLMUN name VARCHAR(255) NOT NULL;
                                          ^
universe=> ALTER TABLE galaxy ADD COLUMN name VARCHAR(255) NOT NULL;
ALTER TABLE
universe=> CREATE TABLE planet (planet_id SERIAL PRIMARY KEY NOT NULL, name VARCHAR(255) NOT NULL, "Potential for life" VARCHAR(255) NOT NULL, "Observation of life" BOOLEAN NOT NULL, "Observation of water" BOOLEAN  NOT NULL, star_id INT NOT NULL, CONSTRAINT fk_star FOREIGN KEY(star_id) REFERENCES star(star_id));
CREATE TABLE
universe=> CREATE TABLE moon(moon_id SERIAL PRIMARY KEY NOT NULL, name VARCHAR(255) NOT NULL UNIQUE, "Primary Body" VARCHAR(255) NOT NULL, mass FLOAT NOT NULL, radius FLOAT NOT NULL, g-factorFLOAT NOT NULL, CONSTRAINT fk_moon FOREIGN KEY (planet_id) REFERENCES planet(planet_id));
ERROR:  syntax error at or near "-"
LINE 1: ...ULL, mass FLOAT NOT NULL, radius FLOAT NOT NULL, g-factor FL...
                                                             ^
universe=> CREATE TABLE moon(moon_id SERIAL PRIMARY KEY NOT NULL, name VARCHAR(255) NOT NULL UNIQUE, "Primary Body" VARCHAR(255) NOT NULL, mass FLOAT NOT NULL, radius FLOAT NOT NULL,"g-factor" FLOAT NOT NULL, CONSTRAINT fk_moo
n FOREIGN KEY (planet_id) REFERENCES planet(planet_id));
ERROR:  column "planet_id" referenced in foreign key constraint does not exist
universe=> \d planet
                                               Table "public.planet"
+----------------------+------------------------+-----------+----------+-------------------------------------------+
|        Column        |          Type          | Collation | Nullable |                  Default                  |
+----------------------+------------------------+-----------+----------+-------------------------------------------+
| planet_id            | integer                |           | not null | nextval('planet_planet_id_seq'::regclass) |
| name                 | character varying(255) |           | not null |                                           |
| Potential for life   | character varying(255) |           | not null |                                           |
| Observation of life  | boolean                |           | not null |                                           |
| Observation of water | boolean                |           | not null |                                           |
| star_id              | integer                |           | not null |                                           |
+----------------------+------------------------+-----------+----------+-------------------------------------------+
Indexes:
    "planet_pkey" PRIMARY KEY, btree (planet_id)
Foreign-key constraints:
    "fk_star" FOREIGN KEY (star_id) REFERENCES star(star_id)

universe=> CREATE TABLE moon(moon_id SERIAL PRIMARY KEY NOT NULL, name VARCHAR(255) NOT NULL UNIQUE, "Primary Body" VARCHAR(255) NOT NULL, mass FLOAT NOT NULL, radius FLOAT NOT NULL,"g-factor" FLOAT NOT NULL, CONSTRAINT fk_moon FOREIGN KEY (planet_id) REFERENCES planet(planet_id));
ERROR:  column "planet_id" referenced in foreign key constraint does not exist
universe=> CREATE TABLE moon (moon_id SERIAL PRIMARY KEY NOT NULL, name VARCHAR(255) NOT NULL UNIQUE, "Primary Body" VARCHAR(255) NOT NULL, mass FLOAT NOT NULL, radius FLOAT NOT NULL, "g-factor" FLOAT NOT NULL, planet_id INT, CONSTRAINT fk_moon FOREIGN KEY (planet_id) REFERENCES planet(planet_id));
CREATE TABLE
universe=> \d moon
                                          Table "public.moon"
+--------------+------------------------+-----------+----------+---------------------------------------+
|    Column    |          Type          | Collation | Nullable |                Default                |
+--------------+------------------------+-----------+----------+---------------------------------------+
| moon_id      | integer                |           | not null | nextval('moon_moon_id_seq'::regclass) |
| name         | character varying(255) |           | not null |                                       |
| Primary Body | character varying(255) |           | not null |                                       |
| mass         | double precision       |           | not null |                                       |
| radius       | double precision       |           | not null |                                       |
| g-factor     | double precision       |           | not null |                                       |
| planet_id    | integer                |           |          |                                       |
+--------------+------------------------+-----------+----------+---------------------------------------+
Indexes:
    "moon_pkey" PRIMARY KEY, btree (moon_id)
    "moon_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "fk_moon" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

universe=> CREATE TABLE blackhole(blackhole_id SERIAL PRIMARY KEY NOT NULL, ref_number INT NOT NULL, size FLOAT NOT NULL, mass FLOAT NOT NULL, galaxy_id INT);
CREATE TABLE
universe=> \d
                        List of relations
+--------+----------------------------+----------+--------------+
| Schema |            Name            |   Type   |    Owner     |
+--------+----------------------------+----------+--------------+
| public | blackhole                  | table    | freecodecamp |
| public | blackhole_blackhole_id_seq | sequence | freecodecamp |
| public | galaxy                     | table    | freecodecamp |
| public | galaxy_galaxy_id_seq       | sequence | freecodecamp |
| public | moon                       | table    | freecodecamp |
| public | moon_moon_id_seq           | sequence | freecodecamp |
| public | planet                     | table    | freecodecamp |
| public | planet_planet_id_seq       | sequence | freecodecamp |
| public | star                       | table    | freecodecamp |
| public | star_star_id_seq           | sequence | freecodecamp |
+--------+----------------------------+----------+--------------+
(10 rows)

universe=> \d galaxy
                                           Table "public.galaxy"
+--------------+------------------------+-----------+----------+-------------------------------------------+
|    Column    |          Type          | Collation | Nullable |                  Default                  |
+--------------+------------------------+-----------+----------+-------------------------------------------+
| galaxy_id    | integer                |           | not null | nextval('galaxy_galaxy_id_seq'::regclass) |
| size         | double precision       |           |          |                                           |
| density      | character varying(255) |           |          |                                           |
| general info | character varying(255) |           |          |                                           |
| name         | character varying(255) |           | not null |                                           |
+--------------+------------------------+-----------+----------+-------------------------------------------+
Indexes:
    "galaxy_pkey" PRIMARY KEY, btree (galaxy_id)
Referenced by:
    TABLE "star" CONSTRAINT "fk_galaxy" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)

universe=> \d planet
                                               Table "public.planet"
+----------------------+------------------------+-----------+----------+-------------------------------------------+
|        Column        |          Type          | Collation | Nullable |                  Default                  |
+----------------------+------------------------+-----------+----------+-------------------------------------------+
| planet_id            | integer                |           | not null | nextval('planet_planet_id_seq'::regclass) |
| name                 | character varying(255) |           | not null |                                           |
| Potential for life   | character varying(255) |           | not null |                                           |
| Observation of life  | boolean                |           | not null |                                           |
| Observation of water | boolean                |           | not null |                                           |
| star_id              | integer                |           | not null |                                           |
+----------------------+------------------------+-----------+----------+-------------------------------------------+
Indexes:
    "planet_pkey" PRIMARY KEY, btree (planet_id)
Foreign-key constraints:
    "fk_star" FOREIGN KEY (star_id) REFERENCES star(star_id)
Referenced by:
    TABLE "moon" CONSTRAINT "fk_moon" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

universe=> \d star 
                                         Table "public.star"
+-----------+------------------------+-----------+----------+---------------------------------------+
|  Column   |          Type          | Collation | Nullable |                Default                |
+-----------+------------------------+-----------+----------+---------------------------------------+
| star_id   | integer                |           | not null | nextval('star_star_id_seq'::regclass) |
| name      | character varying(255) |           | not null |                                       |
| radius    | double precision       |           | not null |                                       |
| mass      | double precision       |           | not null |                                       |
| galaxy_id | integer                |           |          |                                       |
+-----------+------------------------+-----------+----------+---------------------------------------+
Indexes:
    "star_pkey" PRIMARY KEY, btree (star_id)
Foreign-key constraints:
    "fk_galaxy" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
Referenced by:
    TABLE "planet" CONSTRAINT "fk_star" FOREIGN KEY (star_id) REFERENCES star(star_id)

universe=> INSERT INTO galaxy(galaxy_id, size, density, "general info", name) VALUES(01234), VALUES(5555), VALUES(1111),' n/a ', 'Andrew');
ERROR:  syntax error at or near "VALUES"
LINE 1: ...ze, density, "general info", name) VALUES(01234), VALUES(555...
                                                             ^
universe=> INSERT INTO galaxy (galaxy_id, size, density, "general info", name) VALUES (01234, 5555, 'n/a', 'Andrew');
ERROR:  INSERT has more target columns than expressions
LINE 1: ...galaxy (galaxy_id, size, density, "general info", name) VALU...
                                                             ^
universe=> INSERT INTO galaxy (galaxy_id, size, density, "general info", name) VALUES (1234, 5555, 'n/a', 'Some general info', 'Andrew');
INSERT 0 1
universe=> INSERT INTO galaxy (galaxy_id, size, density, "general info", name) VALUES (1235, 5555, 8888, 'n/a', '
Andre');
INSERT 0 1
universe=> INSERT INTO galaxy (galaxy_id, size, density, "general info", name) VALUES (1235, 5555, 8888, 'n/a', 'Andre');
ERROR:  duplicate key value violates unique constraint "galaxy_pkey"
DETAIL:  Key (galaxy_id)=(1235) already exists.
universe=> INSERT INTO galaxy (galaxy_id, size, density, "general info", name) VALUES (1235, 5555, 8888, 'n/a', '
universe'> And');
ERROR:  duplicate key value violates unique constraint "galaxy_pkey"
DETAIL:  Key (galaxy_id)=(1235) already exists.
universe=> INSERT INTO galaxy (galaxy_id, size, density, "general info", name) VALUES (1236, 5555, 8888, 'n/a', 'Alex')
universe-> INSERT INTO galaxy (galaxy_id, size, density, "general info", name) VALUES (1236, 5555, 8888, 'n/a', 'Alex');
ERROR:  syntax error at or near "INSERT"
LINE 2: INSERT INTO galaxy (galaxy_id, size, density, "general info"...
        ^
universe=> INSERT INTO galaxy (galaxy_id, size, density, "general info", name) VALUES (1236, 5555, 8888, 'n/a', 'Alex');
INSERT 0 1
universe=> INSERT INTO galaxy (galaxy_id, size, density, "general info", name) VALUES (1237, 5555, 8888, 'n/a', 'Alx');
INSERT 0 1
universe=> INSERT INTO galaxy (galaxy_id, size, density, "general info", name) VALUES (1238, 5555, 8888, 'n/a', 'Alexi');
INSERT 0 1
universe=> INSERT INTO galaxy (galaxy_id, size, density, "general info", name) VALUES (1736, 555, 8888, 'n/a', 'Alexo');
universe-> 
universe-> INSERT INTO galaxy (galaxy_id, size, density, "general info", name) VALUES (1236, 5555, 8888, 'n/a', 'Alex');
ERROR:  syntax error at or near "INSERT"
LINE 2: INSERT INTO galaxy (galaxy_id, size, density, "general info"...
        ^
universe=> INSERT INTO galaxy (galaxy_id, size, density, "general info", name) VALUES (1236, 5555, 8888, 'n/a', 'Alex');
ERROR:  duplicate key value violates unique constraint "galaxy_pkey"
DETAIL:  Key (galaxy_id)=(1236) already exists.
universe=> INSERT INTO galaxy (galaxy_id, size, density, "general info", name) VALUES (5236, 5555, 8888, 'n/a', 'Alexoo');
INSERT 0 1
universe=> INSERT INTO galaxy (galaxy_id, size, density, "general info", name) VALUES (1276, 5555, 8888, 'n/a', 'A');
INSERT 0 1
universe=> 
