create database DB_Perpustakaan

use db_perpustakaan

-----SPACE CREATING TABLE------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table tbl_buku(
	id_buku int identity(1,1) primary key,
	judul_buku varchar(max)not null,
	genre_id int foreign key references tbl_genre (id_genre),
	penulis_id int foreign key references tbl_penulis(id_penulis),
	penerbit_id int foreign key references tbl_penerbit(id_penerbit),
	status_bk varchar (32) default 'Tersedia'
	);

create table tbl_genre(
	id_genre int identity(1,1) primary key,
	genre varchar (55)
	);

create table tbl_penulis(
	id_penulis int identity(1,1) primary key,
	nama_penulis varchar(max)not null,
	email varchar (32) not null,
	);

create table tbl_penerbit(
	id_penerbit int identity(1,1) primary key,
	nama_penerbit varchar(max)not null,
	email varchar (32) not null,
	alamat text
	);

create table tbl_member(
	id_member int identity(1,1) primary key,
	nama_member varchar(max)not null,
	jenis_kelamin char (1) not null,
	no_telpon varchar (16),
	alamat text,
	masa_berlaku date,
	);

create table tbl_pustakawan(
	id_pustakawan int identity(1,1) primary key,
	nama_pustakawan varchar(max)not null,
	jenis_kelamin char (1) not null,
	email varchar(32)
	);

create table tbl_Pinjam(
	id_pinjam int identity(1,1) primary key,
	member_id int foreign key references tbl_member (id_member),
	total_jumlah int not null,
	tgl_pinjam date,
	tgl_kembali date,
	pustakawan_id int foreign key references tbl_pustakawan(id_pustakawan)
	);

create table tbl_det_pinjam(
	id_det_pinjam int identity(1,1) primary key,
	pinjam_id int foreign key references tbl_pinjam(id_pinjam) ON DELETE CASCADE,
	buku_id int foreign key references tbl_buku (id_buku) ON DELETE CASCADE
)

create table tbl_pengembalian(
	id_pengembalian int identity(1,1) primary key,
	det_pinjam_id int foreign key references tbl_det_pinjam(id_det_pinjam) ON DELETE CASCADE,
	batas_waktu date,
	status_pengembalian varchar(32) default 'Belum Dikembalikan'
	tgl_pengembalian date 
)

create table tbl_denda(
	id_denda int identity(1,1) primary key,
	pengembalian_id int foreign key references tbl_pengembalian(id_pengembalian) ON DELETE CASCADE,
	jumlah_denda money,
	status_denda varchar(32) default 'Belum lunas'
)


------SPACE EDIT TABLE----------------------------------------------------------------------------------------------------------------------------

EXEC sp_rename 'tbl_pengembalian.tgl_pengembalian', 'batas_waktu', 'COLUMN';

bk_id int foreign key references tbl_buku(id_buku)

drop table

delete from tbl_Pinjam where id_pinjam = 16

alter table tbl_pinjam drop column tgl_pinjam

alter table tbl_pengembalian add tgl_pengembalian date 

update tbl_genre set genre = 'Novel Fantasi' where id_genre = 4

drop table tbl_pengembalian


-----SPACE INSERT-----------------------------------------------------------------------------------------------------------------------------------------------
insert into tbl_genre values ('Novel Drama')
insert into tbl_genre values ('Novel komedi')
insert into tbl_genre values ('Novel Horor')
insert into tbl_genre values ('Novel fantasy')
insert into tbl_genre values ('Novel Thriller')
insert into tbl_genre values ('Buku Biografi')
insert into tbl_genre values ('Novel Romance')
insert into tbl_genre values ('Novel Histori')
insert into tbl_genre values ('Buku Sains')



insert into tbl_buku (judul_buku, genre_id,penulis_id,penerbit_id) values 
( 'Manusia Setengah Salmon ', 2, 2, 2),
( 'Cinta Brontosaurus' ,2, 2, 2),
( 'Marmut Merah Jambu ',2, 2, 2),
( 'Ubur-UBur Lembur', 2, 2, 2)


insert into tbl_member (nama_member,jenis_kelamin, no_telpon,alamat, masa_berlaku) values 
('valiant', 'L', '084567332365', 'Djuanda, Depok', '2024-12-31')


insert into tbl_pustakawan (nama_pustakawan, jenis_kelamin, email) values ('Pari', 'L', 'paribksi@gmail.com')


insert into tbl_Pinjam (member_id,total_jumlah,pustakawan_id) values ( 2, 1, 1)


insert into tbl_det_pinjam (pinjam_id,buku_id) values (18,2)


