DROP DATABASE IF EXISTS has_many_blogs;

DROP ROLE IF EXISTS has_many_user;

CREATE USER has_many_user;

CREATE DATABASE has_many_blogs OWNER has_many_user;

\c has_many_blogs;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(90) NOT NULL,
    first_name VARCHAR(90) NULL,
    last_name VARCHAR(90) NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()

);

DROP TABLE IF EXISTS posts;

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(180) NULL,
    url VARCHAR(510) NULL,
    content TEXT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
    user_id SERIAL REFERENCES users(id) --FK
);

DROP TABLE IF EXISTS comments;

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    body VARCHAR(510) NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
    user_id SERIAL REFERENCES users(id), --FK
    post_id SERIAL REFERENCES posts(id) --FK
)

