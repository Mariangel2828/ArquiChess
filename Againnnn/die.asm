INCLUDE Irvine32.inc

.data
;Dibujo del tablero 
boardRow1 DB  " +-----+-----+-----+-----+-----+-----+-----+-----+", 0
boardRow11 DB "8|     |     |     |     |     |     |     |     |", 0
boardRow12 DB " |     |     |     |     |     |     |     |     |", 0
boardRow13 DB " +-----+-----+-----+-----+-----+-----+-----+-----+", 0
boardRow2 DB "7|     |     |     |     |     |     |     |     |", 0
boardRow21 DB " |     |     |     |     |     |     |     |     |", 0
boardRow22 DB " +-----+-----+-----+-----+-----+-----+-----+-----+", 0
boardRow3 DB "6|     |     |     |     |     |     |     |     |", 0
boardRow31 DB " |     |     |     |     |     |     |     |     |", 0
boardRow32 DB " +-----+-----+-----+-----+-----+-----+-----+-----+", 0
boardRow4 DB "5|     |     |     |     |     |     |     |     |", 0
boardRow41 DB " |     |     |     |     |     |     |     |     |", 0
boardRow42 DB " +-----+-----+-----+-----+-----+-----+-----+-----+", 0
boardRow5 DB "4|     |     |     |     |     |     |     |     |", 0
boardRow51 DB " |     |     |     |     |     |     |     |     |", 0
boardRow52 DB " +-----+-----+-----+-----+-----+-----+-----+-----+", 0
boardRow6 DB "3|     |     |     |     |     |     |     |     |", 0
boardRow61 DB " |     |     |     |     |     |     |     |     |", 0
boardRow62 DB " +-----+-----+-----+-----+-----+-----+-----+-----+", 0
boardRow7 DB "2|     |     |     |     |     |     |     |     |", 0
boardRow71 DB " |     |     |     |     |     |     |     |     |", 0
boardRow72 DB " +-----+-----+-----+-----+-----+-----+-----+-----+", 0
boardRow8 DB "1|     |     |     |     |     |     |     |     |", 0
boardRow81 DB " |     |     |     |     |     |     |     |     |", 0
boardRow82 DB " +-----+-----+-----+-----+-----+-----+-----+-----+", 0
labels DB "   a      b     c     d     e     f     g     h  ", 0

;Piezas Blancas 
Pawn DB "P", 0
Bishop DB "B", 0
Queen DB "Q", 0
King DB "K", 0
Knight DB "T", 0
Rook DB "R", 0


;Bontones de selección de posiciones en el tablero 
EA DB " [ 8A ] ", 0
EB DB " [ 8B ] ", 0
EC DB " [ 8C ] ", 0
ED DB " [ 8D ] ", 0
EE DB " [ 8E ] ", 0
EF DB " [ 8F ] ", 0
EG DB " [ 8G ] ", 0 
EH DB " [ 8H ] ", 0

SEA DB " [ 7A ] ", 0
SEB DB " [ 7B ] ", 0
SEC DB " [ 7C ] ", 0
SED DB " [ 7D ] ", 0
SEE DB " [ 7E ] ", 0
SEF DB " [ 7F ] ", 0
SG DB  " [ 7G ] ", 0
SEH DB " [ 7H ] ", 0

SIA DB " [ 6A ] ", 0
SIB DB " [ 6B ] ", 0
SIC DB " [ 6C ] ", 0
SID DB " [ 6D ] ", 0
SIE DB " [ 6E ] ", 0
SIF DB " [ 6F ] ", 0
SIG DB " [ 6G ] ", 0 
SIH DB " [ 6H ] ", 0

FA DB " [ 5A ] ", 0
FB DB " [ 5B ] ", 0
FC DB " [ 5C ] ", 0
FD DB " [ 5D ] ", 0
FE DB " [ 5E ] ", 0
FF DB " [ 5F ] ", 0
FG DB " [ 5G ] ", 0 
FH DB " [ 5H ] ", 0

FOA DB " [ 4A ] ", 0
FOB DB " [ 4B ] ", 0
FOC DB " [ 4C ] ", 0
FOD DB " [ 4D ] ", 0
FOE DB " [ 4E ] ", 0
FOF DB " [ 4F ] ", 0
FOG DB " [ 4G ] ", 0 
FOH DB " [ 4H ] ", 0

TA DB " [ 3A ] ", 0
TB DB " [ 3B ] ", 0
TC DB " [ 3C ] ", 0
TD DB " [ 3D ] ", 0
TE DB " [ 3E ] ", 0
TF DB " [ 3F ] ", 0
TG DB " [ 3G ] ", 0 
TH DB " [ 3H ] ", 0

TWA DB " [ 2A ] ", 0
TWB DB " [ 2B ] ", 0
TWC DB " [ 2C ] ", 0
TWD DB " [ 2D ] ", 0
TWE DB " [ 2E ] ", 0
TWF DB " [ 2F ] ", 0
TWG DB " [ 2G ] ", 0 
TWH DB " [ 2H ] ", 0

OA DB " [ 1A ] ", 0
OB DB " [ 1B ] ", 0
OC DB " [ 1C ] ", 0
OD DB " [ 1D ] ", 0
OE DB " [ 1E ] ", 0
OF DB " [ 1F ] ", 0
OG DB " [ 1G ] ", 0 
OH DB " [ 1H ] ", 0


;Variables para tomar las coordenadas del mouse 
num DWORD 14 
num2 DWORD ?
msg BYTE "Indique con su mouse la pieza que desea mover: ", 0
empty DB "   ", 0

;Data del mouse 
 hStdIn      dd 0
    nRead       dd 0
    ConsoleMode dd 0

    _INPUT_RECORD STRUCT
        EventType   WORD ?
        WORD ? ; For alignment
        UNION
        KeyEvent              KEY_EVENT_RECORD          <>
        MouseEvent            MOUSE_EVENT_RECORD        <>
        WindowBufferSizeEvent WINDOW_BUFFER_SIZE_RECORD <>
        MenuEvent             MENU_EVENT_RECORD         <>
        FocusEvent            FOCUS_EVENT_RECORD        <>
        ENDS
    _INPUT_RECORD ENDS

    InputRecord _INPUT_RECORD <>

    msgExit     db "You pressed ESC, see ya!", 0
    msgX        db "Mouse clicked at X: ", 0
    msgY        db " Y: ", 0
    coordX      dw 0
    coordY      dw 0

