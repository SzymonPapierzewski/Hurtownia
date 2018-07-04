use ProjektHurtownia;
/*==============================================================*/
/* Table: Dostawa                                               */
/*==============================================================*/
create table Dostawa (
   id_dostawy           int                  not null,
   id_filmu             int                  null,
   ilosc_dostarczonych_egzemplarzy int                  not null,
   data_dostawy         datetime             not null,
   delete_dostawa       int                  not null,
   constraint PK_DOSTAWA primary key (id_dostawy)
)
go

create sequence dbo.seq_Dostawa as
int
start with 1
increment by 1
minvalue 1;
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
   delete_film          int                  not null,
   constraint PK_FILM primary key (id_filmu)
)
go

create sequence dbo.seq_Film as
int
start with 1
increment by 1
minvalue 1;
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
   delete_klient        int                  not null,
   constraint PK_KLIENT primary key (id_klienta)
)
go

create sequence dbo.seq_Klient as
int
start with 1
increment by 1
minvalue 1;
go

/*==============================================================*/
/* Table: META_data_importu                                     */
/*==============================================================*/
create table META_data_importu (
   id_daty_importu      int                  not null,
   data_importu         datetime             not null,
   zrodlo_importu       varchar(50)          not null,
   constraint PK_META_DATA_IMPORTU primary key (id_daty_importu)
)
go

create sequence dbo.seq_META_data_importu as
int
start with 3
increment by 1
minvalue 1;
go

/*==============================================================*/
/* Table: META_id_translator                                    */
/*==============================================================*/
create table META_id_translator (
   id_translacji        int                  not null,
   nazwa_zrodla         varchar(50)          not null,
   nazwa_tabeli			varchar(1024)		 not null,
   id_w_zrodle          int                  not null,
   id_w_hurtowni        int                  not null,
   constraint PK_META_ID_TRANSLATOR primary key (id_translacji)
)
go

create sequence dbo.seq_META_id_translator as
int
start with 1
increment by 1
minvalue 1;
go

/*==============================================================*/
/* Table: META_load_log                                         */
/*==============================================================*/
create table META_load_log (
   id_import_log        int                  not null,
   data_importu_log     datetime             not null,
   zrodlo_importu_log   varchar(50)          not null,
   nazwa_tabeli_log     varchar(50)          not null,
   constraint PK_META_LOAD_LOG primary key (id_import_log)
)
go

create sequence dbo.seq_META_load_log as
int
start with 1
increment by 1
minvalue 1;
go

/*==============================================================*/
/* Table: Przeslanie_reklamy                                    */
/*==============================================================*/
create table Przeslanie_reklamy (
   id_przeslania_reklamy int                  not null,
   id_reklamy           int                  null,
   id_klienta           int                  null,
   data_wyslania_reklamy datetime             not null,
   delete_przeslanie_reklamy       int                  not null,
   constraint PK_PRZESLANIE_REKLAMY primary key (id_przeslania_reklamy)
)
go

create sequence dbo.seq_Przeslanie_reklamy as
int
start with 1
increment by 1
minvalue 1;
go

/*==============================================================*/
/* Table: Reklama                                               */
/*==============================================================*/
create table Reklama (
   id_reklamy           int                  not null,
   delete_reklama       int                  not null,
   constraint PK_REKLAMA primary key (id_reklamy)
)
go

create sequence dbo.seq_Reklama as
int
start with 1
increment by 1
minvalue 1;
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
   delete_wypozyczenie       int                  not null,
   constraint PK_WYPOZYCZENIE primary key (id_wypozyczenia)
)
go

create sequence dbo.seq_Wypozyczenie as
int
start with 1
increment by 1
minvalue 1;
go


/*==============================================================*/
/* Table: Zamowienie                                            */
/*==============================================================*/
create table Zamowienie (
   id_zamowienia        int                  not null,
   id_filmu             int                  null,
   id_klienta           int                  null,
   data_zamowienia      datetime             not null,
   delete_zamowienie       int                  not null,
   constraint PK_ZAMOWIENIE primary key (id_zamowienia)
)
go

