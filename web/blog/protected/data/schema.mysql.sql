CREATE TABLE tbl_post (
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    author_id integer not null ,
    title VARCHAR(128) NOT NULL,
    content VARCHAR(128) NOT NULL,
    tags VARCHAR(128) NOT NULL,
    status enum('1','2','3') default 1 not null,
    create_time timestamp not null,
    update_time timestamp not null
);

CREATE TABLE tbl_comment (
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    post_id integer not null ,
    author VARCHAR(128) NOT NULL,
    content text NOT NULL,
    email VARCHAR(128) NOT NULL,
    url VARCHAR(256) NOT NULL,
    status enum('1','2','3') default 1 not null,
    create_time timestamp not null
);

CREATE TABLE tbl_lookup (
   id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
   name VARCHAR(128) NOT NULL,
   code VARCHAR(128) NOT NULL,
   type VARCHAR(128) NOT NULL,
   position VARCHAR(128) NOT NULL
);

CREATE TABLE tbl_tag (
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(128) NOT NULL,
    frequency integer NOT NULL
);