;coordenadas iniciales de las piezas blancas  
wpawn1CoordY dw 7
wpawn1CoordX dw 9

wpawn2CoordY dw 7
wpawn2CoordX dw 15

wpawn3CoordY dw 7
wpawn3CoordX dw 21

wpawn4CoordY dw 7
wpawn4CoordX dw 27

wpawn5CoordY dw 7
wpawn5CoordX dw 33

wpawn6CoordY dw 7
wpawn6CoordX dw 39

wpawn7CoordY dw 7
wpawn7CoordX dw 45

wpawn8CoordY dw 7
wpawn8CoordX dw 51

wrook1CoordY dw 4 
wrook1CoordX dw 51

wrook2CoordY dw 4 
wrook2CoordX dw 9

wKnight1CoordY dw 4 
wknight1CoordX dw 15 

wknight2CoordY dw 4 
wknight2CoordX dw 45

wbishop1CoordY dw 4 
wbishop1CoordX dw 21

wbishop2CoordY dw 4 
wbishop2CoordX dw 39

wkingCoordY dw 4 
wkingCoordX dw 33 

wqueenCoordY dw 4 
wqueenCoordX dw 27


;variables para borrar la antigua posicion de las piezas 
emptyY dw ? 
emptyX dw ?

piece BYTE ? 
flag dw 1

set BYTE "  Piece selected ", 0
get BYTE "  Button selected  ", 0

msg3 BYTE "  HI ", 0

;nuevas coordenadas de las piezas una vez que han sido movidas 
newCoordX dw ?
newCoordY dw ? 



; -------------------- Inicio del codigo ------------------------- 
.code
main PROC
   call drawBoard 
   call drawPieces
   call drawBottons 
    
    
    exit
