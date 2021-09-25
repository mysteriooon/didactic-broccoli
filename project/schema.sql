DROP TABLE IF EXISTS people;
DROP SEQUENCE IF EXISTS people_id_seq;
CREATE SEQUENCE people_id_seq;
CREATE TABLE people (
  id 	 	int PRIMARY KEY DEFAULT nextval('people_id_seq'),
  first_name	varchar(60) NULL,
  family_name	varchar(60) NULL,
  patronymic	varchar(60) NULL,
  passport	varchar(10) NULL,
  inn	varchar(13) NULL,
  snils	varchar(14) NULL,
  timestamp	timestamp NULL,
  birthdate timestamp,
  gender int,
  municipality_id int
);

INSERT INTO people (id, first_name, family_name, patronymic, snils, inn, passport, timestamp, birthdate, gender, municipality_id)
VALUES (1, 'Гражданский', 'Гражданин', 'Гражданович', '100-800-101-01', '183000700200', '1721011000', null, to_timestamp('9/2/1987', 'MM/DD/YYYY'), 1, 2);

INSERT INTO people (id, first_name, family_name, patronymic, snils, inn, passport, timestamp, birthdate, gender, municipality_id)
VALUES (2, 'Тестовый', 'Николай', 'Андреевич', '100-800-102-01', '183000700201', '1721011001', null, to_timestamp('3/10/1990', 'MM/DD/YYYY'), 1, 3);

INSERT INTO people (id, first_name, family_name, patronymic, snils, inn, passport, timestamp, birthdate, gender, municipality_id)
VALUES (3, 'Поддубный', 'Артем', 'Валерьевич', '100-800-103-01', '183000700202', '1721011002', null, to_timestamp('3/20/1999', 'MM/DD/YYYY'), 1, 5);

INSERT INTO people (id, first_name, family_name, patronymic, snils, inn, passport, timestamp, birthdate, gender, municipality_id)
VALUES (4, 'Николаева', 'Анна', 'Владимировна', '100-800-104-02', '183000700203', '1721011003', null, to_timestamp('9/9/2001', 'MM/DD/YYYY'), 0, 4);

INSERT INTO people (id, first_name, family_name, patronymic, snils, inn, passport, timestamp, birthdate, gender, municipality_id)
VALUES (5, 'Кулачек', 'Валерий', 'Дмитриевич', '100-800-105-03', '183000700204', '1721011004', null, to_timestamp('12/12/1982', 'MM/DD/YYYY'), 1, 8);

INSERT INTO people (id, first_name, family_name, patronymic, snils, inn, passport, timestamp, birthdate, gender, municipality_id)
VALUES (6, 'Зеленый', 'Даниил', 'Александрович', '100-800-106-04', '183000700205', '1721011005', null, to_timestamp('11/19/1998', 'MM/DD/YYYY'), 1, 10);

INSERT INTO people (id, first_name, family_name, patronymic, snils, inn, passport, timestamp, birthdate, gender, municipality_id)
VALUES (7, 'Захарова', 'Мария', 'Викторовна', '100-800-107-05', '183000700206', '1721011006', null, to_timestamp('6/18/1972', 'MM/DD/YYYY'), 0, 15);

INSERT INTO people (id, first_name, family_name, patronymic, snils, inn, passport, timestamp, birthdate, gender, municipality_id)
VALUES (8, 'Алканьева', 'Дарья', 'Игоревна', '100-800-108-06', '183000700207', '1721011007', null, to_timestamp('9/11/2001', 'MM/DD/YYYY'), 0, 19);

INSERT INTO people (id, first_name, family_name, patronymic, snils, inn, passport, timestamp, birthdate, gender, municipality_id)
VALUES (9, 'Туряков', 'Захар', 'Алексеевич', '100-800-109-07', '183000700208', '1721011008', null, to_timestamp('1/24/1984', 'MM/DD/YYYY'), 1, 26);

