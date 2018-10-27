-- > psql
-- # @the root user prompt type \l
-- > \l
CREATE DATABASE chitter;
-- # Issue a connect to connect to the newly created DB Chitter
-- > \c chitter;
-- # @the chitter prompt issue the SQl statements to create the table

-- 1. Create Users table
CREATE TABLE users(user_id SERIAL PRIMARY KEY,
email_id VARCHAR(60) NOT NULL CONSTRAINT user_email_unq UNIQUE,
user_name VARCHAR(60),
user_handle VARCHAR(60) NOT NULL CONSTRAINT user_handle_unq UNIQUE,
password VARCHAR(60) NOT NULL);

-- 2. Create Posts table
CREATE TABLE posts(post_id SERIAL PRIMARY KEY,
post_text VARCHAR(200),
created_date_time TIMESTAMP,
createdby_id integer,
CONSTRAINT fk_posts_users
FOREIGN KEY (createdby_id)
REFERENCES users(user_id));

-- > \q to quit the session

-- Repeat above steps to create the above tables under a test database

-- > psql
-- # @the root user prompt type \l
-- > \l
CREATE DATABASE chitter_test;
-- # Issue a connect to connect to the newly created DB Chitter
-- > \c chitter_test;
-- # @the chitter prompt issue the SQl statements to create the table

-- Issue create statements given in step 1 & 2 above from line 10 and 17.
