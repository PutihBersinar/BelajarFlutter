import 'package:flutter/material.dart';

void main() {
  runApp(const CashflowApp());
}

// 1. Root Aplikasi
class CashflowApp extends StatelessWidget {
  const CashflowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cashflow',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

// 2. Halaman Utama (Stateful karena saldo akan berubah dinamis)
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  // Fungsi untuk memunculkan Bottom Sheet Form Input
  void _showInputForm() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Penting: agar form bisa digeser naik saat keyboard muncul
      builder: (BuildContext ctx) {
        return Padding(
          // Menambahkan padding bawah sesuai tinggi keyboard
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Tinggi form menyesuaikan isi konten
            children: [
              const Text(
                'Tambah Transaksi', 
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
              ),
              const SizedBox(height: 16),
              
              // TODO: Tambahkan TextField untuk Nominal, Kategori, dll di sini nanti
              const Placeholder(fallbackHeight: 100), // Placeholder sementara
              
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Logika simpan data ke database (SQLite/MariaDB)
                    Navigator.pop(ctx); // Tutup bottom sheet setelah simpan
                  },
                  child: const Text('Simpan'),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catatan Keuangan'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          // Bagian Atas: Dashboard Saldo
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: const Column(
              children: [
                Text('Total Saldo', style: TextStyle(fontSize: 16)),
                SizedBox(height: 8),
                Text(
                  'Rp 0', // Nanti akan diformat dinamis dengan package intl
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          
          // Bagian Bawah: Daftar Riwayat Transaksi
          const Expanded(
            child: Center(
              child: Text('Belum ada transaksi.'),
              // TODO: Ganti Center ini dengan ListView.builder untuk menampilkan data
            ),
          ),
        ],
      ),
      // Tombol '+' di kanan bawah
      floatingActionButton: FloatingActionButton(
        onPressed: _showInputForm,
        child: const Icon(Icons.add),
      ),
    );
  }
}