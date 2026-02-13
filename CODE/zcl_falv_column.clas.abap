CLASS zcl_falv_column DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA fieldname TYPE lvc_s_fcat-fieldname READ-ONLY.

    METHODS constructor
      IMPORTING VALUE(iv_fieldname) TYPE lvc_s_fcat-fieldname
                io_falv             TYPE REF TO zcl_falv.

    METHODS set_editable RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.
    METHODS set_readonly RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_row_pos
      IMPORTING VALUE(iv_value) TYPE lvc_rowpos
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_col_pos
      IMPORTING VALUE(iv_value) TYPE lvc_colpos
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_fieldname
      IMPORTING VALUE(iv_value) TYPE lvc_fname
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_tabname
      IMPORTING VALUE(iv_value) TYPE lvc_tname
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_currency
      IMPORTING VALUE(iv_value) TYPE lvc_curr
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_cfieldname
      IMPORTING VALUE(iv_value) TYPE lvc_cfname
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_quantity
      IMPORTING VALUE(iv_value) TYPE lvc_quan
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_qfieldname
      IMPORTING VALUE(iv_value) TYPE lvc_qfname
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_ifieldname
      IMPORTING VALUE(iv_value) TYPE lvc_fname
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_round
      IMPORTING VALUE(iv_value) TYPE lvc_round
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_exponent
      IMPORTING VALUE(iv_value) TYPE lvc_expont
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_key
      IMPORTING VALUE(iv_value) TYPE lvc_key
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_key_sel
      IMPORTING VALUE(iv_value) TYPE lvc_keysel
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_icon
      IMPORTING VALUE(iv_value) TYPE lvc_icon
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_symbol
      IMPORTING VALUE(iv_value) TYPE lvc_symbol
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_checkbox
      IMPORTING VALUE(iv_value) TYPE lvc_checkb
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_just
      IMPORTING VALUE(iv_value) TYPE lvc_just
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_lzero
      IMPORTING VALUE(iv_value) TYPE lvc_lzero
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_no_sign
      IMPORTING VALUE(iv_value) TYPE lvc_nosign
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_no_zero
      IMPORTING VALUE(iv_value) TYPE lvc_nozero
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_no_convext
      IMPORTING VALUE(iv_value) TYPE lvc_noconv
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_edit_mask
      IMPORTING VALUE(iv_value) TYPE lvc_edtmsk
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_emphasize
      IMPORTING VALUE(iv_value) TYPE lvc_emphsz
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_color
      IMPORTING VALUE(iv_value) TYPE lvc_emphsz
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_fix_column
      IMPORTING VALUE(iv_value) TYPE lvc_fixcol
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_do_sum
      IMPORTING VALUE(iv_value) TYPE lvc_dosum
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_no_sum
      IMPORTING VALUE(iv_value) TYPE lvc_nosum
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_no_out
      IMPORTING VALUE(iv_value) TYPE lvc_noout
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_tech
      IMPORTING VALUE(iv_value) TYPE lvc_tech
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_outputlen
      IMPORTING VALUE(iv_value) TYPE lvc_outlen
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_convexit
      IMPORTING VALUE(iv_value) TYPE convexit
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_seltext
      IMPORTING VALUE(iv_value) TYPE lvc_txt
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_tooltip
      IMPORTING VALUE(iv_value) TYPE lvc_tip
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_rollname
      IMPORTING VALUE(iv_value) TYPE lvc_roll
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_datatype
      IMPORTING VALUE(iv_value) TYPE datatype_d
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_inttype
      IMPORTING VALUE(iv_value) TYPE inttype
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_intlen
      IMPORTING VALUE(iv_value) TYPE intlen
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_lowercase
      IMPORTING VALUE(iv_value) TYPE lowercase
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_reptext
      IMPORTING VALUE(iv_value) TYPE reptext
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_hier_level
      IMPORTING VALUE(iv_value) TYPE lvc_hierl
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_reprep
      IMPORTING VALUE(iv_value) TYPE lvc_crprp
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_domname
      IMPORTING VALUE(iv_value) TYPE domname
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_sp_group
      IMPORTING VALUE(iv_value) TYPE lvc_spgrp
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_hotspot
      IMPORTING VALUE(iv_value) TYPE lvc_hotspt
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_dfieldname
      IMPORTING VALUE(iv_value) TYPE lvcdbgfn
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_col_id
      IMPORTING VALUE(iv_value) TYPE lvc_colid
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_f4availabl
      IMPORTING VALUE(iv_value) TYPE ddf4avail
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_auto_value
      IMPORTING VALUE(iv_value) TYPE lvc_auto
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_checktable
      IMPORTING VALUE(iv_value) TYPE tabname
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_valexi
      IMPORTING VALUE(iv_value) TYPE valexi
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_web_field
      IMPORTING VALUE(iv_value) TYPE lvc_fname
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_href_hndl
      IMPORTING VALUE(iv_value) TYPE int4
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_style
      IMPORTING VALUE(iv_value) TYPE lvc_style
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_style2
      IMPORTING VALUE(iv_value) TYPE lvc_style
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_style3
      IMPORTING VALUE(iv_value) TYPE lvc_style
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_style4
      IMPORTING VALUE(iv_value) TYPE lvc_style
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_drdn_hndl
      IMPORTING VALUE(iv_value)             TYPE int4
                VALUE(iv_use_domain_values) TYPE abap_bool  DEFAULT 'X'
                VALUE(iv_use_alias)         TYPE abap_bool  DEFAULT 'X'
                VALUE(it_drop_down)         TYPE lvc_t_drop OPTIONAL
                VALUE(it_drop_down_alias)   TYPE lvc_t_dral OPTIONAL
      RETURNING VALUE(r_column)             TYPE REF TO zcl_falv_column.

    METHODS set_drdn_field
      IMPORTING VALUE(iv_value) TYPE lvc_fname
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_no_merging
      IMPORTING VALUE(iv_value) TYPE char01
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_h_ftype
      IMPORTING VALUE(iv_value) TYPE lvc_ftype
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_col_opt
      IMPORTING VALUE(iv_value) TYPE lvc_colopt
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_no_init_ch
      IMPORTING VALUE(iv_value) TYPE char01
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_drdn_alias
      IMPORTING VALUE(iv_value) TYPE char01
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_decfloat_style
      IMPORTING VALUE(iv_value) TYPE outputstyle
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_parameter0
      IMPORTING VALUE(iv_value) TYPE char30
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_parameter1
      IMPORTING VALUE(iv_value) TYPE char30
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_parameter2
      IMPORTING VALUE(iv_value) TYPE char30
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_parameter3
      IMPORTING VALUE(iv_value) TYPE char30
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_parameter4
      IMPORTING VALUE(iv_value) TYPE char30
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_parameter5
      IMPORTING VALUE(iv_value) TYPE int4
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_parameter6
      IMPORTING VALUE(iv_value) TYPE int4
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_parameter7
      IMPORTING VALUE(iv_value) TYPE int4
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_parameter8
      IMPORTING VALUE(iv_value) TYPE int4
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_parameter9
      IMPORTING VALUE(iv_value) TYPE int4
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_ref_field
      IMPORTING VALUE(iv_value) TYPE lvc_rfname
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_ref_table
      IMPORTING VALUE(iv_value) TYPE lvc_rtname
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_txt_field
      IMPORTING VALUE(iv_value) TYPE lvc_fname
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_roundfield
      IMPORTING VALUE(iv_value) TYPE lvc_rndfn
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_decimals_o
      IMPORTING VALUE(iv_value) TYPE lvc_decmls
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_decmlfield
      IMPORTING VALUE(iv_value) TYPE lvc_dfname
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_dd_outlen
      IMPORTING VALUE(iv_value) TYPE lvc_ddlen
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_decimals
      IMPORTING VALUE(iv_value) TYPE decimals
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_coltext
      IMPORTING VALUE(iv_value) TYPE lvc_txtcol
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_scrtext_l
      IMPORTING VALUE(iv_value) TYPE scrtext_l
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_scrtext_m
      IMPORTING VALUE(iv_value) TYPE scrtext_m
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_scrtext_s
      IMPORTING VALUE(iv_value) TYPE scrtext_s
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_colddictxt
      IMPORTING VALUE(iv_value) TYPE lvc_ddict
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_selddictxt
      IMPORTING VALUE(iv_value) TYPE lvc_ddict
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_tipddictxt
      IMPORTING VALUE(iv_value) TYPE lvc_ddict
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_edit
      IMPORTING VALUE(iv_value) TYPE lvc_edit
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_tech_col
      IMPORTING VALUE(iv_value) TYPE lvc_tcol
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_tech_form
      IMPORTING VALUE(iv_value) TYPE lvc_tform
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_tech_comp
      IMPORTING VALUE(iv_value) TYPE lvc_tcomp
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_hier_cpos
      IMPORTING VALUE(iv_value) TYPE lvchcolpos
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_h_col_key
      IMPORTING VALUE(iv_value) TYPE tv_itmname
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_h_select
      IMPORTING VALUE(iv_value) TYPE lvc_select
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_dd_roll
      IMPORTING VALUE(iv_value) TYPE rollname
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_dragdropid
      IMPORTING VALUE(iv_value) TYPE lvc_ddid
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_mac
      IMPORTING VALUE(iv_value) TYPE char01
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_indx_field
      IMPORTING VALUE(iv_value) TYPE int4
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_indx_cfiel
      IMPORTING VALUE(iv_value) TYPE int4
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_indx_qfiel
      IMPORTING VALUE(iv_value) TYPE int4
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_indx_ifiel
      IMPORTING VALUE(iv_value) TYPE int4
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_indx_round
      IMPORTING VALUE(iv_value) TYPE int4
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_indx_decml
      IMPORTING VALUE(iv_value) TYPE int4
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_get_style
      IMPORTING VALUE(iv_value) TYPE char01
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_mark
      IMPORTING VALUE(iv_value) TYPE char01
      RETURNING VALUE(r_column) TYPE REF TO zcl_falv_column.

    METHODS set_texts
      IMPORTING VALUE(iv_text_s) TYPE scrtext_s
                VALUE(iv_text_m) TYPE scrtext_m OPTIONAL
                VALUE(iv_text_l) TYPE scrtext_l OPTIONAL
      RETURNING VALUE(r_column)  TYPE REF TO zcl_falv_column.

    METHODS get_editable
      RETURNING VALUE(rv_editable) TYPE abap_bool.

    METHODS get_readonly

      RETURNING VALUE(rv_read_only) TYPE abap_bool.

    METHODS get_row_pos
      RETURNING VALUE(rv_value) TYPE lvc_rowpos.

    METHODS get_col_pos
      RETURNING VALUE(rv_value) TYPE lvc_colpos.

    METHODS get_fieldname
      RETURNING VALUE(rv_value) TYPE lvc_fname.

    METHODS get_tabname
      RETURNING VALUE(rv_value) TYPE lvc_tname.

    METHODS get_currency
      RETURNING VALUE(rv_value) TYPE lvc_curr.

    METHODS get_cfieldname
      RETURNING VALUE(rv_value) TYPE lvc_cfname.

    METHODS get_quantity
      RETURNING VALUE(rv_value) TYPE lvc_quan.

    METHODS get_qfieldname
      RETURNING VALUE(rv_value) TYPE lvc_qfname.

    METHODS get_ifieldname
      RETURNING VALUE(rv_value) TYPE lvc_fname.

    METHODS get_round
      RETURNING VALUE(rv_value) TYPE lvc_round.

    METHODS get_exponent
      RETURNING VALUE(rv_value) TYPE lvc_expont.

    METHODS get_key
      RETURNING VALUE(rv_value) TYPE lvc_key.

    METHODS get_key_sel
      RETURNING VALUE(rv_value) TYPE lvc_keysel.

    METHODS get_icon
      RETURNING VALUE(rv_value) TYPE lvc_icon.

    METHODS get_symbol
      RETURNING VALUE(rv_value) TYPE lvc_symbol.

    METHODS get_checkbox
      RETURNING VALUE(rv_value) TYPE lvc_checkb.

    METHODS get_just
      RETURNING VALUE(rv_value) TYPE lvc_just.

    METHODS get_lzero
      RETURNING VALUE(rv_value) TYPE lvc_lzero.

    METHODS get_no_sign
      RETURNING VALUE(rv_value) TYPE lvc_nosign.

    METHODS get_no_zero
      RETURNING VALUE(rv_value) TYPE lvc_nozero.

    METHODS get_no_convext
      RETURNING VALUE(rv_value) TYPE lvc_noconv.

    METHODS get_edit_mask
      RETURNING VALUE(rv_value) TYPE lvc_edtmsk.

    METHODS get_emphasize
      RETURNING VALUE(rv_value) TYPE lvc_emphsz.

    METHODS get_color
      RETURNING VALUE(rv_value) TYPE lvc_emphsz.

    METHODS get_fix_column
      RETURNING VALUE(rv_value) TYPE lvc_fixcol.

    METHODS get_do_sum
      RETURNING VALUE(rv_value) TYPE lvc_dosum.

    METHODS get_no_sum
      RETURNING VALUE(rv_value) TYPE lvc_nosum.

    METHODS get_no_out
      RETURNING VALUE(rv_value) TYPE lvc_noout.

    METHODS get_tech
      RETURNING VALUE(rv_value) TYPE lvc_tech.

    METHODS get_outputlen
      RETURNING VALUE(rv_value) TYPE lvc_outlen.

    METHODS get_convexit
      RETURNING VALUE(rv_value) TYPE convexit.

    METHODS get_seltext
      RETURNING VALUE(rv_value) TYPE lvc_txt.

    METHODS get_tooltip
      RETURNING VALUE(rv_value) TYPE lvc_tip.

    METHODS get_rollname
      RETURNING VALUE(rv_value) TYPE lvc_roll.

    METHODS get_datatype
      RETURNING VALUE(rv_value) TYPE datatype_d.

    METHODS get_inttype
      RETURNING VALUE(rv_value) TYPE inttype.

    METHODS get_intlen
      RETURNING VALUE(rv_value) TYPE intlen.

    METHODS get_lowercase
      RETURNING VALUE(rv_value) TYPE lowercase.

    METHODS get_reptext
      RETURNING VALUE(rv_value) TYPE reptext.

    METHODS get_hier_level
      RETURNING VALUE(rv_value) TYPE lvc_hierl.

    METHODS get_reprep
      RETURNING VALUE(rv_value) TYPE lvc_crprp.

    METHODS get_domname
      RETURNING VALUE(rv_value) TYPE domname.

    METHODS get_sp_group
      RETURNING VALUE(rv_value) TYPE lvc_spgrp.

    METHODS get_hotspot
      RETURNING VALUE(rv_value) TYPE lvc_hotspt.

    METHODS get_dfieldname
      RETURNING VALUE(rv_value) TYPE lvcdbgfn.

    METHODS get_col_id
      RETURNING VALUE(rv_value) TYPE lvc_colid.

    METHODS get_f4availabl
      RETURNING VALUE(rv_value) TYPE ddf4avail.

    METHODS get_auto_value
      RETURNING VALUE(rv_value) TYPE lvc_auto.

    METHODS get_checktable
      RETURNING VALUE(rv_value) TYPE tabname.

    METHODS get_valexi
      RETURNING VALUE(rv_value) TYPE valexi.

    METHODS get_web_field
      RETURNING VALUE(rv_value) TYPE lvc_fname.

    METHODS get_href_hndl
      RETURNING VALUE(rv_value) TYPE int4.

    METHODS get_style
      RETURNING VALUE(rv_value) TYPE lvc_style.

    METHODS get_style2
      RETURNING VALUE(rv_value) TYPE lvc_style.

    METHODS get_style3
      RETURNING VALUE(rv_value) TYPE lvc_style.

    METHODS get_style4
      RETURNING VALUE(rv_value) TYPE lvc_style.

    METHODS get_drdn_hndl
      RETURNING VALUE(rv_value) TYPE int4.

    METHODS get_drdn_field
      RETURNING VALUE(rv_value) TYPE lvc_fname.

    METHODS get_no_merging
      RETURNING VALUE(rv_value) TYPE char01.

    METHODS get_h_ftype
      RETURNING VALUE(rv_value) TYPE lvc_ftype.

    METHODS get_col_opt
      RETURNING VALUE(rv_value) TYPE lvc_colopt.

    METHODS get_no_init_ch
      RETURNING VALUE(rv_value) TYPE char01.

    METHODS get_drdn_alias
      RETURNING VALUE(rv_value) TYPE char01.

    METHODS get_decfloat_style
      RETURNING VALUE(rv_value) TYPE outputstyle.

    METHODS get_parameter0
      RETURNING VALUE(rv_value) TYPE char30.

    METHODS get_parameter1
      RETURNING VALUE(rv_value) TYPE char30.

    METHODS get_parameter2
      RETURNING VALUE(rv_value) TYPE char30.

    METHODS get_parameter3
      RETURNING VALUE(rv_value) TYPE char30.

    METHODS get_parameter4
      RETURNING VALUE(rv_value) TYPE char30.

    METHODS get_parameter5
      RETURNING VALUE(rv_value) TYPE int4.

    METHODS get_parameter6
      RETURNING VALUE(rv_value) TYPE int4.

    METHODS get_parameter7
      RETURNING VALUE(rv_value) TYPE int4.

    METHODS get_parameter8
      RETURNING VALUE(rv_value) TYPE int4.

    METHODS get_parameter9
      RETURNING VALUE(rv_value) TYPE int4.

    METHODS get_ref_field
      RETURNING VALUE(rv_value) TYPE lvc_rfname.

    METHODS get_ref_table
      RETURNING VALUE(rv_value) TYPE lvc_rtname.

    METHODS get_txt_field
      RETURNING VALUE(rv_value) TYPE lvc_fname.

    METHODS get_roundfield
      RETURNING VALUE(rv_value) TYPE lvc_rndfn.

    METHODS get_decimals_o
      RETURNING VALUE(rv_value) TYPE lvc_decmls.

    METHODS get_decmlfield
      RETURNING VALUE(rv_value) TYPE lvc_dfname.

    METHODS get_dd_outlen
      RETURNING VALUE(rv_value) TYPE lvc_ddlen.

    METHODS get_decimals
      RETURNING VALUE(rv_value) TYPE decimals.

    METHODS get_coltext
      RETURNING VALUE(rv_value) TYPE lvc_txtcol.

    METHODS get_scrtext_l
      RETURNING VALUE(rv_value) TYPE scrtext_l.

    METHODS get_scrtext_m
      RETURNING VALUE(rv_value) TYPE scrtext_m.

    METHODS get_scrtext_s
      RETURNING VALUE(rv_value) TYPE scrtext_s.

    METHODS get_colddictxt
      RETURNING VALUE(rv_value) TYPE lvc_ddict.

    METHODS get_selddictxt
      RETURNING VALUE(rv_value) TYPE lvc_ddict.

    METHODS get_tipddictxt
      RETURNING VALUE(rv_value) TYPE lvc_ddict.

    METHODS get_edit
      RETURNING VALUE(rv_value) TYPE lvc_edit.

    METHODS get_tech_col
      RETURNING VALUE(rv_value) TYPE lvc_tcol.

    METHODS get_tech_form
      RETURNING VALUE(rv_value) TYPE lvc_tform.

    METHODS get_tech_comp
      RETURNING VALUE(rv_value) TYPE lvc_tcomp.

    METHODS get_hier_cpos
      RETURNING VALUE(rv_value) TYPE lvchcolpos.

    METHODS get_h_col_key
      RETURNING VALUE(rv_value) TYPE tv_itmname.

    METHODS get_h_select
      RETURNING VALUE(rv_value) TYPE lvc_select.

    METHODS get_dd_roll
      RETURNING VALUE(rv_value) TYPE rollname.

    METHODS get_dragdropid
      RETURNING VALUE(rv_value) TYPE lvc_ddid.

    METHODS get_mac
      RETURNING VALUE(rv_value) TYPE char01.

    METHODS get_indx_field
      RETURNING VALUE(rv_value) TYPE int4.

    METHODS get_indx_cfiel
      RETURNING VALUE(rv_value) TYPE int4.

    METHODS get_indx_qfiel
      RETURNING VALUE(rv_value) TYPE int4.

    METHODS get_indx_ifiel
      RETURNING VALUE(rv_value) TYPE int4.

    METHODS get_indx_round
      RETURNING VALUE(rv_value) TYPE int4.

    METHODS get_indx_decml
      RETURNING VALUE(rv_value) TYPE int4.

    METHODS get_get_style
      RETURNING VALUE(rv_value) TYPE char01.

    METHODS get_mark
      RETURNING VALUE(rv_value) TYPE char01.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA falv TYPE REF TO zcl_falv.

    METHODS change_setting
      IMPORTING VALUE(iv_value)   TYPE any
                VALUE(iv_setting) TYPE string.

    METHODS get_setting
      IMPORTING VALUE(iv_setting) TYPE string
      EXPORTING VALUE(e_value)    TYPE any.
