#include <stdio.h>
#include <stdlib.h>

#define N 5
extern int check_word(char A[], char B[], char words[], int size_word, char word[], int count);

int main(int argc, char *argv[])
{
	//25)  ����������, ���� �� ����� ������� �����������, ������� ������ � ����������� �����������.
	// ������� ��� ����� � ����� �����������, � ������� ��� �����������.
	system("chcp 1251");
	system("cls");
	char A[N][255];
	char Words[25][255];
	char word[255];
	int count= 0;
	printf("������� �����������:\n");
	for (int i = 0; i < N; i++)
	{
		printf("%d) ", i+1);
		fgets(A[i], sizeof(A[i]), stdin);
	}
	printf("\n���������� ���� � ������ ������������:\n \n");

	for (int j = 0; j < N-1; j++)
	{
		count = check_word(A[0], A[j + 1], Words, 255, word, count);

		for (int k = 0; k < count; k++) printf("����� - '%s' | ����� ����������� - %d\n", Words[k], j + 2);
	}
	getchar();
	return 0;
}