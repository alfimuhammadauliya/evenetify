import 'package:flutter/material.dart';

class DetailEventSaya extends StatelessWidget {
  final String eventTitle;
  final bool isAjukan; // True jika ini adalah detail dari "Event Yang Diajukan"

  const DetailEventSaya({
    super.key,
    required this.eventTitle,
    this.isAjukan = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- HEADER GRADIENT (Identik Gambar 2) ---
            Container(
              height: 220,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0056B3), Color(0xFFC848D7)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: -10, left: -15,
                    child: Opacity(
                      opacity: 0.4,
                      child: Icon(Icons.settings_outlined, color: Colors.white, size: 130),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: const EdgeInsets.only(top: 40),
                      height: 110, width: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white54, width: 2),
                      ),
                      child: const Icon(Icons.theater_comedy_outlined, color: Colors.white, size: 65),
                    ),
                  ),
                  Positioned(
                    top: 55, left: 25,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                        child: const Icon(Icons.arrow_back, color: Color(0xFF0056B3), size: 16),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30, left: 25,
                    child: Text(
                      isAjukan ? "Detail Pengajuan" : "Detail Event Saya",
                      style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
            ),

            // --- KONTEN DINAMIS ---
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventTitle.toUpperCase(),
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Colors.black),
                  ),
                  const SizedBox(height: 15),

                  // KONDISI 1: TAMPILAN UNTUK PENGAJUAN (Logika Gambar 13)
                  if (isAjukan) ...[
                    // STEP 4: BANNER STATUS DI ATAS (Bisa berubah otomatis dari Firebase)
                    _buildStatusBannerTop("MENUNGGU PEMBAYARAN"), 
                    const SizedBox(height: 25),

                    _buildInfoRowDetail("Penyelenggara", "Universitas Teknologi Bandung"),
                    _buildInfoRowDetail("Lokasi Event", "Aula Lantai 4, Gedung A"),
                    _buildInfoRowDetail("Jenis Event", "Seminar"),
                    const SizedBox(height: 20),
                    
                    _buildLabelCokelat("Deskripsi Event :"),
                    const SizedBox(height: 5),
                    const Text(
                      "Seminar Nasional 2025 merupakan kegiatan akademik yang menghadirkan narasumber nasional untuk membahas inovasi di era digital.",
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                    const SizedBox(height: 20),

                    _buildLabelCokelat("Harga Tiket / Biaya Sewa :"),
                    const SizedBox(height: 10),
                    _buildTicketPriceRow("Reguler", "Rp50.000"),
                    _buildTicketPriceRow("VIP", "Rp100.000"),
                    
                    const Divider(height: 40),

                    // STEP 2: QR CODE UNTUK PEMBAYARAN DI BAWAH
                    _buildPaymentQRSection(),
                  ] 
                  
                  // KONDISI 2: TAMPILAN JIKA SUDAH JADI TIKET MASUK
                  else ...[
                    _buildInfoRowDetail("Kode Pemesanan", "EVT- A1B2C3D4E"),
                    _buildInfoRowDetail("Tanggal Event", "12 Desember 2025"),
                    _buildInfoRowDetail("Waktu", "19.00 WIB Sd. Selesai"),
                    const SizedBox(height: 25),
                    _buildLabelCokelat("Nama Pengunjung :"),
                    const Text("Admin Amin", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 15),
                    _buildLabelCokelat("Jenis Tiket :"),
                    const Text("VVIP", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 40),
                    _buildQrCodeTicketSection(),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- HELPER WIDGETS ---

  // Banner Status yang ada di bagian atas kodingan
  Widget _buildStatusBannerTop(String statusText) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.orange.shade200),
      ),
      child: Row(
        children: [
          Icon(Icons.hourglass_bottom_rounded, color: Colors.orange.shade700, size: 20),
          const SizedBox(width: 12),
          Text(
            "STATUS: $statusText",
            style: TextStyle(color: Colors.orange.shade900, fontWeight: FontWeight.bold, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRowDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(label, style: const TextStyle(color: Color(0xFF555151), fontWeight: FontWeight.bold, fontSize: 15)),
          ),
          const Text(" : ", style: TextStyle(color: Color(0xFF555151), fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(value, style: const TextStyle(color: Color(0xFF555151), fontWeight: FontWeight.bold, fontSize: 15)),
          ),
        ],
      ),
    );
  }

  Widget _buildLabelCokelat(String text) {
    return Text(text, style: const TextStyle(color: Color(0xFF363333), fontWeight: FontWeight.bold, fontSize: 15));
  }

  Widget _buildTicketPriceRow(String category, String price) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(category, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(price, style: const TextStyle(color: Color(0xFF0056B3), fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  // Bagian QR Code khusus untuk Pembayaran ke Admin
  Widget _buildPaymentQRSection() {
    return Center(
      child: Column(
        children: [
          const Text(
            "QR Verifikasi Pengajuan Event",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.blue.shade200, width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.network(
              'https://bwipjs-api.metafloor.com/?bcid=qrcode&text=PAY-EVENT-123&scale=3',
              width: 150, height: 150, fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            "Tunjukkan QR ini ke pengurus untuk\nproses pembayaran & aktivasi event.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.grey, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }

  // Bagian QR Code jika status sudah menjadi Tiket Masuk
  Widget _buildQrCodeTicketSection() {
    return Center(
      child: Column(
        children: [
          const Text("Tunjukan Barcode Ini Di Pintu Masuk", 
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black12, width: 1.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.network(
              'https://bwipjs-api.metafloor.com/?bcid=qrcode&text=TICKET-ACTIVE-99&scale=3',
              width: 180, height: 180, fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}