create sequence dbo.seq_Zamowienie as
int
start with 1
increment by 1
minvalue 1;
go



/*==============================================================*/
/* Table: Zgoda                                                 */
/*==============================================================*/
create table Zgoda (
   id_zgody             int                  not null,
   delete_zgoda         int                  not null,
   constraint PK_ZGODA primary key (id_zgody)
)
go

create sequence dbo.seq_Zgoda as
int
start with 1
increment by 1
minvalue 1;
go

/*==============================================================*/
/* Table: Zgoda_klienta                                         */
/*==============================================================*/
create table Zgoda_klienta (
   id_zgody_klienta     int                  not null,
   id_klienta           int                  null,
   id_zgody             int                  null,
   data_zgody           datetime             not null,
   delete_zgoda_klienta       int                  not null,
   constraint PK_ZGODA_KLIENTA primary key (id_zgody_klienta)
)
go

create sequence dbo.seq_Zgoda_klienta as
int
start with 1
increment by 1
minvalue 1;
go
/*==============================================================*/
/* Tables: STAGE_SOURCE                                         */
/*==============================================================*/

/*==============================================================*/
/* Table: STAGE_SOURCE_Dostawa                                  */
/*==============================================================*/
create table STAGE_SOURCE_Dostawa (
   id_dostawy           int                  not null,
   id_filmu             int                  null,
   ilosc_dostarczonych_egzemplarzy int                  not null,
   data_dostawy         datetime             not null,
   data_wprowadzenia_rekordu_dostawa datetime             not null,
   delete_dostawa      int                   not null,
)
go

/*==============================================================*/
/* Table: STAGE_SOURCE_Film                                     */
/*==============================================================*/
create table STAGE_SOURCE_Film (
   id_filmu             int                  not null,
   cena                 int                  not null,
   Rezyser              varchar(60)          not null,
   Rok_wydania          datetime             not null,
   Tytul                varchar(60)          not null,
   ilosc_egzemplarzy    int                  not null,
   Stan                 int                  not null,
   data_wprowadzenia_rekordu_film datetime             not null,
   delete_film      int                   not null,
)
go

/*==============================================================*/
/* Table: STAGE_SOURCE_Klient                                   */
/*==============================================================*/
create table STAGE_SOURCE_Klient (
   id_klienta           int                  not null,
   Nazwisko             varchar(60)          not null,
   Imie                 varchar(60)          not null,
   pesel                numeric(11)          not null,
   mail                 varchar(80)          not null,
   data_wprowadzenia_rekordu_klient datetime             not null,
   delete_klient      int                   not null,
)
go

/*==============================================================*/
/* Table: STAGE_SOURCE_Przeslanie_reklamy                       */
/*==============================================================*/
create table STAGE_SOURCE_Przeslanie_reklamy (
   id_przeslania_reklamy int                  not null,
   id_klienta           int                  null,
   id_reklamy           int                  null,
   data_wyslania_reklamy datetime             not null,
   data_wprowadzenia_rekordu_przeslanie_reklamy datetime             not null,
   delete_przeslanie_reklamy     int                   not null,
)
go

/*==============================================================*/
/* Table: STAGE_SOURCE_Reklama                                  */
/*==============================================================*/
create table STAGE_SOURCE_Reklama (
   id_reklamy           int                  not null,
   data_wprowadzenia_rekordu_reklama datetime             not null,
   delete_reklama      int                   not null,
)
go

/*==============================================================*/
/* Table: STAGE_SOURCE_Wypozyczenie                             */
/*==============================================================*/
create table STAGE_SOURCE_Wypozyczenie (
   id_wypozyczenia      int                  not null,
   id_klienta           int                  null,
   id_filmu             int                  null,
   data_wypozyczenia    datetime             not null,
   data_oddania         datetime             not null,
   termin_oddania       datetime             not null,
   data_wprowadzenia_rekordu_wypozyczenie datetime             not null,
   delete_wypozyczenie      int                   not null,
)
go

