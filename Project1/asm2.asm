.586
.model flat, c
.code

check_word proc C adress_mas:byte, adress_mas_next:byte, words:byte, size_word:dword, word_r:byte, count:dword
	mov esi, dword ptr adress_mas
	mov edi, dword ptr word_r
	mov eax, dword ptr words
	xor edx, edx
	mov count, edx

	while_1:
		mov bl, ' '
		cmp [esi], bl
		jz next_1

		start:
			mov bl, 10
			mov cl, [esi]
			cmp cl, bl
			jz next_1

			start_2:
			mov bl, [esi]
			mov [edi], bl
			inc edi
			inc esi
			inc edx
	jmp while_1

	next_1:
		push esi
		push edi; ����� �� ��������� �� ������� ��� �����
		mov ecx, edx; ���-�� �������� � 1 �����
		mov esi, dword ptr adress_mas_next
		mov edi, dword ptr word_r; ������

		pre_c1: 
		push ecx
		c1:
			mov dl, [esi]
			mov bl, [edi]
			inc edi
			inc esi
			cmp dl, bl
			jnz next_2
		loop c1

		mov dl, [esi]
		mov bl, ' '; ����� �����, � �� ���������
		cmp dl, bl
		jz find

		check_next:
		mov bl, 10
		cmp dl, bl
		jnz next_2

		; �����
		find:
		inc count
		mov edi, eax; ��� ������ ����������
		pop ebx
		pop esi
		mov ebx, esi; ����� �� ��������� �� ������� ��� �����
		mov esi, dword ptr word_r
		while_2:
			cmp esi, ebx
			jnz next_3
			mov dl, 0
			mov [edi], dl
			mov edi, eax
			add edi, size_word
			mov eax, edi
			jmp endd

			next_3:
				mov edx, [esi]
				mov [edi], edx
				inc esi
				inc edi
				jmp while_2

		; �� �����
		next_2:
			mov edi, dword ptr word_r
			pop ecx

			next_6:
			mov bl, ' '
			mov dl, [esi]
			inc esi
			cmp dl, bl
			jz pre_c1

			mov bl, 10
			cmp dl, bl
			jz enddd

			jmp next_6

		enddd:
		pop ebx
		endd:
			pop esi
			mov dl, [esi]
			mov bl, 10
			cmp dl, bl
			jz exit

			inc esi
			mov edi, dword ptr word_r
			xor edx, edx
		jmp while_1
	exit:
	mov eax, count
ret
check_word endp
end