main ENDP
;Proc para dibujar el tablero
 drawBoard PROC
   mov  dh, 2                                  ;coordenada con respecto al eje y 
   mov  dl, 5                                  ;coordenada con respecto al eje x 
   call Gotoxy                                 ;funcion para esas coordenadas 
   lea  edx, boardRow1                         ;cadena de texto a imprimir 
   call WriteString                            ;imprimir la cadena en las coordenadas que se especificaron 

   mov  dh, 3
   mov  dl, 5
   call Gotoxy
   lea  edx, boardRow11    
   call WriteString

   mov  dh, 4
   mov  dl, 5
   call Gotoxy
   lea  edx, boardRow12
   call WriteString

   mov  dh, 5
   mov  dl, 5
   call Gotoxy
   lea  edx, boardRow13
   call WriteString

    ; ----------- SECOND ROW ---------------
   mov  dh, 6
   mov  dl, 5
   call Gotoxy
   lea  edx, boardRow2
   call WriteString

   mov  dh, 7
   mov  dl, 5
   call Gotoxy
   lea  edx, boardRow21
   call WriteString

   mov  dh, 8
   mov  dl, 5
   call Gotoxy
   lea  edx, boardRow22
   call WriteString

   ;-------------- THIRD ROW --------------
   mov  dh, 9
   mov  dl, 5
   call Gotoxy
   lea  edx, boardRow3
   call WriteString

   mov  dh, 10
   mov  dl, 5
   call Gotoxy
   lea  edx, boardRow31
   call WriteString

   mov  dh, 11
   mov  dl, 5
   call Gotoxy
   lea  edx, boardRow32
   call WriteString

   ;------------- FOURTH ROW ---------------
   mov  dh, 12
   mov  dl, 5
   call Gotoxy
   lea  edx, boardRow4
   call WriteString

   mov  dh, 13
   mov  dl, 5
   call Gotoxy
   lea  edx, boardRow41
   call WriteString

   mov  dh, 14
   mov  dl, 5
   call Gotoxy
   lea  edx, boardRow42
   call WriteString

   ;------------- FIFTH ROW ---------------- 
   mov  dh, 15
   mov  dl, 5
   call Gotoxy
   lea  edx, boardRow5
   call WriteString

   mov  dh, 16 
   mov  dl, 5
   call Gotoxy
   lea  edx, boardRow51
   call WriteString

   mov  dh, 17
   mov  dl, 5
   call Gotoxy
   lea  edx, boardRow52
   call WriteString

   ;------------ SIXTH ROW ----------------- 
   mov  dh, 18
   mov  dl, 5
   call Gotoxy
   lea  edx, boardRow6
   call WriteString

   mov  dh, 19
   mov  dl, 5
   call Gotoxy
   lea  edx, boardRow61
   call WriteString

   mov  dh, 20
   mov  dl, 5
   call Gotoxy
   lea  edx, boardRow62
   call WriteString

   ;------------ SEVENTH ROW ----------------
   mov  dh, 21
   mov  dl, 5
   call Gotoxy
   lea  edx, boardRow7
   call WriteString

   mov  dh, 22
   mov  dl, 5
   call Gotoxy
   lea  edx, boardRow71
   call WriteString

   mov  dh, 23
   mov  dl, 5
   call Gotoxy
   lea  edx, boardRow72
   call WriteString

   ;------------- EIGTH ROW -----------------
   mov  dh, 24
   mov  dl, 5
   call Gotoxy
   lea  edx, boardRow8
   call WriteString

   mov  dh, 25
   mov  dl, 5
   call Gotoxy
   lea  edx, boardRow81
   call WriteString

   mov  dh, 26
   mov  dl, 5
   call Gotoxy
   lea  edx, boardRow82
   call WriteString
  
   mov  dh, 28
   mov  dl, 5
   call Gotoxy
   lea  edx, labels
   call WriteString

 drawBoard ENDP
 

 ;Proc para dibujar las piezas del tablero 
 drawPieces PROC 
   ;------------ WHITE PIECES -------------
   ; -- PAWNS 

   mov ax, wpawn1CoordY
   mov  dh, al
   mov ax, wpawn1CoordX 
   mov  dl, al 
   call Gotoxy
   lea  edx, Pawn
   call WriteString

   mov ax, wpawn2CoordY
   mov  dh, al
   mov ax, wpawn2CoordX 
   mov  dl, al 
   call Gotoxy
   lea  edx, Pawn
   call WriteString

   mov ax, wpawn3CoordY
   mov  dh, al
   mov ax, wpawn3CoordX 
   mov  dl, al 
   call Gotoxy
   lea  edx, Pawn
   call WriteString

   mov ax, wpawn4CoordY
   mov  dh, al
   mov ax, wpawn4CoordX 
   mov  dl, al 
   call Gotoxy
   lea  edx, Pawn
   call WriteString

   mov ax, wpawn5CoordY
   mov  dh, al
   mov ax, wpawn5CoordX 
   mov  dl, al 
   call Gotoxy
   lea  edx, Pawn
   call WriteString

   mov ax, wpawn6CoordY
   mov  dh, al
   mov ax, wpawn6CoordX 
   mov  dl, al 
   call Gotoxy
   lea  edx, Pawn
   call WriteString

   mov ax, wpawn7CoordY
   mov  dh, al
   mov ax, wpawn7CoordX 
   mov  dl, al 
   call Gotoxy
   lea  edx, Pawn
   call WriteString

   mov ax, wpawn8CoordY
   mov  dh, al
   mov ax, wpawn8CoordX 
   mov  dl, al 
   call Gotoxy
   lea  edx, Pawn
   call WriteString

   ; --- ROOK 
   mov ax, wrook1CoordY
   mov  dh, al
   mov ax, wrook1CoordX 
   mov  dl, al 
   call Gotoxy
   lea  edx, Rook
   call WriteString

   mov ax, wrook2CoordY
   mov  dh, al
   mov ax, wrook2CoordX 
   mov  dl, al 
   call Gotoxy
   lea  edx, Rook
   call WriteString

   ; -- KNIGHT 
   mov ax, wknight1CoordY
   mov  dh, al
   mov ax, wknight1CoordX 
   mov  dl, al 
   call Gotoxy
   lea  edx, Knight
   call WriteString

   mov ax, wknight2CoordY
   mov  dh, al
   mov ax, wknight2CoordX 
   mov  dl, al 
   call Gotoxy
   lea  edx, Knight
   call WriteString

   ; -- BISHOPS 
   mov ax, wbishop1CoordY
   mov  dh, al
   mov ax, wbishop1CoordX 
   mov  dl, al 
   call Gotoxy
   lea  edx, Bishop
   call WriteString

   mov ax, wbishop2CoordY
   mov  dh, al
   mov ax, wbishop2CoordX 
   mov  dl, al 
   call Gotoxy
   lea  edx, Bishop
   call WriteString

   ; -- QUEEN  
   mov ax, wqueenCoordY
   mov  dh, al
   mov ax, wqueenCoordX 
   mov  dl, al 
   call Gotoxy
   lea  edx, Queen
   call WriteString

   ; -- KING  
   mov ax, wkingCoordY
   mov  dh, al
   mov ax, wkingCoordX 
   mov  dl, al 
   call Gotoxy
   lea  edx, King
   call WriteString

 drawPieces ENDP
 
 ;Proc para dibujar los botones del tablero 
 drawBottons PROC
   mov  dh, 13
   mov  dl, 60
   call Gotoxy
   lea  edx, EA 
   call WriteString

   mov  dh, 13
   mov  dl, 67
   call Gotoxy
   lea  edx, EB
   call WriteString

   mov  dh, 13
   mov  dl, 74
   call Gotoxy
   lea  edx, EC 
   call WriteString

   mov  dh, 13
   mov  dl, 81
   call Gotoxy
   lea  edx, ED 
   call WriteString

   mov  dh, 13
   mov  dl, 88
   call Gotoxy
   lea  edx, EE 
   call WriteString

   mov  dh, 13
   mov  dl, 95
   call Gotoxy
   lea  edx, EF
   call WriteString

   mov  dh, 13
   mov  dl, 102
   call Gotoxy
   lea  edx, EG
   call WriteString

   mov  dh, 13
   mov  dl, 109
   call Gotoxy
   lea  edx, EH 
   call WriteString


   ; -- SECOND ROW  
   mov  dh, 14
   mov  dl, 60
   call Gotoxy
   lea  edx, SEA
   call WriteString

   mov  dh, 14
   mov  dl, 67
   call Gotoxy
   lea  edx, SEB
   call WriteString

   mov  dh, 14
   mov  dl, 74
   call Gotoxy
   lea  edx,SEC
   call WriteString

   mov  dh, 14
   mov  dl, 81
   call Gotoxy
   lea  edx, SED
   call WriteString

   mov  dh, 14
   mov  dl, 88
   call Gotoxy
   lea  edx, SEE
   call WriteString

   mov  dh, 14
   mov  dl, 95
   call Gotoxy
   lea  edx, SEF
   call WriteString

   mov  dh, 14
   mov  dl, 102
   call Gotoxy
   lea  edx, SG
   call WriteString

   mov  dh, 14
   mov  dl, 109
   call Gotoxy
   lea  edx, SEH
   call WriteString

   ; -- THIRD ROW 
   mov  dh, 15
   mov  dl, 60
   call Gotoxy
   lea  edx, SIA
   call WriteString

   mov  dh, 15
   mov  dl, 67
   call Gotoxy
   lea  edx, SIB
   call WriteString

   mov  dh, 15
   mov  dl, 74
   call Gotoxy
   lea  edx,SIC
   call WriteString

   mov  dh, 15
   mov  dl, 81
   call Gotoxy
   lea  edx, SID
   call WriteString

   mov  dh, 15
   mov  dl, 88
   call Gotoxy
   lea  edx, SIE
   call WriteString

   mov  dh, 15
   mov  dl, 95
   call Gotoxy
   lea  edx, SIF
   call WriteString

   mov  dh, 15
   mov  dl, 102
   call Gotoxy
   lea  edx, SIG
   call WriteString

   mov  dh, 15
   mov  dl, 109
   call Gotoxy
   lea  edx, SIH
   call WriteString

   ; -- FOURTH ROW 
   mov  dh, 16
   mov  dl, 60
   call Gotoxy
   lea  edx, FA
   call WriteString

   mov  dh, 16
   mov  dl, 67
   call Gotoxy
   lea  edx, FB
   call WriteString

   mov  dh, 16
   mov  dl, 74
   call Gotoxy
   lea  edx, FC
   call WriteString

   mov  dh, 16
   mov  dl, 81
   call Gotoxy
   lea  edx, FD
   call WriteString

   mov  dh, 16
   mov  dl, 88
   call Gotoxy
   lea  edx, FE
   call WriteString

   mov  dh, 16
   mov  dl, 95
   call Gotoxy
   lea  edx, FF
   call WriteString

   mov  dh, 16
   mov  dl, 102
   call Gotoxy
   lea  edx, FG
   call WriteString

   mov  dh, 16
   mov  dl, 109
   call Gotoxy
   lea  edx, FH
   call WriteString

   ; -- FIFTH ROW 
   mov  dh, 17
   mov  dl, 60
   call Gotoxy
   lea  edx, FOA
   call WriteString

   mov  dh, 17
   mov  dl, 67
   call Gotoxy
   lea  edx, FOB
   call WriteString

   mov  dh, 17
   mov  dl, 74
   call Gotoxy
   lea  edx, FOC
   call WriteString

   mov  dh, 17
   mov  dl, 81
   call Gotoxy
   lea  edx, FOD
   call WriteString

   mov  dh, 17
   mov  dl, 88
   call Gotoxy
   lea  edx, FOE
   call WriteString

   mov  dh, 17
   mov  dl, 95
   call Gotoxy
   lea  edx, FOF
   call WriteString

   mov  dh, 17
   mov  dl, 102
   call Gotoxy
   lea  edx, FOG
   call WriteString

   mov  dh, 17
   mov  dl, 109
   call Gotoxy
   lea  edx, FOH
   call WriteString

   ; -- SIXTH ROW 
   mov  dh, 18
   mov  dl, 60
   call Gotoxy
   lea  edx, TA
   call WriteString

   mov  dh, 18
   mov  dl, 67
   call Gotoxy
   lea  edx, TB
   call WriteString

   mov  dh, 18
   mov  dl, 74
   call Gotoxy
   lea  edx, TC
   call WriteString

   mov  dh, 18
   mov  dl, 81
   call Gotoxy
   lea  edx, TD
   call WriteString

   mov  dh, 18
   mov  dl, 88
   call Gotoxy
   lea  edx, TE
   call WriteString

   mov  dh, 18
   mov  dl, 95
   call Gotoxy
   lea  edx, TF
   call WriteString

   mov  dh, 18
   mov  dl, 102
   call Gotoxy
   lea  edx, TG
   call WriteString

   mov  dh, 18
   mov  dl, 109
   call Gotoxy
   lea  edx, TH
   call WriteString

   ; -- SEVENTH ROW 
   mov  dh, 19
   mov  dl, 60
   call Gotoxy
   lea  edx, TWA
   call WriteString

   mov  dh, 19
   mov  dl, 67
   call Gotoxy
   lea  edx, TWB
   call WriteString

   mov  dh, 19
   mov  dl, 74
   call Gotoxy
   lea  edx, TWC
   call WriteString

   mov  dh, 19
   mov  dl, 81
   call Gotoxy
   lea  edx, TWD
   call WriteString

   mov  dh, 19
   mov  dl, 88
   call Gotoxy
   lea  edx, TWE
   call WriteString

   mov  dh, 19
   mov  dl, 95
   call Gotoxy
   lea  edx, TWF
   call WriteString

   mov  dh, 19
   mov  dl, 102
   call Gotoxy
   lea  edx, TWG
   call WriteString

   mov  dh, 19
   mov  dl, 109
   call Gotoxy
   lea  edx, TWH
   call WriteString

   ; -- EIGHT ROW 
   mov  dh, 20
   mov  dl, 60
   call Gotoxy
   lea  edx, OA
   call WriteString

   mov  dh, 20
   mov  dl, 67
   call Gotoxy
   lea  edx, OB
   call WriteString

   mov  dh, 20
   mov  dl, 74
   call Gotoxy
   lea  edx, OC
   call WriteString

   mov  dh, 20
   mov  dl, 81
   call Gotoxy
   lea  edx, OD
   call WriteString

   mov  dh, 20
   mov  dl, 88
   call Gotoxy
   lea  edx, OE
   call WriteString

   mov  dh, 20
   mov  dl, 95
   call Gotoxy
   lea  edx, OF
   call WriteString

   mov  dh, 20
   mov  dl, 102
   call Gotoxy
   lea  edx, OG
   call WriteString

   mov  dh, 20
   mov  dl, 109
   call Gotoxy
   lea  edx, OH
   call WriteString

   mov  dh, 28
   mov  dl, 5
   call Gotoxy
   lea  edx, empty 
   call WriteString