INSERT INTO tbl_penerbit VALUES ('Bentang Pustaka', 'BentangP@gmail.com', 'Yogyakarta')
INSERT INTO tbl_penerbit VALUES ('Gagas Media', 'GagasM@gmail.com', 'Jakarta')
INSERT INTO tbl_penerbit VALUES ('Hasta Mitra', 'HastaM@gmail.com', 'Jakarta')
INSERT INTO tbl_penerbit VALUES ('Disney Hyperion', 'DisneyH@gmail.com', 'California')
INSERT INTO tbl_penerbit VALUES ('Gramedia Pustaka Utama', 'Gramedia@gmail.com','Jakarta')

insert into tbl_penulis values ('Andrea hirata', 'AndreaH@gmail.com') ,('Raditya Dika', 'RaditR@gmail.com')
INSERT INTO tbl_penulis VALUES 
('Pramoedya Ananta Toer', 'PramoedyaT@gmail,com'),
('Rick Riordan', 'RickR@gmail.com'),
('Stephen Hawking', 'StephenH@gmail.com'),
('Daniel Ahmad', 'Daniel@gmail.com'),
('Illana Tan', 'IlanaTan@gmail.com')



insert into tbl_buku (judul_buku, genre_id, penulis_id, penerbit_id) values 
('A Brief History of Time',8,5,5 ),
('Black Holes And Baby Universes',8,5,5),
('My Brief History',6,5,5),
('Pesta Bunuh Diri',5,6,2),
('Midnight Hospital',3,6,2),
('Seasons To Remember',7,7,5),
('Winter in Tokyo',7,7,5)



insert into tbl_Pinjam (member_id,total_jumlah,pustakawan_id) values ( 2, 1, 1)


insert into tbl_det_pinjam (pinjam_id,buku_id) values (18,2)



----SPACE JOIN----------------------------------------------------------------------------------------------------------------------------------------------------------

--join 4 tbl
select * from tbl_buku bk join tbl_genre gn on bk.genre_id = gn.id_genre join tbl_penerbit pr on bk.penerbit_id = pr.id_penerbit join tbl_penulis pn on bk.penulis_id = pn. id_penulis where bk.id_buku =1


--join semua table
select * from tbl_buku bk join tbl_genre gn on bk.genre_id = gn.id_genre join tbl_penerbit pr on bk.penerbit_id = pr.id_penerbit join tbl_penulis pn on bk.penulis_id = pn. id_penulis join tbl_det_pinjam dtp on bk.id_buku = dtp.buku_id join tbl_Pinjam pj on dtp.pinjam_id = pj.id_pinjam join tbl_member mb on pj.member_id = mb.id_member join tbl_pustakawan ps on pj.pustakawan_id = ps.id_pustakawan where dtp.id_det_pinjam = 1



-------SPACE TRIGGER---------------------------------------------------------------------------------------------------------------------------------------------------------

alter TRIGGER tbh_data_pengembalian ON tbl_det_pinjam
AFTER INSERT
AS
BEGIN
  INSERT INTO tbl_pengembalian(det_pinjam_id, batas_waktu)
  SELECT id_det_pinjam, DATEADD(month, 1, tgl_pinjam)
  FROM inserted
END


alter trigger sts_buku on tbl_det_pinjam
after insert
as 
begin
	update tbl_buku set status_bk = 'Tidak Tersedia' WHERE id_buku IN (SELECT buku_id FROM inserted);
end


CREATE TRIGGER tr_update_sts_buku ON tbl_pengembalian
AFTER UPDATE
AS
BEGIN
  UPDATE tbl_buku
  SET status_bk = 'Tersedia'
  FROM tbl_pengembalian pm join tbl_det_pinjam dtp on pm.det_pinjam_id = dtp.id_det_pinjam join tbl_buku bk ON dtp.buku_id = bk.id_buku
  WHERE pm.status_pengembalian = 'Telah Dikembalikan'
    AND bk.status_bk = 'Tidak Tersedia'
    AND pm.id_pengembalian = (SELECT id_pengembalian FROM inserted)
END


alter trigger set_denda on tbl_pengembalian
after update
as
begin
	declare @day int 
	declare @denda int = 2000
	select @day = DATEDIFF (DAY, batas_waktu,tgl_pengembalian) from tbl_pengembalian pm join tbl_det_pinjam dtp on pm.det_pinjam_id = dtp.id_det_pinjam where pm.det_pinjam_id = dtp.id_det_pinjam
	if (@day > 0)
		begin
			insert into tbl_denda(pengembalian_id,jumlah_denda)
			select id_pengembalian, jumlah_denda = @day * @denda
			from tbl_pengembalian pm where pm.status_pengembalian = 'Telah Dikembalikan' and pm.id_pengembalian = (SELECT id_pengembalian FROM inserted)
		end
end

 

/* list trigger
-  trigger menambah data pengembalian
-  trigger mengubah status buku yang dipinjam menjadi tidak tersedia
-  trigger mengubah status buku yang dikembalikan menjadi tersedia
-  trigger menambah tabel denda apabila tanggal pengembalian melewati batas waktu
*/