/*==============================================================*/
/* Table: STAGE_SOURCE_Zamowienie                               */
/*==============================================================*/
create table STAGE_SOURCE_Zamowienie (
   id_zamowienia        int                  not null,
   id_filmu             int                  null,
   id_klienta           int                  null,
   data_zamowienia      datetime             not null,
   data_wprowadzenia_rekordu_zamowienie datetime             not null,
   delete_zamowienie      int                   not null,
)
go

/*==============================================================*/
/* Table: STAGE_SOURCE_Zgoda                                    */
/*==============================================================*/
create table STAGE_SOURCE_Zgoda (
   id_zgody             int                  not null,
   data_wprowadzenia_rekordu_zgoda datetime             not null,
   delete_zgoda      int                   not null,
)
go

/*==============================================================*/
/* Table: STAGE_SOURCE_Zgoda_klienta                            */
/*==============================================================*/
create table STAGE_SOURCE_Zgoda_klienta (
   id_zgody_klienta     int                  not null,
   id_klienta           int                  null,
   id_zgody             int                  null,
   data_zgody           datetime             not null,
   data_wprowadzenia_rekordu_zgoda_klienta datetime             not null,
   delete_zgoda_klienta      int                   not null,
)
go

/*==============================================================*/
/* Tables: STAGE_FLAT                                           */
/*==============================================================*/

/*==============================================================*/
/* Table: STAGE_FLAT_Dostawa                                  */
/*==============================================================*/
create table STAGE_FLAT_Dostawa (
   id_dostawy           int,
   id_filmu             int,
   ilosc_dostarczonych_egzemplarzy int,
   data_dostawy         datetime,
   data_wprowadzenia_rekordu_dostawa datetime,
   delete_dostawa		int,
)
go

/*==============================================================*/
/* Table: STAGE_FLAT_Film                                     */
/*==============================================================*/
create table STAGE_FLAT_Film (
   id_filmu             int,
   cena                 int,
   Rezyser              varchar(60),
   Rok_wydania          datetime,
   Tytul                varchar(60),
   ilosc_egzemplarzy    int,
   Stan                 int,
   data_wprowadzenia_rekordu_film datetime,
   delete_film		int,
)
go

/*==============================================================*/
/* Table: STAGE_FLAT_Klient                                   */
/*==============================================================*/
create table STAGE_FLAT_Klient (
   id_klienta           int,
   Nazwisko             varchar(60),
   Imie                 varchar(60),
   pesel                numeric(11),
   mail                 varchar(80),
   data_wprowadzenia_rekordu_klient datetime,
   delete_klient	int,
)
go

/*==============================================================*/
/* Table: STAGE_FLAT_Przeslanie_reklamy                       */
/*==============================================================*/
create table STAGE_FLAT_Przeslanie_reklamy (
   id_przeslania_reklamy int,
   id_klienta           int,
   id_reklamy           int,
   data_wyslania_reklamy datetime,
   data_wprowadzenia_rekordu_przeslanie_reklamy datetime,
   delete_przeslanie_reklamy	int,
)
go

/*==============================================================*/
/* Table: STAGE_FLAT_Reklama                                  */
/*==============================================================*/
create table STAGE_FLAT_Reklama (
   id_reklamy           int,
   data_wprowadzenia_rekordu_reklama datetime,
   delete_reklama	int,
)
go

/*==============================================================*/
/* Table: STAGE_FLAT_Wypozyczenie                             */
/*==============================================================*/
create table STAGE_FLAT_Wypozyczenie (
   id_wypozyczenia      int,
   id_klienta           int,
   id_filmu             int,
   data_wypozyczenia    datetime,
   data_oddania         datetime,
   termin_oddania       datetime,
   data_wprowadzenia_rekordu_wypozyczenie datetime,
   delete_wypozyczenie	int,
)
go

/*==============================================================*/
/* Table: STAGE_FLAT_Zamowienie                               */
/*==============================================================*/
create table STAGE_FLAT_Zamowienie (
   id_zamowienia        int,
   id_filmu             int,
   id_klienta           int,
   data_zamowienia      datetime,
   data_wprowadzenia_rekordu_zamowienie datetime,
   delete_zamowienie	int,
)
go

