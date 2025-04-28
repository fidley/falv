function z_falv_display.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IO_FALV) TYPE REF TO  ZCL_FALV
*"     VALUE(IV_START_ROW) TYPE  I OPTIONAL
*"     VALUE(IV_START_COLUMN) TYPE  I OPTIONAL
*"     VALUE(IV_END_ROW) TYPE  I OPTIONAL
*"     VALUE(IV_END_COLUMN) TYPE  I OPTIONAL
*"----------------------------------------------------------------------
  if not line_exists( outputs[ table_line->falv = io_falv ] ).
    data(output) = new lcl_output( io_falv ).
    insert output into table outputs.
    current_guid = output->guid.
    assign output to <out>.
    if sy-subrc eq 0.

    endif.

  else.
    assign outputs[ table_line->falv = io_falv ] to <out>.
    if sy-subrc eq 0.
      current_guid = <out>->guid.
*      <out>->pbo( iv_dynnr = sy-dynnr ).
      if <out>->falv->built_in_screen is not initial.
        "! When you reuse FALV sometimes it needs to be refreshed
        "! in order to show on screen. Like with Error log
        <out>->falv->set_dummy_function_code( ).
      endif.
    endif.
  endif.

  insert current_guid into call_stack index 1.

  if io_falv->screen eq io_falv->c_screen_popup.
    call screen io_falv->screen starting at  iv_start_column iv_start_row
                                ending at    iv_end_column iv_end_row
                                .
  else.
    call screen io_falv->screen.
  endif.

  delete call_stack index 1.
  if lines( call_stack ) gt 0.
    current_guid = call_stack[ 1 ].
    assign outputs[ table_line->guid = current_guid ] to <out>.
    if sy-subrc eq 0.
      "! When you reuse FALV sometimes it needs to be refreshed
      "! in order to show on screen. Like with Error log
      <out>->falv->set_dummy_function_code( ).
      <out>->pbo( iv_dynnr = sy-dynnr ).
    endif.
  endif.

endfunction.
