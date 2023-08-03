CREATE TABLE IF NOT EXISTS Musical_genre (
genreID SERIAL PRIMARY KEY	,
genre_name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Musical_performers (
performers_listID SERIAL PRIMARY KEY,
genreID INTEGER REFERENCES Musical_genre (genreID),
performerID INTEGER REFERENCES Music_performer (performerID),
CONSTRAINT pk PRIMARY KEY (genreID, performerID)
);

CREATE TABLE IF NOT EXISTS Music_performer (
performerID SERIAL PRIMARY KEY,
performer_name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Album_list (
album_listID SERIAL PRIMARY KEY,
performerID INTEGER REFERENCES Music_performer (performerID),
albumID INTEGER REFERENCES Album (albumID),
CONSTRAINT pk PRIMARY KEY (performerID, albumID)
);

CREATE TABLE IF NOT EXISTS Album (
albumID SERIAL PRIMARY KEY,
album_name TEXT NOT NULL,
releas_e DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Music_track (
trackID SERIAL PRIMARY KEY,
track_name TEXT NOT NULL,
duration TIME NOT NULL,
albumID INTEGER REFERENCES Album (albumID)
);

CREATE TABLE IF NOT EXISTS Collection_track (
collection_trackID SERIAL PRIMARY KEY,
collectionID INTEGER REFERENCES Music_collection (collectionID),
trackID INTEGER REFERENCES Music_track (trackID),
CONSTRAINT pk PRIMARY KEY (collectionID, trackID)
);

CREATE TABLE IF NOT EXISTS Music_collection (
collectionID SERIAL PRIMARY KEY,
collection_name TEXT NOT NULL,
releas_e DATE NOT NULL
);