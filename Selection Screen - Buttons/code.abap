REPORT z_teste_botao.

* Estrutura necess�ria para manipula��o do elemento na Tela
*----------------------------------------------------------
TABLES: sscrfields.

* Type Pools com os �cones (duplo clique para visualiza-los) �� �
*----------------------------------------------------------
TYPE-POOLS: icon.

* Declara��o do Bot�o
* Voc� pode utilizar da fun��o 1 at� a fun��o 5
* O atalho ser� Ctrl+Fx onde X � o n�mero da Function Key
*--------------------------------------------------------
SELECTION-SCREEN: FUNCTION KEY 1. "Declara��o do Bot�o

* O Bot�o por s� s� n�o faz uma tela de sele��o.
* Outros elementos de tela devem existir, e o bot�o ir� aparecer ao lado
* do bot�o executar.
*-----------------------------------------------------------------------
PARAMETERS: p_dummy TYPE char10.

* Descrevendo o bot�o no evento Initialization
*---------------------------------------------
INITIALIZATION.

 PERFORM cria_botao.

* Manipuala��o do Bot�o
*----------------------
AT SELECTION-SCREEN.

 IF sy-ucomm = 'FC01'.
 BREAK-POINT.
 ENDIF.

*&---------------------------------------------------------------------*
*&����� Form� cria_botao
*&---------------------------------------------------------------------*
FORM cria_botao .

*� Estrutura para descrever o bot�o
 DATA: wa_button TYPE smp_dyntxt.

*� Nome do Bot�o
 wa_button-text����� = 'Botao Log de Erros'.

*� �cone do Bot�o
 wa_button-icon_id�� = icon_error_protocol.

*� Texto que aparecer� ao lado do �cone (pode ser vazio)
 wa_button-icon_text = 'Log de Erros'.

*� Quickinfo (aparece quando o user passar o mouse sobre o botao)
 wa_button-quickinfo = 'Visualizar Log de Erros'.

*� Associa essas propriedades com a fun��o 1
 sscrfields-functxt_01 = wa_button.

ENDFORM.������������������� " cria_botao