ENDCLASS.


CLASS zcl_falv_column IMPLEMENTATION.
  METHOD change_setting.
    falv->get_frontend_fieldcatalog( IMPORTING et_fieldcatalog = falv->fcat ).
    ASSIGN falv->fcat[ fieldname = fieldname ] TO FIELD-SYMBOL(<fcat>).
    IF sy-subrc = 0.
      DATA(fcat_field) = |<fcat>-{ iv_setting }|.
      ASSIGN (fcat_field) TO FIELD-SYMBOL(<field>).
      IF sy-subrc = 0.
        <field> = iv_value.
      ENDIF.
      falv->set_frontend_fieldcatalog( it_fieldcatalog = falv->fcat ).
    ENDIF.
  ENDMETHOD.

  METHOD get_setting.
    falv->get_frontend_fieldcatalog( IMPORTING et_fieldcatalog = falv->fcat ).
    ASSIGN falv->fcat[ fieldname = fieldname ] TO FIELD-SYMBOL(<fcat>).
    IF sy-subrc = 0.
      DATA(fcat_field) = |<fcat>-{ iv_setting }|.
      ASSIGN (fcat_field) TO FIELD-SYMBOL(<field>).
      IF sy-subrc = 0.
        e_value = <field>.
      ENDIF.
    ENDIF.
  ENDMETHOD.

  METHOD constructor.
    fieldname = iv_fieldname.
    falv = io_falv.
  ENDMETHOD.

  METHOD set_auto_value.
    change_setting( iv_value   = iv_value
                    iv_setting = 'AUTO_VALUE' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_cfieldname.
    change_setting( iv_value   = iv_value
                    iv_setting = 'CFIELDNAME' ).
    set_tech_form( 2 ).
    r_column = me.
  ENDMETHOD.

  METHOD set_checkbox.
    change_setting( iv_value   = iv_value
                    iv_setting = 'CHECKBOX' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_checktable.
    change_setting( iv_value   = iv_value
                    iv_setting = 'CHECKTABLE' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_colddictxt.
    change_setting( iv_value   = iv_value
                    iv_setting = 'COLDDICTXT' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_color.
    set_emphasize( iv_value = iv_value ).
    r_column = me.
  ENDMETHOD.

  METHOD set_coltext.
    change_setting( iv_value   = iv_value
                    iv_setting = 'COLTEXT' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_col_id.
    change_setting( iv_value   = iv_value
                    iv_setting = 'COL_ID' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_col_opt.
    change_setting( iv_value   = iv_value
                    iv_setting = 'COL_OPT' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_col_pos.
    falv->get_frontend_fieldcatalog( IMPORTING et_fieldcatalog = falv->fcat ).
    ASSIGN falv->fcat[ fieldname = fieldname ] TO FIELD-SYMBOL(<current_column>).
    IF sy-subrc = 0.
      " TODO: variable is assigned but never used (ABAP cleaner)
      DATA(original_pos) = <current_column>-col_pos.
      SORT falv->fcat BY col_pos ASCENDING.
      LOOP AT falv->fcat ASSIGNING FIELD-SYMBOL(<fcat>) WHERE col_pos >= iv_value.
*        <fcat>-col_pos += 1.
         add 1 to <fcat>-col_pos.
      ENDLOOP.
      <current_column>-col_pos = iv_value.
      SORT falv->fcat BY col_pos ASCENDING.
    ENDIF.
    falv->set_frontend_fieldcatalog( it_fieldcatalog = falv->fcat ).
    r_column = me.
  ENDMETHOD.

  METHOD set_convexit.
    change_setting( iv_value   = iv_value
                    iv_setting = 'CONVEXIT' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_currency.
    change_setting( iv_value   = iv_value
                    iv_setting = 'CURRENCY' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_datatype.
    change_setting( iv_value   = iv_value
                    iv_setting = 'DATATYPE' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_dd_outlen.
    change_setting( iv_value   = iv_value
                    iv_setting = 'DD_OUTLEN' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_dd_roll.
    change_setting( iv_value   = iv_value
                    iv_setting = 'DD_ROLL' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_decfloat_style.
    change_setting( iv_value   = iv_value
                    iv_setting = 'DECFLOAT_STYLE' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_decimals.
    change_setting( iv_value   = iv_value
                    iv_setting = 'DECIMALS' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_decimals_o.
    change_setting( iv_value   = iv_value
                    iv_setting = 'DECIMALS_O' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_decmlfield.
    change_setting( iv_value   = iv_value
                    iv_setting = 'DECMLFIELD' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_dfieldname.
    change_setting( iv_value   = iv_value
                    iv_setting = 'DFIELDNAME' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_domname.
    change_setting( iv_value   = iv_value
                    iv_setting = 'DOMNAME' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_do_sum.
    change_setting( iv_value   = iv_value
                    iv_setting = 'DO_SUM' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_dragdropid.
    change_setting( iv_value   = iv_value
                    iv_setting = 'DRAGDROPID' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_drdn_alias.
    change_setting( iv_value   = iv_value
                    iv_setting = 'DRDN_ALIAS' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_drdn_field.
    change_setting( iv_value   = iv_value
                    iv_setting = 'DRDN_FIELD' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_drdn_hndl.
    DATA lt_drop_down       TYPE lvc_t_drop.
    DATA ls_drop_down       LIKE LINE OF lt_drop_down.
    DATA lt_drop_down_alias TYPE lvc_t_dral.
    DATA ls_drop_down_alias LIKE LINE OF lt_drop_down_alias.
    DATA lo_typedescr       TYPE REF TO cl_abap_typedescr.
    DATA lo_elemdescr       TYPE REF TO cl_abap_elemdescr.
    DATA lv_rollname        TYPE lvc_roll.
    DATA lt_fixed_values    TYPE STANDARD TABLE OF ddfixvalue WITH EMPTY KEY.
    DATA ls_fixed_value     LIKE LINE OF lt_fixed_values.

    change_setting( iv_value   = iv_value
                    iv_setting = 'DRDN_HNDL' ).

    IF    ( it_drop_down       IS NOT INITIAL )
       OR ( it_drop_down_alias IS NOT INITIAL ).

      APPEND LINES OF it_drop_down       TO lt_drop_down.
      APPEND LINES OF it_drop_down_alias TO lt_drop_down_alias.

    ELSE.
      IF iv_use_domain_values = abap_true.
        lv_rollname = get_rollname( ).
        cl_abap_elemdescr=>describe_by_name( EXPORTING  p_name         = lv_rollname
                                             RECEIVING  p_descr_ref    = lo_typedescr
                                             EXCEPTIONS type_not_found = 1
                                                        OTHERS         = 2 ).
        IF sy-subrc = 0.
          lo_elemdescr ?= lo_typedescr.
          lo_elemdescr->get_ddic_fixed_values( RECEIVING  p_fixed_values = lt_fixed_values
                                               EXCEPTIONS not_found      = 1
                                                          no_ddic_type   = 2
                                                          OTHERS         = 3 ).
          IF sy-subrc = 0.
            LOOP AT lt_fixed_values INTO ls_fixed_value.
              IF iv_use_alias = abap_true.
                CLEAR ls_drop_down_alias.

                ls_drop_down_alias-handle = iv_value.
                CONCATENATE ls_fixed_value-ddtext '['
                            INTO ls_drop_down_alias-value SEPARATED BY space.

                CONCATENATE ls_drop_down_alias-value
                           ls_fixed_value-low ']'
                            INTO ls_drop_down_alias-value.

                ls_drop_down_alias-int_value = ls_fixed_value-low.
                APPEND ls_drop_down_alias TO lt_drop_down_alias.
              ELSE.
                CLEAR ls_drop_down.

                ls_drop_down-handle = iv_value.
                ls_drop_down-value  = ls_fixed_value-low.
                APPEND ls_drop_down TO lt_drop_down.
              ENDIF.
            ENDLOOP.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDIF.

    IF    ( lt_drop_down       IS NOT INITIAL )
       OR ( lt_drop_down_alias IS NOT INITIAL ).
      IF iv_use_alias = abap_true.
        falv->set_drop_down_table( it_drop_down_alias = lt_drop_down_alias ).
        change_setting( iv_value   = 'X'
                        iv_setting = 'DRDN_ALIAS' ).
      ELSE.
        falv->set_drop_down_table( it_drop_down = lt_drop_down ).
      ENDIF.

    ENDIF.
    r_column = me.
  ENDMETHOD.

  METHOD set_edit.
    change_setting( iv_value   = iv_value
                    iv_setting = 'EDIT' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_editable.
    change_setting( iv_value   = abap_true
                    iv_setting = 'EDIT' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_edit_mask.
    change_setting( iv_value   = iv_value
                    iv_setting = 'EDIT_MASK' ).
    if iv_value is not initial.
       set_tech_form( 7 ).
    else.
       set_tech_form( 90 ).
    endif.
    r_column = me.
  ENDMETHOD.

  METHOD set_emphasize.
    change_setting( iv_value   = iv_value
                    iv_setting = 'EMPHASIZE' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_exponent.
    change_setting( iv_value   = iv_value
                    iv_setting = 'EXPONENT' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_f4availabl.
    change_setting( iv_value   = iv_value
                    iv_setting = 'F4AVAILABL' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_fieldname.
    change_setting( iv_value   = iv_value
                    iv_setting = 'FIELDNAME' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_fix_column.
    change_setting( iv_value   = iv_value
                    iv_setting = 'FIX_COLUMN' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_get_style.
    change_setting( iv_value   = iv_value
                    iv_setting = 'GET_STYLE' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_hier_cpos.
    change_setting( iv_value   = iv_value
                    iv_setting = 'HIER_CPOS' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_hier_level.
    change_setting( iv_value   = iv_value
                    iv_setting = 'HIER_LEVEL' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_hotspot.
    change_setting( iv_value   = iv_value
                    iv_setting = 'HOTSPOT' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_href_hndl.
    change_setting( iv_value   = iv_value
                    iv_setting = 'HREF_HNDL' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_h_col_key.
    change_setting( iv_value   = iv_value
                    iv_setting = 'H_COL_KEY' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_h_ftype.
    change_setting( iv_value   = iv_value
                    iv_setting = 'H_FTYPE' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_h_select.
    change_setting( iv_value   = iv_value
                    iv_setting = 'H_SELECT' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_icon.
    change_setting( iv_value   = iv_value
                    iv_setting = 'ICON' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_ifieldname.
    change_setting( iv_value   = iv_value
                    iv_setting = 'IFIELDNAME' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_indx_cfiel.
    change_setting( iv_value   = iv_value
                    iv_setting = 'INDX_CFIEL' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_indx_decml.
    change_setting( iv_value   = iv_value
                    iv_setting = 'INDX_DECML' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_indx_field.
    change_setting( iv_value   = iv_value
                    iv_setting = 'INDX_FIELD' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_indx_ifiel.
    change_setting( iv_value   = iv_value
                    iv_setting = 'INDX_IFIEL' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_indx_qfiel.
    change_setting( iv_value   = iv_value
                    iv_setting = 'INDX_QFIEL' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_indx_round.
    change_setting( iv_value   = iv_value
                    iv_setting = 'INDX_ROUND' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_intlen.
    change_setting( iv_value   = iv_value
                    iv_setting = 'INTLEN' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_inttype.
    change_setting( iv_value   = iv_value
                    iv_setting = 'INTTYPE' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_just.
    change_setting( iv_value   = iv_value
                    iv_setting = 'JUST' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_key.
    change_setting( iv_value   = iv_value
                    iv_setting = 'KEY' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_key_sel.
    change_setting( iv_value   = iv_value
                    iv_setting = 'KEY_SEL' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_lowercase.
    change_setting( iv_value   = iv_value
                    iv_setting = 'LOWERCASE' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_lzero.
    change_setting( iv_value   = iv_value
                    iv_setting = 'LZERO' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_mac.
    change_setting( iv_value   = iv_value
                    iv_setting = 'MAC' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_mark.
    change_setting( iv_value   = iv_value
                    iv_setting = 'MARK' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_texts.
    DATA(lv_text_l) = COND scrtext_l( WHEN iv_text_l IS NOT INITIAL THEN iv_text_l
                                      WHEN iv_text_m IS NOT INITIAL THEN iv_text_m
                                      ELSE                               iv_text_s ).
    DATA(lv_text_m) = COND scrtext_m( WHEN iv_text_m IS NOT INITIAL
                                      THEN iv_text_m
                                      ELSE iv_text_s ).
    set_scrtext_s( iv_text_s ).
    set_scrtext_m( lv_text_m ).
    set_scrtext_l( lv_text_l ).
    set_tooltip( lv_text_l ).
    set_coltext( lv_text_l ).
    set_seltext( lv_text_l ).
    set_reptext( |{ lv_text_l }| ).

    r_column = me.
  ENDMETHOD.

  METHOD set_no_convext.
    change_setting( iv_value   = iv_value
                    iv_setting = 'NO_CONVEXT' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_no_init_ch.
    change_setting( iv_value   = iv_value
                    iv_setting = 'NO_INIT_CH' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_no_merging.
    change_setting( iv_value   = iv_value
                    iv_setting = 'NO_MERGING' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_no_out.
    change_setting( iv_value   = iv_value
                    iv_setting = 'NO_OUT' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_no_sign.
    change_setting( iv_value   = iv_value
                    iv_setting = 'NO_SIGN' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_no_sum.
    change_setting( iv_value   = iv_value
                    iv_setting = 'NO_SUM' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_no_zero.
    change_setting( iv_value   = iv_value
                    iv_setting = 'NO_ZERO' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_outputlen.
    change_setting( iv_value   = iv_value
                    iv_setting = 'OUTPUTLEN' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_parameter0.
    change_setting( iv_value   = iv_value
                    iv_setting = 'PARAMETER0' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_parameter1.
    change_setting( iv_value   = iv_value
                    iv_setting = 'PARAMETER1' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_parameter2.
    change_setting( iv_value   = iv_value
                    iv_setting = 'PARAMETER2' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_parameter3.
    change_setting( iv_value   = iv_value
                    iv_setting = 'PARAMETER3' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_parameter4.
    change_setting( iv_value   = iv_value
                    iv_setting = 'PARAMETER4' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_parameter5.
    change_setting( iv_value   = iv_value
                    iv_setting = 'PARAMETER5' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_parameter6.
    change_setting( iv_value   = iv_value
                    iv_setting = 'PARAMETER6' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_parameter7.
    change_setting( iv_value   = iv_value
                    iv_setting = 'PARAMETER7' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_parameter8.
    change_setting( iv_value   = iv_value
                    iv_setting = 'PARAMETER8' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_parameter9.
    change_setting( iv_value   = iv_value
                    iv_setting = 'PARAMETER9' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_qfieldname.
    change_setting( iv_value   = iv_value
                    iv_setting = 'QFIELDNAME' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_quantity.
    change_setting( iv_value   = iv_value
                    iv_setting = 'QUANTITY' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_readonly.
    change_setting( iv_value   = abap_false
                    iv_setting = 'EDIT' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_ref_field.
    change_setting( iv_value   = iv_value
                    iv_setting = 'REF_FIELD' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_ref_table.
    change_setting( iv_value   = iv_value
                    iv_setting = 'REF_TABLE' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_reprep.
    change_setting( iv_value   = iv_value
                    iv_setting = 'REPREP' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_reptext.
    change_setting( iv_value   = iv_value
                    iv_setting = 'REPTEXT' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_rollname.
    change_setting( iv_value   = iv_value
                    iv_setting = 'ROLLNAME' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_round.
    change_setting( iv_value   = iv_value
                    iv_setting = 'ROUND' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_roundfield.
    change_setting( iv_value   = iv_value
                    iv_setting = 'ROUNDFIELD' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_row_pos.
    change_setting( iv_value   = iv_value
                    iv_setting = 'ROW_POS' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_scrtext_l.
    change_setting( iv_value   = iv_value
                    iv_setting = 'SCRTEXT_L' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_scrtext_m.
    change_setting( iv_value   = iv_value
                    iv_setting = 'SCRTEXT_M' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_scrtext_s.
    change_setting( iv_value   = iv_value
                    iv_setting = 'SCRTEXT_S' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_selddictxt.
    change_setting( iv_value   = iv_value
                    iv_setting = 'SELDDICTXT' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_seltext.
    change_setting( iv_value   = iv_value
                    iv_setting = 'SELTEXT' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_sp_group.
    change_setting( iv_value   = iv_value
                    iv_setting = 'SP_GROUP' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_style.
    change_setting( iv_value   = iv_value
                    iv_setting = 'STYLE' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_style2.
    change_setting( iv_value   = iv_value
                    iv_setting = 'STYLE2' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_style3.
    change_setting( iv_value   = iv_value
                    iv_setting = 'STYLE3' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_style4.
    change_setting( iv_value   = iv_value
                    iv_setting = 'STYLE4' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_symbol.
    change_setting( iv_value   = iv_value
                    iv_setting = 'SYMBOL' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_tabname.
    change_setting( iv_value   = iv_value
                    iv_setting = 'TABNAME' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_tech.
    change_setting( iv_value   = iv_value
                    iv_setting = 'TECH' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_tech_col.
    change_setting( iv_value   = iv_value
                    iv_setting = 'TECH_COL' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_tech_comp.
    change_setting( iv_value   = iv_value
                    iv_setting = 'TECH_COMP' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_tech_form.
    change_setting( iv_value   = iv_value
                    iv_setting = 'TECH_FORM' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_tipddictxt.
    change_setting( iv_value   = iv_value
                    iv_setting = 'TIPDDICTXT' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_tooltip.
    change_setting( iv_value   = iv_value
                    iv_setting = 'TOOLTIP' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_txt_field.
    change_setting( iv_value   = iv_value
                    iv_setting = 'TXT_FIELD' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_valexi.
    change_setting( iv_value   = iv_value
                    iv_setting = 'VALEXI' ).
    r_column = me.
  ENDMETHOD.

  METHOD set_web_field.
    change_setting( iv_value   = iv_value
                    iv_setting = 'WEB_FIELD' ).
    r_column = me.
  ENDMETHOD.

  METHOD get_auto_value.
    get_setting( EXPORTING iv_setting = 'AUTO_VALUE'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_cfieldname.
    get_setting( EXPORTING iv_setting = 'CFIELDNAME'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_checkbox.
    get_setting( EXPORTING iv_setting = 'CHECKBOX'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_checktable.
    get_setting( EXPORTING iv_setting = 'CHECKTABLE'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_colddictxt.
    get_setting( EXPORTING iv_setting = 'COLDDICTXT'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_color.
    rv_value = get_emphasize( ).
  ENDMETHOD.

  METHOD get_coltext.
    get_setting( EXPORTING iv_setting = 'COLTEXT'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_col_id.
    get_setting( EXPORTING iv_setting = 'COL_ID'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_col_opt.
    get_setting( EXPORTING iv_setting = 'COL_OPT'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_col_pos.
    get_setting( EXPORTING iv_setting = 'COL_POS'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_convexit.
    get_setting( EXPORTING iv_setting = 'CONVEXIT'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_currency.
    get_setting( EXPORTING iv_setting = 'CURRENCY'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_datatype.
    get_setting( EXPORTING iv_setting = 'DATATYPE'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_dd_outlen.
    get_setting( EXPORTING iv_setting = 'DD_OUTLEN'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_dd_roll.
    get_setting( EXPORTING iv_setting = 'DD_ROLL'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_decfloat_style.
    get_setting( EXPORTING iv_setting = 'DECFLOAT_STYLE'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_decimals.
    get_setting( EXPORTING iv_setting = 'DECIMALS'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_decimals_o.
    get_setting( EXPORTING iv_setting = 'DECIMALS_O'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_decmlfield.
    get_setting( EXPORTING iv_setting = 'DECMLFIELD'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_dfieldname.
    get_setting( EXPORTING iv_setting = 'DFIELDNAME'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_domname.
    get_setting( EXPORTING iv_setting = 'DOMNAME'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_do_sum.
    get_setting( EXPORTING iv_setting = 'DO_SUM'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_dragdropid.
    get_setting( EXPORTING iv_setting = 'DRAGDROPID'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_drdn_alias.
    get_setting( EXPORTING iv_setting = 'DRDN_ALIAS'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_drdn_field.
    get_setting( EXPORTING iv_setting = 'DRDN_FIELD'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_drdn_hndl.
    get_setting( EXPORTING iv_setting = 'DRDN_HNDL'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_edit.
    get_setting( EXPORTING iv_setting = 'EDIT'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_editable.
    get_setting( EXPORTING iv_setting = 'EDIT'
                 IMPORTING e_value    = rv_editable ).
  ENDMETHOD.

  METHOD get_edit_mask.
    get_setting( EXPORTING iv_setting = 'EDIT_MASK'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_emphasize.
    get_setting( EXPORTING iv_setting = 'EMPHASIZE'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_exponent.
    get_setting( EXPORTING iv_setting = 'EXPONENT'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_f4availabl.
    get_setting( EXPORTING iv_setting = 'F4AVAILABL'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_fieldname.
    get_setting( EXPORTING iv_setting = 'FIELDNAME'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_fix_column.
    get_setting( EXPORTING iv_setting = 'FIX_COLUMN'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_get_style.
    get_setting( EXPORTING iv_setting = 'GET_STYLE'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_hier_cpos.
    get_setting( EXPORTING iv_setting = 'HIER_CPOS'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_hier_level.
    get_setting( EXPORTING iv_setting = 'HIER_LEVEL'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_hotspot.
    get_setting( EXPORTING iv_setting = 'HOTSPOT'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_href_hndl.
    get_setting( EXPORTING iv_setting = 'HREF_HNDL'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_h_col_key.
    get_setting( EXPORTING iv_setting = 'H_COL_KEY'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_h_ftype.
    get_setting( EXPORTING iv_setting = 'H_FTYPE'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_h_select.
    get_setting( EXPORTING iv_setting = 'H_SELECT'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_icon.
    get_setting( EXPORTING iv_setting = 'ICON'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_ifieldname.
    get_setting( EXPORTING iv_setting = 'IFIELDNAME'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_indx_cfiel.
    get_setting( EXPORTING iv_setting = 'INDX_CFIEL'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_indx_decml.
    get_setting( EXPORTING iv_setting = 'INDX_DECML'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_indx_field.
    get_setting( EXPORTING iv_setting = 'INDX_FIELD'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_indx_ifiel.
    get_setting( EXPORTING iv_setting = 'INDX_IFIEL'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_indx_qfiel.
    get_setting( EXPORTING iv_setting = 'INDX_QFIEL'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_indx_round.
    get_setting( EXPORTING iv_setting = 'INDX_ROUND'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_intlen.
    get_setting( EXPORTING iv_setting = 'INTLEN'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_inttype.
    get_setting( EXPORTING iv_setting = 'INTTYPE'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_just.
    get_setting( EXPORTING iv_setting = 'JUST'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_key.
    get_setting( EXPORTING iv_setting = 'KEY'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_key_sel.
    get_setting( EXPORTING iv_setting = 'KEY_SEL'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_lowercase.
    get_setting( EXPORTING iv_setting = 'LOWERCASE'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_lzero.
    get_setting( EXPORTING iv_setting = 'LZERO'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_mac.
    get_setting( EXPORTING iv_setting = 'MAC'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_mark.
    get_setting( EXPORTING iv_setting = 'MARK'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_no_convext.
    get_setting( EXPORTING iv_setting = 'NO_CONVEXT'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_no_init_ch.
    get_setting( EXPORTING iv_setting = 'NO_INIT_CH'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_no_merging.
    get_setting( EXPORTING iv_setting = 'NO_MERGING'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_no_out.
    get_setting( EXPORTING iv_setting = 'NO_OUT'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_no_sign.
    get_setting( EXPORTING iv_setting = 'NO_SIGN'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_no_sum.
    get_setting( EXPORTING iv_setting = 'NO_SUM'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_no_zero.
    get_setting( EXPORTING iv_setting = 'NO_ZERO'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_outputlen.
    get_setting( EXPORTING iv_setting = 'OUTPUTLEN'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_parameter0.
    get_setting( EXPORTING iv_setting = 'PARAMETER0'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_parameter1.
    get_setting( EXPORTING iv_setting = 'PARAMETER1'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_parameter2.
    get_setting( EXPORTING iv_setting = 'PARAMETER2'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_parameter3.
    get_setting( EXPORTING iv_setting = 'PARAMETER3'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_parameter4.
    get_setting( EXPORTING iv_setting = 'PARAMETER4'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_parameter5.
    get_setting( EXPORTING iv_setting = 'PARAMETER5'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_parameter6.
    get_setting( EXPORTING iv_setting = 'PARAMETER6'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_parameter7.
    get_setting( EXPORTING iv_setting = 'PARAMETER7'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_parameter8.
    get_setting( EXPORTING iv_setting = 'PARAMETER8'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_parameter9.
    get_setting( EXPORTING iv_setting = 'PARAMETER9'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_qfieldname.
    get_setting( EXPORTING iv_setting = 'QFIELDNAME'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_quantity.
    get_setting( EXPORTING iv_setting = 'QUANTITY'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_readonly.
    get_setting( EXPORTING iv_setting = 'EDIT'
                 IMPORTING e_value    = rv_read_only ).
    rv_read_only = SWITCH #( rv_read_only
                             WHEN abap_true  THEN abap_false
                             WHEN abap_false THEN abap_true ).
  ENDMETHOD.

  METHOD get_ref_field.
    get_setting( EXPORTING iv_setting = 'REF_FIELD'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_ref_table.
    get_setting( EXPORTING iv_setting = 'REF_TABLE'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_reprep.
    get_setting( EXPORTING iv_setting = 'REPREP'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_reptext.
    get_setting( EXPORTING iv_setting = 'REPTEXT'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_rollname.
    get_setting( EXPORTING iv_setting = 'ROLLNAME'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_round.
    get_setting( EXPORTING iv_setting = 'ROUND'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_roundfield.
    get_setting( EXPORTING iv_setting = 'ROUNDFIELD'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_row_pos.
    get_setting( EXPORTING iv_setting = 'ROW_POS'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_scrtext_l.
    get_setting( EXPORTING iv_setting = 'SCRTEXT_L'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_scrtext_m.
    get_setting( EXPORTING iv_setting = 'SCRTEXT_M'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_scrtext_s.
    get_setting( EXPORTING iv_setting = 'SCRTEXT_S'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_selddictxt.
    get_setting( EXPORTING iv_setting = 'SELDDICTXT'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_seltext.
    get_setting( EXPORTING iv_setting = 'SELTEXT'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_sp_group.
    get_setting( EXPORTING iv_setting = 'SP_GROUP'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_style.
    get_setting( EXPORTING iv_setting = 'STYLE'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_style2.
    get_setting( EXPORTING iv_setting = 'STYLE2'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_style3.
    get_setting( EXPORTING iv_setting = 'STYLE3'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_style4.
    get_setting( EXPORTING iv_setting = 'STYLE4'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_symbol.
    get_setting( EXPORTING iv_setting = 'SYMBOL'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_tabname.
    get_setting( EXPORTING iv_setting = 'TABNAME'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_tech.
    get_setting( EXPORTING iv_setting = 'TECH'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_tech_col.
    get_setting( EXPORTING iv_setting = 'TECH_COL'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_tech_comp.
    get_setting( EXPORTING iv_setting = 'TECH_COMP'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_tech_form.
    get_setting( EXPORTING iv_setting = 'TECH_FORM'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_tipddictxt.
    get_setting( EXPORTING iv_setting = 'TIPDDICTXT'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_tooltip.
    get_setting( EXPORTING iv_setting = 'TOOLTIP'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_txt_field.
    get_setting( EXPORTING iv_setting = 'TXT_FIELD'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_valexi.
    get_setting( EXPORTING iv_setting = 'VALEXI'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.

  METHOD get_web_field.
    get_setting( EXPORTING iv_setting = 'WEB_FIELD'
                 IMPORTING e_value    = rv_value ).
  ENDMETHOD.
ENDCLASS.
