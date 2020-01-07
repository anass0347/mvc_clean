-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 29 nov 2019 om 13:18
-- Serverversie: 10.1.30-MariaDB
-- PHP-versie: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `menukaart_goede`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `bestelling`
--

CREATE TABLE `bestelling` (
  `bestellingID` int(11) NOT NULL,
  `reserveringID` int(11) NOT NULL,
  `bon_code` int(11) NOT NULL,
  `stadCode` varchar(5) NOT NULL,
  `Stad` varchar(255) NOT NULL,
  `Inwoners` float(10,2) NOT NULL,
  `Voltooid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `bestelling`
--



-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `bonnetje`
--

CREATE TABLE `bonnetje` (
  `bon_code` int(11) NOT NULL,
  `reserveringID` int(11) NOT NULL,
  `tafel_nr` int(11) NOT NULL,
  `tijd` time NOT NULL,
  `datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Gerecht`
--

CREATE TABLE `Gerecht` (
  `GerechtCode` varchar(5) NOT NULL,
  `Gerecht` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `continent`
--

INSERT INTO `Gerecht` (`GerechtCode`, `Gerecht`) VALUES
('H', 'Hapjes'),
('HG', 'Hoofdgerecht'),
('NG', 'Nagerecht'),
('VG', 'Voorgerecht');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `SubGerecht`
--

CREATE TABLE `SubGerecht` (
  `SubGerecht` varchar(255) NOT NULL,
  `SubGerechtCode` varchar(5) NOT NULL,
  `GerechtCode` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `SubGerecht`
--

INSERT INTO `SubGerecht` (`SubGerecht`, `SubGerechtCode`, `GerechtCode`) VALUES
('Frisdrank', 'CN', 'AS'),
('Klein', 'ETH', 'AF'),
('Warm', 'FR', 'EU');


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `reserveringen`
--

CREATE TABLE `reserveringen` (
  `reserveringID` int(11) NOT NULL,
  `Naam` varchar(255) NOT NULL,
  `Achternaam` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `begin_tijd` time NOT NULL,
  `eind_tijd` time NOT NULL,
  `datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `reserveringen`
--

INSERT INTO `reserveringen` (`reserveringID`, `Naam`, `Achternaam`, `email`, `begin_tijd`, `eind_tijd`, `datum`) VALUES
(1, 'Anass', 'Kadouri', 'sakmodeacc@gmail.com', '12:00:00', '13:00:00', '2019-12-12'),
(2, 'Anass', 'Kadouri', 'sakmodeacc@gmail.com', '12:00:00', '13:00:00', '2019-12-12'),
(3, 'Anass', 'Kadouri', 'sakmodeacc@gmail.com', '12:00:00', '13:00:00', '2019-12-12'),
(4, 'Anass', 'Kadouri', 'sakmodeacc@gmail.com', '12:00:00', '13:00:00', '1122-02-13'),
(5, 'Anass', 'Kadouri', 'sakmodeacc@gmail.com', '11:11:00', '11:11:00', '1111-11-11'),
(6, 'aaaaaaaaaaaaaaaa', 'Kadouri', 'sakmodeacc@gmail.com', '11:11:00', '11:11:00', '1111-11-11');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `MenuItem`
--

CREATE TABLE `MenuItem` (
  `MenuItemCode` varchar(5) NOT NULL,
  `SubGerechtCode` varchar(5) NOT NULL,
  `Menuitem` varchar(255) NOT NULL,
  `Prijs` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `MenuItem`
--



--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `bestelling`
--
ALTER TABLE `bestelling`
  ADD PRIMARY KEY (`bestellingID`),
  ADD KEY `reservering_id` (`reserveringID`),
  ADD KEY `reserveringID` (`reserveringID`),
  ADD KEY `bon_code` (`bon_code`),
  ADD KEY `MenuItemCode` (`stadCode`),

--
-- Indexen voor tabel `bonnetje`
--
ALTER TABLE `bonnetje`
  ADD PRIMARY KEY (`bon_code`),
  ADD KEY `reserveringID` (`reserveringID`);

--
-- Indexen voor tabel `continent`
--
ALTER TABLE `Gerecht`
  ADD PRIMARY KEY (`GerechtCode`);

--
-- Indexen voor tabel `SubGerecht`
--
ALTER TABLE `SubGerecht`
  ADD PRIMARY KEY (`SubGerechtCode`),
  ADD UNIQUE KEY `SubGerechtCode` (`SubGerechtCode`),
  ADD KEY `ContinentCode` (`ContinentCode`),
  ADD KEY `GerechtCode` (`GerechtCode`),

--
-- Indexen voor tabel `reserveringen`
--
ALTER TABLE `reserveringen`
  ADD PRIMARY KEY (`reserveringID`),
  ADD KEY `reserveringID` (`reserveringID`);

--
-- Indexen voor tabel `stad`
--
ALTER TABLE `MenuItem`
  ADD PRIMARY KEY (`MenuItemCode`),
  ADD KEY `StadID` (`SubGerechtCode`),
  ADD KEY `StadID_2` (`SubGerechtCode`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `bestelling`
--
ALTER TABLE `bestelling`
  MODIFY `bestellingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT voor een tabel `bonnetje`
--
ALTER TABLE `bonnetje`
  MODIFY `bon_code` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `reserveringen`
--
ALTER TABLE `reserveringen`
  MODIFY `reserveringID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `bestelling`
--
ALTER TABLE `bestelling`
  ADD CONSTRAINT `bestelling_ibfk_3` FOREIGN KEY (`MenuItemCode`) REFERENCES `MenuItem` (`MenuItemCode`);

--
-- Beperkingen voor tabel `bonnetje`
--
ALTER TABLE `bonnetje`
  ADD CONSTRAINT `bonnetje_ibfk_1` FOREIGN KEY (`reserveringID`) REFERENCES `reserveringen` (`reserveringID`);

--
-- Beperkingen voor tabel `SubGerecht`
--
ALTER TABLE `SubGerecht`
  ADD CONSTRAINT `SubGerecht_ibfk_1` FOREIGN KEY (`GerechtCode`) REFERENCES `Gerecht` (`GerechtCode`);

--
-- Beperkingen voor tabel `MenuItem`
--
ALTER TABLE `MenuItem`
  ADD CONSTRAINT `stad_ibfk_1` FOREIGN KEY (`SubGerechtCode`) REFERENCES `SubGerecht` (`SubGerechtCode`);
