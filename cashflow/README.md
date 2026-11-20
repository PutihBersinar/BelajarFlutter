# Cashflow

Aplikasi pencatat arus kas (pemasukan dan pengeluaran) sederhana dalam **Rupiah (IDR)**.
Dibuat dengan Flutter dan hanya untuk **Android**.

## Fitur

- Ringkasan **saldo**, total **pemasukan**, dan total **pengeluaran**
- Tambah transaksi: jenis (pemasukan/pengeluaran), keterangan, jumlah, dan tanggal
- Hapus transaksi dengan menggesernya ke kiri (ada tombol **Batal** untuk mengembalikan)
- Data tersimpan di HP, tetap ada setelah aplikasi ditutup
- Format angka Rupiah (contoh: `Rp 25.000`)

## Cara 1: Pasang langsung di HP (APK)

Cara tercepat, tanpa perlu memasang Flutter.

1. Unduh file `app-release.apk` dari halaman **Releases** repo ini.
2. Pindahkan ke HP Android (kabel USB, Google Drive, atau WhatsApp).
3. Buka file APK di HP, lalu ketuk **Install**.
   - Jika muncul "Install unknown apps", aktifkan izinnya untuk aplikasi yang kamu pakai membuka file tersebut.
   - Jika muncul peringatan Play Protect, pilih **Install anyway**.
4. Buka aplikasi **Cashflow**.

## Cara 2: Jalankan dari kode sumber

### Kebutuhan

- [Flutter SDK](https://docs.flutter.dev/install) (channel stable)
- [Android Studio](https://developer.android.com/studio) dengan Android SDK terpasang
- Emulator Android, atau HP Android dengan **USB debugging** aktif
- Koneksi internet saat build pertama (mengunduh Gradle dan dependensi)

Cek pemasangan dengan:

```bash
flutter doctor
```

Bagian **Flutter** dan **Android toolchain** harus bertanda centang. Jika lisensi Android belum diterima:

```bash
flutter doctor --android-licenses
```

### Langkah

1. Unduh proyek ini:

   ```bash
   git clone https://github.com/PutihBersinar/BelajarFlutter.git
   cd BelajarFlutter/cashflow
   ```

2. Pasang dependensi:

   ```bash
   flutter pub get
   ```

3. Nyalakan emulator atau colok HP, lalu cek perangkat terdeteksi:

   ```bash
   flutter devices
   ```

4. Jalankan aplikasi:

   ```bash
   flutter run
   ```

   Jika ada lebih dari satu perangkat, tambahkan `-d <id-perangkat>`.

Build pertama bisa memakan waktu 3-10 menit. Itu normal.

### Membuat APK sendiri

```bash
flutter build apk --release
```

Hasilnya ada di `build/app/outputs/flutter-apk/app-release.apk`.

## Pemecahan masalah

- **`flutter` tidak dikenali:** tambahkan folder `flutter/bin` ke PATH, lalu buka ulang terminal.
- **Perangkat tidak terdeteksi:** ganti kabel USB, ubah mode USB di HP ke *File transfer*, dan pastikan USB debugging aktif.
- **Banyak error merah di VS Code setelah memindahkan folder Flutter atau proyek:** jalankan `flutter clean` lalu `flutter pub get`, kemudian *Dart: Restart Analysis Server*.
- **Gagal mengunduh Gradle (HTTP 504):** masalah jaringan sementara. Coba ulang, ganti jaringan, atau gunakan VPN.
- **Error `Could not close incremental caches` (Kotlin):** jalankan `cd android && gradlew --stop`, lalu `flutter clean`, dan coba lagi.

## Teknologi

- Flutter (Material 3)
- [`intl`](https://pub.dev/packages/intl) untuk format Rupiah dan tanggal
- [`shared_preferences`](https://pub.dev/packages/shared_preferences) untuk penyimpanan lokal
