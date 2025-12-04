DROP TABLE IF EXISTS users_marks CASCADE;
DROP TABLE IF EXISTS subs_users CASCADE;
DROP TABLE IF EXISTS users_purchases CASCADE;
DROP TABLE IF EXISTS history CASCADE;
DROP TABLE IF EXISTS families CASCADE;
DROP TABLE IF EXISTS films CASCADE;
DROP TABLE IF EXISTS puchases CASCADE;
DROP TABLE IF EXISTS family CASCADE;
DROP TABLE IF EXISTS subscribe CASCADE;
DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE families
(
  login     varchar(32) NOT NULL,
  family_id uuid        NOT NULL,
  PRIMARY KEY (login, family_id)
);

CREATE TABLE family
(
  family_id uuid        NOT NULL,
  name      varchar(64) NOT NULL DEFAULT family1,
  PRIMARY KEY (family_id)
);

CREATE TABLE films
(
  film       varchar(64) NOT NULL,
  view_count integer     NOT NULL,
  describe   text       ,
  imdb       float      ,
  duration   time        NOT NULL,
  genre      varchar(25),
  PRIMARY KEY (film)
);

CREATE TABLE history
(
  login varchar(32) NOT NULL,
  film  varchar(64) NOT NULL,
  date  date       ,
  PRIMARY KEY (login, film)
);

CREATE TABLE puchases
(
  purchase_date date    NOT NULL,
  price         integer,
  purchase_id   uuid    NOT NULL,
  PRIMARY KEY (purchase_id)
);

CREATE TABLE subs_users
(
  name       varchar(25) NOT NULL,
  login      varchar(32) NOT NULL,
  host       bool        NOT NULL DEFAULT 1,
  start_date date        NOT NULL,
  end_date   date        NOT NULL,
  PRIMARY KEY (name, login)
);

CREATE TABLE subscribe
(
  name  varchar(25) NOT NULL,
  price integer     NOT NULL,
  PRIMARY KEY (name)
);

CREATE TABLE users
(
  login         varchar(32) NOT NULL,
  password      varchar(16) NOT NULL,
  first_name    varchar(25) NOT NULL DEFAULT username,
  last_name     varchar(25) NOT NULL,
  birthday_date date        NOT NULL,
  sex           char        NOT NULL,
  PRIMARY KEY (login)
);

CREATE TABLE users_marks
(
  login     varchar(32) NOT NULL,
  film      varchar(64) NOT NULL,
  user_mark float       NOT NULL,
  PRIMARY KEY (login, film)
);

CREATE TABLE users_purchases
(
  purchase_id uuid        NOT NULL,
  login       varchar(32) NOT NULL,
  PRIMARY KEY (purchase_id, login)
);

ALTER TABLE users_marks
  ADD CONSTRAINT FK_users_TO_users_marks
    FOREIGN KEY (login)
    REFERENCES users (login);

ALTER TABLE users_marks
  ADD CONSTRAINT FK_films_TO_users_marks
    FOREIGN KEY (film)
    REFERENCES films (film);

ALTER TABLE subs_users
  ADD CONSTRAINT FK_subscribe_TO_subs_users
    FOREIGN KEY (name)
    REFERENCES subscribe (name);

ALTER TABLE subs_users
  ADD CONSTRAINT FK_users_TO_subs_users
    FOREIGN KEY (login)
    REFERENCES users (login);

ALTER TABLE users_purchases
  ADD CONSTRAINT FK_users_TO_users_purchases
    FOREIGN KEY (login)
    REFERENCES users (login);

ALTER TABLE users_purchases
  ADD CONSTRAINT FK_puchases_TO_users_purchases
    FOREIGN KEY (purchase_id)
    REFERENCES puchases (purchase_id);

ALTER TABLE history
  ADD CONSTRAINT FK_users_TO_history
    FOREIGN KEY (login)
    REFERENCES users (login);

ALTER TABLE history
  ADD CONSTRAINT FK_films_TO_history
    FOREIGN KEY (film)
    REFERENCES films (film);

ALTER TABLE families
  ADD CONSTRAINT FK_users_TO_families
    FOREIGN KEY (login)
    REFERENCES users (login);

ALTER TABLE families
  ADD CONSTRAINT FK_family_TO_families
    FOREIGN KEY (family_id)
    REFERENCES family (family_id);