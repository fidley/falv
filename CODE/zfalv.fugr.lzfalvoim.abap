MODULE pbo OUTPUT.
  IF create_dummy_container EQ abap_true.
    dummy_container = CAST cl_gui_container( NEW cl_gui_custom_container(
        container_name = zcl_falv=>cc_name
        dynnr          = zcl_falv=>c_screen_popup
        repid          = zcl_falv=>c_fscr_repid
        no_autodef_progid_dynnr =  abap_true  ) ).
    LEAVE TO SCREEN 0.
  ELSE.
    ASSIGN outputs[ table_line->guid = current_guid ] TO <out>.
    IF sy-subrc EQ 0.
      <out>->pbo( iv_dynnr = sy-dynnr ).
    ENDIF.
  ENDIF.
ENDMODULE.


MODULE pai INPUT.
  ASSIGN outputs[ table_line->guid = current_guid ] TO <out>.
  IF sy-subrc EQ 0.
    <out>->pai( CHANGING c_ucomm = okcode  ).
  ENDIF.
ENDMODULE.
