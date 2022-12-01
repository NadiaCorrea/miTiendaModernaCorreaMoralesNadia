
-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: mysqlDawes:3306
-- Tiempo de generación: 09-11-2022 a las 07:18:53
-- Versión del servidor: 5.7.22
-- Versión de PHP: 8.0.19

CREATE DATABASE MedicamentosJvh;
USE MedicamentosJvh;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `MedicamentosJvh`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Category`
--

CREATE TABLE `Category` (
  `id` int(11) NOT NULL,
  `name` varchar(150) CHARACTER SET utf8 NOT NULL,
  `description` varchar(150) CHARACTER SET utf8 NOT NULL,
  
  CONSTRAINT pk_c PRIMARY KEY (id)
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO Category (id,name,description) VALUES (1,'GEMCITABINE HYDROCHLORIDE','dapibus dolor');
INSERT INTO Category (id,name,description) VALUES (2,'NICOTINE','neque');
INSERT INTO Category (id,name,description) VALUES (3,'Day-Time Night-Time','nec molestie sed');
INSERT INTO Category (id,name,description) VALUES (4,'Aspergillus repens','non');
INSERT INTO Category (id,name,description) VALUES (5,'Alert','est phasellus sit');
INSERT INTO Category (id,name,description) VALUES (6,'Good Sense Sleep Time','ipsum primis in');
INSERT INTO Category (id,name,description) VALUES (7,'SHISEIDO ADVANCED HYDRO-LIQUID COMPACT (REFILL)','ut volutpat');
INSERT INTO Category (id,name,description) VALUES (8,'metoprolol succinate','vitae quam');
INSERT INTO Category (id,name,description) VALUES (9,'esika MEN Control Fresh Deodorant and Antiperspirant','pulvinar lobortis est');
INSERT INTO Category (id,name,description) VALUES (10,'Golfers Skin Broad Spectrum SPF 30 Plus Sunscreen','platea dictumst etiam');

--
-- Volcado de datos para la tabla `Category`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Medicine`
--

