
use school_library;
create table uyeler(
uyeNo int not null Primary key identity(1,1),
uyeAdi nvarchar(50) not null,
uyeSoyadi nvarchar(50) not null,
eposta nvarchar(100) not null,
cinsiyet char(2) not null, 
telefon int
);
use school_library;
create table adresler(
adresNo int not null Primary Key identity(1,1),
sehir nvarchar(50),
mahalle nvarchar(100),
binaNo int,
cadde nvarchar(200),
ulke nvarchar(50),
postaKodu int
);
ALTER TABLE uyeler ADD adresNo int
constraint FK_uyeler_adres
FOREIGN KEY (adresNo)
references ADRESLER (adresNo);

create table kutuphane(
kutuphaneNo int not null identity(1,1) PRIMARY KEY ,
kutuphaneIsmi nvarchar(150),
aciklama nvarchar(500),
adresNo int constraint FK_adresler_kutuphane FOREIGN KEY(adresNo) references adresler(adresNo) 
);
select*from kutuphane

create table emanet(
emanetNo int not null identity(1,1) PRIMARY KEY,
emanetTarihi datetime,
teslimTarihi datetime,
uyeNo int constraint FK_uye_emanet FOREIGN KEY(uyeNo) references uyeler(uyeNo),

kutuphaneNo int constraint FK_kutuphane_emanet FOREIGN KEY(kutuphaneNo) references kutuphane(kutuphaneNo),

ISBN nvarchar(50) constraint FK_kitap_emanet FOREIGN KEY(ISBN) references kitaplar(ISBN)
);
create table kitaplar(
ISBN nvarchar(50) not null PRIMARY KEY,
sayfaSayisi int ,
yayinTarihi datetime
);
select*from kitaplar


create table kategoriler(
kategoriNo int not null identity(1,1) PRIMARY KEY,
kategoriAdi nvarchar(75)
);
create table bulunur(
kategoriNo int constraint FK_bulunur_kategoriler FOREIGN KEY(kategoriNo) references	kategoriler(kategoriNo)
);
create table yazarlar(
yazarNo int not null identity(1,1) PRIMARY KEY,
yazarAdi nvarchar(50),
yazarSoyadi nvarchar(50)
);

create table yazar(
yazarNo int constraint FK_yazar_yazarlar FOREIGN KEY (yazarNo) references yazarlar(yazarNo)
);

create table bulunurkutuphane(
miktar nvarchar(50),
ISBN nvarchar(50) constraint FK_kitaplar_bulunurkutuphane FOREIGN KEY (ISBN) references kitaplar(ISBN),
kutuphaneNo int constraint FK_kutuphane_bulunurkutuphane FOREIGN KEY (kutuphaneNo) references kutuphane(kutuphaneNo)
);