drawBottons endP 

;detecta el click del mouse 
mouseClick PROC 
   mov dh, 0 
   mov dl, 0 
   mov  dh, 6
   mov  dl, 62
   call Gotoxy
   lea  edx, msg  
   call WriteString

   again:
    invoke GetStdHandle, STD_INPUT_HANDLE
    mov hStdIn, eax

    invoke GetConsoleMode, hStdIn, ADDR ConsoleMode
    mov eax, 0090h ; ENABLE_MOUSE_INPUT | DISABLE_QUICK_EDIT_MODE | ENABLE_EXTENDED_FLAGS
    invoke SetConsoleMode, hStdIn, eax

    .WHILE InputRecord.KeyEvent.wVirtualKeyCode != VK_ESCAPE
        invoke ReadConsoleInput, hStdIn, ADDR InputRecord, 1, ADDR nRead

        movzx eax, InputRecord.EventType

        cmp eax, MOUSE_EVENT
        jne no_mouse_click

        ; Verificar si se hizo clic con el botón izquierdo del mouse
        test InputRecord.MouseEvent.dwButtonState, 1
        jz no_mouse_click

        ; Guardar las coordenadas del clic
        mov ax, InputRecord.MouseEvent.dwMousePosition.X
        mov coordX, ax
        mov ax, InputRecord.MouseEvent.dwMousePosition.Y
        mov coordY, ax

        ; Mostrar las coordenadas del clic
        mov  dh, 10
        mov  dl, 67
        call Gotoxy
        lea  edx, empty 
        call WriteString

        lea edx, msgX
        call WriteString
        movzx eax, coordX
        call WriteDec

        mov  dh, 11
        mov  dl, 67
        call Gotoxy
        lea  edx, empty 
        call WriteString

        lea edx, msgY
        call WriteString
        movzx eax, coordY
        call WriteDec

        cmp flag, 1                             ;Si la bandera esta en 1 entonces detecta la seleccion de una de las piezas 
        je set1
        cmp flag, 2                             ;Si la bandera esta en 2 detecta que se seleccionara un boton 
        je set2 

    set1: 
        call setPiece
        
    set2: 
       call getCoordinates 
        ; Nueva línea
        call Crlf

        jmp done

    no_mouse_click:
    .ENDW

    mov edx, OFFSET msgExit
    call MsgBox
    jmp exit_p

