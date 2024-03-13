CREATE TABLE Albergo (
albergoID INT PRIMARY KEY IDENTITY(1,1),
nome VARCHAR(250) NOT NULL UNIQUE,
indrizzo VARCHAR(250) NOT NULL UNIQUE,
valutazione INT NOT NULL, CHECK (valutazione BETWEEN 1 AND 5 )
);

CREATE TABLE Dipendente (
DipendenteID INT PRIMARY KEY IDENTITY(1,1),
nome VARCHAR(250) NOT NULL,
cognome VARCHAR(250) NOT NULL,
posizione VARCHAR(250) NOT NULL, 
email VARCHAR(250) NOT NULL,
albergoRIF INT NOT NULL, 
-- Il comando della foreign key si scrive
--FOREIGN KEY (attributo della tabella presente) REFERENCES il nome della tabella di arrivo (la sua primary key)
FOREIGN KEY (albergoRIF) REFERENCES Albergo(albergoID)
);


CREATE TABLE Facility (
facilityID INT PRIMARY KEY IDENTITY(1,1),
nome VARCHAR(250) NOT NULL,
descrizione VARCHAR(250) NOT NULL,
orarioApertura INT  NOT NULL CHECK (orarioApertura BETWEEN 8 AND 21), 
albergoRIF INT NOT NULL, 
-- Il comando della foreign key si scrive
--FOREIGN KEY (attributo della tabella presente) REFERENCES il nome della tabella di arrivo (la sua primary key)
FOREIGN KEY (albergoRIF) REFERENCES Albergo(albergoID)
);



CREATE TABLE Camera (
CameraID INT PRIMARY KEY IDENTITY(1,1),
numeroCamera INT NOT NULL ,
tipo VARCHAR(250) NOT NULL  CHECK(tipo IN('singola' , 'doppia' , 'suite')),
capacit‡Max INT  NOT NULL CHECK (capacit‡Max BETWEEN 1 AND 6), 
tariffaNotte INT NOT NULL CHECK (tariffaNotte > 0), 
albergoRIF INT NOT NULL, 
-- Il comando della foreign key si scrive
--FOREIGN KEY (attributo della tabella presente) REFERENCES il nome della tabella di arrivo (la sua primary key)
FOREIGN KEY (albergoRIF) REFERENCES Albergo(albergoID)
);



CREATE TABLE Cliente (
CLienteID INT PRIMARY KEY IDENTITY(1,1),
nome VARCHAR(250) NOT NULL ,
cognome VARCHAR (250) NOT NULL ,
contatto VARCHAR(250) NOT NULL, 
);





--inserire ancora prenotazione
CREATE TABLE Prenotazione (
PrenotazioneID INT PRIMARY KEY IDENTITY(1,1),
checkIn DATE NOT NULL UNIQUE,
checkOut DATE NOT NULL UNIQUE,
cameraRIF INT NOT NULL, 
clienteRIF INT NOT NULL,
FOREIGN KEY (cameraRIF) REFERENCES Camera(CameraID),
FOREIGN KEY (clienteRIF) REFERENCES Cliente(CLienteID)
);
















--DROP TABLE  IF EXISTS Dipendente;



INSERT INTO Albergo(nome, indrizzo, valutazione) VALUES
('Hilton', 'Viale Eur', 1),
('Sheraton', 'Via Azurri', 2),
('Pulitzer', 'Via tulio', 3),
('Dumbledore', 'Viale Neri', 1);

INSERT INTO Dipendente(nome, cognome, posizione, email, albergoRIF ) VALUES
('Marco', 'Mariani', 'Cameriere di Piano', 'mm@m',1),
('Roberto', 'Bianchi', 'Manager', 'r@b',3),
('Valeria', 'Tulli','Barista', 'v@t', 2);

INSERT INTO Facility(nome, descrizione, orarioApertura, albergoRIF ) VALUES
('Palestra', 'lightweight', 14,1),
('Piscina', 'swim', 11,3),
('Sala biliardo','pool', 19, 4);

INSERT INTO Camera(numeroCamera, tipo, capacit‡Max,tariffaNotte, albergoRIF) VALUES
(11, 'singola', 2, 40, 4),
(12, 'singola', 3, 42, 2),
(13, 'suite', 1, 129, 1),
(14, 'doppia', 6, 234, 3);



INSERT INTO Cliente(nome, cognome, contatto) VALUES
('Ramil', 'Garc', 'email'),
('Mario', 'Rossi', 'telefono'),
('Giovanna', 'Verdi', 'email'),
('Harry', 'Belzebub', 'email');


INSERT INTO Prenotazione(checkIn, checkOut, cameraRIF) VALUES
('2023-01-22', '2023-02-22',1),
('2023-06-12', '2023-06-20',2),
('2023-04-06','2023-04-09',3),
('2023-11-01','2023-12-12',4);

