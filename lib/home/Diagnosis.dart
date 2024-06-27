import 'package:flutter/material.dart';

class DiagnosisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFF2F9F1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.black),
      ),
      child: SizedBox(
        height: 350, // Adjust the height as needed
        child: Scrollbar(
          thickness: 10,
          trackVisibility: true,
          radius: const Radius.circular(3),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Diagnosis and Treatment\n(Diagnosa dan Pencegahan)',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'LeagueSpartan',
                      color: const Color(0xFF5C715E),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Hindari sinar matahari pada siang hari, karena paparan terkuat sinar UV dari matahari berlangsung pada jam 10 pagi hingga 4 sore.\n',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'LeagueSpartan',
                    color: const Color(0xFF5C715E),
                  ),
                ),
                Text(
                  '• Gunakan tabir surya secara rutin, untuk mencegah penyerapan sinar UV ke dalam kulit dan mengurangi risiko kerusakan kulit akibat sinar matahari.\n',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'LeagueSpartan',
                    color: const Color(0xFF5C715E),
                  ),
                ),
                Text(
                  '• Kenakan pakaian yang menutupi tubuh, seperti baju lengan panjang dan celana panjang, untuk melindungi kulit dari sinar matahari.\n',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'LeagueSpartan',
                    color: const Color(0xFF5C715E),
                  ),
                ),
                Text(
                  '• Gunakan pula topi dan kacamata hitam saat keluar rumah, untuk memberikan perlindungan lebih terhadap kepala dan mata dari radiasi sinar matahari.\n',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'LeagueSpartan',
                    color: const Color(0xFF5C715E),
                  ),
                ),
                Text(
                  '• Hindari penggunaan tanning bed, yaitu alat untuk menggelapkan kulit, karena dapat memancarkan radiasi ultraviolet yang berbahaya bagi kulit.\n',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'LeagueSpartan',
                    color: const Color(0xFF5C715E),
                  ),
                ),
                Text(
                  '• Hati-hati saat menggunakan obat yang menyebabkan efek samping pada kulit, seperti antibiotik. Agar aman, konsultasikan kepada dokter terlebih dulu.\n',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'LeagueSpartan',
                    color: const Color(0xFF5C715E),
                  ),
                ),
                Text(
                  '• Lakukan pemeriksaan kulit secara rutin dan segera konsultasikan kepada dokter jika Anda mencurigai adanya perubahan atau kelainan pada kulit.\n',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'LeagueSpartan',
                    color: const Color(0xFF5C715E),
                  ),
                ),
                Text(
                  'Ayo kenali gejala dini kanker kulit. Periksakan gejala kanker kulit Anda sekarang!\n',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'LeagueSpartan',
                    color: const Color(0xFF5C715E),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Action for the button
                    },
                    child: Text(
                      'Click For Check',
                      style: TextStyle(
                        fontFamily: 'LeagueSpartan',
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color(0xFFF2F9F1),
                      backgroundColor: const Color(0xFF5C715E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
