DROP DATABASE IF EXISTS dbstore;
CREATE DATABASE dbstore;

USE dbstore;

CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `img_url` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- dbstore.services definition

CREATE TABLE `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `price` double NOT NULL,
  `delay` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- dbstore.users definition

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` text NOT NULL,
  `last_name` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `telephone` text NULL,
  `address` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- dbstore.products definition

CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `stock` int(11) NOT NULL,
  `price` double NOT NULL,
  `promo` double NOT NULL,
  `description` longtext NOT NULL,
  `spec_1` text NOT NULL,
  `spec_2` text NOT NULL,
  `spec_3` text NOT NULL,
  `spec_4` text NOT NULL,
  `spec_5` text NOT NULL,
  `img_url` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_FK` (`category_id`),
  CONSTRAINT `products_FK` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- dbstore.orders definition

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_date` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_FK` (`user_id`),
  CONSTRAINT `orders_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- dbstore.order_list definition

CREATE TABLE `order_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,  
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_list_FK` (`prod_id`),
  KEY `order_list_FK_1` (`order_id`),
  CONSTRAINT `order_list_FK` FOREIGN KEY (`prod_id`) REFERENCES `products` (`id`),
  CONSTRAINT `order_list_FK_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

USE dbstore;
DELETE FROM products;

/* INSERT PRODUCT CATEGORIES */

INSERT INTO dbstore.categories(description, img_url) VALUES('Processors', 'intel_150.png');
INSERT INTO dbstore.categories(description, img_url) VALUES('Motherboards', 'gigabyte_150.png');
INSERT INTO dbstore.categories(description, img_url) VALUES('Memory/RAM', 'crucial_150.png');
INSERT INTO dbstore.categories(description, img_url) VALUES('Video Cards', 'asus_rtx_150.png');
INSERT INTO dbstore.categories(description, img_url) VALUES('Solid State Drives', 'intel_ssd_150.png');
INSERT INTO dbstore.categories(description, img_url) VALUES('Power Supplies', 'psu_150.png');
INSERT INTO dbstore.categories(description, img_url) VALUES('Hard Drives', 'hdd_150.png');
INSERT INTO dbstore.categories(description, img_url) VALUES('Computer Cases', 'case_150.png');
INSERT INTO dbstore.categories(description, img_url) VALUES('Apple Products', 'imac_150.png');
INSERT INTO dbstore.categories(description, img_url) VALUES('Cables', 'network_cable_150.png');
INSERT INTO dbstore.categories(description, img_url) VALUES('Servers', 'server_150.png');
INSERT INTO dbstore.categories(description, img_url) VALUES('Cooling', 'cpu_cooler_150.png');

/* SERVICES INSERT */

INSERT INTO dbstore.services(name, price, delay) VALUES('OS REINSTALLATION + DATA BACKUP', '149.99', '48 hours');
INSERT INTO dbstore.services(name, price, delay) VALUES('OS REINSTALLATION', '79.99', '24 hours');
INSERT INTO dbstore.services(name, price, delay) VALUES('DATA BACKUP', '79.99', '24 hours');
INSERT INTO dbstore.services(name, price, delay) VALUES('VIRUS AND MALWARE CLEANUP', '59.99', '48 hours');
INSERT INTO dbstore.services(name, price, delay) VALUES('SOFTWARE INSTALLATION', '49.99', '4 hours');
INSERT INTO dbstore.services(name, price, delay) VALUES('HARDWARE INSTALLATION', '49.99', '6 hours');
INSERT INTO dbstore.services(name, price, delay) VALUES('COMPLETE COMPUTER ASSEMBLING', '89.99', '12 hours');

/* INSERT PRODUCTS */

/* DUMMY REQUEST
INSERT INTO dbstore.products(category_id, name, stock, price, promo, description, spec_1, spec_2, spec_3, spec_4, spec_5, img_url) VALUES(0, '', 0, 0.0, 0.0, '', '', '', '', '', '', '/category/image.png');
*/

/* Processors */
INSERT INTO dbstore.products(category_id, name, stock, price, promo, description, spec_1, spec_2, spec_3, spec_4, spec_5, img_url) VALUES(1, 'Intel Core i7-9700k', 100, 589.99, 0.25, 'Coffee Lake 8-Core 3.6 GHz (4.9 GHz Turbo) LGA 1151 (300 Series) 95W BX80684I79700K Desktop Processor Intel UHD Graphics 630', '9th Gen Intel Processor', 'Intel UHD Graphics 630', 'Only Compatible with Intel 300 Series Motherboard', 'Socket LGA 1151 (300 Series)', 'DDR4 Support', '/cpu/9700k.png');

/* Motherboards */
INSERT INTO dbstore.products(category_id, name, stock, price, promo, description, spec_1, spec_2, spec_3, spec_4, spec_5, img_url) VALUES(2, 'GIGABYTE Z490 AORUS ELITE', 100, 309.99, 0.10, 'GIGABYTE Z490 AORUS ELITE AC LGA 1200 Intel Z490 ATX Motherboard with Dual M.2, SATA 6Gb/s, USB 3.2 Gen 2, Intel 802.11ac', 'Supports 10th Gen Intel Core Series Processors', 'Dual Channel Non-ECC Unbuffered DDR4, 4 DIMMs', 'Advanced Thermal Design with Optimized Surface Heatsink', 'Realtek 2.5 GbE LAN', 'Intel WiFi 802.11ac and Bluetooth 5 1x1 with AORUS Antenna', '/motherboard/z490_elite.png');

/* Memory */
INSERT INTO dbstore.products(category_id, name, stock, price, promo, description, spec_1, spec_2, spec_3, spec_4, spec_5, img_url) VALUES(3, 'Ballistix Sport LT 8GB', 50, 139.99, 0.0, 'Ballistix Sport LT 8GB 288-Pin DDR4 SDRAM DDR4 2400 (PC4 19200) Desktop Memory Model BLS8G4D240FSE', 'DDR4 2400 (PC4 19200)', 'Timing 16-16-16', 'CAS Latency 16', 'Voltage 1.20V', 'Spec_5', '/ram/ballistix_sport_lt_8.png');

/* Video Cards */
INSERT INTO dbstore.products(category_id, name, stock, price, promo, description, spec_1, spec_2, spec_3, spec_4, spec_5, img_url) VALUES(4, 'ASUS ROG STRIX GeForce RTX 2060', 22, 469.99, 0.05, 'ASUS ROG STRIX GeForce RTX 2060 DirectX 12 ROG-STRIX-RTX2060-O6G-EVO-GAMING 6GB 192-Bit GDDR6 PCI Express 3.0', '6GB 192-Bit GDDR6', 'Core Clock 1365 MHz', 'Boost Clock OC Mode: 1860 MHz', 'Gaming Mode: 1830 MHz', '2 x HDMI 2.0b 2 x DisplayPort 1.4', '/videocard/asus_rog_rtx_2060.png');

/* SSD */
INSERT INTO dbstore.products(category_id, name, stock, price, promo, description, spec_1, spec_2, spec_3, spec_4, spec_5, img_url) VALUES(5, 'WD Blue 3D NAND 1TB Internal SSD', 48, 139.99, 0.0, 'WD Blue 3D NAND 1TB Internal SSD SATA III 6Gb/s 2.5"/7mm Solid State Drive - WDS100T2B0A', 'Capacities up to 4TB with enhanced reliability.', 'An active power draw up to 25% lower than previous generations of WD Blue SSD.', 'Sequential read speeds up to 560 MB/s and sequential write speeds up to 530 MB/s.', 'An industry-leading 1.75M hours mean time to failure (MTTF) and up to 400 terabytes written (TBW) for enhanced reliability.', 'WD F.I.T. Lab certification for compatibility with a wide range of computers.', '/ssd/wd_blue_nand_1tb.png');

/* Power Supplies */
INSERT INTO dbstore.products(category_id, name, stock, price, promo, description, spec_1, spec_2, spec_3, spec_4, spec_5, img_url) VALUES(6, 'CORSAIR VS Series VS650', 14, 189.50, 0.0, 'CORSAIR VS Series, VS650, 650 Watt (650W), Active PFC, 80 PLUS White Certified Power Supply', '80 PLUS efficiency', 'ATX12V v2.31 / EPS 2.92', '100 - 240 V 47 - 63 Hz', '+3.3V@24A, +5V@20A, +12V@52A, -12V@0.3A, +5VSB@3A', 'Black housing, cable sleeves and connectors', '/psu/vs650.png');

/* Hard Drives */
INSERT INTO dbstore.products(category_id, name, stock, price, promo, description, spec_1, spec_2, spec_3, spec_4, spec_5, img_url) VALUES(7, 'WD Black 2TB', 92, 129.99, 0.0, 'WD Black 2TB Performance Desktop Hard Disk Drive - 7200 RPM SATA 6Gb/s 64MB Cache 3.5 Inch - WD2003FZEX', 'Desktop performance hard drive.', 'Designed for creative professionals, gamers and system builders.', 'Performance storage available in up to 6TB capacities.', '2X DRAM cache up to 128MB (6TB only) for faster read operations.', 'Industry-leading 5-year limited warranty.', '/hdd/wd_2tb_black.png');

/* Computer Cases */
INSERT INTO dbstore.products(category_id, name, stock, price, promo, description, spec_1, spec_2, spec_3, spec_4, spec_5, img_url) VALUES(8, 'Fractal Design Meshify C Black', 64, 134.99, 0.0, 'ATX High-Airflow Compact Light Tint Tempered Glass Mid Tower Computer Case, FD-CA-MESH-C-BKO-TGL', 'Lightly tinted tempered glass side panel', 'Streamlined high-airflow design', 'Distinctive new styling with sharp, stealthy aesthetic', 'Newly designed angular mesh front panel maximizes air intake', 'Performance and capacity of a full tower in a compact mid-tower size', '/case/fractal_1.png');

/* Apple Products */
INSERT INTO dbstore.products(category_id, name, stock, price, promo, description, spec_1, spec_2, spec_3, spec_4, spec_5, img_url) VALUES(9, 'Mac Pro "Eight Core" 2.26 MB535LL/A', 37, 99999.99, 0.001, '2x Quad Core Intel Xeon E5520@2.26GHz, 20GB DDR3 RAM, 240GB SDD+1TB HDD, NVIDIA GeForce GT120, 8X DL SuperDrive', 'Xeon 2.26 GHz', '1 TB HDD 240 GB SSD', 'Mac OS X 10.7 Lion', 'No Screen', 'NVIDIA GeForce GT 120', '/apple/mac_pro.png');

/* Cables */
INSERT INTO dbstore.products(category_id, name, stock, price, promo, description, spec_1, spec_2, spec_3, spec_4, spec_5, img_url) VALUES(10, 'Link Depot C6M-50-BKB 50 ft', 369, 19.99, 0.0, 'Link Depot C6M-50-BKB 50 ft. Cat 6 Black 550 MHz Network Cable', 'Black Color', 'Cat 6', '50 ft.', '', '', '/cable/cat6_50.png');

/* Servers */
INSERT INTO dbstore.products(category_id, name, stock, price, promo, description, spec_1, spec_2, spec_3, spec_4, spec_5, img_url) VALUES(11, 'SuperMicro GPU 4029GP-TRT2', 12, 7499.99, 0.2, 'SuperMicro GPU 4029GP-TRT2 DUAL LGA 3647 DDR4 2000W Redundant PSU Server Barebone', 'Artificial Intelligence, Big Data Analytics, Research Lab / National Lab, Astrophysics and Business Intelligence', 'Dual Socket P (LGA 3647) support', '24 x DIMMs; up to 6TB 3DS ECC DDR4-2933 MHz', '11 x PCI-E 3.0 x16 (FH, FL) slots, 1 x PCI-E 3.0 x8 (FH, FL in x16 slot)', '2000W (2+2) Redundant Power Supplies Titanium Level (96%+)', '/server/supermicro_1.png');

/* Coolings */
INSERT INTO dbstore.products(category_id, name, stock, price, promo, description, spec_1, spec_2, spec_3, spec_4, spec_5, img_url) VALUES(12, 'Cooler Master MasterLiquid Lite 120', 57, 85.99, 0.0, 'AIO CPU Liquid Cooler, White Led Pump, FEP Tubing, 120mm Air Balance MF, Dual Dissipation Technology', 'Easy and Reliable', 'Dual Dissipation Pump', 'Robust FEP Tubing', 'Air Balance Fan Design', 'Support latest Intel and AMD socket', '/cooling/coolermaster_1.png');

/* INSERT USERS */
insert into users (first_name, last_name, email, password, telephone, address) values ('Artie', 'Antonescu', 'aantonescu0@ihg.com', 'kAU9eZCt', '397-332-9948', '66 Esch Park');
insert into users (first_name, last_name, email, password, telephone, address) values ('Korney', 'Poplee', 'kpoplee1@webmd.com', 'eupXbos01OU', '609-634-9436', '03 Division Parkway');
insert into users (first_name, last_name, email, password, telephone, address) values ('Ingaberg', 'Kilby', 'ikilby2@freewebs.com', 'R3X7d06', '165-758-5329', '72 Division Pass');
insert into users (first_name, last_name, email, password, telephone, address) values ('Dita', 'Agglio', 'dagglio3@google.cn', 'wmvqu6', '600-265-8048', '9476 Petterle Hill');
insert into users (first_name, last_name, email, password, telephone, address) values ('Rosana', 'O''Lennachain', 'rolennachain4@friendfeed.com', 'O7NALNyoX', '294-363-2883', '0989 Fair Oaks Hill');
insert into users (first_name, last_name, email, password, telephone, address) values ('Allison', 'Pinel', 'apinel5@cdbaby.com', 'o6klh81wL8', '855-548-5272', '76615 Cardinal Alley');
insert into users (first_name, last_name, email, password, telephone, address) values ('Aimee', 'Sissons', 'asissons6@google.com.br', 'U5iTFajL8c', '591-563-5864', '15645 Hanover Parkway');
insert into users (first_name, last_name, email, password, telephone, address) values ('Maury', 'Demsey', 'mdemsey7@howstuffworks.com', 'M5GmoR', '705-174-9281', '048 Hoard Alley');
insert into users (first_name, last_name, email, password, telephone, address) values ('Hanna', 'Michell', 'hmichell8@miitbeian.gov.cn', 'ynNf2v', '419-308-5294', '0 Lake View Court');
insert into users (first_name, last_name, email, password, telephone, address) values ('Daisy', 'Kettlestringes', 'dkettlestringes9@va.gov', 'vpbryx5f', '135-735-9173', '9627 Transport Lane');
insert into users (first_name, last_name, email, password, telephone, address) values ('Renate', 'Corroyer', 'rcorroyera@sohu.com', '8TdK0RI', '996-795-9969', '20709 Merchant Lane');
insert into users (first_name, last_name, email, password, telephone, address) values ('Neale', 'Guthrie', 'nguthrieb@webeden.co.uk', 'DmQujjrTr', '603-998-6827', '358 Duke Center');
insert into users (first_name, last_name, email, password, telephone, address) values ('Tristan', 'Pearch', 'tpearchc@elpais.com', 'GrqhBD', '235-206-5052', '28681 Grasskamp Crossing');
insert into users (first_name, last_name, email, password, telephone, address) values ('Xerxes', 'Tripon', 'xtripond@patch.com', '8Qeuwer8TdA', '291-423-2840', '55989 Oneill Drive');
insert into users (first_name, last_name, email, password, telephone, address) values ('Rora', 'Chagg', 'rchagge@prweb.com', '8R3T2n', '195-428-6330', '7 Susan Drive');
insert into users (first_name, last_name, email, password, telephone, address) values ('Sandy', 'Hegel', 'shegelf@archive.org', 'oee2h1fJmfPv', '630-553-7764', '6 Anzinger Court');
insert into users (first_name, last_name, email, password, telephone, address) values ('Jeana', 'Grimsdyke', 'jgrimsdykeg@wunderground.com', 'yhGotR3ja', '872-800-7744', '15 Stang Circle');
insert into users (first_name, last_name, email, password, telephone, address) values ('Marc', 'Shelbourne', 'mshelbourneh@wikipedia.org', '746kIjiBQ', '584-737-4631', '82957 Doe Crossing Avenue');
insert into users (first_name, last_name, email, password, telephone, address) values ('Amalia', 'Boothroyd', 'aboothroydi@meetup.com', 'ZK0beNK', '739-362-2486', '8755 Northwestern Plaza');
insert into users (first_name, last_name, email, password, telephone, address) values ('Tallulah', 'Pruvost', 'tpruvostj@howstuffworks.com', 'QXzEjzLv5g1l', '411-421-7840', '19447 Northview Circle');
insert into users (first_name, last_name, email, password, telephone, address) values ('Tome', 'Warbeys', 'twarbeysk@sciencedirect.com', 'GZKRZ2la', '248-138-3715', '59 Sherman Alley');
insert into users (first_name, last_name, email, password, telephone, address) values ('Joana', 'Offill', 'joffilll@123-reg.co.uk', 'Ttr9NoWTqPO5', '267-881-3001', '434 Quincy Pass');
insert into users (first_name, last_name, email, password, telephone, address) values ('Cleopatra', 'Shakesby', 'cshakesbym@mit.edu', 'ltS8kl7b', '570-174-2596', '2608 Little Fleur Center');
insert into users (first_name, last_name, email, password, telephone, address) values ('Nickola', 'Comben', 'ncombenn@t-online.de', 'XcNmn8', '686-202-2514', '4192 Bobwhite Lane');
insert into users (first_name, last_name, email, password, telephone, address) values ('Zaneta', 'Sharpling', 'zsharplingo@bloomberg.com', 'FGkLY144j9', '168-461-1667', '058 Blackbird Hill');
insert into users (first_name, last_name, email, password, telephone, address) values ('Sigismondo', 'Birley', 'sbirleyp@cpanel.net', 'epKLkN', '180-726-2648', '046 Mcbride Point');
insert into users (first_name, last_name, email, password, telephone, address) values ('Nessy', 'Gribbell', 'ngribbellq@noaa.gov', 'wHtRdcXmvmCw', '480-282-9834', '85873 Comanche Park');
insert into users (first_name, last_name, email, password, telephone, address) values ('Masha', 'Rumble', 'mrumbler@fastcompany.com', 'xkVwpw', '438-728-5174', '13937 Lukken Avenue');
insert into users (first_name, last_name, email, password, telephone, address) values ('Ophelia', 'Belloch', 'obellochs@tumblr.com', 'q5eRNg', '729-175-4955', '6674 Valley Edge Street');
insert into users (first_name, last_name, email, password, telephone, address) values ('Gerianne', 'Odgaard', 'godgaardt@fema.gov', 'nrWGZ6DG592', '957-805-0909', '11 Summit Circle');
insert into users (first_name, last_name, email, password, telephone, address) values ('Halsey', 'Dunk', 'hdunku@ucoz.com', 'eLAogdY', '156-366-7882', '5360 Debs Trail');
insert into users (first_name, last_name, email, password, telephone, address) values ('Lian', 'Breissan', 'lbreissanv@cpanel.net', 'dsCaZzHS', '580-782-7796', '06840 Mccormick Circle');
insert into users (first_name, last_name, email, password, telephone, address) values ('Stormie', 'Hutchins', 'shutchinsw@e-recht24.de', '3aNX75p', '916-873-7688', '74824 Buell Place');
insert into users (first_name, last_name, email, password, telephone, address) values ('Arlie', 'Busfield', 'abusfieldx@mysql.com', '9JMBCK', '989-703-4978', '21 Lerdahl Street');
insert into users (first_name, last_name, email, password, telephone, address) values ('Monroe', 'Dyka', 'mdykay@microsoft.com', 'dcudhX', '823-228-9359', '9428 Esch Road');
insert into users (first_name, last_name, email, password, telephone, address) values ('Lilllie', 'Simmings', 'lsimmingsz@webs.com', 'AAPQiMJb', '117-979-8633', '0 Morning Parkway');
insert into users (first_name, last_name, email, password, telephone, address) values ('Chauncey', 'Tytler', 'ctytler10@dion.ne.jp', 'u85piiEuVv4', '738-699-2185', '8 Shasta Park');
insert into users (first_name, last_name, email, password, telephone, address) values ('Darrin', 'Messiter', 'dmessiter11@prweb.com', 'kkyjNPN', '958-341-4212', '8 Coolidge Plaza');
insert into users (first_name, last_name, email, password, telephone, address) values ('Bryce', 'Piris', 'bpiris12@ovh.net', 'Xcv9qI8A', '145-219-6147', '899 Loeprich Court');
insert into users (first_name, last_name, email, password, telephone, address) values ('Arnuad', 'Harriss', 'aharriss13@woothemes.com', 'P7JfHXZxhSz', '140-876-7139', '90727 Drewry Avenue');
insert into users (first_name, last_name, email, password, telephone, address) values ('Lavinia', 'Sumpter', 'lsumpter14@cbslocal.com', 'rkOlB2WlE3kP', '849-896-3208', '0660 Loftsgordon Road');
insert into users (first_name, last_name, email, password, telephone, address) values ('Kamillah', 'Stivey', 'kstivey15@mac.com', 'EcbO2GhgHRWo', '876-932-4418', '3 Bay Road');
insert into users (first_name, last_name, email, password, telephone, address) values ('Cherise', 'McHugh', 'cmchugh16@sun.com', 'KU697YrCsJ', '396-837-9453', '73019 Basil Trail');
insert into users (first_name, last_name, email, password, telephone, address) values ('Bram', 'Overstreet', 'boverstreet17@hatena.ne.jp', 'uUAXcf', '570-172-8403', '59735 Petterle Junction');
insert into users (first_name, last_name, email, password, telephone, address) values ('Larry', 'Odda', 'lodda18@phoca.cz', '9pFYAWtFw', '207-917-3555', '884 Buena Vista Point');
insert into users (first_name, last_name, email, password, telephone, address) values ('Magdaia', 'Fallis', 'mfallis19@kickstarter.com', 'xsindx', '141-193-0251', '39538 Haas Terrace');
insert into users (first_name, last_name, email, password, telephone, address) values ('Felisha', 'Buyers', 'fbuyers1a@paginegialle.it', 'bvVedrh', '662-792-3626', '787 Golden Leaf Pass');
insert into users (first_name, last_name, email, password, telephone, address) values ('Debra', 'Beauman', 'dbeauman1b@house.gov', 'LgJ5Y6RP9g', '696-392-3892', '94 Fordem Junction');
insert into users (first_name, last_name, email, password, telephone, address) values ('Harley', 'Walch', 'hwalch1c@geocities.jp', 'o1riH2x', '375-379-3387', '7273 Dwight Plaza');
insert into users (first_name, last_name, email, password, telephone, address) values ('Missy', 'Dictus', 'mdictus1d@google.com.au', 'pGhKaJEC80BH', '893-605-4360', '53710 Briar Crest Terrace');