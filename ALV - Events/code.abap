REPORT zvmfj_ex_08.

CLASS pessoa DEFINITION.

  PUBLIC SECTION.

    EVENTS trocou_de_ano_escolar
                EXPORTING VALUE(serie) TYPE i.

    METHODS: gerenciar_troca_de_ano_escolar FOR EVENT trocou_de_ano_escolar OF pessoa
      IMPORTING serie.

    METHODS: set_ano_escolar
      IMPORTING serie TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA: serie TYPE i.

ENDCLASS.

CLASS mae DEFINITION
    INHERITING FROM pessoa.

  PUBLIC SECTION.

    METHODS: gerenciar_troca_de_ano_escolar REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS pai DEFINITION
    INHERITING FROM pessoa.

  PUBLIC SECTION.

    METHODS: gerenciar_troca_de_ano_escolar REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS pessoa IMPLEMENTATION.

  METHOD gerenciar_troca_de_ano_escolar.

    WRITE: 'Trocou de ano escolar!', /.

  ENDMETHOD.

  METHOD set_ano_escolar.

    "Posso ter validações aqui
    me->serie = serie.

    RAISE EVENT trocou_de_ano_escolar
      EXPORTING
        serie = serie.

  ENDMETHOD.

ENDCLASS.

CLASS mae IMPLEMENTATION.

  METHOD gerenciar_troca_de_ano_escolar.
    super->gerenciar_troca_de_ano_escolar( serie = serie ).
    WRITE: 'Mãe: - Meu filho é o melhor filho do mundo. ',
           'Ele está no ', serie, ' da escola', /.
  ENDMETHOD.

ENDCLASS.

CLASS pai IMPLEMENTATION.

  METHOD gerenciar_troca_de_ano_escolar.
    super->gerenciar_troca_de_ano_escolar( serie = serie ).
    WRITE: 'Pai: - Vou ter que comprar material escolar de novo!', /.
  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

  DATA: lo_filho TYPE REF TO pessoa,
        lo_mae   TYPE REF TO mae,
        lo_pai   TYPE REF TO pai.

  CREATE OBJECT: lo_filho,
                 lo_mae,
                 lo_pai.

  SET HANDLER: lo_mae->gerenciar_troca_de_ano_escolar FOR lo_filho,
               lo_pai->gerenciar_troca_de_ano_escolar FOR lo_filho.

  lo_filho->set_ano_escolar( serie = '1' ).