INSERT INTO people (id, first_name, family_name, patronymic, snils, inn, passport, timestamp, birthdate, gender, municipality_id)
VALUES (10, 'Павлов', 'Артем', 'Геннадьевич', '100-800-110-08', '183000700209', '1721011009', null, to_timestamp('10/16/1975', 'MM/DD/YYYY'), 1, 10);

INSERT INTO people (id, first_name, family_name, patronymic, snils, inn, passport, timestamp, birthdate, gender, municipality_id)
VALUES (11, 'Котов ', 'Илья', 'Григореьвич', '100-800-111-09', '183000700210', '1721011010', null, to_timestamp('4/19/1999', 'MM/DD/YYYY'), 1, 11);

INSERT INTO people (id, first_name, family_name, patronymic, snils, inn, passport, timestamp, birthdate, gender, municipality_id)
VALUES (12, 'Караваева', 'Нина', 'Васильевна', '100-800-112-10', '183000700211', '1721011011', null, to_timestamp('3/12/1978', 'MM/DD/YYYY'), 0, 13);


DROP TABLE IF EXISTS fns;
DROP SEQUENCE IF EXISTS fns_id_seq;
CREATE SEQUENCE fns_id_seq;
CREATE TABLE fns(
  id		 int PRIMARY KEY DEFAULT  nextval('fns_id_seq'),
  passport varchar(10) NULL,
  month	varchar(2) NULL,
  year	varchar(4) NULL,
  summary_income	decimal(12,4) NULL
);

INSERT INTO public.fns (id, passport, month, year, summary_income)
VALUES (1, '1721011000', '01', '2019', 20000.0000);

INSERT INTO public.fns (id, passport, month, year, summary_income)
VALUES (2, '1721011001', '01', '2019', 20000.0000);

INSERT INTO public.fns (id, passport, month, year, summary_income)
VALUES (3, '1721011002', '01', '2019', 10000.0000);

INSERT INTO public.fns (id, passport, month, year, summary_income)
VALUES (4, '1721011003', '01', '2019', 12000.0000);

INSERT INTO public.fns (id, passport, month, year, summary_income)
VALUES (5, '1721011004', '02', '2019', 15000.0000);

INSERT INTO public.fns (id, passport, month, year, summary_income)
VALUES (6, '1721011005', '02', '2019', 13000.0000);

INSERT INTO public.fns (id, passport, month, year, summary_income)
VALUES (7, '1721011006', '02', '2019', 9000.0000);

INSERT INTO public.fns (id, passport, month, year, summary_income)
VALUES (8, '1721011007', '02', '2020', 8000.0000);

INSERT INTO public.fns (id, passport, month, year, summary_income)
VALUES (9, '1721011008', '02', '2020', 50000.0000);

INSERT INTO public.fns (id, passport, month, year, summary_income)
VALUES (10, '1721011009', '02', '2020', 25000.0000);

INSERT INTO public.fns (id, passport, month, year, summary_income)
VALUES (11, '1721011010', '03', '2020', 30000.0000);

INSERT INTO public.fns (id, passport, month, year, summary_income)
VALUES (12, '1721011011', '03', '2020', 31000.0000);

DROP TABLE IF EXISTS pfr;
DROP SEQUENCE IF EXISTS pfr_id_seq;
CREATE SEQUENCE pfr_id_seq;
CREATE TABLE pfr (
	id int	PRIMARY KEY DEFAULT nextval('pfr_id_seq'),
	snils	varchar(14) NULL,
	disabled_person	boolean,
	disabled_group	int
);

INSERT INTO public.pfr (id, snils, disabled_person, disabled_group)
VALUES (1, '100-800-101-01', false, 0);

INSERT INTO public.pfr (id, snils, disabled_person, disabled_group)
VALUES (2, '100-800-102-01', true, 1);

INSERT INTO public.pfr (id, snils, disabled_person, disabled_group)
VALUES (3, '100-800-103-01', true, 3);