done:
    mov eax, ConsoleMode
    invoke SetConsoleMode, hStdIn, eax
    jmp again
   
exit_p:
   mov  dh, 28
   mov  dl, 63
   call Gotoxy
   lea  edx, empty 
   call WriteString
   
mouseClick endP

;Detecta la pieza que fue seleccionada con el mouse 
setPiece PROC
    ; Mostrar que se ha seleccionado una pieza
    lea edx, set
    call writestring

    ; Verificar la pieza seleccionada basándonos en ambas coordenadas X e Y

    ; Peón 1
    mov ax, coordX 
    cmp ax, wpawn1CoordX                       ;Compara la coordenada X seleccionada con la coordenada determinada de las piezas 
    jne checkPawn2                             ;De modo que se pueda saber cual pieza debe ser movida 
    mov ax, coordY
    cmp ax, wpawn1CoordY
    je setPawn1

    ; Peón 2
checkPawn2:
    mov ax, coordX
    cmp ax, wpawn2CoordX
    jne checkPawn3
    mov ax, coordY
    cmp ax, wpawn2CoordY
    je setPawn2

    ; Peón 3
checkPawn3:
    mov ax, coordX
    cmp ax, wpawn3CoordX
    jne checkPawn4
    mov ax, coordY
    cmp ax, wpawn3CoordY
    je setPawn3

    ; Peón 4
checkPawn4:
    mov ax, coordX
    cmp ax, wpawn4CoordX
    jne checkPawn5
    mov ax, coordY
    cmp ax, wpawn4CoordY
    je setPawn4

    ; Peón 5
checkPawn5:
    mov ax, coordX
    cmp ax, wpawn5CoordX
    jne checkPawn6
    mov ax, coordY
    cmp ax, wpawn5CoordY
    je setPawn5

    ; Peón 6
checkPawn6:
    mov ax, coordX
    cmp ax, wpawn6CoordX
    jne checkPawn7
    mov ax, coordY
    cmp ax, wpawn6CoordY
    je setPawn6

    ; Peón 7
checkPawn7:
    mov ax, coordX
    cmp ax, wpawn7CoordX
    jne checkPawn8
    mov ax, coordY
    cmp ax, wpawn7CoordY
    je setPawn7

    ; Peón 8
checkPawn8:
    mov ax, coordX
    cmp ax, wpawn8CoordX
    jne checkRook1
    mov ax, coordY
    cmp ax, wpawn8CoordY
    je setPawn8

    ; Torre 1
checkRook1:
    mov ax, coordX
    cmp ax, wrook1CoordX
    jne checkRook2
    mov ax, coordY
    cmp ax, wrook1CoordY
    je setRook1

    ; Torre 2
checkRook2:
    mov ax, coordX
    cmp ax, wrook2CoordX
    jne checkKnight1
    mov ax, coordY
    cmp ax, wrook2CoordY
    je setRook2

    ; Caballo 1
checkKnight1:
    mov ax, coordX
    cmp ax, wknight1CoordX
    jne checkKnight2
    mov ax, coordY
    cmp ax, wknight1CoordY
    je setKnight1

    ; Caballo 2
checkKnight2:
    mov ax, coordX
    cmp ax, wknight2CoordX
    jne checkBishop1
    mov ax, coordY
    cmp ax, wknight2CoordY
    je setKnight2

    ; Alfil 1
checkBishop1:
    mov ax, coordX
    cmp ax, wbishop1CoordX
    jne checkBishop2
    mov ax, coordY
    cmp ax, wbishop1CoordY
    je setBishop1

    ; Alfil 2
checkBishop2:
    mov ax, coordX
    cmp ax, wbishop2CoordX
    jne checkQueen
    mov ax, coordY
    cmp ax, wbishop2CoordY
    je setBishop2

    ; Reina
checkQueen:
    mov ax, coordX
    cmp ax, wqueenCoordX
    jne checkKing
    mov ax, coordY
    cmp ax, wqueenCoordY
    je setQueen

    ; Rey
checkKing:
    mov ax, coordX
    cmp ax, wkingCoordX
    jne mouseClick
    mov ax, coordY
    cmp ax, wkingCoordY
    je setKing

    ; Si no coincide ninguna pieza, vuelve a mouseClick
    jmp mouseClick

; --- Aquí están las funciones para cada pieza ---

