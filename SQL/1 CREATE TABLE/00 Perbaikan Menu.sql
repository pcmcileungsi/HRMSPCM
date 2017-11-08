DELETE FROM MASTER_MENU WHERE MENU_ID>4
DELETE FROM MASTER_MODULE WHERE MODULE_ID>3
DELETE FROM MASTER_ROLE WHERE MODULE_ID>3
DELETE FROM MASTER_GROUP_ROLE

DBCC CHECKIDENT (MASTER_GROUP_ROLE, RESEED, 0)
INSERT INTO MASTER_GROUP_ROLE
SELECT GROUP_CODE, ROLE_CODE, CRE_DATE, CRE_BY, CRE_IP_ADDRESS, MOD_DATE, MOD_BY, MOD_IP_ADDRESS 
FROM MHRMS.dbo.MASTER_GROUP_ROLE 
WHERE GROUP_CODE IN(SELECT USERGROUP FROM MASTER_GROUP)
		AND ROLE_CODE in(SELECT ROLE_CODE FROM MASTER_ROLE)
		

--PARENT MENU
EXEC SP_Tambah_Menu_Modul_Parent_Anas 'Master Data', 1
--MENU/CHILD MENU
EXEC SP_Tambah_Menu_Modul_Anas 'Agama','module/data/agamalst.aspx',5, 1
EXEC SP_Tambah_Menu_Modul_Anas 'Hubungan Keluarga','module/data/hubkellst.aspx',5, 1
EXEC SP_Tambah_Menu_Modul_Anas 'Jenjang Pendidikan','module/data/jenpenlst.aspx',5, 1
EXEC SP_Tambah_Menu_Modul_Anas 'Jenis Usaha','module/data/jenusahalst.aspx',5, 1
EXEC SP_Tambah_Menu_Modul_Anas 'Jenis Pekerjaan','module/data/jenpekerjaanlst.aspx',5, 1
EXEC SP_Tambah_Menu_Modul_Anas 'Jenis Jabatan','module/data/jenjabatanlst.aspx',5, 1
EXEC SP_Tambah_Menu_Modul_Anas 'Jenis Golongan','module/data/jengolonganlst.aspx',5, 1
EXEC SP_Tambah_Menu_Modul_Anas 'Jenis Tunjangan','module/data/jentunjanganlst.aspx',5, 1
EXEC SP_Tambah_Menu_Modul_Anas 'Jenis Posisi','module/data/jenposisilst.aspx',5, 1

--PARENT MENU
EXEC SP_Tambah_Menu_Modul_Parent_Anas 'Master Instansi', 1
--MENU/CHILD MENU
EXEC SP_Tambah_Menu_Modul_Anas 'Instansi','module/sysadmin/master/syscompanylist.aspx',15, 1
EXEC SP_Tambah_Menu_Modul_Anas 'Majelis','module/sysadmin/master/majelislist.aspx',15, 1
EXEC SP_Tambah_Menu_Modul_Anas 'Unit Kerja','module/sysadmin/master/ukerlist.aspx',15, 1
EXEC SP_Tambah_Menu_Modul_Anas 'Master Gapok','module/sysadmin/master/mstgapoklist.aspx',15, 1
EXEC SP_Tambah_Menu_Modul_Anas 'Master Jabatan','module/sysadmin/master/mstjabatanlist.aspx',15, 1
EXEC SP_Tambah_Menu_Modul_Anas 'Master Tunjangan','module/sysadmin/master/msttunjanganlist.aspx',15, 1
EXEC SP_Tambah_Menu_Modul_Anas 'Master Tunjangan Jabatan','module/sysadmin/master/msttunjanganjablist.aspx',15, 1
EXEC SP_Tambah_Menu_Modul_Anas 'Master Cuti','module/sysadmin/master/mstcutilist.aspx',15, 1
EXEC SP_Tambah_Menu_Modul_Anas 'Master Shift','module/sysadmin/master/mstshiftlist.aspx',15, 1
EXEC SP_Tambah_Menu_Modul_Anas 'Master Posisi','module/sysadmin/master/mstposisilist.aspx',14, 1
EXEC SP_Tambah_Menu_Modul_Anas 'Master Kalender','module/sysadmin/master/mstcalendarlist.aspx',14, 1
--update MASTER_MENU set parent_menu_id = 14 where menu_id = 38

--PARENT MENU
EXEC SP_Tambah_Menu_Modul_Parent_Anas 'Master Pegawai', 1
--MENU/CHILD MENU
EXEC SP_Tambah_Menu_Modul_Anas 'Pelamar','module/pegawai/pelamarlist.aspx',24, 1
EXEC SP_Tambah_Menu_Modul_Anas 'Kontrak','module/pegawai/kontraklist.aspx',24, 1
EXEC SP_Tambah_Menu_Modul_Anas 'Pegawai','module/pegawai/pegawailist.aspx',24, 1
EXEC SP_Tambah_Menu_Modul_Anas 'Kuota Cuti','module/pegawai/kuotacutilist.aspx',24, 1
EXEC SP_Tambah_Menu_Modul_Anas 'Absensi','module/pegawai/absensilist.aspx',24, 1
--update MASTER_MENU set parent_menu_id = 23 where menu_id = 41

--PARENT MENU
EXEC SP_Tambah_Menu_Modul_Parent_Anas 'Transaksi', 1
--MENU/CHILD MENU
EXEC SP_Tambah_Menu_Modul_Anas 'Kehadiran','module/transaksi/kehadiranlist.aspx',29, 1
EXEC SP_Tambah_Menu_Modul_Anas 'Cuti','module/transaksi/cutilist.aspx',29, 1
EXEC SP_Tambah_Menu_Modul_Anas 'Tunjangan','module/transaksi/tunjanganlist.aspx',29, 1
EXEC SP_Tambah_Menu_Modul_Anas 'Pinjaman','module/transaksi/pinjamanlist.aspx',29, 1
EXEC SP_Tambah_Menu_Modul_Anas 'Potongan','module/transaksi/potonganlist.aspx',29, 1
EXEC SP_Tambah_Menu_Modul_Anas 'Penggajian','module/transaksi/penggajianlist.aspx',29, 1
EXEC SP_Tambah_Menu_Modul_Anas 'Shift','module/transaksi/shiftlist.aspx',29, 1
--update MASTER_MENU set parent_menu_id = 28 where menu_id = 39

--PARENT MENU
EXEC SP_Tambah_Menu_Modul_Parent_Anas 'Persetujuan', 1
--MENU/CHILD MENU
EXEC SP_Tambah_Menu_Modul_Anas 'Persetujuan Pinjaman','module/persetujuan/apvpinjamanlist.aspx',36, 1
EXEC SP_Tambah_Menu_Modul_Anas 'Persetujuan Penggajian','module/persetujuan/apvpenggajianlist.aspx',36, 1

		


