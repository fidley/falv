*&---------------------------------------------------------------------*
*& Report zdemo_falv27
*&---------------------------------------------------------------------*
*& Demo for merging of cells, based on:
*& https://tricktresor.de/blog/zellen-verbinden/
*&---------------------------------------------------------------------*
REPORT zdemo_falv27.

*REPORT ztrcktrsr_alv_grid_merge_demo1.
*&---------------------------------------------------------------------*
*& (c) Edwin Leippi Software-Entwicklung                               *
*& Email : info@leippi.de                                              *
*& Datum : 01.03.2008                                                  *
*&                                                                     *
*& Der Autor übernimmt keine Haftung für Schäden,                      *
*& die durch den Einsatz dieses Programmes entstehen können            *
*&---------------------------------------------------------------------*
*& https://tricktresor.de/blog/zellen-verbinden/
*&---------------------------------------------------------------------*

PARAMETERS dummy.


class lcl_falv definition INHERITING FROM zcl_falv.

  public section.
      INCLUDE <cl_alv_control>.
        DATA style  TYPE lvc_style.
  PROTECTED SECTION.
      methods evf_before_first_display REDEFINITION.
  private section.
        METHODS merge_cells.
endclass.

class lcl_falv implementation.

  method evf_before_first_display.
        merge_cells( ).
  endmethod.


   METHOD merge_cells.

    " vertikal verbinden
    set_merge_vertically(
        col           = 1
        tab_row_merge =  VALUE #(
           ( row_id    = 1 outputlen = 2 ) ) ).

    set_cell_style(
        row   = 1
        col   = 1
        style = CONV #( alv_style_font_bold
                + alv_style_align_center_center
                + alv_style_color_key ) ) .

    " Horizontal verbinden
    set_merge_horizontally(
        row           = 1
        tab_col_merge = VALUE #(
          ( col_id    = 1  outputlen = 2 ) ) ).

    set_merge_horizontally(
        row           = 1
        tab_col_merge = VALUE #(
          ( col_id    = 4  outputlen = 8 )
          ( col_id    = 10 outputlen = 12 ) ) ).

    set_cell_style(
        row   = 1
        col   = 3
        style = alv_style_font_bold ).

    set_cell_style(
        row   = 1
        col   = 4
        style = alv_style_font_bold ).

    set_cell_style(
        row   = 1
        col   = 9
        style = alv_style_font_bold ).

    set_cell_style(
        row   = 1
        col   = 10
        style = alv_style_font_bold ).


    set_merge_horizontally(
        row           = 2
        tab_col_merge = VALUE #(
          ( col_id    = 4  outputlen = 7 )
          ( col_id    = 10 outputlen = 2 ) ) ).


    set_cell_style(
        col   = 3
        style = CONV #( alv_style_color_group
                      + alv_style_align_center_center ) ).

    style    = alv_style_color_heading
             + alv_style_align_center_center.

    set_cell_style(
        col   = 4
        style = style ).

    set_cell_style(
        col   = 5
        style = style ).

    set_cell_style(
        col   = 6
        style = style ).

    set_cell_style(
        col   = 7
        style = style ).

    set_cell_style(
        col   = 8
        style = style ).

    style     = alv_style_color_total
              + alv_style_align_center_center.

    set_cell_style(
        col   = 9
        style = style ).

    style     = alv_style_color_negative
              + alv_style_align_center_center.

    set_cell_style(
        col   = 10
        style = style ).

    set_cell_style(
        col   = 11
        style = style ).

    set_cell_style(
        col   = 12
        style = style ).

    set_cell_style(
        col   = 13
        style = style ).

    style    = alv_style_color_positive
             + alv_style_align_center_center.

    set_cell_style(
        col   = 14
        style = style ).

    set_cell_style(
        col   = 15
        style = style ).

    style     = alv_style_color_int_background
              + alv_style_align_center_center.

    set_cell_style(
        col   = 16
        style = style ).

    style    = alv_style_color_positive
             + alv_style_align_center_center
             + alv_style_font_italic.


    set_cell_style(
        row   = 4
        col   = 2
        style = style ).

    set_fixed_col_row(
        col = 3
        row = 3 ).

  ENDMETHOD.
endclass.

CLASS merge DEFINITION.
  PUBLIC SECTION.

    INCLUDE <cl_alv_control>.

    METHODS init
      IMPORTING
        parent TYPE REF TO cl_gui_container.
  PRIVATE SECTION.
    METHODS set_fieldcatalog.
    METHODS set_demo_data.

    TYPES: BEGIN OF ts_demo,
             field01(20),
             field02(20),
             field03(20),
             field04(20),
             field05(20),
             field06(20),
             field07(20),
             field08(20),
             field09(20),
             field10(20),
             field11(20),
             field12(20),
           END OF ts_demo,
           tt_demo TYPE STANDARD TABLE OF ts_demo WITH DEFAULT KEY.

    DATA demo TYPE tt_demo.

*FIELD-SYMBOLS <style>        TYPE t_check_styles.
    DATA fieldcatalog  TYPE lvc_t_fcat.

    DATA style  TYPE lvc_style.


