drop database if exists nettbutikk;
create database nettbutikk;
use nettbutikk;

create table Produkter (
    produktID int primary key auto_increment,
    produktNavn varchar(255) not null,
    produktBeskrivelse varchar(255) not null,
    produktPris decimal(10, 2),
    kategori varchar(255) not null
);

create table Kunder (
    kundeID int primary key auto_increment,
    fornavn varchar(255) not null,
    etternavn varchar(255) not null,
    adresse varchar(255) not null,
	epost varchar(255) not null,
    telefon char(8) not null,
    alder int
);

create table Bestillinger (
    bestillingsID int primary key auto_increment,
    kundeID int not null,
    bestillingsDato date not null,
    totalPris decimal(10, 2) not null,
    foreign key (KundeID) references Kunder(KundeID)
);

create table Bestillingsdetaljer (
    bestillingsID int,
    produktID int,
    antall int not null,
    foreign key (bestillingsID) references Bestillinger(bestillingsID),
    foreign key (produktID) references Produkter(produktID)
);

create table Leveringer (
    leveringsID int primary key auto_increment,
    bestillingsID int,
    leveringsDato date not null,
    leveringsAdresse varchar(255) not null,
    foreign key (bestillingsID) references Bestillinger(bestillingsID)
);

-- test data:
insert into Produkter (produktNavn, produktBeskrivelse, produktPris, kategori)
values
    ('Skjorte', 'Blå skjorte i bomull med korte ermer', 249.00, 'Klær'),
    ('T-skjorte', 'Grønn t-skjorte med trykk', 149.00, 'Klær'),
    ('Bok', '"Harry Potter og de vises stein" av J.K. Rowling', 129.00, 'Bøker'),
    ('Laptop', 'Dell XPS 13 bærbar PC med intel Core i7-prosessor', 12999.00, 'Elektronikk'),
    ('Mobiltelefon', 'Samsung Galaxy S20 med 128 GB lagringsplass', 8499.00, 'Elektronikk'),
    ('Håndveske', 'Brun skinnveske med avtagbar skulderstropp', 899.00, 'Vesker'),
    ('Joggesko', 'Nike Air Max 270 løpesko i svart', 1399.00, 'Sko'),
    ('Badekåpe', 'Grå badekåpe i myk bomull', 499.00, 'Klær'),
    ('Hårføner', 'Dyson Supersonic hårføner med tre hastighetsinnstillinger', 3499.00, 'Elektronikk'),
    ('Veske', 'Sort lærveske med to hovedrom og to sidelommer', 1499.00, 'Vesker');

insert into Kunder (fornavn, etternavn, adresse, epost, telefon)
values
    ('Anne', 'Hansen', 'Storgata 12, 0250 Oslo', 'anne.hansen@example.com', '98765432'),
    ('Per', 'Olsen', 'Strandgata 14, 0105 Oslo', 'per.olsen@example.com', '93456789'),
    ('Ingrid', 'Johansen', 'Kirkegata 8, 0153 Oslo', 'ingrid.johansen@example.com', '91234567'),
    ('Lars', 'Berg', 'Karl Johans gate 25, 0159 Oslo', 'lars.berg@example.com', '92876543'),
    ('Kari', 'Pedersen', 'Grensen 12, 0159 Oslo', 'kari.pedersen@example.com', '91234567'),
    ('Tom', 'Kristensen', 'Pilestredet 8, 0176 Oslo', 'tom.kristensen@example.com', '93456789'),
    ('Maria', 'Johansson', 'Torggata 14, 0182 Oslo', 'maria.johansson@example.com', '92876543'),
    ('Anders', 'Andersen', 'Stortingsgata 4, 0161 Oslo', 'anders.andersen@example.com', '98765432');