/*==============================================================*/
/* Table: STAGE_FLAT_Zgoda                                    */
/*==============================================================*/
create table STAGE_FLAT_Zgoda (
   id_zgody             int,
   data_wprowadzenia_rekordu_zgoda datetime,
   delete_zgoda	int,
)
go

/*==============================================================*/
/* Table: STAGE_FLAT_Zgoda_klienta                            */
/*==============================================================*/
create table STAGE_FLAT_Zgoda_klienta (
   id_zgody_klienta     int,
   id_klienta           int,
   id_zgody             int,
   data_zgody           datetime,
   data_wprowadzenia_rekordu_zgoda_klienta datetime,
   delete_zgoda_klienta	int,
)
go


/*==============================================================*/
/* Tables: ERROR                                     		*/
/*==============================================================*/

/*==============================================================*/
/* Table: ERROR_Dostawa                                 		*/
/*==============================================================*/
create table ERROR_Dostawa (
   id_dostawy           int,
   id_filmu             int,
   ilosc_dostarczonych_egzemplarzy int,
   data_dostawy         datetime,
   delete_dostawa       int
)
go

/*==============================================================*/
/* Table: ERROR_Film                                     */
/*==============================================================*/
create table ERROR_Film (
   id_filmu             int,
   cena                 int,
   Rezyser              varchar(60),
   Rok_wydania          datetime,
   Tytul                varchar(60),
   ilosc_egzemplarzy    int,
   Stan                 int,
   delete_film          int
)
go

/*==============================================================*/
/* Table: ERROR_Klient                                   */
/*==============================================================*/
create table ERROR_Klient (
   id_klienta           int,
   Nazwisko             varchar(60),
   Imie                 varchar(60),
   pesel                numeric(11),
   mail                 varchar(80),
   delete_klient        int
)
go

/*==============================================================*/
/* Table: ERROR_Przeslanie_reklamy                       */
/*==============================================================*/
create table ERROR_Przeslanie_reklamy (
   id_przeslania_reklamy int,
   id_klienta           int,
   id_reklamy           int,
   data_wyslania_reklamy datetime,
   delete_przeslanie_reklamy       int
)
go

/*==============================================================*/
/* Table: ERROR_Reklama                                  */
/*==============================================================*/
create table ERROR_Reklama (
   id_reklamy           int,
   delete_reklama       int
)
go

/*==============================================================*/
/* Table: ERROR_Wypozyczenie                             */
/*==============================================================*/
create table ERROR_Wypozyczenie (
   id_wypozyczenia      int,
   id_klienta           int,
   id_filmu             int,
   data_wypozyczenia    datetime,
   data_oddania         datetime,
   termin_oddania       datetime,
   delete_wypozyczenie       int
)
go

/*==============================================================*/
/* Table: ERROR_Zamowienie                               */
/*==============================================================*/
create table ERROR_Zamowienie (
   id_zamowienia        int,
   id_filmu             int,
   id_klienta           int,
   data_zamowienia      datetime,
   delete_zamowienie    int
)
go

/*==============================================================*/
/* Table: ERROR_Zgoda                                    */
/*==============================================================*/
create table ERROR_Zgoda (
   id_zgody             int,
   delete_zgoda         int
)
go

/*==============================================================*/
/* Table: ERROR_Zgoda_klienta                            */
/*==============================================================*/
create table ERROR_Zgoda_klienta (
   id_zgody_klienta     int,
   id_klienta           int,
   id_zgody             int,
   data_zgody           datetime,
   delete_zgoda_klienta int
)
go

insert into dbo.META_data_importu values(1,CONVERT(Datetime,'2000-01-01 12:00:00'),'SOURCE');
insert into dbo.META_data_importu values(2,CONVERT(Datetime,'2000-01-01 12:00:00'),'FLAT');


