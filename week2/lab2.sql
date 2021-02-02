CREATE TABLE movies(
    title TEXT,
    movie_year INTEGER,
    length INTEGER NOT NULL,
    plot_outline TEXT NOT NULL,
    company TEXT REFERENCES companies(name),

    PRIMARY KEY (title, movie_year)
);

CREATE TABLE actors(
    name TEXT,
    date_of_birth DATE,
    PRIMARY KEY (name, date_of_birth)
);

CREATE TABLE actors_of_movie(
    roles TEXT PRIMARY KEY,
    m_title TEXT,
    m_year INTEGER,
    a_name TEXT,
    a_Bday DATE,
    FOREIGN KEY (m_title, m_year) REFERENCES movies(title, movie_year),
    FOREIGN KEY (a_name, a_Bday) REFERENCES actors(name, date_of_birth)
);

CREATE TABLE companies(
    name TEXT PRIMARY KEY,
    address TEXT NOT NULL
);

CREATE TABLE directors(
    name TEXT,
    date_of_birth DATE,
    PRIMARY KEY (name, date_of_birth)
);

CREATE TABLE directors_of_movie(
    id SERIAL PRIMARY KEY,
    m_title TEXT,
    m_year INTEGER,
    d_name TEXT,
    d_Bday DATE,
    FOREIGN KEY (m_title, m_year) REFERENCES movies(title, movie_year),
    FOREIGN KEY (d_name, d_Bday) REFERENCES directors(name, date_of_birth)
);

CREATE TABLE quotes(
    id SERIAL PRIMARY KEY,
    quote TEXT NOT NULL,
    m_title TEXT,
    m_year INTEGER,
    a_name TEXT,
    a_Bday DATE,
    FOREIGN KEY (m_title, m_year) REFERENCES movies(title, movie_year),
    FOREIGN KEY (a_name, a_Bday) REFERENCES actors(name, date_of_birth)
);


