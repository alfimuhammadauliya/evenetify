import 'package:flutter/material.dart';
import 'DetailEventSaya.dart';

class EventSaya extends StatelessWidget {
  const EventSaya({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // HEADER SESUAI IMAGE_1BEC8B.PNG
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
                // Gear Outline (Kiri)
                Positioned(
                  top: 15,
                  left: -5,
                  child: Opacity(
                    opacity: 0.4,
                    child: Icon(Icons.settings_outlined, color: Colors.white, size: 110),
                  ),
                ),
                // Not Musik Outline (Kanan)
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Opacity(
                    opacity: 0.4,
                    child: Icon(Icons.music_note_outlined, color: Colors.white, size: 90),
                  ),
                ),
                // Ikon Panggung di Lingkaran
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.only(top: 40),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white54, width: 1.5),
                    ),
                    child: const Icon(Icons.theater_comedy_outlined, color: Colors.white, size: 55),
                  ),
                ),
                // Judul "Event Saya" Tepat di Tengah Bawah Panggung
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 25, bottom: 30),
                    child: Text(
                      "Event Saya",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                // Tombol Back Putih Kecil
                Positioned(
                  top: 55,
                  left: 25,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white24,
                    child: Icon(Icons.arrow_back, color: Colors.white, size: 18),
                  ),
                ),
              ],
            ),
          ),

          // LIST CONTENT
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(25),
              children: [
                const Text("Event Saya", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 15),
                _buildCard(context, "Festival Musik Nusantara 2025", false),
                _buildCard(context, "Festival Musik Nusantara 2025", false),
                
                const SizedBox(height: 25),
                
                const Text("Event Yang Diajukan", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 15),
                _buildCard(context, "Seminar Nasional 2025", true),
                _buildCard(context, "Seminar Nasional 2025", true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, bool isAjukan) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => DetailEventSaya(eventTitle: title, isAjukan: isAjukan)
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black26, width: 1.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Nama Event", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(title, style: const TextStyle(color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}