/*==============================================================*/
/* Table: Dostawa                                                  */
/*==============================================================*/
create table H_Dostawa (
   id_dostawy           int                  not null,
   id_filmu             int                  null,
   ilosc_dostarczonych_egzemplarzy int                  not null,
   data_dostawy         datetime             not null,
   data_wprowadzenia_rekordu_dostawa datetime             not null,
   delete_dostawa       int                  not null,
   HISTORYZACJA_BLEDOW	varchar(20)		null,
)
go


/*==============================================================*/
/* Table: Film                                                  */
/*==============================================================*/
create table H_Film (
   id_filmu             int                  not null,
   cena                 int                  not null,
   Rezyser              varchar(60)          not null,
   Rok_wydania          datetime             not null,
   Tytul                varchar(60)          not null,
   ilosc_egzemplarzy    int                  not null,
   Stan                 int                  not null,
   data_wprowadzenia_rekordu_film datetime             not null,
   delete_film      int                   not null,
   HISTORYZACJA_BLEDOW	varchar(20)		null,
)
go

/*==============================================================*/
/* Table: Klient                                                */
/*==============================================================*/
create table H_Klient (
   id_klienta           int                  not null,
   Nazwisko             varchar(60)          not null,
   Imie                 varchar(60)          not null,
   pesel                numeric(11)          not null,
   mail                 varchar(80)          not null,
   data_wprowadzenia_rekordu_klient datetime             not null,
   delete_klient      int                   not null,
   HISTORYZACJA_BLEDOW	varchar(20)		null,
)
go

/*==============================================================*/
/* Table: Przeslanie_reklamy                                    */
/*==============================================================*/
create table H_Przeslanie_reklamy (
   id_przeslania_reklamy int                  not null,
   id_klienta           int                  null,
   id_reklamy           int                  null,
   data_wyslania_reklamy datetime             not null,
   data_wprowadzenia_rekordu_przeslanie_reklamy datetime             not null,
   delete_przeslanie_reklamy      int                   not null,
   HISTORYZACJA_BLEDOW	varchar(20)		null,
)
go

/*==============================================================*/
/* Table: Reklama                                               */
/*==============================================================*/
create table H_Reklama (
   id_reklamy           int                  not null,
   data_wprowadzenia_rekordu_reklama datetime             not null,
   delete_reklama      int                   not null,
   HISTORYZACJA_BLEDOW	varchar(20)		null,
)
go

/*==============================================================*/
/* Table: Wypozyczenie                                          */
/*==============================================================*/
create table H_Wypozyczenie (
   id_wypozyczenia      int                  not null,
   id_klienta           int                  null,
   id_filmu             int                  null,
   data_wypozyczenia    datetime             not null,
   data_oddania         datetime             not null,
   termin_oddania       datetime             not null,
   data_wprowadzenia_rekordu_wypozyczenie datetime             not null,
   delete_wypozyczenie      int                   not null,
   HISTORYZACJA_BLEDOW	varchar(20)		null,
)
go

/*==============================================================*/
/* Table: Zamowienie                                            */
/*==============================================================*/
create table H_Zamowienie (
   id_zamowienia        int                  not null,
   id_filmu             int                  null,
   id_klienta           int                  null,
   data_zamowienia      datetime             not null,
   data_wprowadzenia_rekordu_zamowienie datetime             not null,
   delete_zamowienie      int                   not null,
   HISTORYZACJA_BLEDOW	varchar(20)		null,
)
go

/*==============================================================*/
/* Table: Zgoda                                                 */
/*==============================================================*/
create table H_Zgoda (
   id_zgody             int                  not null,
   data_wprowadzenia_rekordu_zgoda datetime             not null,
   delete_zgoda      int                   not null,
   HISTORYZACJA_BLEDOW	varchar(20)		null,
)
go

/*==============================================================*/
/* Table: Zgoda_klienta                                         */
/*==============================================================*/
create table H_Zgoda_klienta (
   id_zgody_klienta     int                  not null,
   id_klienta           int                  null,
   id_zgody             int                  null,
   data_zgody           datetime             not null,
   data_wprowadzenia_rekordu_zgoda_klienta datetime             not null,
   delete_zgoda_klienta      int                   not null,
   HISTORYZACJA_BLEDOW	varchar(20)		null,
)
go