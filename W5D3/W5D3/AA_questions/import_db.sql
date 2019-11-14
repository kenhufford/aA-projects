PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  fname TEXT NOT NULL,
  lname TEXT NOT NULL,
  id  INTEGER PRIMARY KEY
);

DROP TABLE IF EXISTS questions;
CREATE TABLE questions (
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,
  id INTEGER PRIMARY KEY,

FOREIGN KEY (author_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;
CREATE TABLE question_follows (
  question_id INTEGER NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id),
  FOREIGN KEY (queåstion_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS replies;
CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL,


  author_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,

  FOREIGN KEY (author_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id)
);

DROP TABLE IF EXISTS question_likes;
CREATE TABLE question_likes(
  likes INTEGER NOT NULL,
  author_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  
  FOREIGN KEY(author_id) REFERENCES users(id),
  FOREIGN KEY(question_id) REFERENCES questions(id)
);


INSERT INTO
  users (fname, lname)
VALUES
  ('Kenny', 'Hufford'),
  ('Ronil', 'LastName');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('Can a pig fly?', 'Well can it?', (SELECT id FROM users WHERE fname = 'Kenny')),
  ('What time is it?', 'Is it past noon??', (SELECT id FROM users WHERE fname = 'Ronil'));

INSERT INTO 
  replies (body, author_id, question_id, parent_id)
VALUES
  ('Whats up my dude?', 1, 1, NULL),
  ('not much brah', 2, 2, 1);

INSERT INTO
  question_likes (likes, author_id, question_id)
VALUES
 (1, 1, 1);

INSERT INTO
  question_follows(question_id, author_id)
VALUES
  (1, 1);