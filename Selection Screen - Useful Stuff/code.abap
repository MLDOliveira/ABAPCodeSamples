REPORT  z_adicionais_zombie.

* Vamos come�ar a nos divertir hehe :D
* Ah, e boa parte dessas coisas voc� v� no HELP (F1).
*----------------------------------------------

SELECTION-SCREEN BEGIN OF BLOCK bl01 WITH FRAME.

*------> Pular Linhas
PARAMETER: p_pula  TYPE char10.
SELECTION-SCREEN SKIP 1. "Podem ser X linhas
PARAMETER: p_pulou TYPE char10.
SELECTION-SCREEN SKIP 2.

*-------> Coment�rio
SELECTION-SCREEN COMMENT /1(50) comment.
SELECTION-SCREEN SKIP 1.

*-------> Bot�o para apertar (apertar = clicar hehe)
SELECTION-SCREEN  PUSHBUTTON /2(13) botao USER-COMMAND click.
SELECTION-SCREEN SKIP 1.

*-------> Linha Horizontal
SELECTION-SCREEN ULINE. "mesmo esquema do WRITE
SELECTION-SCREEN SKIP 1.

*-------> ListBox (ele puxa os valores do dom�nio)
PARAMETERS: p_listb   TYPE MARA-MTART
                      AS LISTBOX VISIBLE LENGTH 10.

SELECTION-SCREEN END OF BLOCK bl01.

*----------------------------------------------------------
* Vou criar outra tela de sele��o, igual a de cima!
* Escrever tudo denovo? Pra que?
SELECTION-SCREEN BEGIN OF SCREEN 9000 AS WINDOW.

*-------> Incluir uma tela de sele��o em outras
SELECTION-SCREEN INCLUDE BLOCKS bl01.
* D� pra fazer s� com parameters ou s� com select-options
* aperte F1 no INCLUDE ali pra ver!

SELECTION-SCREEN END OF SCREEN 9000.

*--------------------------------------
INITIALIZATION.

* Texto do Coment�rio
  comment = 'Eu sou um coment�rio, duh'.
* Texto do Bot�o
  botao = 'Click Me!'.

*--------------------------------------
AT SELECTION-SCREEN.

* Clicou no botao!
  IF sy-ucomm = 'CLICK'.
*   E com isso, voc� pode chamar a mesma tela como pop-up X vezes
*   (at� o sap n�o aguentar e dar uns problemas malucos!).
    CALL SELECTION-SCREEN 9000 STARTING AT 5 5.
  ENDIF.