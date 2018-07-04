/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2014                    */
/* Created on:     12.06.2018 21:23:16                          */
/*==============================================================*/
use Source

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Dostawa') and o.name = 'FK_DOSTAWA_RELATIONS_FILM')
alter table Dostawa
   drop constraint FK_DOSTAWA_RELATIONS_FILM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Przeslanie_reklamy') and o.name = 'FK_PRZESLAN_RELATIONS_KLIENT')
alter table Przeslanie_reklamy
   drop constraint FK_PRZESLAN_RELATIONS_KLIENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Przeslanie_reklamy') and o.name = 'FK_PRZESLAN_RELATIONS_REKLAMA')
alter table Przeslanie_reklamy
   drop constraint FK_PRZESLAN_RELATIONS_REKLAMA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Wypozyczenie') and o.name = 'FK_WOPOZYCZ_RELATIONS_FILM')
alter table Wypozyczenie
   drop constraint FK_WOPOZYCZ_RELATIONS_FILM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Wypozyczenie') and o.name = 'FK_WOPOZYCZ_RELATIONS_KLIENT')
alter table Wypozyczenie
   drop constraint FK_WOPOZYCZ_RELATIONS_KLIENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Zamowienie') and o.name = 'FK_ZAMOWIEN_RELATIONS_FILM')
alter table Zamowienie
   drop constraint FK_ZAMOWIEN_RELATIONS_FILM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Zamowienie') and o.name = 'FK_ZAMOWIEN_RELATIONS_KLIENT')
alter table Zamowienie
   drop constraint FK_ZAMOWIEN_RELATIONS_KLIENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Zgoda_klienta') and o.name = 'FK_ZGODA_KL_RELATIONS_KLIENT')
alter table Zgoda_klienta
   drop constraint FK_ZGODA_KL_RELATIONS_KLIENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Zgoda_klienta') and o.name = 'FK_ZGODA_KL_RELATIONS_ZGODA')
alter table Zgoda_klienta
   drop constraint FK_ZGODA_KL_RELATIONS_ZGODA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Dostawa')
            and   name  = 'Relationship_2_FK'
            and   indid > 0
            and   indid < 255)
   drop index Dostawa.Relationship_2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Dostawa')
            and   type = 'U')
   drop table Dostawa
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Film')
            and   type = 'U')
   drop table Film
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Klient')
            and   type = 'U')
   drop table Klient
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Przeslanie_reklamy')
            and   name  = 'Relationship_9_FK'
            and   indid > 0
            and   indid < 255)
   drop index Przeslanie_reklamy.Relationship_9_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Przeslanie_reklamy')
            and   name  = 'Relationship_7_FK'
            and   indid > 0
            and   indid < 255)
   drop index Przeslanie_reklamy.Relationship_7_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Przeslanie_reklamy')
            and   type = 'U')
   drop table Przeslanie_reklamy
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Reklama')
            and   type = 'U')
   drop table Reklama
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Wypozyczenie')
            and   name  = 'Relationship_4_FK'
            and   indid > 0
            and   indid < 255)
   drop index Wypozyczenie.Relationship_4_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Wypozyczenie')
            and   name  = 'Relationship_1_FK'
            and   indid > 0
            and   indid < 255)
   drop index Wypozyczenie.Relationship_1_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Wypozyczenie')
            and   type = 'U')
   drop table Wypozyczenie
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Zamowienie')
            and   name  = 'Relationship_6_FK'
            and   indid > 0
            and   indid < 255)
   drop index Zamowienie.Relationship_6_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Zamowienie')
            and   name  = 'Relationship_3_FK'
            and   indid > 0
            and   indid < 255)
   drop index Zamowienie.Relationship_3_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Zamowienie')
            and   type = 'U')
   drop table Zamowienie
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Zgoda')
            and   type = 'U')
   drop table Zgoda
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Zgoda_klienta')
            and   name  = 'Relationship_8_FK'
            and   indid > 0
            and   indid < 255)
   drop index Zgoda_klienta.Relationship_8_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Zgoda_klienta')
            and   name  = 'Relationship_5_FK'
            and   indid > 0
            and   indid < 255)
   drop index Zgoda_klienta.Relationship_5_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Zgoda_klienta')
            and   type = 'U')
   drop table Zgoda_klienta
