import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Task Tracker',
      home: const HalamanTugas(),
    );
  }
}

class HalamanTugas extends StatefulWidget {
  const HalamanTugas({super.key});

  @override
  State<HalamanTugas> createState() => _HalamanTugasState();
}

class _HalamanTugasState extends State<HalamanTugas> {  
  final List<String> daftarTugas = [];

  final TextEditingController controllerTugas = TextEditingController();

  void tambahTugas() {
    setState(() {
      daftarTugas.add(controllerTugas.text);
      controllerTugas.clear();
    });
  }

  void hapusTugas(int index) {
    setState(() {
      daftarTugas.removeAt(index);
    });
  }

  void editTugas(int index, String tugasBaru) {
    setState(() {
      daftarTugas[index] = tugasBaru;
    });
  }

void centang(int index) {
  setState(() {
    if (daftarTugas[index].startsWith('✅ ')) {
      daftarTugas[index] = daftarTugas[index].replaceFirst('✅ ', '');
    } else {
      daftarTugas[index] = '✅ ${daftarTugas[index]}';
    }
  });
}

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.grey[200],
    appBar: AppBar(
      title: const Text('Mini Task Tracker'),
      centerTitle: true,
      backgroundColor: Colors.blueAccent,
    ),
    
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            'Daftar Tugas',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controllerTugas,
                  decoration: const InputDecoration(
                    hintText: 'Masukkan tugas baru',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: tambahTugas,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                ),
                child: const Text('Tambah'),
              ),
            ],
          ),
          
          const SizedBox(height: 20),
        
          Expanded(
            child: ListView.builder(
              itemCount: daftarTugas.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: IconButton(
                    icon: Icon(
                    daftarTugas[index].startsWith('✅ ')
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                    color: Colors.green,
                    ),
                    onPressed: () => centang(index),
                    ),

                    title: Text(daftarTugas[index]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            final TextEditingController controllerEdit =
                                TextEditingController(text: daftarTugas[index]);
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Edit Tugas'),
                                  content: TextField(
                                    controller: controllerEdit,
                                    decoration: const InputDecoration(
                                      hintText: 'Masukkan tugas baru',
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Batal'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        editTugas(index, controllerEdit.text);
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Simpan'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => hapusTugas(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
}