; Peón 1
setPawn1:
    mov piece, 'P'                           ;toma la pieza que va a mover 
    mov ax, wpawn1CoordX                      
    mov emptyX, ax                           ;mueve las coordenadas anteriores a una variable para que luego se pueda borrar la posicion anterior 
    mov ax, wpawn1CoordY   
    mov emptyY, ax
    mov flag, 2
    jmp mouseClick

; Peón 2
setPawn2:
    mov piece, 'P'
    mov ax, wpawn2CoordX    
    mov emptyX, ax 
    mov ax, wpawn2CoordY   
    mov emptyY, ax
    mov flag, 2
    jmp mouseClick

; Peón 3
setPawn3:
    mov piece, 'P'
    mov ax, wpawn3CoordX   
    mov emptyX, ax 
    mov ax, wpawn3CoordY   
    mov emptyY, ax
    mov flag, 2
    jmp mouseClick

; Peón 4
setPawn4:
    mov piece, 'P'
    mov ax, wpawn4CoordX   
    mov emptyX, ax 
    mov ax, wpawn4CoordY   
    mov emptyY, ax
    mov flag, 2
    jmp mouseClick

; Peón 5
setPawn5:
    mov piece, 'P'
    mov ax, wpawn5CoordX   
    mov emptyX, ax 
    mov ax, wpawn5CoordY   
    mov emptyY, ax
    mov flag, 2
    jmp mouseClick

; Peón 6
setPawn6:
    mov piece, 'P'
    mov ax, wpawn6CoordX   
    mov emptyX, ax 
    mov ax, wpawn6CoordY   
    mov emptyY, ax
    mov flag, 2
    jmp mouseClick

; Peón 7
setPawn7:
    mov piece, 'P'
    mov ax, wpawn7CoordX   
    mov emptyX, ax 
    mov ax, wpawn7CoordY   
    mov emptyY, ax
    mov flag, 2
    jmp mouseClick

; Peón 8
setPawn8:
    mov piece, 'P'
    mov ax, wpawn8CoordX   
    mov emptyX, ax 
    mov ax, wpawn8CoordY   
    mov emptyY, ax
    mov flag, 2
    jmp mouseClick

; Torre 1
setRook1:
    mov piece, 'R'
    mov ax, wrook1CoordX   
    mov emptyX, ax 
    mov ax, wrook1CoordY   
    mov emptyY, ax
    mov flag, 2
    jmp mouseClick

; Torre 2
setRook2:
    mov piece, 'R'
    mov ax, wrook2CoordX   
    mov emptyX, ax 
    mov ax, wrook2CoordY   
    mov emptyY, ax
    mov flag, 2
    jmp mouseClick

; Caballo 1
setKnight1:
    mov piece, 'K'
    mov ax, wknight1CoordX   
    mov emptyX, ax 
    mov ax, wknight1CoordY   
    mov emptyY, ax
    mov flag, 2
    jmp mouseClick

; Caballo 2
setKnight2:
    mov piece, 'K'
    mov ax, wknight2CoordX   
    mov emptyX, ax 
    mov ax, wknight2CoordY   
    mov emptyY, ax
    mov flag, 2
    jmp mouseClick

; Alfil 1
setBishop1:
    mov piece, 'B'
    mov ax, wbishop1CoordX   
    mov emptyX, ax 
    mov ax, wbishop1CoordY   
    mov emptyY, ax
    mov flag, 2
    jmp mouseClick

; Alfil 2
setBishop2:
    mov piece, 'B'
    mov ax, wbishop2CoordX   
    mov emptyX, ax 
    mov ax, wbishop2CoordY   
    mov emptyY, ax
    mov flag, 2
    jmp mouseClick

; Reina
setQueen:
    mov piece, 'Q'
    mov ax, wqueenCoordX   
    mov emptyX, ax 
    mov ax, wqueenCoordY   
    mov emptyY, ax
    mov flag, 2
    jmp mouseClick

; Rey
setKing:
    mov piece, 'K'
    mov ax, wkingCoordX   
    mov emptyX, ax 
    mov ax, wkingCoordY   
    mov emptyY, ax
    mov flag, 2
    jmp mouseClick

setPiece ENDP

;Compara las coordenas del boton para saber a que posicion del tablero debe ir 
getCoordinates PROC
   mov edx, offset get 
   call writestring
   cmp coordX, 63
   je movCA
   cmp coordX, 64
   je movCA 
   cmp coordX, 70
   je movCB 
   cmp coordX, 71
   je movCB
   cmp coordX, 77
   je movCc
   cmp coordX, 78
   je movCc
   cmp coordX, 84
   je movCd
   cmp coordX, 85
   je movCd
   cmp coordX, 91
   je movCE
   cmp coordX, 92
   je movCE
   cmp coordX, 98
   je movCF
   cmp coordX, 99
   je movCF
   cmp coordX, 105
   je movCG
   cmp coordX, 106
   je movCG
   cmp coordX, 112
   je movCH
   cmp coordX, 113
   je movCH
   jne mouseClick 
    
movCA:
   mov newCoordX, 8
   call SETCOORDY 
   
movCB: 
   mov newCoordX, 14
   call SETCOORDY

movCc: 
   mov newCoordX, 20
   call SETCOORDY

movCd: 
   mov newCoordX, 26
   call SETCOORDY

movCE: 
   mov newCoordX, 32
   call SETCOORDY

movCF: 
   mov newCoordX, 38
   call SETCOORDY

movCG: 
   mov newCoordX, 44
   call SETCOORDY

movCH: 
   mov newCoordX, 50
   call SETCOORDY

done: 
   call mouseClick
     
getCoordinates endP 

SETCOORDY PROC 
   cmp coordY, 13
   je setRow1
   cmp coordY, 14
   je setRow2
   cmp coordY, 15
   je setRow3
   cmp coordY, 16
   je setRow4
   cmp coordY, 17
   je setRow5
   cmp coordY, 18
   je setRow6
   cmp coordY, 19
   je setRow7
   cmp coordY, 20
   je setRow8
  