go

/*==============================================================*/
/* Table: Dostawa                                               */
/*==============================================================*/
create table Dostawa (
   id_dostawy           int                  not null,
   id_filmu             int                  null,
   ilosc_dostarczonych_egzemplarzy int                  not null,
   data_dostawy         datetime             not null,
   data_wprowadzenia_rekordu_dostawa datetime             not null,
   delete_dostawa      int                   not null,
   constraint PK_DOSTAWA primary key (id_dostawy)
)
go

/*==============================================================*/
/* Index: Relationship_2_FK                                     */
/*==============================================================*/




create nonclustered index Relationship_2_FK on Dostawa (id_filmu ASC)
go

/*==============================================================*/
/* Table: Film                                                  */
/*==============================================================*/
create table Film (
   id_filmu             int                  not null,
   cena                 int                  not null,
   Rezyser              varchar(60)          not null,
   Rok_wydania          datetime             not null,
   Tytul                varchar(60)          not null,
   ilosc_egzemplarzy    int                  not null,
   Stan                 int                  not null,
   data_wprowadzenia_rekordu_film datetime             not null,
   delete_film      int                   not null,
   constraint PK_FILM primary key (id_filmu)
)
go

/*==============================================================*/
/* Table: Klient                                                */
/*==============================================================*/
create table Klient (
   id_klienta           int                  not null,
   Nazwisko             varchar(60)          not null,
   Imie                 varchar(60)          not null,
   pesel                numeric(11)          not null,
   mail                 varchar(80)          not null,
   data_wprowadzenia_rekordu_klient datetime             not null,
   delete_klient      int                   not null,
   constraint PK_KLIENT primary key (id_klienta)
)
go

/*==============================================================*/
/* Table: Przeslanie_reklamy                                    */
/*==============================================================*/
create table Przeslanie_reklamy (
   id_przeslania_reklamy int                  not null,
   id_klienta           int                  null,
   id_reklamy           int                  null,
   data_wyslania_reklamy datetime             not null,
   data_wprowadzenia_rekordu_przeslanie_reklamy datetime             not null,
   delete_przeslanie_reklamy      int                   not null,
   constraint PK_PRZESLANIE_REKLAMY primary key (id_przeslania_reklamy)
)
go

/*==============================================================*/
/* Index: Relationship_7_FK                                     */
/*==============================================================*/




create nonclustered index Relationship_7_FK on Przeslanie_reklamy (id_klienta ASC)
go

/*==============================================================*/
/* Index: Relationship_9_FK                                     */
/*==============================================================*/




create nonclustered index Relationship_9_FK on Przeslanie_reklamy (id_reklamy ASC)
go

/*==============================================================*/
/* Table: Reklama                                               */
/*==============================================================*/
create table Reklama (
   id_reklamy           int                  not null,
   data_wprowadzenia_rekordu_reklama datetime             not null,
   delete_reklama      int                   not null,
   constraint PK_REKLAMA primary key (id_reklamy)
)
go

/*==============================================================*/
/* Table: Wypozyczenie                                          */
/*==============================================================*/
create table Wypozyczenie (
   id_wypozyczenia      int                  not null,
   id_klienta           int                  null,
   id_filmu             int                  null,
   data_wypozyczenia    datetime             not null,
   data_oddania         datetime             not null,
   termin_oddania       datetime             not null,
   data_wprowadzenia_rekordu_wypozyczenie datetime             not null,
   delete_wypozyczenie      int                   not null,
   constraint PK_Wypozyczenie primary key (id_wypozyczenia)
)
go

/*==============================================================*/
/* Index: Relationship_1_FK                                     */
/*==============================================================*/




