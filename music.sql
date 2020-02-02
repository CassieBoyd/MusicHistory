-- SELECT * FROM Song;

-- SELECT Title, ArtistId FROM Song;

-- SELECT Title FROM Song WHERE ArtistId = 6;

-- SELECT * FROM Song;

-- SELECT Title, SongLength, ReleaseDate, ArtistId
-- FROM Song
-- WHERE ArtistId = 8
-- AND ArtistId = 6;

--Insert stuff into the database
-- INSERT INTO Song
-- VALUES (null, "Baby Shark", 689, "09/22/1896", 9, 3, 5);

-- -- Another way to insert (recommended)
-- INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
-- VALUES ("Baby Squid", 799, "09/22/1896", 9, 3, 5);

-- UPDATE Song 
-- SET Title = "Baby Tuna"
-- WHERE SongId = 23;

-- DELETE FROM Song
-- WHERE SongId = 12;

--Write a select statament to display how many songs exist
--for each artist. YOu'll need to use the COUNT() function
--and the GROUP BY keyword sequence.
-- SELECT count() as SongCount, artist.artistname
-- FROM Song
-- JOIN Artist
-- ON song.artistid = artist.artistid
-- GROUP BY Song.artistid
-- ORDER by SongCount DESC;

-- SELECT al.title || " by " || ar.artistname
-- FROM Album al
-- JOIN Artist ar
-- ON al.artistid = ar.artistid;


-- *****CHAPTER 2 MUSIC HISTORY EXERCISE*****

--Run the following command in the terminal to open the database file.

-- tableplus musichistory.db
-- For each of the following exercises, provide the appropriate query. Yes, even the ones that are expressed in the form of questions. Everything from class and the Sqlite documentation for SQL keywords and functions is fair game.

-- Query all of the entries in the Genre table

SELECT * FROM Song;

--Using the INSERT statement, add one of your favorite artists to the Artist table.

INSERT INTO Artist (ArtistName, YearEstablished)
VALUES ("Elvis Presley", 1954);

--Using the INSERT statement, add one, or more, albums by your artist to the Album table.

INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES ("Elvis' Golden Records", "03/21/1958", 1923, "RCA Victor", 28, 2);

--Using the INSERT statement, add some songs that are on that album to the Song table.

INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES ("All Shook Up", 117, "03/22/1957", 2, 28, 23);

INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES ("Heartbreak Hotel", 128, "01/27/1956", 2, 28, 23);

INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES ("Jailhouse Rock", 155, "08/24/1957", 2, 28, 23);

--Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.

-- Reminder: Direction of join matters. Try the following statements and see the difference in results.

-- SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s USING (AlbumId);
-- SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;

SELECT s.Title AS Song, a.Title, ar.ArtistName
FROM Artist ar
LEFT JOIN Album a
ON ar.ArtistId = a.ArtistId
LEFT JOIN Song s
ON a.ArtistId = s.ArtistId
WHERE s.ArtistId = 28;

--Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT COUNT() as SongCount, album.Title
FROM Album
JOIN Song
ON Song.AlbumId = Album.AlbumId
GROUP BY Album.AlbumId;

--Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT count() as SongCount, artist.artistname
FROM Song
JOIN Artist
ON song.artistid = artist.artistid
GROUP BY Song.artistid;
 
--Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT COUNT() as SongCount, genre.GenreId, genre.label
FROM Song
JOIN Genre
ON song.GenreId = genre.GenreId
GROUP BY song.GenreId;

--Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.

SELECT MAX(album.AlbumLength) as MaxAlbumLength, album.Title
FROM Album;

--Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.

SELECT MAX(song.SongLength) as MaxSongLength, song.title
FROM Song;

--Modify the previous query to also display the title of the album.