setRow1:
   mov newCoordY, 4
   call CONTINUE
   jmp doneSetting

setRow2:
   mov newCoordY, 7
   call CONTINUE
   jmp doneSetting

setRow3:
   mov newCoordY, 10
   call CONTINUE
   jmp doneSetting

setRow4:
   mov newCoordY, 13
   call CONTINUE
   jmp doneSetting

setRow5:
   mov newCoordY, 16
   call CONTINUE
   jmp doneSetting

setRow6:
   mov newCoordY, 19
   call CONTINUE
   jmp doneSetting

setRow7:
   mov newCoordY, 22
   call CONTINUE
   jmp doneSetting

setRow8:
   mov newCoordY, 25
   call CONTINUE
   jmp doneSetting

doneSetting:
   ret

SETCOORDY ENDP
 

SETP1 PROC 
   mov ax, emptyY
   mov  dh, al
   mov ax, emptyX 
   mov  dl, al 
   call Gotoxy
   lea  edx, empty
   
   call WriteString
   mov ax, newCoordX
   mov wpawn1CoordX, ax
   mov ax, newCoordY
   mov wpawn1CoordY, ax
   mov ax, wpawn1CoordX   
   mov dl, al            
   mov ax, wpawn1CoordY   
   mov dh, al             
   call Gotoxy
   lea  edx, piece 
   call writestring 
   mov flag, 1 
   call mouseClick 
SETP1 ENDP

SETP2 PROC 
   mov ax, emptyY
   mov  dh, al
   mov ax, emptyX 
   mov  dl, al 
   call Gotoxy
   lea  edx, empty 
   call WriteString

   mov ax, newCoordX
   mov wpawn2CoordX, ax
   mov ax, newCoordY
   mov wpawn2CoordY, ax
   mov ax, wpawn2CoordX   
   mov dl, al            
   mov ax, wpawn2CoordY   
   mov dh, al             
   call Gotoxy
   lea  edx, piece 
   call writestring 
   mov flag, 1 
   call mouseClick 
SETP2 ENDP

SETP3 PROC 
   mov ax, emptyY
   mov  dh, al
   mov ax, emptyX 
   mov  dl, al 
   call Gotoxy
   lea  edx, empty 
   call WriteString

   mov ax, newCoordX
   mov wpawn3CoordX, ax
   mov ax, newCoordY
   mov wpawn3CoordY, ax
   mov ax, wpawn3CoordX   
   mov dl, al            
   mov ax, wpawn3CoordY   
   mov dh, al             
   call Gotoxy
   lea  edx, piece 
   call writestring 
   mov flag, 1 
   call mouseClick 
SETP3 ENDP


SETP4 PROC  
   mov ax, emptyY
   mov  dh, al
   mov ax, emptyX 
   mov  dl, al 
   call Gotoxy
   lea  edx, empty 
   call WriteString

   mov ax, newCoordX
   mov wpawn4CoordX, ax
   mov ax, newCoordY 
   mov wpawn4CoordY, ax 
   mov ax, wpawn4CoordX   
   mov dl, al            
   mov ax, wpawn4CoordY   
   mov dh, al             
   call Gotoxy
   lea  edx, piece 
   call writestring 
   mov flag, 1 
   call mouseClick 
SETP4 ENDP 

SETP5 PROC 
   mov ax, emptyY
   mov  dh, al
   mov ax, emptyX 
   mov  dl, al 
   call Gotoxy
   lea  edx, empty 
   call WriteString

   mov ax, newCoordX
   mov wpawn5CoordX, ax
   mov ax, newCoordY 
   mov wpawn5CoordY, ax
   mov ax, wpawn5CoordX   
   mov dl, al            
   mov ax, wpawn5CoordY   
   mov dh, al             
   call Gotoxy
   lea  edx, piece 
   call writestring 
   mov flag, 1 
   call mouseClick
SETP5 ENDP 

SETP6 PROC 
   mov ax, emptyY
   mov  dh, al
   mov ax, emptyX 
   mov  dl, al 
   call Gotoxy
   lea  edx, empty 
   call WriteString

   mov ax, newCoordX
   mov wpawn6CoordX, ax
   mov ax, newCoordY 
   mov wpawn6CoordY, ax
   mov ax, wpawn6CoordX   
   mov dl, al            
   mov ax, wpawn6CoordY   
   mov dh, al             
   call Gotoxy
   lea  edx, piece 
   call writestring 
   call mouseClick 
SETP6 ENDP 

SETP7 PROC  
   mov ax, emptyY
   mov  dh, al
   mov ax, emptyX 
   mov  dl, al 
   call Gotoxy
   lea  edx, empty 
   call WriteString

   mov ax, newCoordX 
   mov wpawn7CoordX, 26
   mov wpawn7CoordY, 9
   mov ax, wpawn7CoordX   
   mov dl, al            
   mov ax, wpawn7CoordY   
   mov dh, al             
   call Gotoxy
   lea  edx, piece 
   call writestring 
   mov flag, 1 
   call mouseClick 
SETP7 ENDP 

SETP8 PROC  
   mov ax, emptyY
   mov  dh, al
   mov ax, emptyX 
   mov  dl, al 
   call Gotoxy
   lea  edx, empty 
   call WriteString

   mov ax, newCoordX
   mov wpawn8CoordX, ax
   mov ax, newCoordY
   mov wpawn8CoordY, ax
   mov ax, wpawn8CoordX   
   mov dl, al            
   mov ax, wpawn8CoordY   
   mov dh, al             
   call Gotoxy
   lea  edx, piece 
   call writestring 
   mov flag, 1 
   call mouseClick 
SETP8 ENDP 

SETR1 PROC 
   mov ax, emptyY
   mov  dh, al
   mov ax, emptyX 
   mov  dl, al 
   call Gotoxy
   lea  edx, empty 

   call WriteString

   mov ax, newCoordX
   mov wrook1CoordX, ax
   mov ax, newCoordY
   mov wrook1CoordY, ax
   mov ax, wrook1CoordX   
   mov dl, al            
   mov ax, wrook1CoordY   
   mov dh, al             
   call Gotoxy
   lea  edx, piece 
   call writestring 
   mov flag, 1 
   call mouseClick
