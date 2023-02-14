CREATE TABLE MusicAlbum (
    id INT GENERATED ALWAYS AS IDENTITY,
    on_spotify BOOLEAN NOT NULL,
    publish_date DATE NOT NULL,
    genre_id INT NULL,
    author_id INT NULL,
    label_id INT NULL,
    FOREIGN KEY (genre_id) REFERENCES genre(id)
    FOREIGN KEY (author_id) REFERENCES author(id)
    FOREIGN KEY (label_id) REFERENCES label(id)
    archived BOOLEAN NOT NULL,
    PRIMARY KEY(id)
);


CREATE TABLE genre (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY(id)
);