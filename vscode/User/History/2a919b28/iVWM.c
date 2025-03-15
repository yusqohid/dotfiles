/*
Nama File       : 1.c
Programmer      : M Yusqo Hidayatulhaq
NIM             : 24344058
Tgl. pembuatan  : 17/02/2025
Deskripsi       : Hapus Array 2 Dimensi
*/

#include <stdio.h>

// Deklarasi fungsi untuk menghapus elemen dari array 2 dimensi
void hapusData(int arr[][3], int baris, int kolom, int barisMax, int kolomMax);

int main() {
    int arr[2][3] = {
        {1, 2, 3},
        {4, 5, 6}
    };

    printf("Array sebelum penghapusan:\n");
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 3; j++) {
            printf("%d ", arr[i][j]);
        }
        printf("\n");
    }

    printf("\nMasukkan posisi baris dan kolom untuk penghapusan (contoh: 1 2): ");
    int baris, kolom;
    scanf("%d %d", &baris, &kolom);

    hapusData(arr, baris, kolom, 2, 3);

    printf("\nArray setelah penghapusan:\n");
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 3; j++) {
            printf("%d ", arr[i][j]);
        }
        printf("\n");
    }

    return 0;
}

// Definisi fungsi untuk menghapus elemen dari array 2 dimensi
void hapusData(int arr[][3], int baris, int kolom, int barisMax, int kolomMax) {
    if (baris >= 0 && baris < barisMax && kolom >= 0 && kolom < kolomMax) {
        arr[baris][kolom] = 0; // Mengganti elemen dengan nilai default (0)
        printf("Data pada posisi [%d][%d] telah dihapus.\n", baris, kolom);
    } else {
        printf("Posisi tidak valid! Tidak dapat menghapus data.\n");
    }
}

void judul(){
	printf("PROGRAM HAPUS DATA ARRAY 2 DIMENSI\n");
	printf("---------------------------------\n");
	printf("Nama	: M Yusqo Hidayatulhaq\n");
	printf("NIM 	: 24343058\n");
	printf("---------------------------------\n");
}

