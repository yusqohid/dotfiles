/*
Nama File       : 7.c
Programmer      : M Yusqo Hidayatulhaq
NIM             : 24343058
Tgl. pembuatan  : 17/02/2025
Deskripsi       : Bab 3 - Studi Kasus Pointer bagian 2
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    int id;
    char nama[50];
    float harga;
} Barang;

void judul();
void tambahBarang(Barang **barang, int *jumlah, int id, const char *nama, float harga);
void tampilkanBarang(Barang **barang, int jumlah);
void updateBarang(Barang **barang, int jumlah, int id, const char *nama, float harga);
void hapusBarang(Barang **barang, int *jumlah, int id);

int main() {
    judul();
    Barang *barang[100]; // Array pointer untuk menyimpan barang
    int jumlah = 0;

    while (1) {
        printf("\nMenu Pengelolaan Tabel Data Barang:\n");
        printf("1. Tambah Barang\n");
        printf("2. Tampilkan Barang\n");
        printf("3. Update Barang\n");
        printf("4. Hapus Barang\n");
        printf("5. Keluar\n");
        printf("Pilih operasi: ");
        int pilihan;
        scanf("%d", &pilihan);

        if (pilihan == 5) break;

        int id;
        char nama[50];
        float harga;

        switch (pilihan) {
            case 1:
                printf("Masukkan ID Barang: ");
                scanf("%d", &id);
                printf("Masukkan Nama Barang: ");
                scanf(" %[^\n]s", nama);
                printf("Masukkan Harga Barang: ");
                scanf("%f", &harga);
                tambahBarang(barang, &jumlah, id, nama, harga);
                break;
            case 2:
                tampilkanBarang(barang, jumlah);
                break;
            case 3:
                printf("Masukkan ID Barang yang ingin diupdate: ");
                scanf("%d", &id);
                printf("Masukkan Nama Baru Barang: ");
                scanf(" %[^\n]s", nama);
                printf("Masukkan Harga Baru Barang: ");
                scanf("%f", &harga);
                updateBarang(barang, jumlah, id, nama, harga);
                break;
            case 4:
                printf("Masukkan ID Barang yang ingin dihapus: ");
                scanf("%d", &id);
                hapusBarang(barang, &jumlah, id);
                break;
            default:
                printf("Pilihan tidak valid!\n");
        }
    }

    // Bebaskan memori semua barang
    for (int i = 0; i < jumlah; i++) {
        free(barang[i]);
    }

    return 0;
}

void judul(){
    printf("Nama File       : 7.c\n");
    printf("Programmer      : M Yusqo Hidayatulhaq\n");
    printf("NIM             : 24343058\n");
    printf("Tgl. pembuatan  : 17/02/2025\n");
    printf("Deskripsi       : Bab 3 - Studi Kasus Pointer bagian 2\n");
}

void tambahBarang(Barang **barang, int *jumlah, int id, const char *nama, float harga) {
    barang[*jumlah] = (Barang *)malloc(sizeof(Barang)); // Alokasi memori untuk barang baru
    barang[*jumlah]->id = id;
    snprintf(barang[*jumlah]->nama, sizeof(barang[*jumlah]->nama), "%s", nama);
    barang[*jumlah]->harga = harga;
    (*jumlah)++;
    printf("Barang berhasil ditambahkan!\n");
}

void tampilkanBarang(Barang **barang, int jumlah) {
    printf("Data Barang:\n");
    for (int i = 0; i < jumlah; i++) {
        printf("ID: %d, Nama: %s, Harga: Rp%.2f\n", barang[i]->id, barang[i]->nama, barang[i]->harga);
    }
}

void updateBarang(Barang **barang, int jumlah, int id, const char *nama, float harga) {
    for (int i = 0; i < jumlah; i++) {
        if (barang[i]->id == id) {
            snprintf(barang[i]->nama, sizeof(barang[i]->nama), "%s", nama);
            barang[i]->harga = harga;
            printf("Data barang dengan ID %d berhasil diperbarui!\n", id);
            return;
        }
    }
    printf("Barang dengan ID %d tidak ditemukan!\n", id);
}

void hapusBarang(Barang **barang, int *jumlah, int id) {
    for (int i = 0; i < *jumlah; i++) {
        if (barang[i]->id == id) {
            free(barang[i]); // Bebaskan memori barang
            for (int j = i; j < *jumlah - 1; j++) {
                barang[j] = barang[j + 1];
            }
            (*jumlah)--;
            printf("Barang dengan ID %d berhasil dihapus!\n", id);
            return;
        }
    }
    printf("Barang dengan ID %d tidak ditemukan!\n", id);
}