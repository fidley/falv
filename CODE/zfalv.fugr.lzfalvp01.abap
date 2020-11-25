class lcl_output implementation.

  method constructor.
    call function 'GUID_CREATE'
      importing
        ev_guid_22 = guid.
    falv = io_falv.
  endmethod.
  method show.
    check cl_gui_alv_grid=>offline( ) is initial.
    loop at outputs assigning field-symbol(<hide>) where table_line->guid ne me->guid
                                                     and table_line->falv->screen eq falv->screen.
      <hide>->hide( ).
    endloop.

    falv->main_container->set_visible( abap_true ).
    falv->parent->set_visible( abap_true ).
    falv->set_visible( abap_true ).
  endmethod.
  method hide.
    check cl_gui_alv_grid=>offline( ) is initial.
    falv->set_visible( abap_false ).
    falv->parent->set_visible( abap_false ).
    falv->main_container->set_visible( abap_false ).
  endmethod.

  method pbo.
    show( ).

    falv->pbo( iv_dynnr = iv_dynnr ).
    if first_output eq abap_true.

      cl_gui_cfw=>flush(
      exceptions
        cntl_system_error = 0
        cntl_error        = 0
        others            = 0 ).
      falv->display( iv_force_grid = abap_true ).

      clear first_output.
*      if falv->split_container is not initial or falv->built_in_screen is not initial.
*        "! When I use embedded applog then although it's container is hidden
*        "! then you can still see the place for it until some pbo will happen.
*        "! I force dummy user-command to get rid of it
*        falv->set_dummy_function_code( ).
*      endif.
    endif.

  endmethod.

  method pai.
    check c_ucomm is not initial.
    falv->pai( exporting iv_dynnr = sy-dynnr changing c_ucomm  = c_ucomm ).
  endmethod.

  method end_of_ss1001.
    receive results from function 'Z_FALV_CALL_MASS_SS'
      importing
        et_rsparams       = mass_repl_params.
    wait_for_mass_repl = space.
  endmethod.

  method set_ss1001_status.
    data: exclude type standard table of rsexfcode.
    if sy-dynnr eq 1001.
      exclude = value #( ( fcode = 'GET' ) ( fcode = 'SPOS' ) ( fcode = 'NONE' ) ).
      call function 'RS_SET_SELSCREEN_STATUS'
        exporting
          p_status  = space
          p_program = sy-repid
        tables
          p_exclude = exclude.
    endif.

  endmethod.

endclass.
