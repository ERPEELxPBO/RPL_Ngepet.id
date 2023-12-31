import 'dart:convert';
import 'dart:io';

void main() {
  // Nama file output.txt
  String fileName = 'oometrics.txt';

  try {
    // Membaca isi file output.txt dengan encoding 'latin1'
    List<String> lines = File(fileName).readAsLinesSync(encoding: latin1);

    // Buat header untuk file CSV
    String csvContent = "issue_type,file_path,line_number,message\n";

    // Iterasi melalui setiap baris dan konversi ke format CSV
    lines.forEach((line) {
      // Menghilangkan spasi di awal dan akhir setiap baris
      line = line.trim();

      // Memeriksa apakah baris tidak kosong
      if (line.isNotEmpty) {
        // Memisahkan baris berdasarkan delimiter yang sesuai
        List<String> parts = line.split(" - ");
        if (parts.length == 3) {
          csvContent += "${parts[2]},${parts[0]},${parts[1]}\n";
        }
      }
    });

    // Simpan hasilnya ke file CSV
    saveToCSV(csvContent, "output_oo_metrics.csv");
    print("Data berhasil diubah dan disimpan ke output_oo_metrics.csv");
  } catch (error) {
    print("Terjadi kesalahan: $error");
  }
}

void saveToCSV(String content, String fileName) {
  try {
    // Simpan isi ke file CSV
    File(fileName).writeAsStringSync(content);
  } catch (error) {
    print("Gagal menyimpan ke file CSV: $error");
  }
}
