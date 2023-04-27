CREATE SEQUENCE hc_tournament_id_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  MAXVALUE 2147483647
  CACHE 1;

CREATE TABLE hc_tournament (
  id int8 NOT NULL DEFAULT nextval('hc_tournament_id_seq'),
  country VARCHAR (255),
  name VARCHAR (255),
  PRIMARY KEY (id));


CREATE SEQUENCE hc_team_id_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  MAXVALUE 2147483647
  CACHE 1;

CREATE TABLE hc_team (
  id int8 NOT NULL DEFAULT nextval('hc_team_id_seq'),
  name VARCHAR(255),
  players int4,
  PRIMARY KEY(id));


CREATE TABLE hc_tournament_team (
  id_tournament int8 NOT NULL ,
  id_team int8 NOT NULL ,
  PRIMARY KEY (id_team, id_tournament));


CREATE SEQUENCE hc_match_id_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  MAXVALUE 2147483647
  CACHE 1;

CREATE TABLE fc_match (
  id int8 NOT NULL DEFAULT nextval('hc_match_id_seq'),
  match_date TIMESTAMP,
  score_guests int4,
  score_owners int4,
  id_guests int8 NOT NULL,
  id_owners int8 NOT NULL,
  id_tournament int8 NOT NULL,
  PRIMARY KEY (id));


CREATE SEQUENCE hc_coach_id_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  MAXVALUE 2147483647
  CACHE 1;

CREATE TABLE hc_coach (
  id int8 NOT NULL DEFAULT nextval('hc_coach_id_seq'),
  age int4,
  experience int4,
  name VARCHAR(255),
  surname VARCHAR(255),
  id_team int8,
  PRIMARY KEY (id));


CREATE SEQUENCE hc_news_id_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  MAXVALUE 2147483647
  CACHE 1;

CREATE TABLE hc_news (
  id int8 NOT NULL DEFAULT nextval('hc_news_id_seq'),
  content TEXT,
  name VARCHAR(255),
  PRIMARY KEY (id));


CREATE TABLE hc_team_news (
  id_news int8 NOT NULL,
  id_team int8 NOT NULL,
  PRIMARY KEY (id_news, id_team));


CREATE SEQUENCE hc_player_id_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  MAXVALUE 2147483647
  CACHE 1;

CREATE TABLE hc_player (
  id int8 NOT NULL DEFAULT nextval('hc_player_id_seq'),
  age int4,
  height int4,
  name VARCHAR(255),
  surname VARCHAR(255),
  weight int4,
  PRIMARY KEY (id));


CREATE TABLE hc_player_team (
  id_player int8 NOT NULL,
  id_team int8 NOT NULL,
  PRIMARY KEY (id_player, id_team));


CREATE SEQUENCE hc_event_id_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  MAXVALUE 2147483647
  CACHE 1;

CREATE TABLE hc_event (
  id int8 NOT NULL DEFAULT nextval('hc_event_id_seq'),
  content TEXT,
  name VARCHAR(255),
  PRIMARY KEY (id));


CREATE TABLE hc_player_event (
  id_event int8 NOT NULL,
  id_player int8 NOT NULL,
  PRIMARY KEY (id_event, id_player));


CREATE SEQUENCE hc_tournament_result_id_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  MAXVALUE 2147483647
  CACHE 1;

CREATE TABLE hc_tournament_result (
  id int8 NOT NULL DEFAULT nextval('hc_tournament_result_id_seq'),
  draw int4,
  goals int4,
  goals_missed int4,
  loses int4,
  missed int4,
  place int4,
  points int4,
  wins int4,
  id_team int8,
  id_tournament int8,
  PRIMARY KEY (id));

ALTER TABLE if EXISTS hc_tournament_team
ADD CONSTRAINT hc_team_hk
FOREIGN KEY (id_team) REFERENCES hc_team;

ALTER TABLE if EXISTS hc_tournament_team
ADD CONSTRAINT hc_tournament_hk
FOREIGN KEY (id_tournament) REFERENCES hc_tournament;

ALTER TABLE if EXISTS hc_match
ADD CONSTRAINT hc_guest_hk
FOREIGN KEY (id_guests) REFERENCES hc_team;

ALTER TABLE if EXISTS hc_match
ADD CONSTRAINT hc_owner_hk
FOREIGN KEY(id_owners) REFERENCES hc_team;

ALTER TABLE if EXISTS hc_match
ADD CONSTRAINT  hc_tournament_hk
FOREIGN KEY (id_tournament) REFERENCES hc_tournament;

ALTER TABLE if EXISTS hc_coach
ADD CONSTRAINT  hc_coach_hk
FOREIGN KEY (id_team) REFERENCES hc_team;

ALTER TABLE if EXISTS hc_team_news
ADD CONSTRAINT  hc_team_hk
FOREIGN KEY (id_team) REFERENCES hc_team;

ALTER TABLE if EXISTS hc_team_news
ADD CONSTRAINT  hc_news_hk
FOREIGN KEY (id_news) REFERENCES hc_news;

ALTER TABLE if EXISTS hc_player_team
ADD CONSTRAINT  hc_team_hk
FOREIGN KEY (id_team) REFERENCES hc_team;

ALTER TABLE if EXISTS hc_player_team
ADD CONSTRAINT  hc_player_hk
FOREIGN KEY (id_player) REFERENCES hc_player;

ALTER TABLE if EXISTS hc_tournament_result
ADD CONSTRAINT  hc_team_hk
FOREIGN KEY (id_team) REFERENCES hc_team;

ALTER TABLE if EXISTS hc_tournament_result
ADD CONSTRAINT  hc_tournament_hk
FOREIGN KEY (id_tournament) REFERENCES hc_tournament;

ALTER TABLE if EXISTS hc_tournament_result
ADD CONSTRAINT hc_tournament_team_u
 UNIQUE (id_tournament,id_team);