import pandas as pd
import matplotlib.pyplot as plt

# Baca file CSV
df = pd.read_csv('output.csv')

# Pilih hanya kolom yang diperlukan (sesuaikan sesuai struktur CSV Anda)
selected_columns = ['issue_type', 'file_path', 'line_number', 'message']
df_selected = df[selected_columns]

# Hitung jumlah masalah per jenis
issue_counts = df['issue_type'].value_counts()

# Tentukan warna untuk setiap jenis masalah
colors = ['skyblue', 'lightcoral', 'lightgreen', 'orange', 'lightblue']

# Buat pie chart untuk setiap jenis masalah
plt.figure(figsize=(12, 8))
for i, (issue_type, count) in enumerate(issue_counts.items()):
    plt.subplot(2, 3, i+1)
    plt.pie([count, len(df) - count], labels=['', issue_type], autopct='%1.1f%%', colors=colors)
    plt.title(f'{issue_type} ({count} issues)')

plt.tight_layout()

# Tampilkan plot
plt.show()
