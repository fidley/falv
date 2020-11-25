"! This is demo for FALV Mix Demo. It contains many features, many FALVs in one program
"! and a usage of a own screen with own container and FALV
"! done by Lukasz Pegiel for http://abapblog.com
report zdemo_falv13.

types: begin of t_sflight.
        include type sflight.
types: style type lvc_t_styl,
       end of t_sflight.

data: sflight type standard table of t_sflight.
select * up to 100 rows into corresponding fields of table @sflight
  from sflight.

class lcl_test definition inheriting from zcl_falv.
  public section.

  protected section.
    methods evf_at_set_title redefinition.
    methods evf_top_of_page redefinition.

  private section.

endclass.

class lcl_test implementation.

  method evf_at_set_title.

  endmethod.

  method evf_top_of_page.

    e_dyndoc_id->add_text( text = 'Top Of Page' sap_style = cl_dd_area=>heading ).

    e_dyndoc_id->new_line( repeat = 1 ).

    e_dyndoc_id->add_link(
      exporting
        name                   =  'ABAPBLOG.com'   " Name (You Can Use Any Name You Choose)
        url                    =   'http://abapblog.com'  " URL
        tooltip                =  'ABAPBLOG.com'   " Tool Tip
        text                   =  'ABAPBLOG.com'    " Text
    ).


  endmethod.

endclass.

data: falv_screen type ref to lcl_test.
data: ok_code type sy-ucomm.


start-of-selection.
  "creation of falv with local redefinition
  data falv_redef type ref to lcl_test.
  falv_redef ?= lcl_test=>create( exporting i_applog_embedded = abap_false  i_popup = abap_true
                              i_subclass = cl_abap_classdescr=>describe_by_name( p_name = 'LCL_TEST' )
                              changing ct_table = sflight    ) .
  falv_redef->show_top_of_page( ).
  falv_redef->add_button(
    exporting
      iv_function  = 'F111'
      iv_icon      = icon_refresh
      iv_butn_type = zcl_falv=>button_normal
  ).
  falv_redef->delete_button( zcl_falv=>mc_fc_detail ).
  falv_redef->display( ).

  zcl_falv=>create( exporting i_popup = abap_true changing ct_table = sflight   )->display( ).
  falv_redef->display( ).
  "creation of standard falv
  data(falv_stand) = zcl_falv=>create( exporting i_applog_embedded = abap_true changing ct_table = sflight   ).

  falv_stand->gui_status->add_button(
    exporting
      iv_button              = falv_stand->gui_status->b_15
      iv_text                = 'F15'
      iv_icon                = icon_refresh
      iv_qinfo               = 'Test d'
      iv_allowed             = abap_true
        ).

  falv_stand->gui_status->add_button(
  exporting
    iv_button              = falv_stand->gui_status->b_16
    iv_text                = 'F16'
    iv_icon                = icon_refresh
    iv_qinfo               = 'Test d'
    iv_allowed             = abap_true
    ).

  falv_stand->gui_status->add_button(
  exporting
    iv_button              = falv_stand->gui_status->b_17
    iv_text                = 'F17'
    iv_icon                = icon_refresh
    iv_qinfo               = 'Test d'
    iv_allowed             = abap_true
).

  falv_stand->gui_status->add_button(
exporting
  iv_button              = falv_stand->gui_status->b_18
  iv_text                = 'F18'
  iv_icon                = icon_refresh
  iv_qinfo               = 'Test d'
  iv_allowed             = abap_true
).

  falv_stand->gui_status->add_button(
exporting
  iv_button              = falv_stand->gui_status->b_19
  iv_text                = 'F19'
  iv_icon                = icon_refresh
  iv_qinfo               = 'Test d'
  iv_allowed             = abap_true
).

  falv_stand->gui_status->add_button(
exporting
  iv_button              = falv_stand->gui_status->b_13
  iv_text                = 'F13'
  iv_icon                = icon_refresh
  iv_qinfo               = 'Test d'
  iv_allowed             = abap_true
).

  falv_stand->gui_status->add_button(
  exporting
    iv_button              = falv_stand->gui_status->b_14
    iv_text                = 'F14'
    iv_icon                = icon_refresh
    iv_qinfo               = 'Test d'
    iv_allowed             = abap_true
).


  falv_stand->display( ).

  "copy of standard falv + some changes of descriptions
  data(falv_stand_copy) = falv_stand->create_by_copy(  ).
  falv_stand_copy->column( 'CARRID' )->set_scrtext_l( 'test' ).
  falv_stand_copy->column( 'CARRID' )->set_scrtext_m( 'test' ).
  falv_stand_copy->column( 'CARRID' )->set_scrtext_s( 'test' ).
  falv_stand_copy->column( 'CARRID' )->set_reptext( 'test' ).
  falv_stand_copy->variant-report = sy-repid.
  falv_stand_copy->layout_save = 'X'.
  falv_stand_copy->layout->set_zebra( abap_true  ).
  falv_stand_copy->display( ).

  "copy of falv with own local redefinitions
  data(falv_redef_copy) = falv_redef->create_by_copy(  ).
  falv_redef_copy->display( ).

  falv_stand->display( ).

  falv_stand_copy->display( ).

  falv_redef_copy->column( 'SEATSMAX' )->set_edit( abap_true ).
  falv_redef_copy->layout->set_edit( abap_true ).
  falv_redef_copy->set_editable( ).
  falv_redef_copy->layout->set_stylefname( 'STYLE' ).
  falv_redef_copy->set_cell_disabled(
    exporting
      iv_fieldname = 'SEATSMAX'
      iv_row       = 1
  ).
  falv_redef_copy->add_button(
    exporting
      iv_function  = zcl_falv=>fc_mass_replace
      iv_icon      = icon_replace
  ).
  falv_redef_copy->refresh_table_display( ).
  falv_redef_copy->delete_all_buttons(   ).
  falv_redef_copy->display( ).

  falv_stand->display( ).

  falv_redef_copy->display( ).

  call screen 100.
*&---------------------------------------------------------------------*
*&      Module  PBO  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
module pbo output.
  set pf-status 'DYNAMIC_STATUS_PART' of program 'SAPLZFALV'.
  if falv_screen is initial.
    falv_screen ?= lcl_test=>create( exporting
      i_parent = new cl_gui_custom_container( container_name = 'CC_MAIN' )
      i_subclass = cl_abap_classdescr=>describe_by_name( p_name = 'LCL_TEST' )
      changing ct_table = sflight    ) .
    falv_screen->column( 'CARRID' )->set_reptext( 'test' ).
    falv_screen->show_top_of_page( ).
    falv_screen->display( ).
  endif.
endmodule.

module pai input.
  falv_screen->pai(
    exporting
      iv_dynnr = sy-dynnr
    changing
      c_ucomm  = ok_code
  ).

endmodule.
