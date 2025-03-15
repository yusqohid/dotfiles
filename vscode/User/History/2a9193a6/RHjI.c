/*
Nama File       : 3.c
Programmer      : M Yusqo Hidayatulhaq
NIM             : 24344058
Tgl. pembuatan  : 17/02/2025
Deskripsi       : Transversal Array
*/

#include <stdio.h>

// Deklarasi fungsi untuk membaca elemen dari array 2 dimensi
void bacaData(int arr[][3], int baris, int kolom, int barisMax, int kolomMax);

int main() {
    judul();
    int arr[2][3] = {
        {1, 2, 3},
        {4, 5, 6}
    };

    printf("Masukkan posisi baris dan kolom untuk membaca data (contoh: 1 2): ");
    int baris, kolom;
    scanf("%d %d", &baris, &kolom);

    bacaData(arr, baris, kolom, 2, 3);

    return 0;
}

// Definisi fungsi untuk membaca elemen dari array 2 dimensi
void bacaData(int arr[][3], int baris, int kolom, int barisMax, int kolomMax) {
    if (baris >= 0 && baris < barisMax && kolom >= 0 && kolom < kolomMax) {
        printf("Data pada posisi [%d][%d] adalah: %d\n", baris, kolom, arr[baris][kolom]);
    } else {
        printf("Posisi tidak valid! Tidak dapat membaca data.\n");
    }
}

void judul(){
	printf("PROGRAM BACA DATA ARRAY 2 DIMENSI\n");
	printf("---------------------------------\n");
	printf("Nama	: M Yusqo Hidayatulhaq\n");
	printf("NIM 	: 24343058\n");
	printf("---------------------------------\n");
}