CREATE TABLE `Medicine` (
  `id` int(11) NOT NULL,
  `name` varchar(150) CHARACTER SET utf8 NOT NULL UNIQUE,
  `description` varchar(150) CHARACTER SET utf8 NOT NULL,
  `price` double NOT NULL,
  `Category` int(11) NOT NULL,
  `img` longblob,
  `stock` int(11) DEFAULT 50,
  
  CONSTRAINT pk_m PRIMARY KEY (id),
    CONSTRAINT fk_c FOREIGN KEY (Category) REFERENCES Category(id)
    
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Medicine`
INSERT INTO `Medicine` (`id`, `name`, `description`, `price`, `Category`) VALUES
(1, 'Dronedarone', "Nondisp Maisonneuve\'s fx r leg, 7thG", 12.77, 1),
(2, 'BISMUTH', 'Non-prs chronic ulcer oth prt right foot w fat layer exposed', 40.81, 2),
(3, 'metformin hydrochloride', 'Corrosion of third degree of thigh', 78, 3),
(4, 'Acetaminophen', 'Laceration of tail of pancreas, unsp degree, init encntr', 18.57, 4),
(5, 'Risperidone Mucosal', 'Partial traumatic amputation of unspecified midfoot', 36.47, 5),
(6, 'Acetaminophen, Diphenhydramine HCl', 'Encephalocele of other sites', 83.61, 6),
(7, 'Guinea Pig Epithelium', 'Cystinosis', 40.19, 7),
(8, 'POTASSIUM CHLORIDES', 'Basal cell carcinoma of skin of lower limb, including hip', 69.11, 8),
(9, 'Fentanyl Citrate', 'Pathological fracture in neoplastic disease, r humerus, init', 48.67, 9),
(10, 'MENTHOL', 'Unsp superficial injuries of r frnt wl of thorax, sequela', 70.31, 10),
(11, 'Chlorpheniramine Maleate', 'Disp fx of med phalanx of unsp less toe(s), 7thG', 11.97, 1),
(12, 'Nicotine Polacrilex', 'Contact w hot household appliance, undet intent, sequela', 54.77, 2),
(13, 'Ethylhexyl methoxycinnamate, Ethylhexy Salicate, Butyl Methoxydibezoylmethane', 'Ped w convey injured in collision w hv veh, unsp, sequela', 73.26, 3),
(14, 'Oxybutynin', 'Crushing injury of right little finger, sequela', 36.47, 4),
(15, 'Balsam Poplar', 'Foreign body in cornea, right eye, subsequent encounter', 63.41, 5),
(16, 'IBUPROFEN', 'Prsn brd/alit a motorcycle injured in collision w hv veh', 66.64, 6),
(17, 'Arnica Montana, Chamomilla, Echinacea, Symphytum Officinale, Boron Gluconate, Calcarea Phosphorica', 'Poisoning by antimycobacterial drugs, undetermined, subs', 45.51, 7),
(18, 'Dicloxacillin Sodium', 'Superficial foreign body of scalp, subsequent encounter', 55.59, 8),
(19, 'Treatment Set TS343826', 'Disp fx of distal phalanx of left great toe, init for opn fx', 81.66, 9),
(20, 'Aluminum Chlorohydrate', 'Fracture of unspecified phalanx of left index finger', 33.14, 10),
(21, 'BENZETHONIUM CHLORIDE', 'Unsp pedal cyclist injured in collision w 2/3-whl mv nontraf', 90.43, 1),
(22, 'Acetaminophen, Dextromethorphan Hydrobromide, Phenylephrine Hydrochloride', 'Corrosion of left eyelid and periocular area, sequela', 13.62, 2),
(23, 'Acetaminophen, Dextromethorphan Hydrobromide, Doxylamine Succinate', 'Rhodesiense trypanosomiasis', 68.56, 3),
(24, 'TITANIUM DIOXIDE', 'Oth superfic bite of left eyelid and periocular area, init', 24.1, 4),
(25, 'Hydrochlorido', 'Puncture wound with foreign body of right ear, subs encntr', 51.06, 5),
(26, 'Chlorhexidine gluconate and Isopropyl alcohol', 'Inj unsp musc/fasc/tend at wrs/hnd lv, left hand, sequela', 75.26, 6),
(27, 'mesna', 'Subluxation of T10/T11 thoracic vertebra, sequela', 61.03, 7),
(28, 'L-carnitine, L-glutamine, L-ornithine, L-tryptophan, L-tyrosine, Human chorionic gonadotropin,', 'Cardiac arrest, cause unspecified', 13.53, 8),
(29, 'Calcitriol', 'Partial traumatic trnsphal amp of r little finger, init', 83.58, 9),
(30, 'MENTHOL, CAMPHOR', 'Burn first degree of unsp mult fngr (nail), inc thumb, sqla', 26.6, 10),
(31, 'Triclosanium', 'Encounter for screening for malignant neoplasm of skin', 13.03, 1),
(32, 'Hydrochlorideum', 'Nondisp intertroch fx r femr, 7thN', 40.68, 2),
(33, 'Pantoprazole Sodium', 'Anterior dislocation of unspecified humerus, subs encntr', 91.43, 3),
(34, 'Hydroxyzine Pamoate', 'Burn of unspecified degree of back of left hand, sequela', 71.96, 4),
(35, 'bexarotene', 'Disord of newborn related to long gest and high birth weight', 57.4, 5),
(36, 'ALCOHOLIUM', 'Follicular lymphoma grade IIIb, intrathoracic lymph nodes', 76.32, 6),
(37, 'Progesterone', 'Nondisp oblique fx shaft of r rad, 7thE', 30.99, 7),
(38, 'levofloxacin', 'Contact with raccoon', 44.43, 8),
(39, 'Metoclopramide Hydrochloride', 'Partial traumatic amp of right foot, level unsp, sequela', 73.62, 9),
(40, 'Famotidine', 'Nondisp fx of sternal end of unsp clavicle, init for clos fx', 66.8, 10),
(41, 'Sporotrichum', 'Poisoning by antirheumatics, NEC, undetermined', 64.27, 1),
(42, 'desonide', 'Malignant neoplasm of right acoustic nerve', 40.84, 2),
(43, 'Triclosano', 'Burn first degree of unsp single finger except thumb, sqla', 15.6, 3),
(44, 'Norepinephrine', 'Antidysrhythmic drugs', 18.32, 4),
(45, 'Pseudoephedrine hydrochloride', 'Left lower quadrant abdominal rigidity', 82.37, 5),
(46, 'ATORVASTATIN CALCIUM', 'Laceration w/o fb of abd wall, epigst rgn w penet perit cav', 64.15, 6),
(47, 'Metoprolol succinate', 'Congenital deformities of hip', 84.13, 7),
(48, 'NAPROXEN', 'Disp fx of less trochanter of r femr, 7thD', 29.74, 8),
(49, 'Benztropine Mesylate', 'Complete traumatic amputation of left hand at wrist level', 76.67, 9),
(50, 'sodium fluoride', 'Drug/chem diabetes with stable prolif diabetic rtnop, r eye', 58.77, 10),
(51, 'Ruta, Rhus Tox, Arnica', 'Stress fracture, left finger(s), subs for fx w routn heal', 81.1, 1),
(52, 'Benzalkonium', 'Macrocheilia', 32.24, 2),
(53, 'CVS 44-585', 'Burn of third degree of unspecified toe(s) (nail), sequela', 99.02, 3),
(54, 'homosalate, octocrylene, octisalate, Avobenzone', 'Other injury of other part of small intestine, init encntr', 90.42, 4),
(55, 'Fentanyl Citrate, Bupivacaine HCl', 'Person outside car inj in nonclsn trnsp acc nontraf, subs', 45.17, 5),
(56, 'Titanium Dioxide, Zinc Oxide', 'Disp fx of cuboid bone of l foot, subs for fx w delay heal', 69.34, 6),
(57, 'Menthol Camphor Eucalyptus Oil', 'Lac w fb of abd wall, right upper q w penet perit cav, init', 23.36, 7),
(58, 'amlodipine besylate and atorvastatin calcium', 'Nondisp fx of neck of scapula, right shoulder, sequela', 42.41, 8),
(59, 'Deadly nightshade, indian cockle, ipecac root, poison nut, crude rock-oil', 'Nondisp fx of r tibial spine, init for opn fx type 3A/B/C', 47.74, 9),
(60, 'Trandolapril', 'Drug-induced chronic gout, ankle and foot', 36.47, 10),
(61, 'Aluminum Zirconium Trichlorohydrex Gly', 'Other physeal fracture of left metatarsal, 7thB', 47.85, 1),
(62, 'Titanium Dioxide and Zinc Oxide', 'Osteochondrodysplasia, unspecified', 48.07, 2),
(63, 'DOCUSATE SODIUM', 'Disp fx of greater tuberosity of r humerus, init for opn fx', 50.05, 3),
(64, 'Methocarbamol', 'Oth physl fx upr end rad, left arm, subs for fx w delay heal', 19.55, 4),
(65, 'BISMUTH SUBSALICYLATE', 'Burn of unspecified degree of unspecified wrist', 77.4, 5),
(66, 'Octinoxate and Oxybenzone', 'Path fx in oth disease, r humerus, subs for fx w delay heal', 86.93, 6),
(67, 'albuterol sulfate', 'Corrosion of unspecified degree of buttock, init encntr', 30.32, 7),
(68, 'Loperamide Hydrochloride', 'Oth fx left femur, subs for opn fx type 3A/B/C w routn heal', 41.86, 8),
(69, 'Triclosan', 'Pasngr in pk-up/van injured in clsn w nonmtr vehicle nontraf', 60.86, 9),
(70, 'Nabumentone', 'Malaise and fatigue', 89.63, 10),
(71, 'ALCOHOL', 'Disorder of urea cycle metabolism, unspecified', 56.09, 1),
(72, 'Rosuvastatin calcium', 'Maternal care for high head at term, fetus 5', 62.59, 2),
(73, 'Enalapril Maleate', "Monteggia\'s fx unsp ulna, 7thR", 40.07, 3),
(74, 'White Petroleum', 'Periumbilic rebound abdominal tenderness', 95.1, 4),
(75, 'Chlorhexidine Gluconate 4%', 'Superficial frostbite of wrist, hand, and fingers', 32.86, 5),
(76, 'oxybutynin chloride', 'Unsp fx right femur, subs for opn fx type I/2 w delay heal', 51.21, 6),
(77, 'Polyvinyl Alcohol and Povidone', 'Other superficial bite of hand of left hand, init encntr', 76.17, 7),
(78, 'ZINC OXIDE', 'Encopresis not due to a substance or known physiol condition', 47.96, 8),
(79, 'UREA', 'Laceration with foreign body of right buttock, sequela', 91.17, 9),
(80, 'Benzalkonium Chloride', 'Injury of unspecified nerves of neck, subsequent encounter', 90.24, 10),
(81, 'Octreotide acetate', 'Displaced transverse fracture of shaft of right fibula', 85.07, 1),
(82, 'Desipramine Hydrochloride', 'Poisoning by pyrazolone derivatives, undetermined, subs', 96.36, 2),
(83, 'Atropa Belladonna and Drosera Rotundifolia and Polygala Senega Root and Prunus Laurocerasus Leaf and Rumex Crispus root and Verbascum Thapsus', 'Pnctr w foreign body of r idx fngr w/o damage to nail, subs', 78.68, 3),
(84, 'Miconazole Nitrate', 'Gynephobia', 21.72, 4),
(85, 'TRIHEXYPHENIDYL HYDROCHLORIDE', 'Paraneoplastic neuromyopathy and neuropathy', 70.24, 5),
(86, 'Olanzapine', 'Preterm labor second tri w preterm del third tri, fetus 1', 28.21, 6),
(87, 'Lidocaine Hydrochloride and Epinephrine Bitartrate', 'Chondromalacia, unspecified site', 53.93, 7),
(88, 'Dextroamphetamine Saccharate, Amphetamine Aspartate, Dextroamphetamine Sulfate, and Amphetamine Sulfate', 'Unsp disp fx of surg nk of unsp humer, 7thP', 55.15, 8),
(89, 'Terazosin Hydrochloride', 'Insect bite (nonvenomous) of toe', 66.44, 9),
(90, 'Black Walnut', "Barton\'s fx unsp rad, 7thJ", 89.59, 10),
(91, 'ESTROGENS, CONJUGATED', 'Poisoning by keratolyt/keratplst/hair trmt drug, acc, init', 49.79, 1),
(92, 'Amlodipine Besylate', 'Burn of first degree of unspecified upper arm, subs encntr', 12.48, 2),
(93, 'Cyclosporine', 'Burn due to (nonpowered) inflatable craft on fire, init', 20.14, 3),
(94, 'Diphenhydramine Hydrochloride', 'Type 2 diab w prolif diab rtnop with trctn dtch n-mcla, unsp', 56.29, 4),
(95, 'Risperidone', 'Corrosion of third degree of left hand, unspecified site', 70.94, 5),
(96, 'Pyrithione Zinc', 'Nondisp trimalleol fx r low leg, init for opn fx type 3A/B/C', 59.29, 6),
(97, 'Galantamine Hydrobromide', 'Fracture of trapezoid [smaller multangular]', 53.28, 7),
(98, 'MENTHOL, METHYL SALICYLATE', 'Oth osteopor w current path fracture, unsp shoulder, sequela', 72.48, 8),
(99, 'Naproxen sodium, Pseudoephedrine HCl', 'Unsp superficial injury of scrotum and testes, init encntr', 30.27, 9),
(100, 'Aspirin', 'Toxic effect of nitro and oth nitric acids and esters, asslt', 82.03, 10);
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `Users`
--

CREATE TABLE `Users` (
  `user` varchar(50) CHARACTER SET utf8 NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `surname` varchar(50) CHARACTER SET utf8 NOT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(1) CHARACTER SET utf8 NOT NULL,
  `admin` tinyint(1) NOT NULL,
  
  CONSTRAINT pk_users PRIMARY KEY (user)
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Users`
--

INSERT INTO Users (user,password,name,surname,birthday,gender,admin) VALUES ('maltamirano0','d41d8cd98f00b204e9800998ecf8427e','Merle','Altamirano','2018-09-06','M',1);
INSERT INTO Users (user,password,name,surname,birthday,gender,admin) VALUES ('rnye1','d41d8cd98f00b204e9800998ecf8427e','Rog','Nye','2020-02-29','M',1);
INSERT INTO Users (user,password,name,surname,birthday,gender,admin) VALUES ('pfanstone2','d41d8cd98f00b204e9800998ecf8427e','Page','Fanstone','2018-07-23','M',0);
INSERT INTO Users (user,password,name,surname,birthday,gender,admin) VALUES ('bjohantges3','d41d8cd98f00b204e9800998ecf8427e','Bethanne','Johantges','2009-09-09','F',1);
INSERT INTO Users (user,password,name,surname,birthday,gender,admin) VALUES ('bgaroghan4','d41d8cd98f00b204e9800998ecf8427e','Bartram','Garoghan','2001-03-20','M',0);
INSERT INTO Users (user,password,name,surname,birthday,gender,admin) VALUES ('messon5','d41d8cd98f00b204e9800998ecf8427e','Malynda','Esson','2020-01-09','F',1);
INSERT INTO Users (user,password,name,surname,birthday,gender,admin) VALUES ('dbrodeur6','d41d8cd98f00b204e9800998ecf8427e','Dietrich','Brodeur','2017-08-18','M',1);
INSERT INTO Users (user,password,name,surname,birthday,gender,admin) VALUES ('pbarrowcliff7','d41d8cd98f00b204e9800998ecf8427e','Pete','Barrowcliff','2011-09-11','M',0);
INSERT INTO Users (user,password,name,surname,birthday,gender,admin) VALUES ('qcunnow8','d41d8cd98f00b204e9800998ecf8427e','Quincey','Cunnow','2022-05-08','M',0);
INSERT INTO Users (user,password,name,surname,birthday,gender,admin) VALUES ('oburndred9','d41d8cd98f00b204e9800998ecf8427e','Oberon','Burndred','2009-12-15','M',1);
INSERT INTO Users (user,password,name,surname,birthday,gender,admin) VALUES ('inma', 'd40dbcae0e7088fc4a7e1768cf8771da', 'Inmaculada', 'Olias', '2016-04-03', 'F', 1);
INSERT INTO Users (user,password,name,surname,birthday,gender,admin) VALUES ('javi', 'a14f8a540e78dae706d255750010a0f8', 'Javier', 'Villarreal', '2016-04-03', 'M', 1);



-- --------------------------------------------------------
CREATE TABLE `purchase` (
  `idMedicine` int(11) NOT NULL,
  `user` varchar(50) CHARACTER SET utf8 NOT NULL,
  `purchase_price` double NOT NULL,
  `purchase_date` date NOT NULL,
  `cod` int(11) DEFAULT NULL,
  `cuantity` int(11) NOT NULL,
  
     CONSTRAINT pk_cod PRIMARY KEY (purchase_date,idMedicine,user),
    CONSTRAINT fk_pr FOREIGN KEY (idMedicine) REFERENCES Medicine(id),
    CONSTRAINT fk_pur FOREIGN KEY (user) REFERENCES Users(user)
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (1,'maltamirano0',66.34,'2022-08-23',1,60);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (2,'rnye1',67.52,'2021-12-24',2,52);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (3,'pfanstone2',45.02,'2022-09-04',3,52);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (4,'bjohantges3',85.65,'2022-08-11',4,67);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (5,'bgaroghan4',87.23,'2021-11-08',5,33);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (6,'messon5',79.94,'2022-07-30',6,94);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (7,'dbrodeur6',15.37,'2022-08-13',7,73);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (8,'pbarrowcliff7',56.68,'2022-02-23',8,63);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (9,'qcunnow8',34.58,'2021-12-25',9,55);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (10,'oburndred9',84.44,'2022-10-14',10,76);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (11,'maltamirano0',46.53,'2022-06-03',11,95);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (12,'rnye1',18.34,'2022-06-08',12,90);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (13,'pfanstone2',38.04,'2022-07-19',13,85);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (14,'bjohantges3',90.17,'2022-02-14',14,35);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (15,'bgaroghan4',97.07,'2022-08-02',15,49);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (16,'messon5',15.73,'2022-10-10',16,78);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (17,'dbrodeur6',77.75,'2022-08-06',17,32);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (18,'pbarrowcliff7',15.44,'2022-06-06',18,43);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (19,'qcunnow8',90.11,'2022-09-22',19,53);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (20,'oburndred9',49.85,'2022-01-04',20,84);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (21,'maltamirano0',75.54,'2022-03-30',21,64);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (22,'rnye1',43.19,'2022-10-09',22,26);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (23,'pfanstone2',37.62,'2022-02-15',23,9);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (24,'bjohantges3',45.29,'2022-10-12',24,4);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (25,'bgaroghan4',96.14,'2022-04-03',25,34);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (26,'messon5',22.79,'2022-10-14',26,84);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (27,'dbrodeur6',25.63,'2022-04-06',27,30);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (28,'pbarrowcliff7',67.34,'2022-07-01',28,85);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (29,'qcunnow8',22.79,'2022-11-01',29,21);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (30,'oburndred9',77.94,'2022-03-12',30,92);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (31,'maltamirano0',58.45,'2022-08-28',31,61);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (32,'rnye1',47.83,'2022-04-17',32,86);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (33,'pfanstone2',72.98,'2022-10-03',33,76);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (34,'bjohantges3',71.14,'2022-04-20',34,63);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (35,'bgaroghan4',32.3,'2021-12-06',35,28);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (36,'messon5',50.72,'2022-03-18',36,84);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (37,'dbrodeur6',87.18,'2022-03-17',37,58);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (38,'pbarrowcliff7',70.44,'2022-01-26',38,25);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (39,'qcunnow8',71.26,'2022-04-17',39,100);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (40,'oburndred9',39.06,'2022-05-20',40,100);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (41,'maltamirano0',47.9,'2022-06-20',41,57);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (42,'rnye1',77.14,'2022-03-17',42,52);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (43,'pfanstone2',17.07,'2022-04-29',43,8);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (44,'bjohantges3',18.91,'2022-04-09',44,41);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (45,'bgaroghan4',79.36,'2022-06-10',45,76);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (46,'messon5',55.64,'2022-06-18',46,94);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (47,'dbrodeur6',29.08,'2022-01-12',47,90);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (48,'pbarrowcliff7',48.75,'2021-11-19',48,16);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (49,'qcunnow8',50.48,'2022-08-17',49,62);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (50,'oburndred9',16.29,'2022-08-22',50,82);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (51,'maltamirano0',39.51,'2021-11-09',51,39);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (52,'rnye1',95.94,'2022-09-02',52,98);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (53,'pfanstone2',39.22,'2022-06-14',53,6);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (54,'bjohantges3',78.28,'2022-09-02',54,90);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (55,'bgaroghan4',57.22,'2022-01-15',55,81);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (56,'messon5',26.99,'2022-08-09',56,56);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (57,'dbrodeur6',38.89,'2022-11-06',57,68);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (58,'pbarrowcliff7',67.61,'2022-04-22',58,34);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (59,'qcunnow8',12.48,'2022-03-21',59,56);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (60,'oburndred9',92.67,'2021-11-21',60,66);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (61,'maltamirano0',16.35,'2022-02-13',61,12);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (62,'rnye1',54.66,'2022-02-05',62,96);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (63,'pfanstone2',28.3,'2022-08-26',63,66);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (64,'bjohantges3',21.58,'2022-06-23',64,20);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (65,'bgaroghan4',16.65,'2021-11-12',65,13);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (66,'messon5',58.58,'2021-11-11',66,95);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (67,'dbrodeur6',28.14,'2021-12-13',67,86);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (68,'pbarrowcliff7',36.77,'2022-01-29',68,9);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (69,'qcunnow8',80.62,'2022-08-14',69,82);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (70,'oburndred9',85.97,'2022-04-03',70,68);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (71,'maltamirano0',80.63,'2022-09-01',71,38);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (72,'rnye1',18.58,'2022-08-16',72,67);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (73,'pfanstone2',16.74,'2022-07-21',73,51);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (74,'bjohantges3',46.86,'2022-02-09',74,8);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (75,'bgaroghan4',48.29,'2022-07-31',75,68);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (76,'messon5',69.17,'2022-06-10',76,37);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (77,'dbrodeur6',65.45,'2022-10-04',77,2);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (78,'pbarrowcliff7',68.1,'2022-10-05',78,70);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (79,'qcunnow8',40.37,'2022-01-11',79,74);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (80,'oburndred9',44.79,'2021-12-21',80,43);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (81,'maltamirano0',89.43,'2022-08-15',81,2);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (82,'rnye1',22.82,'2022-10-20',82,9);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (83,'pfanstone2',53.84,'2022-01-26',83,90);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (84,'bjohantges3',19.7,'2022-09-16',84,64);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (85,'bgaroghan4',13.48,'2022-03-27',85,15);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (86,'messon5',70.67,'2022-08-06',86,95);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (87,'dbrodeur6',25.49,'2022-04-22',87,50);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (88,'pbarrowcliff7',29.32,'2022-09-21',88,27);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (89,'qcunnow8',39.24,'2022-07-15',89,49);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (90,'oburndred9',28.55,'2022-08-30',90,45);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (91,'maltamirano0',19.05,'2022-04-10',91,22);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (92,'rnye1',95.61,'2022-02-28',92,20);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (93,'pfanstone2',81.23,'2022-07-22',93,94);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (94,'bjohantges3',55.2,'2021-12-19',94,66);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (95,'bgaroghan4',63.51,'2022-08-09',95,4);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (96,'messon5',66.62,'2022-04-23',96,97);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (97,'dbrodeur6',40.08,'2022-03-05',97,62);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (98,'pbarrowcliff7',29.03,'2021-11-08',98,66);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (99,'qcunnow8',30.29,'2022-11-03',99,24);
INSERT INTO purchase (idMedicine,user,purchase_price,purchase_date,cod,cuantity) VALUES (100,'oburndred9',44.8,'2022-02-06',100,62);



--
-- Índices para tablas volcadas
--

--

COMMIT;

CREATE USER 'villarreal'@'%' IDENTIFIED BY 'javier';
GRANT ALL PRIVILEGES ON MedicamentosJvh.* to 'villarreal'@'%';

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
