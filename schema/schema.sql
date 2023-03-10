CREATE TABLE
    Item (
        id SERIAL NOT NULL,
        genre_id INT,
        author_id INT,
        label_id INT,
        publish_date DATE NOT NULL,
        archived BOOLEAN,
        FOREIGN KEY (genre_id) REFERENCES Genre (id),
        FOREIGN KEY (author_id) REFERENCES Author (id),
        FOREIGN KEY (label_id) REFERENCES Label (id),
        PRIMARY KEY (id)
    );

CREATE TABLE
    Genre (
        id SERIAL NOT NULL,
        name VARCHAR(100) NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Author (
        id SERIAL NOT NULL,
        first_name VARCHAR(50) NOT NULL,
        last_name VARCHAR(50) NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Label (
        id SERIAL NOT NULL,
        title VARCHAR(50) NOT NULL,
        color VARCHAR(50) NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Book (
        id INT GENERATED BY DEFAULT AS IDENTITY,
        title VARCHAR(50) NOT NULL,
        publish_date DATE NOT NULL,
        publisher VARCHAR(50) NOT NULL,
        cover_state VARCHAR(15) NOT NULL,
        label_id INT,
        author_id INT,
        genre_id INT,
        FOREIGN KEY (label_id) REFERENCES Label (id),
        FOREIGN KEY (author_id) REFERENCES Author (id),
        FOREIGN KEY (genre_id) REFERENCES Genre (id),
        PRIMARY KEY (id)
    );

CREATE TABLE
    MusicAlbum (
        id INT GENERATED ALWAYS AS IDENTITY,
        on_spotify BOOLEAN NOT NULL,
        publish_date DATE NOT NULL,
        genre_id INT NULL,
        author_id INT NULL,
        label_id INT NULL,
        FOREIGN KEY (genre_id) REFERENCES Genre (id),
        FOREIGN KEY (author_id) REFERENCES Author (id),
        FOREIGN KEY (label_id) REFERENCES Label (id),
        archived BOOLEAN NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    games (
        id INT GENERATED BY DEFAULT AS IDENTITY,
        name VARCHAR(50),
        multiplayer BOOLEAN NOT NULL,
        publish_date DATE NOT NULL,
        last_played_at DATE NOT NULL,
        genre_id INT,
        author_id INT,
        label_id INT,
        FOREIGN KEY (genre_id) REFERENCES Genre (id),
        FOREIGN KEY (author_id) REFERENCES Author (id),
        FOREIGN KEY (label_id) REFERENCES Label (id),
        PRIMARY KEY (id)
    );