----SPACE PROCEDURE---------------------------------------------------------------------------------------------------------------------------

--prosedur cek buku: genre
create PROCEDURE Cek_Buku_Genre @genre varchar (55)
AS
BEGIN
	IF EXISTS (SELECT * FROM tbl_genre WHERE genre = @genre)
		BEGIN
			SELECT bk.judul_buku 'Judul Buku', pn.nama_penulis 'Nama Penulis', pr.nama_penerbit 'Nama Penerbit', gn.genre, bk.status_bk 'Status Buku'
			from tbl_buku bk join tbl_genre gn on bk.genre_id = gn.id_genre join tbl_penerbit pr on bk.penerbit_id = pr.id_penerbit join tbl_penulis pn on bk.penulis_id = pn. id_penulis where gn.genre = @genre
		end
	else 
		begin
			print 'Tidak ada data yang ditemukan atau cek kembali ejaan yang anda masukkan'
		end
end

--test
 exec Cek_Buku_genre 'novel komedi'

 -- prosedur cek buku: penulis
 create PROCEDURE Cek_Buku_Penulis @penulis varchar (55)
AS
BEGIN
	IF EXISTS (SELECT * FROM tbl_penulis WHERE nama_penulis = @penulis)
		BEGIN
			SELECT bk.judul_buku 'Judul Buku', pn.nama_penulis 'Nama Penulis', pr.nama_penerbit 'Nama Penerbit', gn.genre, bk.status_bk 'Status Buku'
			from tbl_buku bk join tbl_genre gn on bk.genre_id = gn.id_genre join tbl_penerbit pr on bk.penerbit_id = pr.id_penerbit join tbl_penulis pn on bk.penulis_id = pn. id_penulis where pn.nama_penulis = @penulis
		end
	else 
		begin
			print 'Tidak ada data yang ditemukan atau cek kembali ejaan yang anda masukkan'
		end
end

--test
exec Cek_Buku_Penulis 'Raditya dika'


-- prosedur cek buku :judul
 create PROCEDURE Cek_Buku_Judul @jdl_buku varchar (55)
AS
BEGIN
	IF EXISTS (SELECT * FROM tbl_buku WHERE judul_buku = @jdl_buku)
		BEGIN
			SELECT bk.judul_buku 'Judul Buku', pn.nama_penulis 'Nama Penulis', pr.nama_penerbit 'Nama Penerbit', gn.genre, bk.status_bk 'Status Buku'
			from tbl_buku bk join tbl_genre gn on bk.genre_id = gn.id_genre join tbl_penerbit pr on bk.penerbit_id = pr.id_penerbit join tbl_penulis pn on bk.penulis_id = pn. id_penulis where bk.judul_buku = @jdl_buku
		end
	else 
		begin
			print 'Tidak ada data yang ditemukan atau cek kembali ejaan yang anda masukkan'
		end
end

exec Cek_Buku_Judul ' Ubur-UBur Lembur'


--prosedur menginput update status peminjaman
alter procedure input_status @id_status int, @dtp int
 as
 begin
	if (@id_status = 1)
		begin
			update tbl_pengembalian set status_pengembalian = 'Telah Dikembalikan', tgl_pengembalian = '2023-02-5' from tbl_det_pinjam dtp join tbl_pengembalian pm on dtp.id_det_pinjam = pm.det_pinjam_id  where id_det_pinjam = @dtp
		end
end


--TEST
exec input_status 1,20

-- procedure input status denda
alter procedure input_status_denda @id_status int, @dtp int
 as
 begin
	if (@id_status = 1)
		begin
			update tbl_denda set status_denda = 'Lunas' from tbl_det_pinjam dtp join tbl_pengembalian pm on dtp.id_det_pinjam = pm.det_pinjam_id join tbl_denda dd on pm.id_pengembalian = dd.pengembalian_id  where id_det_pinjam= @dtp
		end
end

exec input_status_denda 1,20


-- list prosedur
-- prosedur mencari buku berdasarkan genre
exec Cek_Buku_genre 'novel horor'

-- prosedur mencari buku berdasarkan penulis
exec Cek_Buku_Penulis 'Andrea hirata'

-- prosedur mencari buku berdasarkan judul
exec Cek_Buku_Judul 'cinta brontosaurus'

-- prosedur menginput update status pengembalian
exec input_status 1, 23

-- prosedur mengupdate status denda
exec input_status_denda 1,23


insert into tbl_Pinjam (member_id,total_jumlah,pustakawan_id) values ( 2, 1, 1)


insert into tbl_det_pinjam (pinjam_id,buku_id) values (20,26)



-- view table

select * from tbl_buku
select * from tbl_genre
select * from tbl_penerbit
select * from tbl_penulis

select * from tbl_member
select * from tbl_pustakawan

select * from tbl_Pinjam
select * from tbl_det_pinjam
select * from tbl_pengembalian
select * from tbl_denda