create nonclustered index Relationship_1_FK on Wypozyczenie (id_filmu ASC)
go

/*==============================================================*/
/* Index: Relationship_4_FK                                     */
/*==============================================================*/




create nonclustered index Relationship_4_FK on Wypozyczenie (id_klienta ASC)
go

/*==============================================================*/
/* Table: Zamowienie                                            */
/*==============================================================*/
create table Zamowienie (
   id_zamowienia        int                  not null,
   id_filmu             int                  null,
   id_klienta           int                  null,
   data_zamowienia      datetime             not null,
   data_wprowadzenia_rekordu_zamowienie datetime             not null,
   delete_zamowienie      int                   not null,
   constraint PK_ZAMOWIENIE primary key (id_zamowienia)
)
go

/*==============================================================*/
/* Index: Relationship_3_FK                                     */
/*==============================================================*/




create nonclustered index Relationship_3_FK on Zamowienie (id_filmu ASC)
go

/*==============================================================*/
/* Index: Relationship_6_FK                                     */
/*==============================================================*/




create nonclustered index Relationship_6_FK on Zamowienie (id_klienta ASC)
go

/*==============================================================*/
/* Table: Zgoda                                                 */
/*==============================================================*/
create table Zgoda (
   id_zgody             int                  not null,
   data_wprowadzenia_rekordu_zgoda datetime             not null,
   delete_zgoda      int                   not null,
   constraint PK_ZGODA primary key (id_zgody)
)
go

/*==============================================================*/
/* Table: Zgoda_klienta                                         */
/*==============================================================*/
create table Zgoda_klienta (
   id_zgody_klienta     int                  not null,
   id_klienta           int                  null,
   id_zgody             int                  null,
   data_zgody           datetime             not null,
   data_wprowadzenia_rekordu_zgoda_klienta datetime             not null,
   delete_zgoda_klienta      int                   not null,
   constraint PK_ZGODA_KLIENTA primary key (id_zgody_klienta)
)
go

/*==============================================================*/
/* Index: Relationship_5_FK                                     */
/*==============================================================*/




create nonclustered index Relationship_5_FK on Zgoda_klienta (id_klienta ASC)
go

/*==============================================================*/
/* Index: Relationship_8_FK                                     */
/*==============================================================*/




create nonclustered index Relationship_8_FK on Zgoda_klienta (id_zgody ASC)
go

alter table Dostawa
   add constraint FK_DOSTAWA_RELATIONS_FILM foreign key (id_filmu)
      references Film (id_filmu)
go

alter table Przeslanie_reklamy
   add constraint FK_PRZESLAN_RELATIONS_KLIENT foreign key (id_klienta)
      references Klient (id_klienta)
go

alter table Przeslanie_reklamy
   add constraint FK_PRZESLAN_RELATIONS_REKLAMA foreign key (id_reklamy)
      references Reklama (id_reklamy)
go

alter table Wypozyczenie
   add constraint FK_WOPOZYCZ_RELATIONS_FILM foreign key (id_filmu)
      references Film (id_filmu)
go

alter table Wypozyczenie
   add constraint FK_WOPOZYCZ_RELATIONS_KLIENT foreign key (id_klienta)
      references Klient (id_klienta)
go

alter table Zamowienie
   add constraint FK_ZAMOWIEN_RELATIONS_FILM foreign key (id_filmu)
      references Film (id_filmu)
go

alter table Zamowienie
   add constraint FK_ZAMOWIEN_RELATIONS_KLIENT foreign key (id_klienta)
      references Klient (id_klienta)
go

alter table Zgoda_klienta
   add constraint FK_ZGODA_KL_RELATIONS_KLIENT foreign key (id_klienta)
      references Klient (id_klienta)
go

alter table Zgoda_klienta
   add constraint FK_ZGODA_KL_RELATIONS_ZGODA foreign key (id_zgody)
      references Zgoda (id_zgody)
go

