/*
Nama File       : 5.c
Programmer      : M Yusqo Hidayatulhaq
NIM             : 24344058
Tgl. pembuatan  : 17/02/2025
Deskripsi       : Bab 3 - Pointer ke Struct
*/

#include <stdio.h>
#include <stdlib.h>

void judul();

typedef struct {
    int id;
    char nama[50];
} Mahasiswa;

int main() {
	judul();
    Mahasiswa *mhs = (Mahasiswa *)malloc(sizeof(Mahasiswa)); // Alokasi memori

    mhs->id = 24343058;
    snprintf(mhs->nama, sizeof(mhs->nama), "Yusqo Hidayatulhaq");

    printf("ID: %d\n", mhs->id);
    printf("Nama: %s\n", mhs->nama);

    free(mhs); // Membebaskan memori
    return 0;
}

void judul(){
	printf("PROGRAM POINTER ke STRUCT\n");
	printf("---------------------------------\n");
	printf("Nama	: M Yusqo Hidayatulhaq\n");
	printf("NIM 	: 24343058\n");
	printf("---------------------------------\n");
}