ENDCLASS.
CLASS merge IMPLEMENTATION.
  METHOD init.

    DATA variant TYPE disvariant. "for parameter IS_VARIANT
    DATA layout TYPE lvc_s_layo.   " Layout



    layout-stylefname = 'CELL'.
    layout-no_headers = 'X'.
    layout-cwidth_opt = ' '.
    layout-no_toolbar = 'X'.

    set_fieldcatalog( ).
    set_demo_data( ).

    data falv type ref to lcl_falv.
    falv ?= lcl_falv=>create(
      EXPORTING
        i_parent          = parent
      CHANGING
        ct_table          =  demo   ).

    falv->set_frontend_fieldcatalog( fieldcatalog  ).
    falv->layout->set_stylefname( 'CELL' ).
    falv->layout->set_no_headers( 'X' ).
    falv->layout->set_cwidth_opt( ' ' ).
    falv->layout->set_no_toolbar( 'X' ).

   falv->display(
*     EXPORTING
*       iv_force_grid   = space
*       iv_start_row    =
*       iv_start_column =
*       iv_end_row      =
*       iv_end_column   =
*     RECEIVING
*       r_falv          =
   ).
*    "set table
*    alv_grid->set_table_for_first_display(
*      EXPORTING
*        is_variant      = variant
*        is_layout       = layout
*      CHANGING
*        it_fieldcatalog = fieldcatalog
*        it_outtab       = demo ).
*    merge_cells( ).
  ENDMETHOD.

  METHOD set_fieldcatalog.
    DATA fcat TYPE lvc_s_fcat.
    DATA fieldnr TYPE n LENGTH 2.
    DATA fieldname TYPE string.
    DO 12 TIMES.
      CLEAR fcat.
      fieldnr = sy-index.
      fcat-col_pos = sy-index.
      CONCATENATE 'FIELD' fieldnr INTO fieldname.
      fcat-fieldname = fieldname.
      fcat-tabname   = '1'.
      fcat-datatype  = 'CHAR'.
      fcat-inttype   = 'C'.
      fcat-intlen    = 20.
      IF sy-index > 1.
        fcat-outputlen    = 6.
      ELSE.
        fcat-outputlen    = 20.
      ENDIF.
      fcat-reptext   = fieldname.
      fcat-scrtext_l = fieldname.
      fcat-scrtext_m = fieldname.
      fcat-scrtext_s = fieldname.
      fcat-scrtext_l = fieldname.
      APPEND fcat TO fieldcatalog.
    ENDDO.
  ENDMETHOD.

  METHOD set_demo_data.

* 1 Zeile
    APPEND VALUE #(
      field01 = 'TRICKTRESOR'
      field03 = 'F'
      field04 = 'P'
      field09 = 'M'
      field10 = 'K' ) TO demo.

* 2 Zeile
    APPEND VALUE #(
      field03 = 'HQ'
      field04 = 'HC'
      field08 = 'HW'
      field09 = 'HC'
      field10 = 'HC'
      field12 = 'HW' ) TO demo.

* 3. Zeile
    APPEND VALUE #(
      field01 = 'Bezeichnung'
      field02 = 'Radius'
      field03 = 'WPX 12'
      field04 = 'WAP 25'
      field05 = 'WAP 35'
      field06 = 'WTP 35'
      field07 = 'WXP 45'
      field08 = 'WPM'
      field09 = 'WXM 35'
      field10 = 'WAK 15'
      field11 = 'WAK 25'
      field12 = 'WKM' ) TO demo.

* 4. Zeile
    APPEND VALUE #(
      field01 = 'SPMW 060304 T - A 27'
      field02 = '0.54'
      field03 = icon_led_green
      field04 = icon_led_yellow
      field05 = icon_led_red
      field08 = icon_led_yellow ) TO demo.

    APPEND VALUE #(
      field01 = 'SPMW 060304 - A 57'
      field02 = '0.43'
      field03 = icon_led_yellow
      field05 = icon_led_red
      field08 = icon_led_yellow
      field10 = icon_led_yellow
      field11 = icon_led_red
      field12 = icon_led_yellow ) TO demo.

    APPEND VALUE #(
      field01 = 'SPMW 060304 - D 51'
      field02 = '0.76'
      field04 = icon_led_yellow
      field05 = icon_led_red
      field06 = icon_led_red
      field07 = icon_led_red ) TO demo.

    APPEND VALUE #(
      field01 = 'SPMW 060304 - F 55'
      field02 = '0.44'
      field03 = icon_led_red
      field05 = icon_led_green
      field06 = icon_led_yellow
      field07 = icon_led_red
      field09 = icon_led_yellow
      field10 = icon_led_green
      field11 = icon_led_yellow
      field12 = icon_led_yellow ) TO demo.
  ENDMETHOD.


ENDCLASS.

INITIALIZATION.

** Objekte instanzieren und zuordnen: Grid
  DATA(merge_demo) = NEW merge( ).
  merge_demo->init( NEW cl_gui_docking_container( side = cl_gui_docking_container=>dock_at_bottom ratio = 90 ) ).
