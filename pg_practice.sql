-- 問題1. postgresqlでpracticeデータベースを生成するSQL文を記述してください。
    CREATE DATABASE practice;
-- 問題2. postgresqlでpracticeデータベースのusersテーブルを生成するSQL文を記述してください。
    CREATE TABLE users (
    id integer  NOT NULL PRIMARY KEY,
    name varchar(255) NOT NULL DEFAULT '' ,
    age integer NOT NULL DEFAULT 0 ,
    gender varchar(10)  NOT NULL DEFAULT 'Other',
    CHECK (gender IN ('Man', 'Woman', 'Other'))
    ) ;
-- 問題3. postgresqlでpracticeデータベースのjobsテーブルを生成するSQL文を記述してください。
    CREATE TABLE jobs (
    id integer NOT NULL PRIMARY KEY,
    user_id integer NOT NULL,
    name varchar(255) NOT NULL DEFAULT '会社員' ,
    CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users (id)
    ) ;

