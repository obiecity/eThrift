/* CREATE DATABASE */

CREATE DATABASE ethriftdb;

/* CREATE USER AND GRANT PRIVILEGES */

CREATE USER 'buyer1'@'localhost' IDENTIFIED BY 'password';
GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT on Buyer TO 'buyer1'@'localhost';

/* TABLE CREATION */

CREATE TABLE `Seller`
(
    `sellerID` INT NOT NULL,
    `clientID` INT NOT NULL,
    `firstName` NVARCHAR(40) NOT NULL,
    `lastName` NVARCHAR(20) NOT NULL,
    `bDate` DATETIME,
    `address` NVARCHAR(70),
    `password` NVARCHAR(40) NOT NULL,
    `itemID` INT NOT NULL,
    `reviews` NUMERIC(10,2),
    `avgRating` NUMERIC(10,2),
    CONSTRAINT `PK_Seller` PRIMARY KEY  (`sellerID`)
);

CREATE TABLE `Reviewer`
(
    `buyerID` INT NOT NULL,
    `firstName` NVARCHAR(40) NOT NULL,
    `lastName` NVARCHAR(20) NOT NULL,
    `bDate` DATETIME,
    `address` NVARCHAR(70),
    `password` NVARCHAR(40) NOT NULL,
    `itemID` INT NOT NULL,
    `reviews` NUMERIC(10,2),
    CONSTRAINT `PK_Reviewer` PRIMARY KEY  (`buyerID`)
);

CREATE TABLE `Buyer`
(
    `buyerID` INT NOT NULL,
    `firstName` NVARCHAR(40) NOT NULL,
    `lastName` NVARCHAR(20) NOT NULL,
    `bDate` DATETIME,
    `address` NVARCHAR(70),
    `password` NVARCHAR(40) NOT NULL,
    CONSTRAINT `PK_Buyer` PRIMARY KEY  (`buyerID`)
);

CREATE TABLE `Clothes`
(
    `itemID` INT NOT NULL,
    `sellerID` INT NOT NULL,
    `clientID` INT NOT NULL,
    `name` NVARCHAR(80) NOT NULL,
    `listDate` DATETIME,
    `sellDate` DATETIME,
    `quantity` INT NOT NULL,
    `price` NUMERIC(10,2),
    `size` NVARCHAR(15),
    `category` NVARCHAR(10),
    CONSTRAINT `PK_Clothes` PRIMARY KEY  (`itemID`)
);

/* TABLE RELATIONSHIPS */

