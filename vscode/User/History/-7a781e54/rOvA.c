/*
Nama File       : 3.c
Programmer      : M Yusqo Hidayatulhaq
NIM             : 24344058
Tgl. pembuatan  : 17/02/2025
Deskripsi       : Bab 3 - Pointer dan String
*/

#include <stdio.h>

void judul();

int main() {
	judul();
    char str[] = "Halo, Dunia!";
    char *ptr = str; // Pointer menunjuk ke string

    printf("String: %s\n", str);
    printf("Traversal string menggunakan pointer:\n");
    while (*ptr != '\0') {
        printf("%c ", *ptr); // Dereferensi pointer
        printf("\n");  // Menambahkan newline di akhir output
        ptr++;
    }

    return 0;
}

void judul(){
	printf("PROGRAM POINTER & STRING\n");
	printf("---------------------------------\n");
	printf("Nama	: M Yusqo Hidayatulhaq\n");
	printf("NIM 	: 24343058\n");
	printf("---------------------------------\n");
}
