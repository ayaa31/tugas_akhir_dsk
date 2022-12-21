.MODEL SMALL
.CODE

ORG 100h

JMP Mulai

;Variabel
nama    DB 0dh, 0ah, 0dh, 0ah, "Masukan Nama Anda : ", '$'
nim     DB 0dh, 0ah, "Masukan NIM Anda : ", '$'
psn1    DB "PROGRAM PEMINJAMAN RUANG KELAS", 0dh, 0ah, "----------------------------", '$' 
psn2    DB 0dh, 0dh, 0dh, 0ah, 0dh, 0ah, "Selamat Datang Di Bagian Peminjaman ruang kelas  ...", '$' 
psn3    DB 0dh, 0dh, 0dh, 0ah, 0dh, 0ah, "kelas Yang Dapat Di Pinjam Saat Ini : ", 0dh, 0ah 
        DB "=====================", 0dh, 0ah
        DB "=   1. Kelas A            =", 0dh, 0ah
        DB "=   2. Ruang Lab          =", 0dh, 0ah
        DB "=   3. Ruang Praktik      =", 0dh, 0ah
        DB "=   4. Ruang Olahraga     =", 0dh, 0ah
        DB "=====================", 0dh, 0ah
        DB 0dh, 0ah, "Ruang Yang Ingin Anda Pinjam ? ", '$'

psn4    DB 0dh, 0ah, "Peminjaman Berhasil...", '$'
psn5    DB 0dh, 0dh, 0dh, 0ah, 0dh, 0ah, "========================= PEMINJAMAN SELESAI =====================", 0dh, 0ah
        DB "Silahkan Bawa Bukti peminjaman ruang dan jangan lupa untuk pulang dengan selamat", '$'

psn6    DB 0dh, 0dh, 0dh, 0ah, 0dh, 0ah, "Ingin Meminjam kelas Lain ? (Y, N)", '$'
psn7    DB 0dh, 0dh, 0dh, 0ah, 0dh, 0ah, "Terimakasih Telah Menggunkan Aplikasi Ini..", '$'
error   DB 0dh, 0ah, "Masukan Kode Dengan Benar", '$'
msg1    DB 0dh, 0ah, 0dh, 0ah, "====== Kelas A ======", 0dh, 0ah, "Kelas ini difasilitasi oleh 6 komputer dan 1 proyektor", 0dh, 0ah, "Ruang  kelas wajib di kembalikan dengan kondisi yang sama saat di pinjam" , '$'
msg2    DB 0dh, 0ah, 0dh, 0ah, "====== Ruang Lab ======", 0dh, 0ah, "Ruang Lab ini difasilitasi oleh 40 komputer dan 2 lemari alat", 0dh, 0ah, "Ruang kelas wajib  di kembalikan dengan kondisi yang sama saat di pinjam" , '$'
msg3    DB 0dh, 0ah, 0dh, 0ah, "====== Ruang Praktik ======", 0dh, 0ah, "Ruang Praktik ini difasiltasi oleh 7 alat praktik jurusan ini", 0dh, 0ah, "Ruang kelas wajib di kembalikan dengan kondisi yang sama saat di pinjam" , '$'
msg4    DB 0dh, 0ah, 0dh, 0ah, "====== Ruang Olahraga ======", 0dh, 0ah, "Ruang Olahraga ini difasilitasi alat olahraga lengkap", 0dh, 0ah, "Ruang kelas wajib di kembalikan dengan kondisi yang sama saat di pinjam" , '$'
msg5    DB 0dh, 0ah, 0dh, 0ah, "Ketik 'E' Untuk Mencetak Bukti dan Keluar dari program.... ", '$'

tampung_nama DB 30, ?, 30 dup(?)
tampung_nim DB 30, ?, 30 dup(?)
        
        
Mulai:
    MOV ah, 09
    LEA dx, psn1
    INT 21h
    
    MOV ah, 09
    LEA dx, nama
    INT 21h
    
    MOV ah, 0ah
    LEA dx, tampung_nama
    INT 21h
    PUSH dx
    
    MOV ah, 09
    LEA dx, nim
    INT 21h
    
    MOV ah, 0ah
    LEA dx, tampung_nim
    INT 21h
    PUSH dx
    
    MOV ah, 09
    LEA dx, psn2
    INT 21h
    
Mulai2:
    MOV ah, 09
    LEA dx, psn3
    INT 21h
    
Proses:
    MOV ah, 01
    INT 21h
    
    CMP al, '1'
    JE barang_1
    
    CMP al, '2'
    JE barang_2
    
    CMP al, '3'
    JE barang_3
    
    CMP al, '4'
    JE barang_4
    
    JNE psn_error
    
Proses2:
    MOV ah, 09
    LEA dx, psn6
    INT 21h
    MOV ah, 01
    INT 21h
    
    CMP al, 'Y'
    JE pinjam_lagi
    
    CMP al, 'y'
    JE pinjam_lagi
    
    CMP al, 'N'
    JE pinjam_selesai
    
    CMP al, 'n'
    JE pinjam_selesai
    
    JNE psn_error2

barang_1:
     MOV ah, 09
     LEA dx, psn4
     INT 21h
     
     MOV ah, 09
     LEA dx, msg1
     INT 21h   
     
     JMP Proses2
     
barang_2:
     MOV ah, 09
     LEA dx, psn4
     INT 21h
     
     MOV ah, 09
     LEA dx, msg2
     INT 21h   
     
     JMP Proses2

barang_3:
     MOV ah, 09
     LEA dx, psn4
     INT 21h
     
     MOV ah, 09
     LEA dx, msg3
     INT 21h   
     
     JMP Proses2 
     
barang_4:
     MOV ah, 09
     LEA dx, psn4
     INT 21h
     
     MOV ah, 09
     LEA dx, msg4
     INT 21h   
     
     JMP Proses2

pinjam_lagi:
    JMP Mulai2

pinjam_selesai:
    MOV ah, 09
    LEA dx, psn5
    INT 21h
    JMP Konfirmasi

psn_error:
    MOV ah, 09
    LEA dx, error
    INT 21h
    
    JMP Mulai2

psn_error2:
    MOV ah, 09
    LEA dx, error
    INT 21h
    
    JMP Proses2

Konfirmasi:
    MOV ah, 09
    LEA dx, msg5
    INT 21h
    MOV ah, 01
    INT 21h
    
    CMP al, 'E'
    JE Exit
    
    CMP al, 'e'
    JE Exit
    
    JNE psn_error
    
 

JMP Exit

Exit:
    MOV ah, 09
    LEA dx, psn7
    INT 21h 
    
    INT 20h
     
RET