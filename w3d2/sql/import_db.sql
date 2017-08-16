DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  f_name VARCHAR(50) NOT NULL,
  l_name VARCHAR(50) NOT NULL
);

INSERT INTO
  users (f_name, l_name)
VALUES
  ("Drew", "Stonebraker"),
  ("Dylan", "Caldwell"),
  ("Clark", "Kent"),
  ("Bruce", "Wayne"),
  ("Tony", "Stark"),
  ("Peter", "Parker"),
  ("Mr", "Incredible");

DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(160) NOT NULL,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO
  questions(title, body, user_id)
VALUES
  ("I have a question", "This is my question", 1),
  ("This is my question title 1", "This is my question body 1", 2),
  ("This is my question title 2", "This is my question body 2", 2),
  ("This is my question title 3", "This is my question body 3", 2),
  ("This is my question title 4", "This is my question body 4", 2),
  ("This is my question title 5", "This is my question body 5", 2);

DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  question_follows(user_id, question_id)
VALUES
  (2,1),
  (2,2),
  (2,3),
  (1,1),
  (3,1),
  (4,1),
  (4,2),
  (5,1),
  (6,2),
  (6,3),
  (5,3),
  (4,3),
  (7,1),
  (7,3),
  (7,2);

DROP TABLE IF EXISTS replies;

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL,
  author_user_id INTEGER NOT NULL,
  subject_question_id INTEGER NOT NULL,
  parent_reply_id INTEGER,

  FOREIGN KEY (author_user_id) REFERENCES users(id),
  FOREIGN KEY (subject_question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
);

INSERT INTO
  replies(body, author_user_id, subject_question_id, parent_reply_id)
VALUES
  ("Reply 1", 1, 2, NULL),
  ("Child of reply 1", 2, 2, 1),
  ("Reply 2", 2, 1, NULL);

DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  liker_user_id INTEGER NOT NULL,
  liked_question_id INTEGER NOT NULL,

  FOREIGN KEY (liker_user_id) REFERENCES users(id),
  FOREIGN KEY (liked_question_id) REFERENCES questions(id)
);

INSERT INTO
  question_likes(liker_user_id, liked_question_id)
VALUES
  (1,2),
  (1,3);
