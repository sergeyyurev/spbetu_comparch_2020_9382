; HELLO2 - ????? ? ????? ??  N2  ? ?.? ?.#1 ?? �????????? "??????????  ????????? "
;          ????? ??  ?????????? ?????�??? �?? ??? ?? ??????
;
;      ?????  ?????????

EOFLine  EQU  '$'         ; ????�?????? ?????????? ????? ???
                          ;     "????? ??????"

; ????  ????? ???

;AStack    SEGMENT  STACK
          DW 12 DUP(?)    ; ????�???? 12 ???? ? ????
;AStack    ENDS

; ? ???? ????? ???

DATA      SEGMENT

;  ????????? ???? ??? � ????

HELLO     DB 'Hello Worlds!', 0AH, 0DH,EOFLine
GREETING  DB 'Yuryev Sergey from 9382$'
DATA      ENDS

; ??� ????? ???

CODE      SEGMENT
          ASSUME CS:Code DS:DATA SS:AStack
; ?????�??  ??? ?? ??????
WriteMsg  PROC  NEAR
          mov   AH,9
          int   21h  ; ????? ??????? DOS ?? ?????? ???
          ret
WriteMsg  ENDP

; ?????? ? ?????�?? 
Main      PROC  FAR
          push  DS       ;\  ???? ?????  �???  ? ? ?  PSP ? ?????
          sub   AX,AX    ; > �?? ?????�?????? ????? ???????? ??
          push  AX       ;/  ??? ?�? ret, ? ???? ???? ?????�???.
          mov   AX,DATA             ; ? ?????  ???????????
          mov   DS,AX               ; ???????  � ????.
          mov   DX, OFFSET HELLO    ; ????� ?  ??? ? ??????
          call  WriteMsg            ; ?????? ???????????.
          mov   DX, OFFSET GREETING ; ????� ?  ??? ? ??????
          call  WriteMsg            ; ?????? ???????????.
          ret                       ; ????� ? DOS ?? ??? ?�?,
                                    ; ? ??�?????? ? 1-?? ????? PSP.
Main      ENDP
CODE      ENDS
          END Main