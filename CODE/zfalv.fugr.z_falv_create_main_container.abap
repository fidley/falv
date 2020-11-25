FUNCTION Z_FALV_CREATE_MAIN_CONTAINER.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  EXPORTING
*"     REFERENCE(MAIN_CONTAINER) TYPE REF TO  CL_GUI_CONTAINER
*"----------------------------------------------------------------------
    create_dummy_container = abap_true.
    call screen zcl_falv=>c_screen_popup STARTING AT 1 1.
    main_container = dummy_container.
    create_dummy_container = abap_false.

ENDFUNCTION.
