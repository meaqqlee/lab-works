CREATE TABLE "user"(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    age INT
);

CREATE TABLE post(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    content TEXT,
    user_id INT,
    CONSTRAINT fk_user
        FOREIGN KEY(user_id)
            REFERENCES "user"(id)
);

INSERT INTO "user"(name,
                   age
) VALUES (
        'lolipop',
        23
       );

INSERT INTO post(name,
                 content,
                 user_id
) VALUES (
          'kfc',
          'love waiting for kfc',
          1
         );

SELECT * FROM "user";
SELECT * FROM post;

INSERT INTO post(name,
                 content,
                 user_id
) VALUES (
          'minecraft',
          'i love plauing minecraft',
          1
         );

SELECT "user".*, post.id, post.name AS title, post.content, post.user_id FROM "user" JOIN post ON post.user_id = "user".id;