ALTER TABLE `Clothes` ADD CONSTRAINT `FK_itemID`
    FOREIGN KEY (`itemID`) REFERENCES `Seller` (`itemID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_itemID` ON `Clothes` (`itemID`);

ALTER TABLE `Clothes` ADD CONSTRAINT `FK_sellerID`
    FOREIGN KEY (`sellerID`) REFERENCES `Seller` (`sellerID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_sellerID` ON `Clothes` (`sellerID`);

ALTER TABLE `Clothes` ADD CONSTRAINT `FK_rClientID`
    FOREIGN KEY (`clientID`) REFERENCES `Reviewer` (`buyerID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_rClientID` ON `Clothes` (`clientID`);

ALTER TABLE `Clothes` ADD CONSTRAINT `FK_bClientID`
    FOREIGN KEY (`clientID`) REFERENCES `Buyer` (`buyerID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_bClientID` ON `Clothes` (`clientID`);

ALTER TABLE `Seller` ADD CONSTRAINT `FK_reviewerMsg`
    FOREIGN KEY (`clientID`) REFERENCES `Reviewer` (`buyerID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_sellerReviewer` ON `Reviewer` (`buyerID`);

ALTER TABLE `Seller` ADD CONSTRAINT `FK_buyerMsg`
    FOREIGN KEY (`clientID`) REFERENCES `Buyer` (`buyerID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_sellerBuyer` ON `Seller` (`clientID`);

/* TABLE DATA */

insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('301', '6', 'Roze', 'Pharaoh', '9/10/1994', '325 Lien Road', 'fRmCHAR', 5, 2.47, '51');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('1837', '7', 'Ted', 'Trundle', '4/24/1974', '3 Londonderry Alley', '6zQGdk', null, null, '79952');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('71', '99911', 'Hali', 'Hayworth', '11/23/1979', '9 Fordem Plaza', 'hPTpPi57wM', 5, 2.39, '98351');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('91871', '37', 'Marena', 'Dowsett', '3/7/1988', '6 Mayer Hill', 'kqksNd2WJK', 4, 1.03, '7367');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('3', '34911', 'Naomi', 'Gors', '12/2/1980', '5604 6th Court', 'WVqLPzZUM', null, null, '9643');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('06400', '97892', 'Joelly', 'Mullins', '3/21/1981', '0 Kensington Point', 'ykmiyG', 2, 4.93, '1');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('29186', '7467', 'Page', 'Clohissy', '6/7/1956', '6098 Browning Center', 'jc0VE5jyxI', 5, 2.31, '7');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('02614', '42579', 'Jasmin', 'Loggie', '8/9/2000', '4 Hagan Crossing', 'DvIb8dgW8', null, null, '86370');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('4', '287', 'Gian', 'Binfield', '4/13/1991', '91 Florence Road', 'GXTbEQSAJgf', null, null, '864');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('024', '848', 'Jasmin', 'Sobey', '10/18/2002', '3518 Bellgrove Lane', 'hRfpXw', null, null, '12');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('112', '17', 'Andee', 'Scowcroft', '9/30/1967', '432 Evergreen Parkway', 'dll5XrM3S', 4, 4.97, '6');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('2871', '4', 'Anton', 'McConnel', '7/27/1976', '43 Comanche Trail', 'bwpyUsMs', 4, 3.58, '1221');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('24128', '23', 'Sib', 'Bowen', '1/19/1960', '57627 Algoma Avenue', '2G4tMp8ap', null, null, '77014');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('02', '499', 'Elicia', 'Cadamy', '11/1/1964', '51 Bay Drive', 'AyWjQPezoY5', 3, 3.12, '573');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('2617', '1540', 'Nancie', 'Boobier', '7/25/1989', '079 Chinook Place', 'RPFs05SJJJ', null, null, '95105');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('983', '4395', 'Marcellus', 'Reese', '8/30/1943', '99558 Spaight Road', 'QyeBhSv8Tj', 2, 1.53, '7');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('374', '51020', 'Nero', 'Adam', '4/21/1960', '46 Anniversary Street', 'JQsuczbJ', 3, 3.78, '97421');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('9', '3157', 'Mickie', 'Worledge', '3/1/1950', '28960 Corscot Alley', 'oUvJEna', null, null, '5169');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('735', '57', 'Antons', 'Loadsman', '11/7/1968', '39065 Dunning Parkway', 'XULPgYJz', 1, 2.88, '14');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('0462', '2', 'Ingamar', 'Edworthy', '11/6/1989', '004 Sheridan Lane', 'sRcFg3tf', null, null, '5710');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('482', '5', 'Brantley', 'Skittrell', '7/22/1975', '91683 Marquette Parkway', 'J7QlISrX14B', 3, 2.23, '2');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('29291', '45', 'Nathan', 'Curson', '7/8/1989', '0045 Fordem Junction', 'GuiGbtWrk', 2, 2.03, '7');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('18', '3398', 'Libbie', 'Hopfer', '10/23/1959', '475 Summer Ridge Place', 'rTAnp6u', 4, 2.47, '206');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('9594', '4', 'Bertrand', 'Fasham', '11/18/1995', '0 Elmside Point', 'zny10h', 5, 1.16, '1');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('4', '3', 'Evonne', 'Glendenning', '1/29/1989', '4 Summerview Crossing', 'K3gjPkdbGmL2', null, null, '49597');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('5', '8313', 'Lucho', 'Reyson', '7/1/1952', '9 Dexter Park', 'lPCQFBftFJ', 5, 3.54, '03');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('11', '8136', 'Even', 'Scorer', '1/11/1994', '33539 Sommers Alley', 'ecfGNzBY', 2, 1.42, '8');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('728', '7113', 'Ernst', 'Vardy', '7/2/1998', '312 Elmside Crossing', 'J6VcFpfUKTJ', 2, 1.47, '03139');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('234', '08650', 'Pip', 'McKibben', '10/10/1990', '2 Scofield Lane', 'kThw1Vs1zPUb', null, null, '54646');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('81', '53', 'Parnell', 'Alleyne', '4/20/1988', '5647 Dennis Park', 'gIxwTWq1', null, null, '677');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('501', '884', 'Lorne', 'Franz-Schoninger', '10/13/1973', '8 Toban Road', 'ry2rCx', 2, 2.96, '660');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('03', '34', 'Friedrich', 'Dargavel', '12/2/1998', '38677 Forster Alley', 'eXvqoi4', null, null, '50');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('6', '95', 'Jacky', 'Gatlin', '5/16/1947', '24 Welch Parkway', 'wctxiP', null, null, '621');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('8', '7639', 'Deeyn', 'Fawdrie', '6/24/1989', '9792 American Ash Road', 'rjX7Reg9eq', null, null, '0233');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('4', '868', 'Camala', 'Kilcoyne', '3/28/1986', '53936 Doe Crossing Point', 'w5Y0KhXYCA', 5, 1.93, '14155');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('4782', '1213', 'Alic', 'Metzing', '7/29/1987', '20 Susan Road', 'cdODqd7', null, null, '45');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('254', '28391', 'Antony', 'Hares', '7/3/1946', '6 Bultman Place', 'N1bW1HDY', null, null, '5370');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('778', '538', 'Rickey', 'Mardee', '11/24/1975', '31 Morningstar Trail', '4nXneP', 4, 1.92, '86');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('3342', '407', 'Edythe', 'Ferrero', '10/30/1969', '4782 Stone Corner Center', 'qxw7PdSEHd', 2, 3.38, '91');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('71035', '134', 'Georges', 'Lote', '2/20/1973', '8 Mcbride Trail', 'VbhcvrOQ2', 2, 4.57, '6768');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('2', '25616', 'Jesse', 'Imloch', '2/6/1978', '298 Burrows Circle', 'lHhP5SwmKcaC', 1, 2.92, '75');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('547', '5084', 'Leonardo', 'Wildman', '12/10/1984', '0 Prairieview Parkway', '7bAVOuy', 5, 4.98, '2');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('90168', '9', 'Drugi', 'Rintoul', '10/15/1978', '69883 Bartelt Court', 'PPlai4KsvfH', 4, 2.86, '269');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('2026', '28125', 'Jaimie', 'Reihill', '8/27/1974', '4097 Marcy Circle', 'pVAbjx1', 4, 1.55, '2');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('85979', '623', 'Gisele', 'Allmann', '4/4/1954', '39 Moland Pass', 'iFcQkO', 4, 3.15, '2892');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('43943', '55647', 'Kincaid', 'Timblett', '2/7/1947', '86 Warner Avenue', 'lJjhHaovQ8s', 1, 1.74, '9848');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('561', '7', 'Donnajean', 'Dearnly', '6/2/1987', '4419 Troy Parkway', '5JWE9GZ', 5, 2.38, '6910');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('38442', '7073', 'Ethyl', 'McGrill', '5/15/1965', '6405 Gateway Center', 'go5EPrYxba', null, null, '5');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('083', '36952', 'Alister', 'Oddy', '8/31/1964', '8647 Oneill Crossing', '1z0Ywwt', 5, 4.39, '35');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('01', '630', 'Rozella', 'Vasechkin', '8/8/1955', '9 Lukken Alley', 'wmMor4r6Nb', 2, 1.5, '5559');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('72', '396', 'Reiko', 'Gergus', '11/24/1953', '13 Canary Plaza', 'Uwbz4etHWzN', null, null, '32234');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('829', '78271', 'Heidie', 'Ubach', '5/15/1949', '772 Myrtle Terrace', 'iLCFOh', 3, 1.12, '92');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('7395', '19287', 'Lisha', 'Witard', '9/19/1983', '084 Barnett Junction', 'IePKpe3L8q9', 2, 2.74, '3');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('7371', '54763', 'Granger', 'Midner', '3/15/1960', '621 Eastlawn Street', 'My5ZHUCI4f', null, null, '1027');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('34', '35611', 'Mercedes', 'Wallage', '1/24/1965', '6 Parkside Court', 'lGsvwrwN', null, null, '62337');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('04', '4', 'Llywellyn', 'Dumbleton', '11/25/1960', '0 Boyd Point', 'NmQyge', null, null, '62');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('2222', '08', 'Baxie', 'Johnsson', '1/11/1940', '329 Pankratz Terrace', 'm2EJYqf', 3, 1.89, '534');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('59442', '4955', 'Ethelin', 'Skrzynski', '5/31/1983', '43 Bellgrove Parkway', 'N5YuPcmBT', 5, 4.69, '82152');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('38759', '27582', 'Doro', 'Beardall', '11/29/1999', '9104 Sachs Road', '6OSvEC', 5, 1.6, '3');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('58', '2', 'Eveleen', 'Escale', '2/28/2000', '7 Farmco Crossing', 'Me1osALXZ', 2, 1.53, '423');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('1754', '492', 'Jacklin', 'Basey', '11/10/1941', '181 Mcbride Hill', 'FtrNNkyO', 2, 2.92, '0');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('4106', '36022', 'Douglas', 'Lissaman', '10/15/1979', '0448 Mendota Plaza', 'iDdR0upB', 4, 2.69, '66');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('5', '502', 'Katee', 'Prozillo', '8/17/1944', '687 Clove Point', 'kam4L3R7DT4', 5, 3.86, '044');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('035', '37', 'Pammi', 'Likly', '3/28/1969', '17153 Vera Alley', '6QbNvwsXJn', 4, 1.09, '688');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('43602', '2161', 'Karolina', 'Petraitis', '6/18/1988', '97 Kropf Junction', 'urE0iBVJDIn', 5, 3.33, '8');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('1', '54', 'Rollie', 'Taillant', '12/21/1999', '9 Anniversary Point', 'OaWfVcUKcRSx', 1, 1.03, '70');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('06903', '53250', 'Reinald', 'Jakubovits', '11/28/1995', '9579 Everett Junction', 'N8bn37FGH', 2, 2.34, '853');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('558', '81', 'Ivett', 'Douris', '4/19/1945', '1516 Menomonie Circle', 'NnN0AlTY', 4, 2.32, '48208');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('1136', '597', 'Rosaline', 'Bryan', '8/8/2001', '3 Del Sol Street', 'vyDHux', 1, 2.87, '157');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('16', '42023', 'Rafael', 'Dalgarnowch', '4/7/1940', '334 Nancy Hill', 'sUAH9WnMh', null, null, '3');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('97', '838', 'Reuben', 'Dennerly', '12/12/1973', '2 3rd Alley', 'KY8FaMlT', null, null, '68096');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('9', '6857', 'Adelbert', 'Halloran', '1/25/1969', '5 Kropf Lane', 'k1vApjV1', 3, 2.21, '97');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('78', '4', 'Laurianne', 'Slobom', '4/12/1941', '18117 Kipling Crossing', 'w7jMt8p', null, null, '0850');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('30', '92', 'Jacobo', 'Kennard', '3/17/1951', '719 Declaration Avenue', 'Uk3AqRUD7', 3, 2.0, '481');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('10507', '7', 'Dimitry', 'D''Alesio', '6/24/1948', '54 Carpenter Plaza', 'JxqOCwQ', 3, 3.09, '66445');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('6', '7', 'Kimmy', 'Zanetello', '5/2/1972', '41910 Eggendart Junction', 'x8w6Taz3i2c', 3, 3.7, '78');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('29', '4', 'Darill', 'Larkin', '1/1/1971', '095 Shopko Terrace', 'n85NUB', null, null, '33629');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('36205', '03772', 'Rosalyn', 'Issit', '5/24/1966', '711 Daystar Plaza', 'RO6NW0bz0', null, null, '51');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('31', '75461', 'Olimpia', 'Epp', '1/13/1967', '56816 Bartillon Drive', 'uW4WDc', 5, 4.66, '337');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('99', '64', 'Jaclyn', 'Egre', '1/28/2000', '30 Southridge Court', 'mvxQJ5rYbVxa', 1, 4.41, '284');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('57', '2563', 'Leonerd', 'Burgwin', '3/20/1980', '7360 Judy Plaza', 'OQom8bBZ1v', null, null, '783');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('596', '4', 'Denny', 'Peplaw', '2/2/1995', '7 Shoshone Lane', 'zMljIQD9r', null, null, '57');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('11', '45', 'Hamil', 'Fritschmann', '7/28/1984', '1427 Sloan Pass', 'nFjiCHCtn1', 4, 1.09, '531');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('5', '83654', 'Joell', 'Dohr', '8/31/1944', '33 Evergreen Drive', 'gtsxZUeQVMG', null, null, '26');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('4', '86', 'Cloe', 'Hallahan', '12/17/1952', '7 Mandrake Hill', 'dZfdCLk8Es', null, null, '2');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('2365', '4', 'Tab', 'Bosenworth', '6/9/1941', '26 Rutledge Place', 'YA30dzcPMCdX', 2, 2.49, '84664');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('36376', '85', 'Aurelia', 'Guilleton', '2/2/1975', '222 Fuller Drive', 'YMZ0lbHL', 2, 2.46, '62');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('37985', '132', 'Josepha', 'Kingstne', '7/8/1967', '6 Warrior Place', 'BaCNTL9NP4cX', 5, 1.62, '46');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('076', '7', 'Eydie', 'Pardie', '6/10/1950', '5899 Summit Avenue', 'YzYyt3YTl', 3, 1.18, '49');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('82562', '60', 'Andrus', 'Concklin', '4/4/1952', '87130 Anthes Pass', 'URJrWY', null, null, '1495');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('3877', '39938', 'Marchall', 'Brigg', '5/27/1963', '64753 Dayton Alley', 'meaEUHK73IP', 4, 1.81, '094');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('07684', '3', 'Obadias', 'Mackieson', '7/23/1993', '39 Carberry Court', 'lJBvyhH', 4, 2.57, '7');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('304', '96743', 'Nissie', 'McPaike', '3/10/1969', '01 Loftsgordon Street', 'wq8KI5fF344', null, null, '2');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('8222', '04', 'Darrelle', 'Iacovacci', '2/18/1964', '5 Algoma Center', 'kMAtxAVB', null, null, '59588');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('1465', '82', 'Garnette', 'Nester', '4/26/1988', '4005 Clyde Gallagher Avenue', 'XPKdR2fst', 4, 2.48, '8');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('5', '69594', 'Boniface', 'Hatch', '2/13/1965', '812 Northwestern Lane', 'fcnu4r', null, null, '76');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('292', '5', 'Sigfried', 'Ellery', '8/2/1978', '60 Crescent Oaks Trail', 'vcPBWTMLGitU', 4, 3.26, '800');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('37', '9', 'Emelen', 'Gehricke', '11/22/1944', '156 International Plaza', 'XA3LUWnwd6', null, null, '33');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('317', '5', 'Rebe', 'O''Kuddyhy', '5/1/1953', '4943 Sloan Hill', '8vnrReur', 2, 1.87, '8745');
insert into Seller (sellerID, clientID, firstName, lastName, bDate, address, password, reviews, avgRating, itemID) values ('92', '651', 'Rockie', 'Duffan', '3/31/1998', '19798 Morningstar Court', 'fR330cue', null, null, '33217');

insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('8', '01', 'Meredith', 'Gibbe', '3/22/1940', '422 Burrows Plaza', 'QyrhQoqq7', 5);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('8334', '5388', 'Dicky', 'Gowler', '2/18/1967', '4981 Sycamore Court', '5TQRRYW0Z4RR', 4);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('94089', '66310', 'Rutter', 'Skyrm', '5/25/1950', '13 Haas Court', 'j5Xcfl', 2);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('59122', '465', 'Carmencita', 'Hawkeridge', '1/28/1978', '0 Waxwing Trail', 'QAjx7nb', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('3071', '06', 'Gwenny', 'Rogerson', '5/9/1965', '6 Crowley Center', '28StVzt2Pp', 2);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('97', '527', 'Ivy', 'Riseley', '4/11/1943', '12289 Kingsford Plaza', 'oXq02Yan', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('96', '88', 'Pierrette', 'Nial', '11/3/1944', '97 Prairieview Way', 'R5hqC9ttzBs', 1);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('0', '002', 'Lothario', 'Thurlbourne', '12/1/1989', '6982 Kedzie Center', 'DW2g6xVNrI', 5);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('5069', '38720', 'Archambault', 'Tickner', '5/19/1989', '25306 Graedel Hill', 'MvvOImnUl', 5);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('62382', '458', 'Wilmar', 'Kerton', '10/31/1984', '44204 Rutledge Junction', 'UcYDJ5ui7O', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('4220', '633', 'El', 'Pounder', '4/24/2003', '70 Heffernan Street', 'iG4HLXBeEAx', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('3030', '6', 'Dominick', 'Cotgrave', '10/5/1959', '18 Schurz Center', 'CSkzJG', 1);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('329', '482', 'Monika', 'Kitchinham', '7/7/1971', '5257 Kings Park', 'RzdN49wrsMle', 5);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('1264', '504', 'Danit', 'Perryn', '11/1/1955', '7 Bartillon Plaza', 'zfCUEG', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('378', '576', 'Engelbert', 'Simioni', '5/29/1942', '60 Onsgard Drive', '0IEbFdn0j0', 3);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('5323', '029', 'Marilyn', 'Saul', '3/20/1942', '93 Victoria Road', 'DkQVfxXyiRS', 5);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('37993', '94', 'Jenelle', 'Pashen', '12/19/1972', '3 Carberry Road', 'FCyX3E3', 3);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('9', '0', 'Kelby', 'Josiah', '10/31/1978', '38934 Maple Wood Hill', 'OXblbLVpyL', 2);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('40210', '25', 'Isaac', 'Choldcroft', '12/15/1995', '6 Cordelia Road', 'ohyiWt8rN3', 3);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('84', '3', 'Neddie', 'McClarence', '9/9/1960', '769 Maple Wood Circle', 'WABHT9h1j', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('8', '7', 'My', 'Petti', '1/16/1981', '18281 Division Plaza', 'Pbaf6ZQsa7p', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('475', '319', 'Edee', 'Chatelet', '4/17/1984', '7 Esch Circle', '4d3You9aS3X', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('9', '41453', 'Giacopo', 'Eckels', '10/18/1943', '21 Jackson Parkway', 'pEUY5i07', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('3', '22', 'Preston', 'Twinbourne', '3/29/1974', '5 Merchant Alley', '346Msy', 2);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('64363', '494', 'Dona', 'Habbes', '11/21/1978', '1482 Di Loreto Circle', 'fVrJBVMaj', 3);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('985', '50', 'Arlen', 'Dominici', '9/23/1970', '755 Toban Terrace', 'hxDYOwcG1zu', 1);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('31', '4', 'Lorry', 'Sipson', '9/7/1945', '25 Barnett Point', 'JT0XfvTYysi', 5);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('9', '104', 'Loren', 'Scneider', '6/8/1986', '690 Kropf Court', 'WVs276AyW9', 5);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('44822', '16036', 'Gates', 'Syder', '1/13/1986', '01463 Prairie Rose Plaza', 'hAnvMT', 2);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('688', '43285', 'Sanford', 'Tummond', '7/3/1955', '6 Autumn Leaf Hill', 'PvK8EaCEDt', 4);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('35', '7020', 'Graig', 'Pulster', '3/23/2000', '012 Straubel Point', 'XfVBosE04', 3);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('8', '25', 'Yvette', 'Jacquot', '12/6/1981', '4 Iowa Alley', '1bAyttgk7', 4);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('5', '453', 'Thomasine', 'Chelam', '7/24/1986', '09347 Columbus Street', 'qVZ6O8J', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('489', '9', 'Templeton', 'Zecchetti', '12/16/1958', '455 Veith Point', 'MtYmaxjV', 4);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('65', '23773', 'Rosana', 'Rendle', '9/29/1956', '0652 Rowland Street', 'baiQFXMJnrdH', 2);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('70', '4', 'Jenni', 'Trusler', '1/5/1956', '64428 Waywood Street', 'qB47yPA', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('93', '3504', 'Obadias', 'Codrington', '6/5/1976', '8 Sullivan Junction', 'WzlsgnZZrVt6', 2);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('44', '6', 'Whit', 'Ridhole', '2/10/1958', '428 Mariners Cove Pass', 'lWDTG248Hl', 4);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('42', '6', 'Chrysler', 'Mossom', '8/7/1952', '82 Mosinee Street', 'gz3ovLWzz8f', 5);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('50', '5', 'Fabien', 'Peat', '8/20/1978', '6 Cardinal Avenue', 'nHIlI4mIT', 1);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('4581', '75', 'Holly', 'Hattigan', '2/20/1979', '41024 Lillian Alley', '6JN2IGPpV', 4);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('2655', '80540', 'Lonnie', 'Gernier', '4/18/1948', '3 Ludington Way', '0SDMHra', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('0728', '94966', 'Perkin', 'Lanyon', '1/19/1951', '2 Barby Hill', 'b4tiubTDy', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('7466', '27', 'Benson', 'Mathys', '5/15/1970', '443 Westerfield Place', 'czS1cg7Yo', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('16864', '5', 'Patrica', 'Waples', '7/4/1963', '47645 Thompson Street', 'G3KxLBeZY', 5);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('3062', '974', 'Teddie', 'Stoltz', '8/24/1942', '4 Spaight Crossing', 'KyYqrR', 3);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('37', '2553', 'Kettie', 'Pinar', '8/4/1990', '27167 Anderson Junction', 'Z3QAitFUfEz', 1);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('99', '866', 'Pauly', 'Runham', '6/13/1953', '4 Mayfield Junction', 'E7DTZheZ9', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('7', '72', 'Nixie', 'Goldsby', '6/6/1997', '07 Melby Way', '3mBcCxm7sb1', 4);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('65640', '1388', 'Birdie', 'French', '6/6/1960', '773 Mayfield Crossing', 'ZNm6HXow', 2);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('554', '13218', 'Hilly', 'Granger', '8/9/1980', '30 Maple Terrace', 'h6sg7vD', 2);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('152', '61181', 'Devondra', 'Blinco', '12/19/1946', '37 Gulseth Parkway', 'IOFVB8', 3);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('5567', '2526', 'Glen', 'Seys', '7/9/2003', '84194 Eastlawn Junction', 'Ojnl16c', 3);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('80186', '47', 'Sonya', 'Badsworth', '10/5/1959', '272 Raven Avenue', 'YtOkBm', 3);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('7', '27', 'Odey', 'Fairey', '7/14/1986', '9546 Porter Trail', 'Id0Pf4oaRxqY', 4);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('73', '04', 'Joice', 'Ashbridge', '3/20/1949', '6911 Corscot Lane', 'R33GHh05', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('77841', '9134', 'Katalin', 'Kornyshev', '2/27/1979', '231 Onsgard Circle', 'GL2iobr', 4);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('7', '56', 'Alix', 'Teodorski', '10/20/2002', '27812 Waxwing Junction', 'V92vNacR', 2);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('3', '56493', 'Malanie', 'Knibbs', '12/25/1943', '86 Jana Center', '03P39YU', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('5224', '41224', 'Aubine', 'Benedick', '6/15/1967', '726 John Wall Trail', 'LdOvUHE54', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('3835', '9', 'Frasquito', 'Segar', '12/22/1973', '147 Grayhawk Drive', 'B4tMD4', 5);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('42807', '025', 'Rosene', 'Djurevic', '4/16/1968', '6 Lake View Hill', 'ysKNCBfVW', 5);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('28', '33', 'Heloise', 'O''Hagirtie', '3/22/1960', '9 Warbler Center', '5RCcq3yT3Nf', 1);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('585', '29050', 'Jonathon', 'Sheeran', '8/10/1957', '266 Pine View Avenue', '5PRU3MUV', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('3268', '8082', 'Harlan', 'McNee', '6/3/1953', '5768 Bashford Street', 'FWKphk', 3);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('22', '74896', 'Gisella', 'Mackison', '8/7/1962', '9090 Ryan Place', '6Es4NBn9c', 2);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('1', '27', 'Aluin', 'MacVicar', '11/2/1953', '949 Melody Way', '5iMHHiYf', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('4', '5', 'Aldric', 'Moreno', '9/20/1993', '5307 Fordem Junction', 'Z4I7XyMuqtu', 1);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('137', '4', 'Humfried', 'Neilands', '3/11/1955', '23 Truax Circle', 'MjeFLz8HN', 1);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('2596', '210', 'Conrad', 'Pawling', '3/25/1946', '28 Ludington Crossing', 'F43vi6AUMT4j', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('96697', '22901', 'Syman', 'Pettican', '6/16/1997', '35 Northview Street', 'Mk7GTj88WrGU', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('46389', '45', 'Adelina', 'Hanigan', '9/20/1942', '19654 Iowa Pass', 'nLJGKY', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('62530', '35', 'Shani', 'Eyers', '2/9/1975', '003 Welch Center', 'd0aam5gt', 5);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('03', '12579', 'Dael', 'Softley', '9/2/1941', '7207 Magdeline Circle', 'ScUJCzJbd', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('56', '78', 'Tracie', 'Fesby', '2/11/1951', '71 Bay Point', 'BLdELl', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('12755', '953', 'Scott', 'Dealtry', '12/8/1970', '8 Mcguire Alley', 'e0BTyS86R', 4);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('57', '7751', 'Fara', 'Petto', '4/11/1995', '80624 La Follette Alley', 'QcPK4hYvNCma', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('324', '80197', 'Giacinta', 'Vigours', '5/3/1981', '43929 Morningstar Avenue', 'eSxSzzV5v', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('49', '21414', 'Julianne', 'Piscotti', '8/14/1963', '0974 Londonderry Parkway', '74jcOp5yzM', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('6', '7', 'Audrie', 'Goard', '10/3/1971', '6 Larry Pass', 'FOdGfI', 3);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('14', '04', 'Quillan', 'Esmead', '6/28/1977', '92302 Dwight Terrace', 'NGZcc547t', 1);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('78', '09', 'Vin', 'Kennedy', '2/10/1994', '1192 Lakewood Hill', 'KtMOxaxBDGK', 2);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('6384', '6', 'Edna', 'Labern', '7/28/1998', '5 Truax Hill', 'MzOPyaMg5i', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('54617', '798', 'Mohandas', 'Smitherham', '3/1/1983', '4943 South Crossing', '76X48En', 5);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('94524', '55', 'Lemuel', 'Renney', '9/27/1980', '414 Straubel Plaza', 'houi3qqoFYu', 1);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('7', '702', 'Saw', 'Rosas', '2/28/1981', '26 Bay Way', 'A3akxqUUZ88', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('30', '71', 'Nadya', 'Wilgar', '4/7/1953', '96685 Golf Terrace', 's7Ne89', 3);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('54018', '6791', 'Taber', 'Kopisch', '12/3/1987', '2 Mariners Cove Plaza', 'EKU1BTfQvas', 1);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('9', '977', 'Verne', 'Baron', '1/19/1941', '149 Spenser Circle', 'rB3GzXt', 2);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('9', '86481', 'Meggi', 'Lucius', '2/16/1996', '3036 Corben Avenue', 'DaUn8pH5M6Y', 5);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('584', '03', 'Westley', 'Dicken', '5/12/1999', '72 Loftsgordon Drive', 'f4sJThA', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('82026', '31933', 'Raychel', 'Woodthorpe', '12/5/2000', '142 Elka Drive', 'DruvdwnpP93j', 2);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('0036', '0872', 'Cherida', 'Thorold', '7/10/1961', '792 Menomonie Street', 'TQBNrRYMl', 2);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('8387', '72843', 'Syman', 'Torrijos', '12/13/1967', '01098 Pleasure Court', 'AxYQbTbXyqNh', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('73820', '736', 'Hartwell', 'Heigold', '9/12/1971', '510 Scoville Center', 'CaRHAEo', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('138', '840', 'Elvis', 'Hillin', '12/25/1982', '7 Montana Alley', 'O5wiYxJ', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('6', '57', 'Roger', 'Rudall', '7/15/1954', '583 Rockefeller Center', 'dDb4ovr', null);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('27440', '52', 'Paxon', 'O''Gready', '9/10/1998', '3 Crowley Court', 'wwAUu5rle', 5);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('88', '4', 'Carrissa', 'Addenbrooke', '2/14/1945', '71 Warrior Way', 'EfhBbLAKJ2Kh', 4);
insert into Reviewer (buyerID, itemID, firstName, lastName, bDate, address, password, reviews) values ('9910', '4367', 'Philip', 'Rubroe', '8/19/1951', '65 Oak Lane', 'ore8MJwTOp9t', 5);

insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('09280', 'Licha', 'Ankers', '11/9/1944', '8 Sheridan Place', 'LOLjlICa4');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('34', 'Lucas', 'Winsper', '5/20/1959', '9476 Oneill Street', 'rRCz8s9G311D');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('44851', 'Carie', 'Havercroft', '1/13/2015', '83794 Ramsey Crossing', 'EpCmZVjRIk');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('694', 'Ethyl', 'Merrydew', '5/13/2001', '94 Ludington Parkway', 'gPA3XAuo0');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('6', 'Marco', 'Copner', '6/10/1944', '32942 Bobwhite Park', 'okrZ3iOTlNrI');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('2', 'Jefferey', 'Heintsch', '12/17/1954', '84 Red Cloud Lane', 'xD34wqy');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('1', 'Sianna', 'Creggan', '2/22/1995', '104 La Follette Circle', '2AIxiYY');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('207', 'Aurilia', 'Petrus', '12/15/2001', '4292 Canary Junction', '6jM3UhnY');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('81936', 'Marcille', 'Fairbeard', '7/21/2002', '157 Goodland Parkway', '3p93WRKag8xW');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('078', 'Karalee', 'Swanton', '4/9/2005', '01080 Johnson Park', 'bWM72M3F1jl');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('27', 'Jolynn', 'Guido', '7/12/2010', '3 Porter Plaza', 'FfPplENqP');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('40011', 'Curry', 'Cowitz', '8/19/2007', '969 Hollow Ridge Court', 'o9HezKWGtV2M');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('2116', 'Sarine', 'Laterza', '12/21/1977', '3730 Leroy Point', 'jn4tlA');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('58777', 'Babara', 'Gaffney', '9/21/1942', '6296 Fairview Junction', 'a0SkYBtTZTJ');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('6556', 'Aldric', 'Staneland', '9/21/1993', '7253 Merry Terrace', 'fLghcFCOGCz');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('30351', 'Rosemarie', 'Gain', '5/11/1952', '25913 Randy Crossing', 'VkYNLyhaUE6');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('7714', 'Isaiah', 'Cammock', '7/17/1994', '728 Arrowood Way', 'HQUSX01Bj0');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('9', 'Maxie', 'Wylder', '11/26/1944', '5275 Magdeline Street', 'N8Jqmbn');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('974', 'Aldrich', 'Meeks', '7/5/1977', '08205 Portage Way', 'TimbILiR4M');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('915', 'Rozalin', 'Tongs', '1/7/1972', '348 Clyde Gallagher Park', '1SdulXXql');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('3849', 'Leah', 'Aggus', '1/1/1952', '13 Dennis Terrace', 'LFdi6FSLl');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('834', 'Alaine', 'Scandred', '8/17/1987', '8569 Cordelia Park', 'dkPkwD7');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('6781', 'Wake', 'Clarke-Williams', '2/5/1954', '106 Mallory Center', 'Vc0qd4zxB');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('202', 'Tyne', 'Crofthwaite', '2/10/1993', '426 Red Cloud Hill', 'Xyz4YpNa1rSu');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('1503', 'Mariquilla', 'Carreyette', '7/3/1948', '726 Pine View Street', '4ld82pku');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('3321', 'Ive', 'Wealleans', '3/10/1950', '01 Kenwood Place', 'nKGpwu');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('122', 'Rikki', 'Gibling', '7/27/1971', '19 Green Parkway', '0nrg8PMosImD');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('74', 'Hyacinthe', 'Juppe', '11/2/2021', '5085 Roxbury Circle', 'ZDgdWugvK1TD');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('3', 'Waldo', 'Yanshin', '6/25/1991', '89905 Washington Center', 'aSERuA');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('30', 'Fredrick', 'Ricciardiello', '1/28/2018', '93710 Lawn Center', 'lyuCeiy');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('7023', 'Augustine', 'Cruickshank', '3/27/2021', '47 Towne Parkway', 'Q0hEtxVo');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('670', 'Randell', 'Kynaston', '11/18/1958', '5 Almo Crossing', 'Pl1R7OM');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('3319', 'Sela', 'Holttom', '7/2/2019', '38178 Jay Street', 'ANYJMv3DIu');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('053', 'Deonne', 'Pinnijar', '3/24/1983', '636 Oak Crossing', 'G95UJWfK');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('94', 'Cary', 'MacLeod', '1/10/1993', '3 Haas Crossing', 'Tv4zY4kEnU');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('7', 'Revkah', 'Pawfoot', '7/10/1947', '42203 Main Hill', 'k0QfmKs');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('7', 'Marget', 'Vannoort', '8/2/1975', '17 Garrison Junction', '4GrM2V');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('36194', 'Tallou', 'Goodale', '10/3/2012', '81 Valley Edge Place', '53a4q5yl4');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('0', 'Hamish', 'Hogbin', '3/6/1985', '79989 Westend Junction', 'AFTUs9SNtY');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('24181', 'Faustina', 'Lacrouts', '12/3/1947', '156 Bluestem Plaza', 'chjE9Er');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('7', 'Dirk', 'Desvignes', '5/23/1990', '1 Meadow Valley Pass', 'JzQ84HESKD');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('572', 'Robinet', 'Calver', '10/16/1965', '0369 Thierer Drive', 'UVitmvEAMN');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('49', 'Allissa', 'Menchenton', '9/5/1979', '8 Graedel Parkway', 'NkqBVBTg');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('82609', 'Marian', 'Comizzoli', '7/22/1966', '86039 Riverside Park', '82c1OJKs39BB');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('72', 'Edward', 'Norquay', '10/9/1950', '4 Dottie Hill', 'y8zTEUz3xY');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('507', 'Krissy', 'Casey', '9/24/1944', '3 North Center', 'AfzPjJQm9OyU');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('7341', 'Cristabel', 'Percifer', '6/4/1949', '251 Scott Place', '9MQQoFRywRl');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('77', 'Eliot', 'West', '2/10/2002', '600 Weeping Birch Alley', 'AoExNFNf');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('9', 'Kate', 'Babalola', '7/31/1960', '37 Corscot Alley', 'zEsU6m57jh');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('90', 'Elana', 'Sheldrick', '6/22/1977', '1 Stuart Park', 'QVHnNLkTm5');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('08', 'Katinka', 'Lancastle', '10/5/1972', '3698 Kingsford Pass', 'YMxOOgmDDH');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('861', 'Sloan', 'Goldsworthy', '11/4/1968', '620 Hayes Drive', 'PZdFbjSQ');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('8163', 'See', 'Annets', '11/1/1991', '953 Orin Place', 'VbLzMdPL7');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('000', 'Branden', 'Cregg', '12/25/1992', '19054 Del Mar Hill', '1AHTZhG');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('33', 'Gary', 'Warder', '1/1/2007', '184 Gina Street', 'q6J32l2');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('4', 'Francesca', 'Caldaro', '10/16/1988', '73 Declaration Pass', '1BCOhDatkM');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('41', 'Joachim', 'Cordingly', '4/29/1942', '55 Clarendon Street', 'hFICpGFc');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('2', 'Cull', 'Newarte', '12/7/1998', '888 Dexter Alley', 'lrTkHZqz');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('52', 'Lynn', 'Pedder', '12/16/1988', '79323 Chinook Trail', 'ZD3iNg');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('7031', 'Nadia', 'McGraw', '2/3/1979', '52 Bashford Street', '7FPwl0n');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('1', 'Gordy', 'Jozsa', '1/9/1986', '5703 Iowa Avenue', 'Y0fAwnInKbHN');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('63867', 'Avram', 'Moseby', '2/21/1993', '04492 Crownhardt Place', 'zTJ5vEJLH4V');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('7179', 'Napoleon', 'Baudinet', '3/17/1971', '909 Jackson Plaza', 'U73ofzZZ');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('1764', 'Albertina', 'Bowering', '1/14/1971', '43 Clyde Gallagher Pass', 'IEqYozcZhNm');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('261', 'Neddy', 'Bassindale', '8/17/1995', '1 Prentice Road', 'IRkLnU');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('9963', 'Wyatt', 'Dawltrey', '4/5/2022', '323 Merchant Point', 'C2nrAkKk');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('92121', 'Freddie', 'Runacres', '4/18/1948', '18897 Trailsway Street', 'YeRiZY');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('69', 'Davidde', 'Ben', '2/20/1986', '03458 Sutherland Hill', 'TBaJJUrTnrX0');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('3', 'Devonna', 'Jeroch', '6/3/1999', '0 Macpherson Point', 'KgNRyjQ0r76');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('39', 'Alexi', 'Elintune', '8/26/1998', '42121 Burning Wood Avenue', 'Q1YTSY0VgPvg');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('8505', 'Jon', 'Attoe', '7/27/2006', '573 Cambridge Plaza', 'j5xRRPK2xBg');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('3565', 'Selma', 'Halwood', '3/25/2008', '3558 Bultman Center', 'DgQEmnVO9lH');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('632', 'Maury', 'Redhills', '2/22/1986', '24 Sherman Lane', '6e0Nj5MGYwg');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('06', 'Geoff', 'Epgrave', '8/12/1974', '22 Leroy Circle', 'ZZH90i5i8X');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('42', 'Gratiana', 'Griffoen', '1/5/1943', '82516 Dayton Crossing', 'YUZj8gv');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('65642', 'Corrie', 'McClory', '1/15/1944', '13516 Dayton Pass', '11lsPYjc5SeQ');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('620', 'Calley', 'Towns', '4/6/1972', '6 Fallview Lane', 'F64svpRL');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('42', 'Christian', 'MacQuaker', '1/7/1992', '4581 Hoffman Center', 'CA9bzDgRNDR6');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('1401', 'Myles', 'Courteney', '2/17/1949', '0914 Namekagon Drive', 'R9fjpDSoEl48');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('46', 'Gibb', 'Bonus', '7/6/2020', '76755 Calypso Drive', 'HueTo35Ht9pm');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('78942', 'Fayette', 'Dear', '7/30/1944', '13952 Hanson Street', 'S6U0MJ');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('52', 'Chancey', 'Cicconettii', '3/2/1949', '86381 Lunder Terrace', 'ri7OjnAIc1Pb');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('53', 'Gael', 'Dowsey', '3/5/1993', '17490 Forest Way', 'CVWMts');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('386', 'Joy', 'Dudeney', '7/14/1990', '02303 School Avenue', '6dnNOoNTpk');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('15', 'Karlotte', 'Meadowcroft', '7/3/1952', '2 Corry Trail', 'PrDQcyJQYsI0');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('0', 'Flor', 'Kamien', '2/21/1944', '37068 Annamark Point', '1FDO4C');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('523', 'Esma', 'Rickson', '6/10/1947', '5 Talmadge Hill', 'FmwQFXzZiwe3');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('5068', 'Giordano', 'Tassell', '9/1/2001', '24 Northport Alley', 'RZLvCPHm');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('7', 'Carroll', 'Karpeev', '12/30/1946', '0232 Darwin Street', 'lXuNKhscL');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('7', 'Drud', 'Iacomo', '8/16/1994', '18400 Transport Way', 'UjHbTYK');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('4', 'Adlai', 'Curtois', '3/15/1947', '21609 Randy Court', 'n2g4gWwEtfvk');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('82730', 'Ailey', 'Debenham', '11/26/1958', '15649 Shelley Alley', 'TXYOodFB');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('67', 'Horace', 'Monard', '3/22/1998', '55864 Acker Crossing', 'ZmE3jasFGi');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('975', 'Reinhold', 'Duxbarry', '5/5/1993', '14 Colorado Road', 'BKB1BWmAh');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('1803', 'Lenora', 'Synke', '7/8/1997', '260 Truax Drive', 'TADOKp6zc');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('7367', 'Bink', 'Gerant', '5/19/2004', '2 Blaine Avenue', 'rbuDJEv5NAg');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('00758', 'Allissa', 'Frotton', '4/7/2018', '2034 Everett Terrace', 'HJq3siOSB3uG');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('75037', 'Hillary', 'Knapton', '11/17/2022', '06073 Main Alley', 'KroCaXf');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('79198', 'Dorothy', 'MacCaughan', '10/7/2018', '1520 Roxbury Pass', 'QWcqmhPAQek');
insert into Buyer (buyerID, firstName, lastName, bDate, address, password) values ('317', 'Vinny', 'O''Mahoney', '9/11/1977', '62067 Hollow Ridge Point', 'O4D8CGyk');

insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('3649', '5', '7948', 'Optima', '10/11/2022', '10/14/2022', 'Health', 600.84, 'M', 382);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('88', '8184', '301', 'Grand Cherokee', '3/7/2022', '7/16/2022', 'Kids', 313.26, 'S', 386);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('46679', '27552', '8281', 'Blazer', '12/15/2021', '1/9/2022', 'Beauty', 684.29, 'L', 327);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('26', '82', '95827', 'Grand Prix', '7/25/2022', '6/1/2022', 'Electronics', 706.12, '3XL', 73);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('6', '8', '9', 'V70', '6/1/2022', '11/10/2022', 'Games', 613.5, '3XL', 270);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('855', '849', '26297', 'S70', '7/18/2022', '4/13/2022', 'Computers', 693.91, 'XL', 124);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('42', '3', '641', 'Suburban 2500', '6/18/2022', '5/2/2022', 'Kids', 314.01, '3XL', 302);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('379', '0019', '55', 'DeVille', '10/2/2022', '2/3/2022', 'Toys', 115.97, '3XL', 187);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('57938', '6152', '77112', 'Gallardo', '11/28/2021', '2/3/2022', 'Tools', 144.32, 'L', 495);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('550', '938', '394', 'A6', '9/8/2022', '8/14/2022', 'Grocery', 734.26, 'XL', 7);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('54', '8168', '70', 'XK Series', '2/14/2022', '8/24/2022', 'Garden', 809.9, 'XL', 274);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('51', '16', '096', 'Eclipse', '12/4/2021', '6/18/2022', 'Sports', 429.07, 'L', 10);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('21409', '1658', '7855', 'Cherokee', '12/1/2021', '7/13/2022', 'Games', 268.95, 'L', 306);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('008', '08212', '79', 'MDX', '10/20/2022', '11/10/2022', 'Home', 46.01, 'L', 152);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('45', '46', '6', 'Milan', '10/20/2022', '1/11/2022', 'Shoes', 642.51, '2XL', 219);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('665', '8', '7', 'Allroad', '4/13/2022', '5/9/2022', 'Toys', 64.88, '3XL', 13);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('5826', '922', '3675', 'DB9 Volante', '9/15/2022', '4/5/2022', 'Kids', 405.78, 'S', 467);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('12', '2782', '16', 'SL-Class', '9/20/2022', '11/21/2022', 'Movies', 350.65, 'XS', 107);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('9464', '5184', '58', 'Riviera', '1/12/2022', '1/13/2022', 'Clothing', 420.24, 'L', 65);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('90', '12', '3', 'Intrepid', '3/30/2022', '11/5/2022', 'Industrial', 384.1, '3XL', 335);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('360', '733', '4297', 'Frontier', '9/11/2022', '4/24/2022', 'Electronics', 498.03, 'M', 247);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('93665', '78', '847', 'DeVille', '1/4/2022', '8/19/2022', 'Shoes', 792.49, 'S', 201);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('61', '283', '28', 'Sequoia', '11/11/2022', '2/9/2022', 'Industrial', 328.91, 'L', 263);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('08', '327', '1914', 'GranSport', '10/25/2022', '1/21/2022', 'Garden', 312.64, '2XL', 349);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('949', '5894', '378', '650', '12/10/2021', '3/11/2022', 'Baby', 166.35, 'XS', 148);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('6', '55048', '8722', 'Econoline E250', '10/31/2022', '11/17/2022', 'Sports', 339.58, '2XL', 270);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('88244', '358', '210', 'Samurai', '10/30/2022', '4/29/2022', 'Clothing', 783.18, 'S', 58);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('462', '3', '92', 'Fortwo', '4/22/2022', '3/30/2022', 'Computers', 996.41, 'S', 160);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('7936', '7770', '249', 'Corolla', '10/11/2022', '12/30/2021', 'Electronics', 917.74, 'S', 116);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('2672', '22', '48400', 'Elantra', '9/2/2022', '6/19/2022', 'Tools', 606.4, '3XL', 94);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('8', '74958', '56', 'Bonneville', '11/2/2022', '5/23/2022', 'Tools', 966.12, 'L', 106);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('6016', '045', '50', 'Golf', '5/2/2022', '10/16/2022', 'Movies', 525.84, '2XL', 46);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('62026', '1601', '6', 'R-Class', '10/27/2022', '1/12/2022', 'Toys', 378.9, 'M', 294);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('488', '35', '82', 'X5', '8/31/2022', '2/4/2022', 'Beauty', 672.78, 'XL', 404);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('53819', '59410', '66', 'S4', '4/1/2022', '7/4/2022', 'Home', 842.75, 'L', 320);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('341', '83', '995', 'E-Class', '1/11/2022', '3/18/2022', 'Electronics', 925.42, 'L', 190);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('42', '82', '122', 'Xterra', '6/4/2022', '10/11/2022', 'Automotive', 723.91, 'M', 76);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('53', '402', '3527', 'Savana 1500', '12/4/2021', '6/10/2022', 'Electronics', 26.48, 'L', 461);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('97839', '84027', '355', 'XC90', '3/2/2022', '6/29/2022', 'Garden', 427.53, 'XL', 114);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('674', '7043', '96139', 'QX', '5/30/2022', '8/4/2022', 'Beauty', 360.99, 'M', 480);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('0139', '4', '1459', 'Skylark', '10/20/2022', '11/14/2022', 'Books', 630.97, 'S', 292);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('21673', '4', '8992', 'QX', '6/16/2022', '10/14/2022', 'Industrial', 924.39, 'XL', 65);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('77222', '47050', '4', 'VUE', '1/27/2022', '12/25/2021', 'Movies', 902.13, '2XL', 109);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('79', '0', '56', 'Vitara', '7/31/2022', '8/19/2022', 'Beauty', 379.52, 'M', 427);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('140', '4', '78', 'Q', '8/6/2022', '2/1/2022', 'Music', 404.59, '3XL', 381);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('899', '55', '995', 'Safari', '8/4/2022', '10/16/2022', 'Sports', 599.49, 'L', 137);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('84875', '0', '2377', 'Club Wagon', '6/18/2022', '10/10/2022', 'Outdoors', 728.24, '3XL', 262);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('4', '760', '86', 'Escape', '9/9/2022', '1/3/2022', 'Health', 579.03, '3XL', 116);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('4653', '8', '3234', 'Yukon XL 1500', '4/5/2022', '4/27/2022', 'Baby', 847.17, 'XS', 4);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('26902', '0', '5', 'Fusion', '11/3/2022', '4/18/2022', 'Industrial', 307.61, '3XL', 213);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('9242', '42082', '865', 'LHS', '12/4/2021', '3/24/2022', 'Tools', 448.46, '3XL', 378);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('2606', '3765', '01245', 'TL', '5/14/2022', '11/20/2022', 'Outdoors', 881.65, 'M', 340);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('41362', '6', '8', 'Yaris', '3/8/2022', '3/16/2022', 'Beauty', 112.82, 'XL', 53);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('32', '12', '73', 'B-Series', '5/4/2022', '1/9/2022', 'Movies', 438.93, 'XL', 260);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('05585', '9671', '61', 'LS', '6/22/2022', '1/22/2022', 'Industrial', 781.9, '3XL', 441);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('34', '5', '22', 'Viper', '6/29/2022', '10/13/2022', 'Clothing', 469.3, 'S', 160);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('726', '152', '8852', 'Prowler', '10/1/2022', '6/29/2022', 'Automotive', 413.18, 'M', 191);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('528', '345', '9', 'Esprit', '1/7/2022', '11/19/2022', 'Home', 277.2, '2XL', 2);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('124', '691', '11604', '2500', '9/1/2022', '11/22/2022', 'Tools', 689.33, 'XS', 13);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('09417', '1128', '2', '9-3', '11/30/2021', '9/2/2022', 'Movies', 441.53, 'M', 145);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('78', '605', '09', 'Cayenne', '9/21/2022', '3/25/2022', 'Books', 685.2, 'M', 379);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('09485', '0840', '0660', '900', '1/3/2022', '7/17/2022', 'Garden', 201.14, '3XL', 493);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('40714', '2', '98', 'Fortwo', '7/3/2022', '7/30/2022', 'Books', 227.11, 'L', 193);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('8', '7', '82', 'DTS', '1/19/2022', '5/14/2022', 'Outdoors', 482.33, '2XL', 205);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('509', '1', '8', 'M', '6/25/2022', '6/10/2022', 'Baby', 690.03, 'L', 414);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('811', '34193', '1056', 'xB', '5/22/2022', '8/5/2022', 'Garden', 326.93, 'XL', 248);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('2610', '581', '18513', 'Blazer', '10/9/2022', '7/26/2022', 'Garden', 23.08, 'S', 68);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('69098', '8402', '0791', 'Sonata', '1/12/2022', '2/13/2022', 'Books', 982.05, '3XL', 228);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('2', '0762', '2689', 'Camaro', '6/23/2022', '2/4/2022', 'Clothing', 181.22, 'XS', 74);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('46', '95', '42967', 'Forenza', '3/10/2022', '5/15/2022', 'Grocery', 749.02, 'L', 176);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('5', '9739', '5', 'MPV', '1/16/2022', '3/3/2022', 'Sports', 112.38, 'L', 21);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('0', '82', '511', 'NV1500', '12/9/2021', '4/11/2022', 'Movies', 932.54, 'L', 259);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('524', '7', '88', 'Phantom', '2/16/2022', '12/16/2021', 'Automotive', 199.04, 'S', 442);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('76095', '1', '625', 'Countryman', '4/20/2022', '10/25/2022', 'Outdoors', 786.61, '3XL', 320);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('2', '3374', '3', '5000S', '4/18/2022', '9/25/2022', 'Games', 462.59, 'S', 492);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('3108', '7961', '15992', 'JX', '5/12/2022', '11/8/2022', 'Music', 477.62, '3XL', 469);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('872', '017', '36', 'Sonata', '8/1/2022', '11/12/2022', 'Jewelry', 930.01, 'XS', 77);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('5', '93', '886', 'S-Series', '12/2/2021', '10/2/2022', 'Games', 52.89, '2XL', 493);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('261', '1120', '302', 'GTO', '2/20/2022', '10/4/2022', 'Outdoors', 223.2, '2XL', 438);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('4', '07', '7935', 'Brat', '6/12/2022', '12/21/2021', 'Movies', 483.03, 'M', 95);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('0264', '1', '30021', 'Grand Vitara', '3/13/2022', '11/2/2022', 'Computers', 163.5, 'XS', 446);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('5', '02', '27', 'Rio', '8/6/2022', '12/11/2021', 'Electronics', 669.21, '3XL', 175);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('7', '1739', '24675', 'SL65 AMG', '10/18/2022', '3/12/2022', 'Sports', 112.94, '3XL', 442);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('12865', '6599', '22629', 'Malibu', '6/13/2022', '12/23/2021', 'Sports', 170.03, 'L', 466);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('90', '24', '34268', 'Mustang', '12/23/2021', '7/19/2022', 'Movies', 99.31, 'M', 105);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('9', '3076', '6951', '300', '2/25/2022', '1/23/2022', 'Computers', 792.43, 'XL', 438);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('5689', '465', '0', 'LeSabre', '11/29/2021', '9/28/2022', 'Health', 623.35, 'XL', 254);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('0', '58427', '70545', 'Sable', '7/4/2022', '1/11/2022', 'Industrial', 475.94, 'XS', 38);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('7800', '749', '0', 'Yaris', '3/2/2022', '7/21/2022', 'Computers', 940.17, 'L', 213);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('63872', '99', '92194', 'RX', '7/17/2022', '6/18/2022', 'Movies', 867.21, 'XL', 267);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('9060', '30', '0795', 'Riviera', '1/31/2022', '11/18/2022', 'Kids', 309.22, 'L', 241);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('241', '29407', '244', 'Viper RT/10', '2/6/2022', '4/11/2022', 'Home', 288.99, 'L', 328);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('5431', '45', '4', 'Patriot', '1/3/2022', '4/15/2022', 'Health', 994.86, 'XS', 437);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('06', '68', '702', 'Frontier', '6/20/2022', '6/18/2022', 'Grocery', 384.66, 'M', 267);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('0', '134', '66548', 'Concorde', '10/19/2022', '8/30/2022', 'Home', 832.12, 'XL', 220);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('5', '73', '79146', 'Monte Carlo', '2/9/2022', '7/11/2022', 'Shoes', 798.59, '2XL', 352);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('8', '6', '8488', 'Ram 3500', '3/24/2022', '8/16/2022', 'Games', 664.65, '2XL', 437);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('16639', '63283', '2263', 'Pajero', '8/15/2022', '12/31/2021', 'Health', 72.29, 'XS', 1);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('27', '7', '82', 'Grand Cherokee', '10/5/2022', '3/29/2022', 'Outdoors', 821.8, 'XL', 462);
insert into Clothes (sellerID, clientID, itemID, name, listDate, sellDate, category, price, size, quantity) values ('02', '23327', '53268', 'Avalon', '1/24/2022', '10/8/2022', 'Tools', 987.04, 'L', 147);