INSERT INTO public.pfr (id, snils, disabled_person, disabled_group)
VALUES (4, '100-800-104-02', false, 0);

INSERT INTO public.pfr (id, snils, disabled_person, disabled_group)
VALUES (5, '100-800-105-03', false, 0);

INSERT INTO public.pfr (id, snils, disabled_person, disabled_group)
VALUES (6, '100-800-106-04', true, 2);

INSERT INTO public.pfr (id, snils, disabled_person, disabled_group)
VALUES (7, '100-800-107-05', true, 1);

INSERT INTO public.pfr (id, snils, disabled_person, disabled_group)
VALUES (8, '100-800-108-06', true, 3);

INSERT INTO public.pfr (id, snils, disabled_person, disabled_group)
VALUES (9, '100-800-109-07', false, 0);

INSERT INTO public.pfr (id, snils, disabled_person, disabled_group)
VALUES (10, '100-800-110-08', false, 0);

INSERT INTO public.pfr (id, snils, disabled_person, disabled_group)
VALUES (11, '100-800-111-09', false, 0);

INSERT INTO public.pfr (id, snils, disabled_person, disabled_group)
VALUES (12, '100-800-112-10', false, 0);

DROP TABLE IF EXISTS rosregistry;
DROP SEQUENCE IF EXISTS rosregistry_id_seq;
CREATE SEQUENCE rosregistry_id_seq;
CREATE TABLE rosregistry(
	id int PRIMARY KEY DEFAULT nextval('rosregistry_id_seq'),
	passport	varchar(10) NULL,
	estate	boolean
);

INSERT INTO public.rosregistry (id, passport, estate)
VALUES (1, '1721011000', false);

INSERT INTO public.rosregistry (id, passport, estate)
VALUES (2, '1721011001', false);

INSERT INTO public.rosregistry (id, passport, estate)
VALUES (3, '1721011002', true);

INSERT INTO public.rosregistry (id, passport, estate)
VALUES (4, '1721011003', true);

INSERT INTO public.rosregistry (id, passport, estate)
VALUES (5, '1721011004', false);

INSERT INTO public.rosregistry (id, passport, estate)
VALUES (6, '1721011005', false);

INSERT INTO public.rosregistry (id, passport, estate)
VALUES (7, '1721011006', true);

INSERT INTO public.rosregistry (id, passport, estate)
VALUES (8, '1721011007', false);

INSERT INTO public.rosregistry (id, passport, estate)
VALUES (9, '1721011008', true);

INSERT INTO public.rosregistry (id, passport, estate)
VALUES (10, '1721011009', false);

INSERT INTO public.rosregistry (id, passport, estate)
VALUES (11, '1721011010', true);

INSERT INTO public.rosregistry (id, passport, estate)
VALUES (12, '1721011011', false);


DROP TABLE IF EXISTS children;
DROP SEQUENCE IF EXISTS children_id_seq;
CREATE SEQUENCE children_id_seq;
CREATE TABLE children(
	id int PRIMARY KEY DEFAULT nextval('children_id_seq'),
	parent_passport	varchar(10),
	child_birthcert varchar(6)
);

INSERT INTO children (id, parent_passport, child_birthcert)
VALUES (1, '1721011000', '877321');

INSERT INTO children (id, parent_passport, child_birthcert)
VALUES (2, '1721011007', '132345');

INSERT INTO children (id, parent_passport, child_birthcert)
VALUES (3, '1721011007', '422245');

INSERT INTO children (id, parent_passport, child_birthcert)
VALUES (4, '1721011009', '999523');

INSERT INTO children (id, parent_passport, child_birthcert)
VALUES (5, '1721011011', '221345');

INSERT INTO children (id, parent_passport, child_birthcert)
VALUES (6, '1721011002', '211384');

DROP TABLE IF EXISTS municipalities;
CREATE TABLE municipalities(
	id int PRIMARY KEY,
	name	varchar(255),
	lat decimal,
	lon decimal
);

