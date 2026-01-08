import 'package:flutter/material.dart';
import '../theme/app_color.dart';

class AjukanEvent extends StatefulWidget {
  const AjukanEvent({super.key});

  @override
  State<AjukanEvent> createState() => _AjukanEventState();
}

class _AjukanEventState extends State<AjukanEvent> {
  final namaEventController = TextEditingController();
  final penyelenggaraController = TextEditingController();
  final alamatController = TextEditingController();
  final hargaRegulerController = TextEditingController();
  final hargaVipController = TextEditingController();

  Map<String, bool> jenisEvent = {
    "Konser": false,
    "Pameran Seni": false,
    "Workshop": false,
    "Seminar": false,
    "UMKM": false,
    "Olahraga": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColor.primary, AppColor.secondary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _header(context),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: ListView(
                    children: [
                      /// Nama Event & Penyelenggara (SEJAJAR)
                      Row(
                        children: [
                          Expanded(
                            child: _input("Nama Event", namaEventController),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _input(
                              "Penyelenggara",
                              penyelenggaraController,
                            ),
                          ),
                        ],
                      ),

                      _input("Alamat", alamatController),

                      const SizedBox(height: 20),
                      const Text(
                        "Jenis Event",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),

                      GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 4,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: jenisEvent.keys.map((e) {
                          return CheckboxListTile(
                            value: jenisEvent[e],
                            title: Text(e),
                            controlAffinity: ListTileControlAffinity.leading,
                            onChanged: (val) {
                              setState(() => jenisEvent[e] = val!);
                            },
                          );
                        }).toList(),
                      ),

                      const SizedBox(height: 20),
                      const Text(
                        "Harga Tiket",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),

                      Row(
                        children: [
                          Expanded(
                            child: _input(
                              "Reguler",
                              hargaRegulerController,
                              isNumber: true,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _input(
                              "VIP",
                              hargaVipController,
                              isNumber: true,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),
                      _submitButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// HEADER + TOMBOL KEMBALI
  Widget _header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 8),
          const Text(
            "Ajukan Eventmu",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  /// INPUT FIELD
  Widget _input(
    String label,
    TextEditingController controller, {
    bool isNumber = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: AppColor.background,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  /// BUTTON AJUKAN
  Widget _submitButton() {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: () {
          // nanti diarahkan ke BuktiPembayaran / DetailEventSaya
        },
        child: const Text(
          "Ajukan Event",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