SETR1 ENDP 

SETR2 PROC 
   mov ax, emptyY
   mov  dh, al
   mov ax, emptyX 
   mov  dl, al 
   call Gotoxy
   lea  edx, empty 
   call WriteString

   mov ax, newCoordX 
   mov wrook2CoordX, ax
   mov ax, newCoordY 
   mov wrook2CoordY, ax
   mov ax, wrook2CoordX   
   mov dl, al            
   mov ax, wrook2CoordY   
   mov dh, al             
   call Gotoxy
   lea  edx, piece 
   call writestring 
   mov flag, 1 
   call mouseClick 
SETR2 ENDP 

SETk1 PROC 
   mov ax, emptyY
   mov  dh, al
   mov ax, emptyX 
   mov  dl, al 
   call Gotoxy
   lea  edx, empty 
   call WriteString

   mov ax, newCoordX 
   mov wknight1CoordX, ax
   mov ax, newCoordY 
   mov wknight1CoordY, ax
   mov ax, wknight1CoordX   
   mov dl, al            
   mov ax, wknight1CoordY   
   mov dh, al             
   call Gotoxy
   lea  edx, piece 
   call writestring 
   mov flag, 1 
   call mouseClick 
SETk1 ENDP

SETk2 PROC 
   mov ax, emptyY
   mov  dh, al
   mov ax, emptyX 
   mov  dl, al 
   call Gotoxy
   lea  edx, empty 
   call WriteString

   mov ax, newCoordX 
   mov wknight2CoordX, ax
   mov ax, newCoordY 
   mov wknight2CoordY, ax
   mov ax, wknight2CoordX   
   mov dl, al            
   mov ax, wknight2CoordY   
   mov dh, al             
   call Gotoxy
   lea  edx, piece 
   call writestring 
   mov flag, 1 
   call mouseClick 
SETk2 ENDP

SETB1 PROC 
   mov ax, emptyY
   mov  dh, al
   mov ax, emptyX 
   mov  dl, al 
   call Gotoxy
   lea  edx, empty 
   call WriteString

   mov ax, newCoordX 
   mov wbishop1CoordX, ax
   mov ax, newCoordY 
   mov wbishop1CoordY, ax
   mov ax, wbishop1CoordX   
   mov dl, al            
   mov ax, wbishop1CoordY   
   mov dh, al             
   call Gotoxy
   lea  edx, piece 
   call writestring 
   mov flag, 1 
   call mouseClick 
SETB1 ENDP

SETB2 PROC 
   mov ax, emptyY
   mov  dh, al
   mov ax, emptyX 
   mov  dl, al 
   call Gotoxy
   lea  edx, empty 
   call WriteString

   mov ax, newCoordX 
   mov wbishop2CoordX, ax
   mov ax, newCoordY 
   mov wbishop2CoordY, ax
   mov ax, wbishop2CoordX   
   mov dl, al            
   mov ax, wbishop2CoordY   
   mov dh, al             
   call Gotoxy
   lea  edx, piece 
   call writestring 
   mov flag, 1 
   call mouseClick 
SETB2 ENDP

SETQ PROC 
   mov ax, emptyY
   mov  dh, al
   mov ax, emptyX 
   mov  dl, al 
   call Gotoxy
   lea  edx, empty 
   call WriteString

   mov ax, newCoordX 
   mov wqueenCoordX, ax
   mov ax, newCoordY 
   mov wqueenCoordY, ax
   mov ax, wqueenCoordX   
   mov dl, al            
   mov ax, wqueenCoordY   
   mov dh, al             
   call Gotoxy
   lea  edx, piece 
   call writestring 
   mov flag, 1 
   call mouseClick 
SETQ ENDP

SETk PROC 
   mov ax, emptyY
   mov  dh, al
   mov ax, emptyX 
   mov  dl, al 
   call Gotoxy
   lea  edx, empty 
   call WriteString

   mov ax, newCoordX 
   mov wkingCoordX, ax
   mov ax, newCoordY 
   mov wkingCoordY, ax
   mov ax, wkingCoordX   
   mov dl, al            
   mov ax, wkingCoordY   
   mov dh, al             
   call Gotoxy
   lea  edx, piece 
   call writestring 
   mov flag, 1 
   call mouseClick 
SETk ENDP

CONTINUE PROC 
   mov ax, emptyX         
   cmp ax, wpawn1CoordX 
   je P1
   cmp ax, wpawn2CoordX 
   je P2
   cmp ax, wpawn3CoordX 
   je P3
   cmp ax, wpawn4CoordX 
   je P4
   cmp ax, wpawn5CoordX 
   je P5
   cmp ax, wpawn6CoordX 
   je P6
   cmp ax, wpawn7CoordX 
   je P7
   cmp ax, wpawn8CoordX 
   je P8
   cmp ax, wrook2CoordX 
   je R1
   cmp ax, wrook2CoordX 
   je R2
   cmp ax, wbishop1CoordX 
   je B1
   cmp ax, wbishop2CoordX 
   je B2
   cmp ax, wknight1CoordX 
   je Knight1
   cmp ax, wknight2CoordX 
   je Knight2
   cmp ax, wqueenCoordX 
   je Q
   cmp ax, wkingCoordX 
   je K
   
P1: 
   call SETP1 

P2: 
   call SETP2

P3: 
   call SETP3

P4: 
   call SETP4

P5: 
   call SETP5

P6: 
   call SETP6

P7: 
   call SETP7

P8: 
   call SETP8

R1: 
   call SETR1

R2: 
   call SETR2

Knight1: 
   call SETK1

Knight2: 
   call SETK1

B1: 
   call SETB1

B2: 
   call SETB2

Q: 
   call SETQ

K: 
   call SETK
  

CONTINUE ENDP 

END main