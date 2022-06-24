#!/usr/bin/bash

PGPASSWORD='p0stg3s!' psql --host=$1 --port=5432 -U postgres << EOF 
CREATE USER image_gallery WITH PASSWORD 'p0stgr3s!';
GRANT ROLE image_gallery to postgres;
CREATE DATABASE image_gallery OWNER image_gallery;
EOF

PGPASSWORD='p0stgr3s!' psql --host=$1 --port=5432 -U image_gallery << EOF 
CREATE TABLE users (username varchar(100) NOT NULL PRIMARY KEY, password varchar(100), full_name varchar(200), is_admin boolean DEFAULT false);
CREATE TABLE images (id serial primary key, file varchar(100), owner varchar(200), CONSTRAINT owner FOREIGN KEY(owner) REFERENCES users(username));
EOF
