-- drop the existing database
drop database bdsitas;

-- create the test user
create user sitas_des password 'sitas_des';

-- create the database
create database bdsitas owner sitas_des;