INSERT INTO public.municipalities (id, name, lat, lon)
VALUES (1, 'Алнашский', 56.170105, 52.493344);

INSERT INTO public.municipalities (id, name, lat, lon)
VALUES (2, 'Балезинский', 57.958711, 53.03575);

INSERT INTO public.municipalities (id, name, lat, lon)
VALUES (3, 'Вавожский', 56.769665, 51.921874);

INSERT INTO public.municipalities (id, name, lat, lon)
VALUES (4, 'Воткинский', 57.043055, 54.033661);

INSERT INTO public.municipalities (id, name, lat, lon)
VALUES (5, 'Глазовский', 58.129916, 52.673334);

INSERT INTO public.municipalities (id, name, lat, lon)
VALUES (6, 'Граховский', 56.021483, 51.960464);

INSERT INTO public.municipalities (id, name, lat, lon)
VALUES (7, 'Дебесский', 57.638926, 53.810611);

INSERT INTO public.municipalities (id, name, lat, lon)
VALUES (8, 'Завьяловский', 56.785262, 53.387725);

INSERT INTO public.municipalities (id, name, lat, lon)
VALUES (9, 'Игринский', 57.541048, 53.069725);

INSERT INTO public.municipalities (id, name, lat, lon)
VALUES (10, 'Индустриальный', 56.904064, 53.256398);

INSERT INTO public.municipalities (id, name, lat, lon)
VALUES (11, 'Камбарский', 56.283057, 54.183133);

INSERT INTO public.municipalities (id, name, lat, lon)
VALUES (12, 'Каракулинский', 56.025409, 53.687167);

INSERT INTO public.municipalities (id, name, lat, lon)
VALUES (13, 'Кезский', 57.88238, 53.711493);

INSERT INTO public.municipalities (id, name, lat, lon)
VALUES (14, 'Кизнерский', 56.275231, 51.522127);

INSERT INTO public.municipalities (id, name, lat, lon)
VALUES (15, 'Киясовский', 56.3321, 53.126774);

INSERT INTO public.municipalities (id, name, lat, lon)
VALUES (16, 'Красногорский', 57.689947, 52.512514);

INSERT INTO public.municipalities (id, name, lat, lon)
VALUES (17, 'Ленинский', 56.825965, 53.120036);

INSERT INTO public.municipalities (id, name, lat, lon)
VALUES (18, 'Малопургинский', 56.554863, 53.00517);

INSERT INTO public.municipalities (id, name, lat, lon)
VALUES (19, 'Можгинский', 56.434921, 52.236502);

INSERT INTO public.municipalities (id, name, lat, lon)
VALUES (20, 'Октябрьский', 56.843534, 53.330016);

INSERT INTO public.municipalities (id, name, lat, lon)
VALUES (21, 'Первомайский', 56.375595, 53.234254);

INSERT INTO public.municipalities (id, name, lat, lon)
VALUES (22, 'Селтинский', 57.361636, 51.96087);

INSERT INTO public.municipalities (id, name, lat, lon)
VALUES (23, 'Сюмсинский', 57.117374, 51.553216);

INSERT INTO public.municipalities (id, name, lat, lon)
VALUES (24, 'Увинский', 56.970018, 52.19273);

INSERT INTO public.municipalities (id, name, lat, lon)
VALUES (25, 'Устиновский', 56.88419, 53.294392);

INSERT INTO public.municipalities (id, name, lat, lon)
VALUES (26, 'Шарканский', 57.283155, 53.861681);

INSERT INTO public.municipalities (id, name, lat, lon)
VALUES (27, 'Юкаменский', 57.884664, 52.263263);

INSERT INTO public.municipalities (id, name, lat, lon)
VALUES (28, 'Як-Бодьинский', 57.179064, 53.189572);

INSERT INTO public.municipalities (id, name, lat, lon)
VALUES (29, 'Ярский', 58.379691, 52.015822);

