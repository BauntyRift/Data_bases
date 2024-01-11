CREATE TABLE IF NOT EXISTS Исполнители (
    ID_исполнителя SERIAL PRIMARY KEY,
    Имя_исполнителя VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Жанры (
    ID_жанра SERIAL PRIMARY KEY,
    Название_жанра VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Исполнители_Жанры (
    ID SERIAL PRIMARY KEY,
    ID_исполнителя INT REFERENCES Исполнители(ID_исполнителя),
    ID_жанра INT REFERENCES Жанры(ID_жанра)
);

CREATE TABLE IF NOT EXISTS Альбомы (
    ID_альбома SERIAL PRIMARY KEY,
    Название_альбома VARCHAR(100),
    Год_выпуска INT
);

CREATE TABLE IF NOT EXISTS Альбомы_Исполнители (
    ID SERIAL PRIMARY KEY,
    ID_альбома INT REFERENCES Альбомы(ID_альбома),
    ID_исполнителя INT REFERENCES Исполнители(ID_исполнителя)
);

CREATE TABLE IF NOT EXISTS Треки (
    ID_трека SERIAL PRIMARY KEY,
    Название_трека VARCHAR(100),
    Продолжительность INT,
    ID_альбома INT REFERENCES Альбомы(ID_альбома)
);

CREATE TABLE IF NOT EXISTS Сборники (
    ID_сборника SERIAL PRIMARY KEY,
    Название_сборника VARCHAR(100),
    Год_выпуска INT
);

CREATE TABLE IF NOT EXISTS Сборники_Треки (
    ID SERIAL PRIMARY KEY,
    ID_сборника INT REFERENCES Сборники(ID_сборника),
    ID_трека INT REFERENCES Треки(ID_трека)
);

INSERT INTO Исполнители (Имя_исполнителя) VALUES 
('Madonna'), 
('The Beatles'), 
('Michael Jackson'), 
('Queen');

INSERT INTO Жанры (Название_жанра) VALUES 
('Pop'), 
('Rock'), 
('R&B');

INSERT INTO Альбомы (Название_альбома, Год_выпуска) VALUES 
('Thriller', 1982), 
('Abbey Road', 1969), 
('Like a Virgin', 1984);

INSERT INTO Треки (Название_трека, Продолжительность, ID_альбома) VALUES 
('Billie Jean', 292, 1), 
('Come Together', 248, 2), 
('Material Girl', 239, 3),
('Beat It', 258, 1),
('Hey Jude', 431, 2),
('Bohemian Rhapsody', 367, 3);

INSERT INTO Сборники (Название_сборника, Год_выпуска) VALUES 
('Greatest Hits', 2009), 
('Best of 80s', 1995), 
('Essential R&B', 2003);

INSERT INTO Исполнители_Жанры (ID_исполнителя, ID_жанра) VALUES 
(1, 1), 
(2, 2), 
(3, 3), 
(4, 2);

INSERT INTO Альбомы_Исполнители (ID_альбома, ID_исполнителя) VALUES 
(1, 3), 
(2, 2), 
(3, 1);

INSERT INTO Сборники_Треки (ID_сборника, ID_трека) VALUES 
(1, 1), 
(2, 5), 
(3, 3), 
(1, 4), 
(3, 6), 
(2, 2);