insert into Bestillinger (kundeID, bestillingsDato, totalPris)
values
    (1, '2023-07-25', 647.00),   -- Bestilling 1 (2x Skjorte, 1x T-skjorte)
    (2, '2023-07-24', 406.00),   -- Bestilling 2 (3x Bok, 2x Bok)
    (3, '2023-07-23', 8499.00),  -- Bestilling 3 (1x Laptop)
    (4, '2023-07-22', 8499.00),  -- Bestilling 4 (1x Mobiltelefon)
    (5, '2023-07-21', 2298.00),  -- Bestilling 5 (1x Håndveske, 2x Joggesko)
    (6, '2023-07-20', 1497.00),  -- Bestilling 6 (3x Badekåpe)
    (7, '2023-07-19', 3499.00),  -- Bestilling 7 (1x Hårføner)
    (8, '2023-07-18', 1499.00);  -- Bestilling 8 (1x Veske)

insert into Bestillingsdetaljer (bestillingsID, produktID, antall)
values
    (1, 1, 2),    -- 2x Skjorte
    (1, 2, 1),    -- 1x T-skjorte
    (2, 3, 3),    -- 3x Bok
    (2, 4, 2),    -- 2x Laptop
    (3, 5, 1),    -- 1x Mobiltelefon
    (4, 6, 1),    -- 1x Håndveske
    (5, 7, 1),    -- 1x Joggesko
    (5, 8, 2),    -- 2x Badekåpe
    (6, 9, 3),    -- 3x Hårføner
    (7, 10, 1),   -- 1x Veske
    (8, 10, 1);   -- 1x Veske

insert into Leveringer (bestillingsID, leveringsDato, leveringsAdresse)
values
    (1, '2023-07-26', 'Storgata 12, 0250 Oslo'),      -- Levering for Bestilling 1
    (2, '2023-07-25', 'Strandgata 14, 0105 Oslo'),    -- Levering for Bestilling 2
    (3, '2023-07-24', 'Kirkegata 8, 0153 Oslo'),      -- Levering for Bestilling 3
    (4, '2023-07-23', 'Karl Johans gate 25, 0159 Oslo'), -- Levering for Bestilling 4
    (5, '2023-07-22', 'Grensen 12, 0159 Oslo'),       -- Levering for Bestilling 5
    (6, '2023-07-21', 'Pilestredet 8, 0176 Oslo'),    -- Levering for Bestilling 6
    (7, '2023-07-20', 'Torggata 14, 0182 Oslo'),      -- Levering for Bestilling 7
    (8, '2023-07-19', 'Stortingsgata 4, 0161 Oslo');  -- Levering for Bestilling 8

-- Liste over alle produkter i nettbutikken, sortert etter kategori og produktpris.
select * from Produkter
order by kategori, produktPris;

-- Liste over alle kunder som har kjøpt et produkt fra en bestemt kategori.
select distinct
	Kunder.kundeID,
	Kunder.fornavn,
    Kunder.etternavn
from Produkter
join Bestillingsdetaljer
	on Bestillingsdetaljer.produktID = Produkter.produktID
join Bestillinger
	on Bestillinger.bestillingsID = Bestillingsdetaljer.bestillingsID
join Kunder
	on Kunder.kundeID = Bestillinger.kundeID
where kategori = 'Klær';

-- Liste over alle bestillinger som har blitt plassert i løpet av de siste 30 dagene, inkludert kundeinformasjon og totalpris for hver bestilling.
select 
    bestillingsID,
    bestillingsDato,
    totalPris,
    kunder.kundeID,
    fornavn,
    etternavn,
    adresse,
    epost,
    telefon
from Bestillinger
left join Kunder
	on Kunder.kundeID = Bestillinger.KundeID
where datediff(bestillingsDato, now()) <= 30;

-- Liste over alle bestilte produkter, sortert etter antall solgte enheter.
select 
	Produkter.produktID,
    produktNavn,
    produktBeskrivelse,
    produktPris,
    antall
from Produkter
join Bestillingsdetaljer
	on Produkter.produktID = Bestillingsdetaljer.produktID
order by antall desc;

-- Liste over alle leveranser som skal sendes til en bestemt adresse, inkludert produkt
select
	leveringsID,
    leveringsDato,
    leveringsAdresse,
    produktNavn,
    antall
from Leveringer
left join Bestillingsdetaljer on Bestillingsdetaljer.bestillingsID = Leveringer.bestillingsID
left join Produkter on Produkter.produktID = Bestillingsdetaljer.produktID
where Leveringer.leveringsAdresse = 'Grensen 12, 0159 Oslo';