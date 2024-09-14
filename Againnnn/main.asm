include irvine32.inc

.data
    filename db "C:\Users\acuna\OneDrive - Estudiantes ITCR\SEGUNDO SEMESTRE\Arqui\MASM PROJECT\bueno deay\pueba.txt.txt", 0
    filehandle HANDLE ?
    mensaje db 40 dup(?)
.code
main PROC 
    mov edx, OFFSET mensaje        ; Dirección donde almacenar el input
    mov ecx, 40                       ; Tamaño máximo del input (40 caracteres)
    call ReadString

    ; Create or open the file
    push 0
    push FILE_ATTRIBUTE_NORMAL
    push OPEN_EXISTING 
    push 0
    push 0
    push FILE_SHARE_WRITE 
    push offset filename 
    call CreateFileA
    mov filehandle, eax

    ; Move the file pointer to the end of the file
    push FILE_END
    push 0
    push 0
    push filehandle
    call SetFilePointer 

    ; Calculate the string length
    mov esi, offset mensaje   ; ESI points to the start of the string
    call StrLen               ; Call the custom string length function

    ; Write the string to the file
    push 0
    push 0
    push eax                  ; Length of the string returned in EAX
    push offset mensaje 
    push filehandle
    call WriteFile

    ; Exit the program
    exit
main ENDP

; Custom string length function
StrLen PROC
    mov ecx, 0                ; ECX will store the string length
  next_char:
    cmp byte ptr [esi], 0      ; Check if current character is null (end of string)
    je done                    ; If null, we're done
    inc esi                    ; Move to the next character
    inc ecx                    ; Increment the length count
    jmp next_char              ; Repeat the loop
  done:
    mov eax, ecx               ; Return the length in EAX
    ret
StrLen ENDP

END main
