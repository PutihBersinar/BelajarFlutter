# Mini Task Tracker (Flutter)

Aplikasi pelacak tugas sederhana (*Mini Task Tracker*) berbasis Flutter yang mendukung fitur tambah tugas, edit tugas, hapus tugas, serta menandai tugas yang telah selesai.

## Identitas Mahasiswa

* **Azman Fathary Baswara:**
* **103012500360:**

## Tampilan Aplikasi (*Screenshot*)

Berikut adalah tampilan antarmuka aplikasi **Mini Task Tracker** saat dijalankan:

![Tampilan Aplikasi Mini Task Tracker](SS_Apk.jpeg)


## Langkah Menjalankan Aplikasi (*How to Run*)

1. **Clone repositori ini** ke komputer lokal Anda:
   ```bash
   git clone <url-repositori-github-anda>
   ```

2. **Masuk ke direktori proyek**:
   ```bash
   cd <nama-folder-proyek>
   ```

3. **Unduh semua dependensi Flutter** yang diperlukan:
   ```bash
   flutter pub get
   ```

4. **Jalankan aplikasi** pada emulator atau perangkat fisik yang terhubung:
   ```bash
   flutter run
   ```

## Deklarasi Penggunaan AI

* **Apakah menggunakan AI?** Ya
* **Tool AI yang digunakan:** Gemini 3 Flash
* **Estimasi persentase kontribusi AI:** 30 % (Maksimal 40%)
* **Bagian kode/fitur yang dibantu AI:**
  Memperbaiki tata letak widget (`Column`, `Row`, `ListView.builder`, dan `ListTile`), menyesuaikan fungsi *toggle* centang tugas, serta menghilangkan banner debug.
* **Pernyataan:**
  "Saya menyatakan bahwa saya memahami alur dan fungsi dari seluruh kode yang ada dalam repositori ini"

---

## Riwayat Percakapan dengan AI

Berikut adalah dokumentasi percakapan dengan AI dari awal permintaan perbaikan tampilan hingga seluruh fitur selesai diperbaiki:

### 1. Perbaikan Tata Letak (*Layout*) Widget
**User:**
> *(Mengirimkan kode method `build` dan screenshot tampilan awal di mana daftar tugas menumpuk di tengah dan terpotong secara vertikal)*  
> "perbaikan posisi widget nya bagaimana"

**AI (Gemini):**
> Masalah utama pada tata letak (*layout*) ada pada penempatan `ListView.builder` yang **berada di dalam `Row`** (sejajar menyamping dengan `TextField` dan `ElevatedButton`), serta penggunaan `Center` dan `mainAxisSize: MainAxisSize.min` yang membuat konten menumpuk di tengah layar.
> 
> **Poin perbaikan:**
> 1. **Keluarkan `ListView.builder` dari `Row`**: `Row` hanya boleh berisi `TextField` dan `ElevatedButton`. Pindahkan `ListView.builder` ke bawahnya (menjadi *child* langsung dari `Column`).
> 2. **Hapus `Center` dan `mainAxisSize: MainAxisSize.min`**: Ganti `Center` dengan `Padding` agar tampilan dimulai rapi dari atas ke bawah.
> 3. **Tambahkan `Card`**: Membungkus `ListTile` dengan `Card` agar daftar tugas lebih rapi dan terpisah dengan jelas.

---

### 2. Penambahan Fitur Centang Tugas
**User:**
> ```dart
> void centang(int index) {
>   setState(() {
>     daftarTugas[index] = '✅ ${daftarTugas[index]}';
>   });
> }
> ```
> "jika menambahkan ini widgetny bagaimana"

**AI (Gemini):**
> Untuk memanggil fungsi `centang(index)`, tambahkan `IconButton` di bagian `leading` (sebelah kiri teks tugas) pada `ListTile`. Disarankan juga menambahkan logika pengecekan (*toggle*) agar tanda `✅` tidak bertambah berkali-kali jika tombol ditekan ulang:
> ```dart
> void centang(int index) {
>   setState(() {
>     if (daftarTugas[index].startsWith('✅ ')) {
>       daftarTugas[index] = daftarTugas[index].replaceFirst('✅ ', '');
>     } else {
>       daftarTugas[index] = '✅ ${daftarTugas[index]}';
>     }
>   });
> }
> ```

---

### 3. Penempatan Widget `ListTile`
**User:**
> "listtile taruhnya dimana"

**AI (Gemini):**
> `ListTile` diletakkan di dalam `itemBuilder` milik `ListView.builder` (di dalam widget `Card`), lengkap dengan properti `leading` untuk tombol centang, `title` untuk teks tugas, dan `trailing` untuk tombol edit serta hapus.

---

### 4. Menghilangkan Banner "DEBUG"
**User:**
> *(Mengirimkan screenshot pita merah bertuliskan "DEBUG" di pojok kanan atas aplikasi)*  
> "Tulisan ini ada karena apa"

**AI (Gemini):**
> Pita merah bertuliskan **DEBUG** muncul otomatis karena aplikasi Flutter sedang dijalankan dalam mode pengembangan (*debug mode*). Untuk menghilangkannya, tambahkan properti `debugShowCheckedModeBanner: false` di dalam widget `MaterialApp` pada file `main.dart`:
> ```dart
> MaterialApp(
>   debugShowCheckedModeBanner: false,
>   home: ... // Halaman utama
> )
> ```
