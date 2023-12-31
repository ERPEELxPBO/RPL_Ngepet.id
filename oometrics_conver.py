import pandas as pd

# Membuat DataFrame kosong hanya dengan header
df = pd.DataFrame(columns=['issue_type', 'file_path', 'line_number', 'message'])

# Menyimpan DataFrame dengan header ke file CSV
df.to_csv('output2.csv', index=False)

# Membaca file teks
with open('oometrics.txt', 'r', encoding='latin-1') as file:
    lines = file.readlines()

# Menginisialisasi list kosong untuk menyimpan data
data = []

# Memproses setiap baris
for line in lines:
    # Membersihkan karakter null dari baris
    cleaned_line = line.replace('\x00', '')
    
    parts = cleaned_line.strip().split(' - ')
    
    if len(parts) >= 4:
        issue_type = parts[0].strip()
        message = parts[1].strip()
        file_path_line_number = parts[2].strip()
        additional_info = parts[3].strip()

        file_path, line_number = file_path_line_number.rsplit(':', 1)

        data.append([issue_type, file_path, line_number, message])

# Membuat DataFrame dari data
df_data = pd.DataFrame(data, columns=['issue_type', 'file_path', 'line_number', 'message'])

# Menambahkan data ke DataFrame yang sudah ada
df = pd.concat([df, df_data], ignore_index=True)

# Menyimpan DataFrame yang sudah terisi ke file CSV
df.to_csv('output2.csv', index=False)

print("Final Data:", data[:5])
