CREATE TABLE "users" (
  "id_user" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL,
  "age" int NOT NULL,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL
);

CREATE TABLE "categories" (
  "id_category" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "posts" (
  "id_post" SERIAL PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" varchar(250),
  "content" varchar NOT NULL,
  "id_author" int,
  "id_category" int
);

CREATE TABLE "authors" (
  "id_author" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL,
  "age" int NOT NULL,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL
);

CREATE TABLE "comments" (
  "id_comment" SERIAL PRIMARY KEY,
  "content" varchar NOT NULL,
  "id_post" int,
  "id_user" int
);

CREATE TABLE "rel_posts_categories" (
  "id" SERIAL PRIMARY KEY,
  "id_post" int,
  "id_category" int
);

ALTER TABLE "comments" ADD FOREIGN KEY ("id_post") REFERENCES "posts" ("id_post");

ALTER TABLE "rel_posts_categories" ADD FOREIGN KEY ("id_category") REFERENCES "categories" ("id_category");

ALTER TABLE "rel_posts_categories" ADD FOREIGN KEY ("id_post") REFERENCES "posts" ("id_post");

ALTER TABLE "comments" ADD FOREIGN KEY ("id_user") REFERENCES "users" ("id_user");

ALTER TABLE "posts" ADD FOREIGN KEY ("id_author") REFERENCES "authors" ("id_author");

insert into "users" ("name", "age", "email", "password") values ('Karla', 27, 'Karla@gmail.com', 'ytrewq'),
('Andres', 28, 'andres@gmail.com', 'qwerty');

insert into "categories" ("name") values ('Terror'), ('Drama'), ('Comedy'), ('Sci-fi');


insert into "authors" ("name", "age", "email", "password") values 
('Brillitt', 22, 'brillitt@gmail.com', '1234'),
('Jorge', 30, 'jorge@gmail.com', '4321');


insert into "posts" ("title", "description", "content", "id_author", "id_category") values 
('SHREK', 'Ogro verde con burrito', 'Erase una vez en un lugar muy muy lejano...', 2 , 1 ),
('TOY STORY', 'juguetes animados', 'Al infinito y más alláaaaaa...', 1 , 4 );

insert into "comments" ("content", "id_post", "id_user") values ('Excelente película', 1 , 2), ('Justo en la infancia', 2, 1);

insert into "rel_posts_categories" ("id_post", "id_category") values (1, 1), (2, 4);