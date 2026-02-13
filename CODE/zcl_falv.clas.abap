CLASS zcl_falv DEFINITION
  PUBLIC
  INHERITING FROM cl_gui_alv_grid
  CREATE PUBLIC

  GLOBAL FRIENDS zcl_falv_layout .

  PUBLIC SECTION.

    INTERFACES if_alv_rm_grid_friend .

    TYPES:
      BEGIN OF falv_s_ro01,
        row_id    TYPE i,
        outputlen TYPE i,
      END OF falv_s_ro01 .
    TYPES:
      falv_t_ro01 TYPE TABLE OF falv_s_ro01 .
    TYPES:
      BEGIN OF t_subcl_call,
        progname TYPE progname,
        line     TYPE i,
        column   TYPE i,
        class    TYPE string,
      END OF t_subcl_call .
    TYPES:
      tt_subcl_call TYPE SORTED TABLE OF t_subcl_call WITH UNIQUE KEY progname line column .
    TYPES:
      BEGIN OF t_email,
        smtp_addr  TYPE ad_smtpadr,
        express    TYPE os_boolean,
        copy       TYPE os_boolean,
        blind_copy TYPE os_boolean,
      END OF t_email .
    TYPES:
      tt_email  TYPE TABLE OF t_email .
    TYPES t_column TYPE REF TO zcl_falv_column .
    TYPES:
      t_columns TYPE SORTED TABLE OF t_column WITH UNIQUE KEY table_line .

    CONSTANTS:
      BEGIN OF color,
        blue                         TYPE char4 VALUE 'C100',
        blue_intensified             TYPE char4 VALUE 'C110',
        blue_intensified_inversed    TYPE char4 VALUE 'C111',
        blue_inversed                TYPE char4 VALUE 'C101',
        gray                         TYPE char4 VALUE 'C200',
        gray_itensified              TYPE char4 VALUE 'C210',
        gray_intesified_invers       TYPE char4 VALUE 'C211',
        gray_inversed                TYPE char4 VALUE 'C201',
        yellow                       TYPE char4 VALUE 'C300',
        yellow_intensified           TYPE char4 VALUE 'C310',
        yellow_intensified_inversed  TYPE char4 VALUE 'C311',
        yellow_inversed              TYPE char4 VALUE 'C301',
        light_blue                   TYPE char4 VALUE 'C400',
        light_blue_itensified        TYPE char4 VALUE 'C410',
        light_blue_intesified_invers TYPE char4 VALUE 'C411',
        light_blue_inversed          TYPE char4 VALUE 'C401',
        green                        TYPE char4 VALUE 'C500',
        green_intensified            TYPE char4 VALUE 'C510',
        green_intensified_inversed   TYPE char4 VALUE 'C511',
        green_inversed               TYPE char4 VALUE 'C501',
        red                          TYPE char4 VALUE 'C600',
        red_intensified              TYPE char4 VALUE 'C610',
        red_intensified_inversed     TYPE char4 VALUE 'C611',
        red_inversed                 TYPE char4 VALUE 'C601',
        orange                       TYPE char4 VALUE 'C700',
        orange_intensified           TYPE char4 VALUE 'C710',
        orange_intensified_inversed  TYPE char4 VALUE 'C711',
        orange_inversed              TYPE char4 VALUE 'C701',
      END OF color .
    CONSTANTS version TYPE string VALUE '740.1.0.19' ##NO_TEXT.
    CONSTANTS cc_name TYPE char30 VALUE 'CC_GRID' ##NO_TEXT.
    CONSTANTS c_screen_popup TYPE sy-dynnr VALUE '0200' ##NO_TEXT.
    CONSTANTS c_screen_full TYPE sy-dynnr VALUE '0100' ##NO_TEXT.
    CONSTANTS c_fscr_repid TYPE sy-repid VALUE 'SAPLZFALV' ##NO_TEXT.
    DATA result TYPE i READ-ONLY .
    DATA splitter_row_1_height TYPE i READ-ONLY .
    DATA splitter_row_2_height TYPE i READ-ONLY .
    DATA splitter_row_3_height TYPE i READ-ONLY .
    CONSTANTS fc_back TYPE sy-ucomm VALUE 'BACK' ##NO_TEXT.
    CONSTANTS fc_up TYPE sy-ucomm VALUE 'UP' ##NO_TEXT.
    CONSTANTS fc_exit TYPE sy-ucomm VALUE 'EXIT' ##NO_TEXT.
    CONSTANTS fc_cancel TYPE sy-ucomm VALUE 'CANCEL' ##NO_TEXT.
    CONSTANTS fc_mass_replace TYPE sy-ucomm VALUE 'MASS_REPL' ##NO_TEXT.
    CONSTANTS fc_save TYPE sy-ucomm VALUE '&DATA_SAVE' ##NO_TEXT.
    CONSTANTS fc_print TYPE sy-ucomm VALUE 'PRINT' ##NO_TEXT.
    CONSTANTS fc_find TYPE sy-ucomm VALUE 'FIND' ##NO_TEXT.
    CONSTANTS fc_find_next TYPE sy-ucomm VALUE 'FINDNEXT' ##NO_TEXT.
    CONSTANTS fc_first_page TYPE sy-ucomm VALUE 'PGHOME' ##NO_TEXT.
    CONSTANTS fc_last_page TYPE sy-ucomm VALUE 'PGEND' ##NO_TEXT.
    CONSTANTS fc_previous_page TYPE sy-ucomm VALUE 'PGUP' ##NO_TEXT.
    CONSTANTS fc_next_page TYPE sy-ucomm VALUE 'PGDOWN' ##NO_TEXT.
    CONSTANTS button_normal TYPE tb_btype VALUE 0 ##NO_TEXT.
    CONSTANTS button_menu_default TYPE tb_btype VALUE 1 ##NO_TEXT.
    CONSTANTS button_menu TYPE tb_btype VALUE 2 ##NO_TEXT.
    CONSTANTS button_separator TYPE tb_btype VALUE 3 ##NO_TEXT.
    CONSTANTS button_radiobutton TYPE tb_btype VALUE 4 ##NO_TEXT.
    CONSTANTS button_checkbox TYPE tb_btype VALUE 5 ##NO_TEXT.
    CONSTANTS button_menu_entry TYPE tb_btype VALUE 6 ##NO_TEXT.
    CONSTANTS:
      BEGIN OF symbol,
        empty_space        TYPE char01 VALUE ' ',
        plus_box           TYPE char01 VALUE '!',
        minus_box          TYPE char01 VALUE '"',
        plus_circle        TYPE char01 VALUE '#',
        minus_circle       TYPE char01 VALUE '$',
        filled_square      TYPE char01 VALUE '%',
        half_filled_square TYPE char01 VALUE '&',
        square             TYPE char01 VALUE `'`,
        filled_circle      TYPE char01 VALUE '(',
        half_filled_circle TYPE char01 VALUE ')',
        circle             TYPE char01 VALUE '*',
        filled_diamond     TYPE char01 VALUE '+',
        diamond            TYPE char01 VALUE ',',
        bold_x             TYPE char01 VALUE '.',
        note               TYPE char01 VALUE '/',
        document           TYPE char01 VALUE '0',
        checked_document   TYPE char01 VALUE '1',
        documents          TYPE char01 VALUE '2',
        folder             TYPE char01 VALUE '3',
        plus_folder        TYPE char01 VALUE '4',
        minus_folder       TYPE char01 VALUE '5',
        open_folder        TYPE char01 VALUE '6',
        bold_minus         TYPE char01 VALUE '7',
        bold_plus          TYPE char01 VALUE '8',
        checkbox           TYPE char01 VALUE '9',
        radiobutton        TYPE char01 VALUE ':',
        left_triangle      TYPE char01 VALUE ';',
        right_triangle     TYPE char01 VALUE '<',
        up_triangle        TYPE char01 VALUE '=',
        down_triangle      TYPE char01 VALUE '>',
        left_hand          TYPE char01 VALUE '?',
        left_arrow         TYPE char01 VALUE 'A',
        right_arrow        TYPE char01 VALUE 'B',
        up_arrow           TYPE char01 VALUE 'C',
        down_arrow         TYPE char01 VALUE 'D',
        check_mark         TYPE char01 VALUE 'E',
        pencil             TYPE char01 VALUE 'F',
        glasses            TYPE char01 VALUE 'G',
        locked             TYPE char01 VALUE 'H',
        unlocked           TYPE char01 VALUE 'I',
        phone              TYPE char01 VALUE 'J',
        printer            TYPE char01 VALUE 'K',
        fax                TYPE char01 VALUE 'L',
        asterisk           TYPE char01 VALUE 'M',
        right_hand         TYPE char01 VALUE 'N',
        sorted_up          TYPE char01 VALUE 'O',
        sorted_down        TYPE char01 VALUE 'P',
        cumulated          TYPE char01 VALUE 'Q',
        delete             TYPE char01 VALUE 'R',
        executable         TYPE char01 VALUE 'S',
        workflow_item      TYPE char01 VALUE 'T',
        caution            TYPE char01 VALUE 'U',
        flash              TYPE char01 VALUE 'V',
        large_square       TYPE char01 VALUE 'W',
        ellipsis           TYPE char01 VALUE 'X',
      END OF symbol .
    DATA main_container TYPE REF TO cl_gui_container READ-ONLY .
    DATA split_container TYPE REF TO cl_gui_splitter_container .
    DATA main_split_container TYPE REF TO cl_gui_splitter_container .
    DATA top_of_page_container TYPE REF TO cl_gui_container .
    DATA variant TYPE disvariant .
    DATA layout_save TYPE char01 .
    DATA exclude_functions TYPE ui_functions .
    DATA fcat TYPE lvc_t_fcat .
    DATA sort TYPE lvc_t_sort .
    DATA filter TYPE lvc_t_filt .
    DATA lvc_layout TYPE lvc_s_layo READ-ONLY .
    DATA layout TYPE REF TO zcl_falv_layout .
    DATA gui_status TYPE REF TO zcl_falv_dynamic_status .
    DATA screen TYPE sy-dynnr READ-ONLY .
    DATA outtab TYPE REF TO data .
    DATA title_v1 TYPE string .
    DATA title_v2 TYPE string .
    DATA title_v3 TYPE string .
    DATA title_v4 TYPE string .
    DATA title_v5 TYPE string .
    DATA delay_move_current_cell TYPE i READ-ONLY VALUE 20 ##NO_TEXT.
    DATA delay_change_selection TYPE i READ-ONLY VALUE 20 ##NO_TEXT.
    DATA top_of_page_height TYPE i VALUE 150 ##NO_TEXT.
    DATA error_log_height TYPE i VALUE 100 ##NO_TEXT.
    DATA grid TYPE REF TO cl_gui_alv_grid .
    DATA built_in_screen TYPE abap_bool READ-ONLY .
    DATA buffering_active TYPE abap_bool VALUE abap_true ##NO_TEXT.
    DATA bypassing_buffer TYPE abap_bool VALUE abap_false ##NO_TEXT.

    CLASS-METHODS create
      IMPORTING
        VALUE(i_parent)          TYPE REF TO cl_gui_container OPTIONAL
        VALUE(i_applogparent)    TYPE REF TO cl_gui_container OPTIONAL
        VALUE(i_popup)           TYPE abap_bool DEFAULT abap_false
        VALUE(i_applog_embedded) TYPE abap_bool DEFAULT abap_false
        VALUE(i_subclass)        TYPE REF TO cl_abap_typedescr OPTIONAL
        VALUE(i_handle)          TYPE slis_handl OPTIONAL
      CHANGING
        !ct_table                TYPE STANDARD TABLE
      RETURNING
        VALUE(rv_falv)           TYPE REF TO zcl_falv .
    METHODS create_by_copy
      IMPORTING
        VALUE(i_parent)       TYPE REF TO cl_gui_container OPTIONAL
        VALUE(i_applogparent) TYPE REF TO cl_gui_container OPTIONAL
        VALUE(i_popup)        TYPE abap_bool DEFAULT abap_false
      RETURNING
        VALUE(rv_falv)        TYPE REF TO zcl_falv .
    CLASS-METHODS create_by_type
      IMPORTING
        VALUE(i_parent)          TYPE REF TO cl_gui_container OPTIONAL
        VALUE(i_applogparent)    TYPE REF TO cl_gui_container OPTIONAL
        VALUE(i_popup)           TYPE abap_bool DEFAULT abap_false
        VALUE(i_applog_embedded) TYPE abap_bool DEFAULT abap_false
        VALUE(i_subclass)        TYPE REF TO cl_abap_typedescr OPTIONAL
        !i_type                  TYPE REF TO cl_abap_typedescr
      RETURNING
        VALUE(rv_falv)           TYPE REF TO zcl_falv .
    CLASS-METHODS lvc_fcat_from_itab
      IMPORTING
        !it_table      TYPE STANDARD TABLE
      RETURNING
        VALUE(rt_fcat) TYPE lvc_t_fcat .
    METHODS constructor
      IMPORTING
        VALUE(i_shellstyle)  TYPE i DEFAULT 0
        VALUE(i_lifetime)    TYPE i OPTIONAL
        VALUE(i_parent)      TYPE REF TO cl_gui_container OPTIONAL
        VALUE(i_appl_events) TYPE char01 DEFAULT space
        !i_parentdbg         TYPE REF TO cl_gui_container OPTIONAL
        !i_applogparent      TYPE REF TO cl_gui_container OPTIONAL
        !i_graphicsparent    TYPE REF TO cl_gui_container OPTIONAL
        VALUE(i_name)        TYPE string OPTIONAL
        !i_fcat_complete     TYPE sap_bool DEFAULT space
      EXCEPTIONS
        error_cntl_create
        error_cntl_init
        error_cntl_link
        error_dp_create
        object_created_manually .
    METHODS pbo
      IMPORTING
        VALUE(iv_dynnr) TYPE sy-dynnr DEFAULT sy-dynnr .
    METHODS pai
      IMPORTING
        VALUE(iv_dynnr) TYPE sy-dynnr DEFAULT sy-dynnr
      CHANGING
        !c_ucomm        TYPE sy-ucomm DEFAULT sy-ucomm .
    METHODS display
      FINAL
      IMPORTING
        VALUE(iv_force_grid)   TYPE abap_bool DEFAULT space
        VALUE(iv_start_row)    TYPE i OPTIONAL
        VALUE(iv_start_column) TYPE i OPTIONAL
        VALUE(iv_end_row)      TYPE i OPTIONAL
        VALUE(iv_end_column)   TYPE i OPTIONAL
      RETURNING
        VALUE(r_falv)          TYPE REF TO zcl_falv .
    METHODS exclude_function
      IMPORTING
        VALUE(iv_ucomm) TYPE sy-ucomm
      RETURNING
        VALUE(r_falv)   TYPE REF TO zcl_falv .
    METHODS column
      IMPORTING
        VALUE(iv_fieldname) TYPE lvc_s_fcat-fieldname
      RETURNING
        VALUE(rv_column)    TYPE REF TO zcl_falv_column .
    METHODS soft_refresh
      RETURNING
        VALUE(r_falv) TYPE REF TO zcl_falv .
    METHODS set_mark_field
      IMPORTING
        VALUE(iv_fieldname) TYPE lvc_s_fcat-fieldname
      RETURNING
        VALUE(r_falv)       TYPE REF TO zcl_falv .
    METHODS set_editable
      IMPORTING
        VALUE(iv_modify) TYPE abap_bool DEFAULT abap_false
      RETURNING
        VALUE(r_falv)    TYPE REF TO zcl_falv .
    METHODS set_readonly
      RETURNING
        VALUE(r_falv) TYPE REF TO zcl_falv .
    METHODS add_button
      IMPORTING
        VALUE(iv_function)  TYPE ui_func
        VALUE(iv_icon)      TYPE icon_d OPTIONAL
        VALUE(iv_quickinfo) TYPE iconquick OPTIONAL
        VALUE(iv_butn_type) TYPE tb_btype OPTIONAL
        VALUE(iv_disabled)  TYPE abap_bool OPTIONAL
        VALUE(iv_text)      TYPE text40 OPTIONAL
        VALUE(iv_checked)   TYPE abap_bool OPTIONAL
      RETURNING
        VALUE(r_falv)       TYPE REF TO zcl_falv .
    "! Don't call it from Toolbar event handler
    "! as it will cause endless loop
    "!
    "! @parameter iv_function |
    "! @parameter r_falv |
    METHODS disable_button
      IMPORTING
        VALUE(iv_function) TYPE ui_func
      RETURNING
        VALUE(r_falv)      TYPE REF TO zcl_falv .
    "! Don't call it from Toolbar event handler
    "! as it will cause endless loop
    "!
    "! @parameter iv_function |
    "! @parameter r_falv |
    METHODS enable_button
      IMPORTING
        VALUE(iv_function) TYPE ui_func
      RETURNING
        VALUE(r_falv)      TYPE REF TO zcl_falv .
    "! Don't call it from Toolbar event handler
    "! as it will cause endless loop
    "!
    "! @parameter iv_function |
    "! @parameter r_falv |
    METHODS delete_button
      IMPORTING
        VALUE(iv_function) TYPE ui_func
      RETURNING
        VALUE(r_falv)      TYPE REF TO zcl_falv .
    "! Don't call it from Toolbar event handler
    "! as it will cause endless loop
    "!
    "! @parameter iv_exceptions |
    "! @parameter r_falv |
    METHODS delete_all_buttons
      IMPORTING
        VALUE(iv_exceptions) TYPE ttb_button OPTIONAL
      RETURNING
        VALUE(r_falv)        TYPE REF TO zcl_falv .
    METHODS set_cell_disabled
      IMPORTING
        VALUE(iv_fieldname) TYPE fieldname
        VALUE(iv_row)       TYPE lvc_s_roid-row_id
      RETURNING
        VALUE(r_falv)       TYPE REF TO zcl_falv .
    METHODS set_cell_styles
      IMPORTING
        VALUE(iv_fieldname) TYPE fieldname
        VALUE(iv_row)       TYPE lvc_s_roid-row_id
        VALUE(iv_style)     TYPE lvc_style
        VALUE(iv_style2)    TYPE lvc_style OPTIONAL
      RETURNING
        VALUE(r_falv)       TYPE REF TO zcl_falv .
    METHODS set_cell_enabled
      IMPORTING
        VALUE(iv_fieldname) TYPE fieldname
        VALUE(iv_row)       TYPE lvc_s_roid-row_id
      RETURNING
        VALUE(r_falv)       TYPE REF TO zcl_falv .
    METHODS set_cell_button
      IMPORTING
        VALUE(iv_fieldname) TYPE fieldname
        VALUE(iv_row)       TYPE lvc_s_roid-row_id
      RETURNING
        VALUE(r_falv)       TYPE REF TO zcl_falv .
    METHODS set_cell_hotspot
      IMPORTING
        VALUE(iv_fieldname) TYPE fieldname
        VALUE(iv_row)       TYPE lvc_s_roid-row_id
      RETURNING
        VALUE(r_falv)       TYPE REF TO zcl_falv .
    METHODS set_row_color
      IMPORTING
        VALUE(iv_color) TYPE char04
        VALUE(iv_row)   TYPE lvc_s_roid-row_id
      RETURNING
        VALUE(r_falv)   TYPE REF TO zcl_falv .
    METHODS set_cell_color
      IMPORTING
        VALUE(iv_fieldname) TYPE fieldname
        VALUE(iv_color)     TYPE lvc_s_colo
        VALUE(iv_row)       TYPE lvc_s_roid-row_id
      RETURNING
        VALUE(r_falv)       TYPE REF TO zcl_falv .
    METHODS mass_replace .
    METHODS export_to_excel
      RETURNING
        VALUE(rv_xstring) TYPE xstring .
    METHODS save_excel_localy
      IMPORTING
        VALUE(iv_path)  TYPE string OPTIONAL
      RETURNING
        VALUE(rv_saved) TYPE abap_bool .
    METHODS hide_top_of_page
      RETURNING
        VALUE(r_falv) TYPE REF TO zcl_falv .
    METHODS show_top_of_page
      RETURNING
        VALUE(r_falv) TYPE REF TO zcl_falv .
    METHODS set_list_view
      RETURNING
        VALUE(r_falv) TYPE REF TO zcl_falv .
    METHODS encode_picture_base64
      IMPORTING
        VALUE(iv_xstring)   TYPE xstring
        VALUE(iv_mime_type) TYPE csequence
      RETURNING
        VALUE(rv_image)     TYPE string .
    METHODS get_file_from_mime
      IMPORTING
        VALUE(iv_path)      TYPE string
      EXPORTING
        VALUE(ev_xstring)   TYPE xstring
        VALUE(ev_mime_type) TYPE string .
    METHODS get_picture_from_se78
      IMPORTING
        VALUE(iv_name)    TYPE stxbitmaps-tdname
        VALUE(iv_type)    TYPE stxbitmaps-tdbtype DEFAULT 'BCOL'
        VALUE(iv_id)      TYPE stxbitmaps-tdid DEFAULT 'BMAP'
      RETURNING
        VALUE(rv_xstring) TYPE xstring .
    METHODS send
      IMPORTING
        VALUE(iv_subject)     TYPE csequence OPTIONAL
        VALUE(iv_sender)      TYPE ad_smtpadr OPTIONAL
        VALUE(iv_sender_name) TYPE ad_smtpadr OPTIONAL
        VALUE(iv_filename)    TYPE csequence OPTIONAL
        VALUE(it_recipients)  TYPE tt_email
        VALUE(iv_body)        TYPE string OPTIONAL
        VALUE(iv_importance)  TYPE bcs_docimp OPTIONAL
        VALUE(iv_sensitivity) TYPE so_obj_sns OPTIONAL
        VALUE(iv_immediately) TYPE abap_bool OPTIONAL
        VALUE(iv_commit)      TYPE abap_bool DEFAULT abap_true
      RETURNING
        VALUE(r_falv)         TYPE REF TO zcl_falv
      EXCEPTIONS
        create_request_error
        create_document_error
        add_attachment_error
        add_document_error
        add_recipient_error
        add_sender_error
        send_error
        send_immediately_error .
    METHODS hide_applog .
    METHODS show_applog
      RETURNING
        VALUE(r_falv) TYPE REF TO zcl_falv .
    "! Cell can be editable by layout, by field-catalog or by cell styles
    "!
    "! @parameter i_row |
    "! @parameter i_field |
    "! @parameter r_enabled |
    METHODS get_cell_enabled
      IMPORTING
        VALUE(i_row)     TYPE i
        VALUE(i_field)   TYPE lvc_fname
      RETURNING
        VALUE(r_enabled) TYPE abap_bool .
    METHODS refresh_toolbar
      RETURNING
        VALUE(r_falv) TYPE REF TO zcl_falv .
    METHODS set_dummy_function_code
      RETURNING
        VALUE(r_falv) TYPE REF TO zcl_falv .
    METHODS get_columns
      RETURNING
        VALUE(rt_columns) TYPE t_columns .
    METHODS set_output_table
      CHANGING
        !ct_table TYPE STANDARD TABLE .
    METHODS set_merge_horizontally
      IMPORTING
        !row           TYPE i
        !tab_col_merge TYPE lvc_t_co01 .
    METHODS set_merge_vertically
      IMPORTING
        !col           TYPE i
        !tab_row_merge TYPE falv_t_ro01 .
    " methods Z_DISPLAY .
    METHODS set_cell_style
      IMPORTING
        !row    TYPE i OPTIONAL
        !col    TYPE i OPTIONAL
        !style  TYPE lvc_style
        !style2 TYPE lvc_style OPTIONAL .
    METHODS set_fixed_col_row
      IMPORTING
        !col TYPE i
        !row TYPE i .
    METHODS init_cell_styles .
    METHODS redraw_after_merging_change .
    METHODS get_registered_f4_for_fields
      RETURNING
        VALUE(f4) TYPE lvc_t_f4 .

    METHODS set_frontend_fieldcatalog
        REDEFINITION .
    METHODS set_frontend_layout
        REDEFINITION .
  PROTECTED SECTION.
    DATA toolbar_added            TYPE ttb_button.
    DATA toolbar_deleted          TYPE ttb_button.
    DATA toolbar_disabled         TYPE ttb_button.
    DATA toolbar_exceptions       TYPE ttb_button.
    DATA columns                  TYPE SORTED TABLE OF t_column WITH UNIQUE KEY table_line.

    DATA application_log_embedded TYPE abap_bool.
    DATA subclass_type            TYPE REF TO cl_abap_typedescr.

    EVENTS at_set_pf_status.
    EVENTS at_set_title.
    "! Event called just after method <strong>SET_TABLE_FOR_FIRST_DISPLAY</strong> is called internally.
    "! Can be used for example to setup merging of cells
    EVENTS before_first_display.

    METHODS evf_before_first_display FOR EVENT before_first_display OF zcl_falv.

    METHODS evf_btn_click
      FOR EVENT button_click OF cl_gui_alv_grid
      IMPORTING es_col_id
                es_row_no ##NEEDED.

    METHODS evf_user_command
      FOR EVENT user_command OF cl_gui_alv_grid
      IMPORTING e_ucomm ##NEEDED.

    METHODS evf_hotspot_click
      FOR EVENT hotspot_click OF cl_gui_alv_grid
      IMPORTING e_row_id
                e_column_id
                es_row_no ##NEEDED.

    METHODS evf_data_changed
      FOR EVENT data_changed OF cl_gui_alv_grid
      IMPORTING er_data_changed
                e_onf4
                e_onf4_before
                e_onf4_after
                e_ucomm ##NEEDED.

    METHODS evf_data_changed_finished
      FOR EVENT data_changed_finished OF cl_gui_alv_grid
      IMPORTING e_modified
                et_good_cells ##NEEDED.

    METHODS evf_double_click
      FOR EVENT double_click OF cl_gui_alv_grid
      IMPORTING e_row
                e_column
                es_row_no ##NEEDED.

    METHODS evf_onf1
      FOR EVENT onf1 OF cl_gui_alv_grid
      IMPORTING e_fieldname
                es_row_no
                er_event_data ##NEEDED.

    METHODS evf_onf4
      FOR EVENT onf4 OF cl_gui_alv_grid
      IMPORTING e_fieldname
                e_fieldvalue
                es_row_no
                er_event_data
                et_bad_cells
                e_display ##NEEDED.

    METHODS evf_subtotal_text
      FOR EVENT subtotal_text OF cl_gui_alv_grid
      IMPORTING es_subtottxt_info
                ep_subtot_line
                e_event_data ##NEEDED.

    METHODS evf_before_user_command
      FOR EVENT before_user_command OF cl_gui_alv_grid
      IMPORTING e_ucomm ##NEEDED.

    METHODS evf_after_user_command
      FOR EVENT after_user_command OF cl_gui_alv_grid
      IMPORTING e_ucomm
                e_saved
                e_not_processed ##NEEDED.

    METHODS evf_menu_button
      FOR EVENT menu_button OF cl_gui_alv_grid
      IMPORTING e_object
                e_ucomm ##NEEDED.

    METHODS evf_toolbar
      FOR EVENT toolbar OF cl_gui_alv_grid
      IMPORTING e_object
                e_interactive ##NEEDED.

    METHODS evf_after_refresh
        FOR EVENT after_refresh OF cl_gui_alv_grid.

    METHODS evf_top_of_page
      FOR EVENT top_of_page OF cl_gui_alv_grid
      IMPORTING e_dyndoc_id
                table_index ##NEEDED.

    METHODS evf_delayed_callback
        FOR EVENT delayed_callback OF cl_gui_alv_grid ##NEEDED.

    METHODS evf_delayed_changed_sel_call
        FOR EVENT delayed_changed_sel_callback OF cl_gui_alv_grid ##NEEDED.

    METHODS evf_ondropgetflavor
      FOR EVENT ondropgetflavor OF cl_gui_alv_grid
      IMPORTING es_row_no
                e_column
                e_dragdropobj
                e_flavors
                e_row ##NEEDED.

    METHODS evf_ondrag
      FOR EVENT ondrag OF cl_gui_alv_grid
      IMPORTING es_row_no
                e_column
                e_dragdropobj
                e_row ##NEEDED.

    METHODS evf_ondrop
      FOR EVENT ondrop OF cl_gui_alv_grid
      IMPORTING es_row_no
                e_column
                e_dragdropobj
                e_row ##NEEDED.

    METHODS evf_ondropcomplete
      FOR EVENT ondropcomplete OF cl_gui_alv_grid
      IMPORTING es_row_no
                e_column
                e_dragdropobj
                e_row ##NEEDED.

    METHODS evf_drop_external_file
      FOR EVENT drop_external_files OF cl_gui_alv_grid
      IMPORTING files ##NEEDED.

    METHODS evf_toolbar_menubutton_click
      FOR EVENT toolbar_menubutton_click OF cl_gui_alv_grid
      IMPORTING fcode
                menu_pos_x
                menu_pos_y ##NEEDED.

    METHODS evf_click_col_header
      FOR EVENT click_col_header OF cl_gui_alv_grid
      IMPORTING col_id ##NEEDED.

    METHODS evf_delayed_move_current_cell
        FOR EVENT delayed_move_current_cell OF cl_gui_alv_grid ##NEEDED.

    METHODS evf_f1
        FOR EVENT f1 OF cl_gui_alv_grid ##NEEDED.

    METHODS evf_dblclick_row_col
      FOR EVENT dblclick_row_col OF cl_gui_alv_grid
      IMPORTING col_id
                row_id ##NEEDED.

    METHODS evf_click_row_col
      FOR EVENT click_row_col OF cl_gui_alv_grid
      IMPORTING col_id
                row_id ##NEEDED.

    METHODS evf_toolbar_button_click
      FOR EVENT toolbar_button_click OF cl_gui_alv_grid
      IMPORTING fcode ##NEEDED.

    METHODS evf_double_click_col_separator
      FOR EVENT double_click_col_separator OF cl_gui_alv_grid
      IMPORTING col_id ##NEEDED.

    METHODS evf_delayed_change_selection
        FOR EVENT delayed_change_selection OF cl_gui_alv_grid ##NEEDED.

    METHODS evf_context_menu
        FOR EVENT context_menu OF cl_gui_alv_grid ##NEEDED.

    METHODS evf_context_menu_request
      FOR EVENT context_menu_request OF cl_gui_alv_grid
      IMPORTING e_object ##NEEDED.

    METHODS evf_total_click_row_col
      FOR EVENT total_click_row_col OF cl_gui_alv_grid
      IMPORTING col_id
                row_id ##NEEDED.

    METHODS evf_context_menu_selected
      FOR EVENT context_menu_selected OF cl_gui_alv_grid
      IMPORTING fcode ##NEEDED.

    METHODS evf_toolbar_menu_selected
      FOR EVENT toolbar_menu_selected OF cl_gui_alv_grid
      IMPORTING fcode ##NEEDED.

    METHODS evf_request_data
      FOR EVENT _request_data OF cl_gui_alv_grid
      IMPORTING fragments ##NEEDED.

    METHODS evf_at_set_pf_status
        FOR EVENT at_set_pf_status OF zcl_falv ##NEEDED.

    METHODS evf_at_set_title
        FOR EVENT at_set_title OF zcl_falv ##NEEDED.

  PRIVATE SECTION.
    CLASS-DATA created_from_factory TYPE abap_bool.

    DATA top_of_page_doc              TYPE REF TO cl_dd_document.
    DATA top_of_page_visible_at_start TYPE abap_bool.
    DATA call_redraw_after_merging    TYPE abap_bool.
    DATA onf4_internal                TYPE REF TO zcl_falv_onf4_internal.

    CLASS-METHODS check_if_called_from_subclass
      RETURNING VALUE(ro_subclass) TYPE REF TO object.

    CLASS-METHODS create_containters
      IMPORTING i_parent               TYPE REF TO cl_gui_container
                i_applogparent         TYPE REF TO cl_gui_container
                i_popup                TYPE abap_bool
                i_applog_embedded      TYPE abap_bool
      EXPORTING e_built_in_screen      TYPE abap_bool
                e_parent               TYPE REF TO cl_gui_container
                e_applog               TYPE REF TO cl_gui_container
                e_top_of_page_parent   TYPE REF TO cl_gui_container
                e_custom_container     TYPE REF TO cl_gui_container
                e_main_split_container TYPE REF TO cl_gui_splitter_container
                e_split_container      TYPE REF TO cl_gui_splitter_container.

    CLASS-METHODS create_falv_object
      IMPORTING i_subclass     TYPE REF TO cl_abap_typedescr
                i_parent       TYPE REF TO cl_gui_container
                i_applog       TYPE REF TO cl_gui_container
      RETURNING VALUE(rv_falv) TYPE REF TO zcl_falv.

    CLASS-METHODS link_containers
      IMPORTING iv_falv                TYPE REF TO zcl_falv
                i_top_of_page_parent   TYPE REF TO cl_gui_container
                i_custom_container     TYPE REF TO cl_gui_container
                i_main_split_container TYPE REF TO cl_gui_splitter_container
                i_split_container      TYPE REF TO cl_gui_splitter_container.

    CLASS-METHODS create_main_split_cotainer
      IMPORTING i_popup                       TYPE abap_bool
                i_applog_embedded             TYPE abap_bool
                i_main_parent                 TYPE REF TO cl_gui_container
      RETURNING VALUE(r_main_split_container) TYPE REF TO cl_gui_splitter_container.

    CLASS-METHODS create_main_cont_for_full_scr
      IMPORTING i_popup                   TYPE abap_bool
      RETURNING VALUE(r_custom_container) TYPE REF TO cl_gui_container.

    CLASS-METHODS crate_main_splitter
      IMPORTING i_main_split_container   TYPE REF TO cl_gui_splitter_container
      RETURNING VALUE(r_split_container) TYPE REF TO cl_gui_splitter_container.

    METHODS evf_before_ucommand_internal
      FOR EVENT before_user_command OF cl_gui_alv_grid
      IMPORTING e_ucomm ##NEEDED.

    METHODS evf_toolbar_internal
      FOR EVENT toolbar OF cl_gui_alv_grid
      IMPORTING e_object
                e_interactive ##NEEDED.

    METHODS evf_data_changed_internal
      FOR EVENT data_changed OF cl_gui_alv_grid
      IMPORTING er_data_changed
                e_onf4
                e_onf4_before
                e_onf4_after
                e_ucomm ##NEEDED.

    METHODS set_parent
      IMPORTING io_parent     TYPE REF TO object
      RETURNING VALUE(r_falv) TYPE REF TO zcl_falv.

    METHODS build_columns.
    METHODS raise_top_of_page.

    METHODS set_handlers
      IMPORTING iv_falv TYPE REF TO zcl_falv.

    METHODS copy_attributes
      IMPORTING i_falv TYPE REF TO zcl_falv.

    METHODS create_ex_result_falv
      RETURNING VALUE(er_result_table) TYPE REF TO cl_salv_ex_result_data_table.

    METHODS raise_before_first_display.

    METHODS evf_onf4_internal FOR EVENT onf4 OF cl_gui_alv_grid
      IMPORTING e_fieldname
                e_fieldvalue
                es_row_no
                er_event_data
                et_bad_cells
                e_display
                ##NEEDED.
ENDCLASS.



CLASS zcl_falv IMPLEMENTATION.


  METHOD add_button.
    IF NOT line_exists( toolbar_added[ function = iv_function ] ).
      INSERT VALUE #( function  = iv_function
                      icon      = CONV #( iv_icon )
                      quickinfo = iv_quickinfo
                      butn_type = iv_butn_type
                      disabled  = iv_disabled
                      text      = iv_text
                      checked   = iv_checked )
             INTO TABLE toolbar_added.

      DELETE toolbar_deleted WHERE function = iv_function.
      refresh_toolbar( ).
    ENDIF.
    r_falv = me.
  ENDMETHOD.


  METHOD build_columns.
    LOOP AT fcat ASSIGNING FIELD-SYMBOL(<fcat>).
      DATA(column) = NEW zcl_falv_column( iv_fieldname = <fcat>-fieldname
                                          io_falv      = me ).
      INSERT column INTO TABLE columns.
    ENDLOOP.
  ENDMETHOD.


  METHOD check_if_called_from_subclass.
    DATA callstack TYPE abap_callstack.
    DATA src       TYPE TABLE OF string.

    CALL FUNCTION 'SYSTEM_CALLSTACK'
      IMPORTING
        callstack = callstack.

    ASSIGN callstack[ 3 ] TO FIELD-SYMBOL(<stack>).
    IF sy-subrc <> 0.
      RETURN.
    ENDIF.
    DATA(compiler) = cl_abap_compiler=>create( p_name             = <stack>-mainprogram
                                               p_include          = <stack>-include
                                               p_no_package_check = abap_true ).

    compiler->get_single_ref( EXPORTING  p_full_name = |\\TY:ZCL_FALV\\ME:{ callstack[ 2 ]-blockname CASE = UPPER }|
                                         p_grade     = 1   " Grade of Use
                              IMPORTING  p_result    = DATA(falv_references) " Where-Used List
                              EXCEPTIONS OTHERS      = 5 ).
    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

    READ REPORT <stack>-include INTO src.
    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

    ASSIGN src[ <stack>-line ] TO FIELD-SYMBOL(<line>).
    IF <line> IS NOT ASSIGNED.
      RETURN.
    ENDIF.

    ASSIGN falv_references[ line = <stack>-line ] TO FIELD-SYMBOL(<reference>).
    IF sy-subrc = 0.
      DATA subclass_name TYPE string.
      DO.
        DATA(offset) = <reference>-column - sy-index - 2. "-2 because of =>
        IF offset < 0 OR <line>+offset(1) = ` `.
          EXIT.
        ENDIF.
        subclass_name = <line>+offset(1) && subclass_name.
      ENDDO.
      IF subclass_name IS INITIAL OR to_upper( subclass_name ) = 'ZCL_FALV'.
        RETURN.
      ENDIF.

      " global class
      cl_abap_classdescr=>describe_by_name( EXPORTING  p_name         = to_upper( subclass_name )
                                            RECEIVING  p_descr_ref    = ro_subclass
                                            EXCEPTIONS type_not_found = 1 ).
      IF sy-subrc = 0.
        RETURN.
      ELSE.
        " local class
        subclass_name = |\\PROGRAM={ <stack>-mainprogram }\\CLASS={ subclass_name }|.
        cl_abap_classdescr=>describe_by_name( EXPORTING  p_name         = to_upper( subclass_name )
                                              RECEIVING  p_descr_ref    = ro_subclass
                                              EXCEPTIONS type_not_found = 1 ).
        IF sy-subrc = 0.
          RETURN.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDMETHOD.


  METHOD column.
    TRY.
        rv_column = columns[ table_line->fieldname = iv_fieldname ].
      CATCH cx_sy_itab_line_not_found ##NO_HANDLER.
    ENDTRY.
  ENDMETHOD.


  METHOD constructor.
    IF created_from_factory = abap_false.
      RAISE object_created_manually.
    ENDIF.

    super->constructor( EXPORTING  i_shellstyle      = i_shellstyle    " Control Style
                                   i_lifetime        = i_lifetime    " Lifetime
                                   i_parent          = i_parent    " Parent Container
                                   i_appl_events     = i_appl_events    " Register Events as Application Events
                                   i_parentdbg       = i_parentdbg    " Internal, Do not Use
                                   i_applogparent    = i_applogparent    " Container for Application Log
                                   i_graphicsparent  = i_graphicsparent    " Container for Graphics
                                   i_name            = i_name    " Name
                                   i_fcat_complete   = i_fcat_complete  " Boolean Variable (X=True, Space=False)
                        EXCEPTIONS error_cntl_create = 1
                                   error_cntl_init   = 2
                                   error_cntl_link   = 3
                                   error_dp_create   = 4
                                   OTHERS            = 5 ).
    IF sy-subrc <> 0.
      CASE sy-subrc.
        WHEN 1.
          RAISE error_cntl_create.
        WHEN 2.
          RAISE error_cntl_init.
        WHEN 3.
          RAISE error_cntl_link.
        WHEN 4.
          RAISE error_dp_create.
      ENDCASE.
    ENDIF.
  ENDMETHOD.


  METHOD create.
    IF i_subclass IS INITIAL.
      i_subclass ?= check_if_called_from_subclass( ).
    ENDIF.

    create_containters( EXPORTING i_parent               = i_parent
                                  i_applogparent         = i_applogparent
                                  i_popup                = i_popup
                                  i_applog_embedded      = i_applog_embedded
                        IMPORTING e_built_in_screen      = DATA(built_in_screen)
                                  e_parent               = DATA(parent)
                                  e_applog               = DATA(applog)
                                  e_top_of_page_parent   = DATA(top_of_page_parent)
                                  e_custom_container     = DATA(custom_container)
                                  e_main_split_container = DATA(main_split_container)
                                  e_split_container      = DATA(split_container) ).

    rv_falv = create_falv_object( i_subclass = i_subclass
                                  i_parent   = parent
                                  i_applog   = applog ).

    rv_falv->set_handlers( rv_falv ).

    rv_falv->set_output_table( CHANGING ct_table = ct_table ).
    rv_falv->fcat = rv_falv->lvc_fcat_from_itab( it_table = ct_table ).
    rv_falv->set_frontend_fieldcatalog( it_fieldcatalog = rv_falv->fcat ).
    rv_falv->application_log_embedded = i_applog_embedded.
    rv_falv->built_in_screen          = built_in_screen.
    rv_falv->build_columns( ).
    rv_falv->layout     = NEW zcl_falv_layout( rv_falv ).

    rv_falv->gui_status = NEW zcl_falv_dynamic_status( ).

    rv_falv->screen     = SWITCH #( i_popup
                                    WHEN abap_true  THEN c_screen_popup
                                    WHEN abap_false THEN c_screen_full ).
    IF built_in_screen = abap_true AND rv_falv->screen = c_screen_full.
      " default in full screen
      rv_falv->layout->set_no_toolbar( abap_true ).
      CALL FUNCTION 'Z_FALV_ADD_FALV_TO_STACK'
        EXPORTING
          io_falv = rv_falv.
    ENDIF.

    link_containers( iv_falv                = rv_falv
                     i_top_of_page_parent   = top_of_page_parent
                     i_custom_container     = custom_container
                     i_main_split_container = main_split_container
                     i_split_container      = split_container ).

    rv_falv->layout_save = 'A'.
    rv_falv->variant-report   = sy-cprog.
    rv_falv->variant-username = sy-uname.
    IF i_handle IS NOT INITIAL.
      rv_falv->variant-handle = i_handle.
    ENDIF.
    rv_falv->grid = CAST #( rv_falv ).
  ENDMETHOD.


  METHOD link_containers.
    iv_falv->main_container        ?= i_custom_container.
    iv_falv->split_container        = i_split_container.
    iv_falv->main_split_container   = i_main_split_container.
    iv_falv->top_of_page_container  = i_top_of_page_parent.
    IF i_main_split_container IS NOT INITIAL.
      i_main_split_container->set_row_mode( EXPORTING  mode              = i_split_container->mode_absolute
                                            EXCEPTIONS cntl_error        = 0
                                                       cntl_system_error = 0
                                                       OTHERS            = 0 ).
      iv_falv->hide_applog( ).
    ENDIF.
    IF i_split_container IS NOT INITIAL.
      i_split_container->set_row_mode( EXPORTING  mode              = i_split_container->mode_absolute
                                       EXCEPTIONS cntl_error        = 0
                                                  cntl_system_error = 0
                                                  OTHERS            = 0 ).
      iv_falv->hide_top_of_page( ).
    ENDIF.
  ENDMETHOD.


  METHOD create_falv_object.
    created_from_factory = abap_true.

    IF i_subclass IS NOT INITIAL.
      DATA subclass TYPE REF TO object.
      DATA(sublcass_abs_name) = i_subclass->absolute_name.
      CREATE OBJECT subclass TYPE (sublcass_abs_name)
        EXPORTING i_parent       = i_parent
                  i_applogparent = i_applog.
      rv_falv ?= subclass.
      rv_falv->subclass_type = i_subclass.

    ELSE.
      rv_falv = NEW #( i_parent       = i_parent
                       i_applogparent = i_applog ).

    ENDIF.
  ENDMETHOD.


  METHOD create_containters.
    DATA main_parent    TYPE REF TO cl_gui_container.
    DATA docking_parent TYPE REF TO cl_gui_docking_container ##NEEDED.

    IF cl_gui_alv_grid=>offline( ) IS NOT INITIAL.
      main_parent ?= docking_parent.
    ENDIF.
    " We need to call full screen ALV as container was not passed
    IF i_parent IS INITIAL.
      e_built_in_screen = abap_true.

      IF cl_gui_alv_grid=>offline( ) IS INITIAL.
        e_custom_container = create_main_cont_for_full_scr( i_popup ).
        main_parent ?= e_custom_container.
        e_main_split_container = create_main_split_cotainer( i_popup           = i_popup
                                                             i_applog_embedded = i_applog_embedded
                                                             i_main_parent     = main_parent ).
        e_split_container = crate_main_splitter( e_main_split_container ).
        e_parent ?= e_split_container->get_container( row    = 2
                                                      column = 1 ).
        e_applog ?= e_main_split_container->get_container( row    = 2
                                                           column = 1 ).
        e_top_of_page_parent ?= e_split_container->get_container( row    = 1
                                                                  column = 1 ).
      ELSE.

        e_parent ?= main_parent.
        e_custom_container ?= e_parent.

      ENDIF.

    ELSE.
      IF cl_gui_alv_grid=>offline( ) IS NOT INITIAL.

        e_parent ?= main_parent.
        e_custom_container ?= e_parent.

      ELSE.

        e_applog ?= i_applogparent.
        e_custom_container ?= i_parent.

        e_main_split_container = create_main_split_cotainer( i_popup           = i_popup
                                                             i_applog_embedded = i_applog_embedded
                                                             i_main_parent     = e_custom_container ).

        e_split_container = crate_main_splitter( e_main_split_container ).

        IF e_applog IS INITIAL.
          e_parent ?= e_split_container->get_container( row    = 2
                                                        column = 1 ).
          e_applog ?= e_main_split_container->get_container( row    = 2
                                                             column = 1 ).
          e_top_of_page_parent ?= e_split_container->get_container( row    = 1
                                                                    column = 1 ).
        ELSE.
          e_parent ?= e_split_container->get_container( row    = 2
                                                        column = 1 ).
          e_top_of_page_parent ?= e_split_container->get_container( row    = 1
                                                                    column = 1 ).
          e_custom_container ?= i_parent.
        ENDIF.

      ENDIF.

    ENDIF.
  ENDMETHOD.


  METHOD crate_main_splitter.
    r_split_container = NEW cl_gui_splitter_container( parent  = i_main_split_container->get_container( row    = 1
                                                                                                        column = 1 )
                                                       rows    = 2
                                                       columns = 1 ).
  ENDMETHOD.


  METHOD create_main_cont_for_full_scr.
    IF i_popup = abap_true.

      CALL FUNCTION 'Z_FALV_CREATE_MAIN_CONTAINER'
        IMPORTING
          main_container = r_custom_container.
    ELSE.
      r_custom_container = CAST cl_gui_container( NEW cl_gui_custom_container( container_name          = cc_name
                                                                               dynnr                   = c_screen_full
                                                                               repid                   = c_fscr_repid
                                                                               no_autodef_progid_dynnr = abap_true  ) ).
    ENDIF.
  ENDMETHOD.


  METHOD create_main_split_cotainer.
    " Create split container, log at bottom, grid at top.
    " Log hidden as default, will appear when error will be thrown.
    r_main_split_container = NEW cl_gui_splitter_container( link_dynnr = SWITCH #( i_popup
                                                                                   WHEN abap_true  THEN c_screen_popup
                                                                                   WHEN abap_false THEN c_screen_full )
                                                            link_repid = c_fscr_repid
                                                            parent     = i_main_parent
                                                            rows       = COND #( WHEN i_applog_embedded = abap_true
                                                                                 THEN 2
                                                                                 ELSE 1 )
                                                            columns    = 1 ).
  ENDMETHOD.


  METHOD create_by_copy.
    create_containters( EXPORTING i_parent               = i_parent
                                  i_applogparent         = i_applogparent
                                  i_popup                = i_popup
                                  i_applog_embedded      = application_log_embedded
                        IMPORTING
*                           e_built_in_screen      = data(built_in_screen)
                                  e_parent               = DATA(parent)
                                  e_applog               = DATA(applog)
                                  e_top_of_page_parent   = DATA(top_of_page_parent)
                                  e_custom_container     = DATA(custom_container)
                                  e_main_split_container = DATA(main_split_container)
                                  e_split_container      = DATA(split_container) ).

    rv_falv = create_falv_object( i_subclass = subclass_type
                                  i_parent   = parent
                                  i_applog   = applog ).

    copy_attributes( rv_falv ).
    set_handlers( rv_falv ).

    rv_falv->screen = SWITCH #( i_popup
                                WHEN abap_true  THEN c_screen_popup
                                WHEN abap_false THEN c_screen_full ).
    link_containers( iv_falv                = rv_falv
                     i_top_of_page_parent   = top_of_page_parent
                     i_custom_container     = custom_container
                     i_main_split_container = main_split_container
                     i_split_container      = split_container ).

    IF rv_falv->built_in_screen = abap_true.
      CALL FUNCTION 'Z_FALV_ADD_FALV_TO_STACK'
        EXPORTING
          io_falv = rv_falv.
    ENDIF.
    rv_falv->grid = CAST #( rv_falv ).
  ENDMETHOD.


  METHOD set_handlers.
    SET HANDLER iv_falv->evf_after_refresh FOR iv_falv.
    SET HANDLER iv_falv->evf_after_user_command FOR iv_falv.
    SET HANDLER iv_falv->evf_before_ucommand_internal FOR iv_falv.
    SET HANDLER iv_falv->evf_before_user_command FOR iv_falv.
    SET HANDLER iv_falv->evf_btn_click FOR iv_falv.
    SET HANDLER iv_falv->evf_data_changed FOR iv_falv.
    SET HANDLER iv_falv->evf_data_changed_internal FOR iv_falv.
    SET HANDLER iv_falv->evf_data_changed_finished FOR iv_falv.
    SET HANDLER iv_falv->evf_double_click FOR iv_falv.
    SET HANDLER iv_falv->evf_hotspot_click FOR iv_falv.
    SET HANDLER iv_falv->evf_menu_button FOR iv_falv.
    SET HANDLER iv_falv->evf_onf1 FOR iv_falv.
    SET HANDLER iv_falv->evf_onf4_internal FOR iv_falv.
    SET HANDLER iv_falv->evf_onf4 FOR iv_falv.
    SET HANDLER iv_falv->evf_subtotal_text FOR iv_falv.
    SET HANDLER iv_falv->evf_toolbar_internal FOR iv_falv.
    SET HANDLER iv_falv->evf_toolbar FOR iv_falv.
    SET HANDLER iv_falv->evf_user_command FOR iv_falv.
    SET HANDLER iv_falv->evf_at_set_pf_status FOR iv_falv.
    SET HANDLER iv_falv->evf_at_set_title FOR iv_falv.
    SET HANDLER iv_falv->evf_top_of_page FOR iv_falv.
    SET HANDLER iv_falv->evf_delayed_callback FOR iv_falv.
    SET HANDLER iv_falv->evf_delayed_changed_sel_call FOR iv_falv.
    SET HANDLER iv_falv->evf_ondrag FOR iv_falv.
    SET HANDLER iv_falv->evf_ondrop FOR iv_falv.
    SET HANDLER iv_falv->evf_ondropcomplete FOR iv_falv.
    SET HANDLER iv_falv->evf_ondropgetflavor FOR iv_falv.
    SET HANDLER iv_falv->evf_drop_external_file FOR iv_falv.
    SET HANDLER iv_falv->evf_toolbar_menubutton_click FOR iv_falv.
    SET HANDLER iv_falv->evf_click_col_header FOR iv_falv.
    SET HANDLER iv_falv->evf_delayed_move_current_cell FOR iv_falv.
    SET HANDLER iv_falv->evf_f1 FOR iv_falv.
    SET HANDLER iv_falv->evf_dblclick_row_col FOR iv_falv.
    SET HANDLER iv_falv->evf_click_row_col FOR iv_falv.
    SET HANDLER iv_falv->evf_toolbar_button_click FOR iv_falv.
    SET HANDLER iv_falv->evf_double_click_col_separator FOR iv_falv.
    SET HANDLER iv_falv->evf_delayed_change_selection FOR iv_falv.
    SET HANDLER iv_falv->evf_context_menu FOR iv_falv.
    SET HANDLER iv_falv->evf_total_click_row_col FOR iv_falv.
    SET HANDLER iv_falv->evf_context_menu_selected FOR iv_falv.
    SET HANDLER iv_falv->evf_context_menu_request FOR iv_falv.
    SET HANDLER iv_falv->evf_toolbar_menu_selected FOR iv_falv.
    SET HANDLER iv_falv->evf_request_data FOR iv_falv.
    SET HANDLER iv_falv->evf_before_first_display FOR iv_falv.

    iv_falv->set_delay_change_selection( EXPORTING  time   = iv_falv->delay_change_selection
                                         EXCEPTIONS error  = 0
                                                    OTHERS = 0 ).

    iv_falv->set_delay_move_current_cell( EXPORTING  time   = iv_falv->delay_move_current_cell
                                          EXCEPTIONS error  = 0
                                                     OTHERS = 0 ).
  ENDMETHOD.


  METHOD delete_all_buttons.
    layout->delete_all_buttons = abap_true.
    IF iv_exceptions IS INITIAL.
      APPEND LINES OF mt_toolbar TO toolbar_deleted.
      REFRESH toolbar_added.
    ELSE.
      toolbar_exceptions = iv_exceptions.
      LOOP AT mt_toolbar ASSIGNING FIELD-SYMBOL(<tlb>).
        IF NOT line_exists( iv_exceptions[ function = <tlb>-function ] ).
          APPEND <tlb> TO toolbar_deleted.
          DELETE toolbar_added WHERE function = <tlb>-function.
        ENDIF.
      ENDLOOP.
    ENDIF.
    APPEND LINES OF toolbar_deleted TO exclude_functions.
    refresh_toolbar( ).
    r_falv = me.
  ENDMETHOD.


  METHOD delete_button.
    DELETE toolbar_added WHERE function = iv_function.
    IF sy-subrc <> 0.
      INSERT VALUE #( function = iv_function ) INTO TABLE toolbar_deleted.
    ENDIF.
    refresh_toolbar( ).
    r_falv = me.
  ENDMETHOD.


  METHOD disable_button.
    TRY.
        toolbar_added[ function = iv_function ]-disabled = abap_true.
      CATCH cx_sy_itab_line_not_found.
        CLEAR sy-subrc.
    ENDTRY.
    INSERT VALUE #( function = iv_function ) INTO TABLE toolbar_disabled.
    refresh_toolbar( ).
    r_falv = me.
  ENDMETHOD.


  METHOD display.
    FIELD-SYMBOLS <outtab> TYPE STANDARD TABLE.

    r_falv = me.
    IF me->title_v1 IS INITIAL.
      title_v1 = sy-title. " for lazy people who wants to have alv title to be equal one from report.
    ENDIF.
    IF built_in_screen = abap_true AND iv_force_grid = abap_false.
      IF     screen           = c_screen_popup AND iv_start_row IS INITIAL
         AND iv_start_column IS INITIAL
         AND iv_end_row      IS INITIAL
         AND iv_end_column   IS INITIAL.
        iv_start_row = 1.
        iv_start_column = 1.
        iv_end_row = 20.
        iv_end_column = 150.
      ENDIF.
      CALL FUNCTION 'Z_FALV_DISPLAY'
        EXPORTING
          io_falv         = me
          iv_start_row    = iv_start_row
          iv_start_column = iv_start_column
          iv_end_row      = iv_end_row
          iv_end_column   = iv_end_column.
    ELSE.
      ASSIGN outtab->* TO <outtab>.
      LOOP AT fcat ASSIGNING FIELD-SYMBOL(<fcat>).
        <fcat>-tech_form = space.
      ENDLOOP.
      set_table_for_first_display( EXPORTING  i_buffer_active               = buffering_active   " Buffering Active
                                              i_bypassing_buffer            = bypassing_buffer   " Switch Off Buffer
                                              is_variant                    = variant
                                              i_save                        = layout_save
                                              is_layout                     = lvc_layout
                                              it_toolbar_excluding          = exclude_functions
                                   CHANGING   it_outtab                     = <outtab> " Output Table
                                              it_fieldcatalog               = fcat
                                              it_sort                       = sort " Sort Criteria
                                              it_filter                     = filter " Filter Criteria
                                   EXCEPTIONS invalid_parameter_combination = 1
                                              program_error                 = 2
                                              too_many_lines                = 3
                                              OTHERS                        = 4 ).
      IF sy-subrc = 0.
        onf4_internal = NEW #( me ).
        onf4_internal->build_automatic_f4( ).
        raise_before_first_display( ).
        IF layout->delete_all_buttons = abap_true.
          delete_all_buttons( toolbar_exceptions ).
        ENDIF.
        IF split_container IS NOT INITIAL.
          split_container->set_focus( EXPORTING  control           = me
                                      EXCEPTIONS cntl_error        = 0
                                                 cntl_system_error = 0
                                                 OTHERS            = 0 ).
          hide_applog( ).
        ELSE.
          parent->set_focus( EXPORTING  control           = me
                             EXCEPTIONS cntl_error        = 0
                                        cntl_system_error = 0
                                        OTHERS            = 0 ).
        ENDIF.
        cl_gui_cfw=>flush( EXCEPTIONS cntl_system_error = 0
                                      cntl_error        = 0
                                      OTHERS            = 0 ).
        set_visible( abap_true ).
        parent->set_visible( abap_true ).
        main_container->set_visible( abap_true ).
        IF me->split_container IS NOT INITIAL.
          split_container->set_visible( abap_true ).
        ENDIF.
        raise_top_of_page( ).
      ENDIF.
    ENDIF.
  ENDMETHOD.


  METHOD raise_before_first_display.
    RAISE EVENT before_first_display.
    IF call_redraw_after_merging = abap_true.
      redraw_after_merging_change( ).
    ENDIF.
  ENDMETHOD.


  METHOD enable_button.
    TRY.
        toolbar_added[ function = iv_function ]-disabled = abap_false.
      CATCH cx_sy_itab_line_not_found.
        CLEAR sy-subrc.
    ENDTRY.
    DELETE toolbar_disabled WHERE function = iv_function.
    refresh_toolbar( ).
    r_falv = me.
  ENDMETHOD.


  METHOD encode_picture_base64.
    rv_image = |<img src="data:{ iv_mime_type };base64,{ cl_http_utility=>encode_x_base64(
                                                             unencoded = iv_xstring ) }">|.
  ENDMETHOD.


  METHOD evf_after_refresh ##NEEDED.
  ENDMETHOD.


  METHOD evf_after_user_command ##NEEDED.
  ENDMETHOD.


  METHOD evf_at_set_pf_status ##NEEDED.
  ENDMETHOD.


  METHOD evf_at_set_title ##NEEDED.
  ENDMETHOD.


  METHOD set_dummy_function_code.
    CALL FUNCTION 'SAPGUI_SET_FUNCTIONCODE'
      EXPORTING
        functioncode           = 'DUMMY'
      EXCEPTIONS
        function_not_supported = 0
        OTHERS                 = 0.
    r_falv = me.
  ENDMETHOD.


  METHOD evf_before_ucommand_internal.
    FIELD-SYMBOLS <outtab> TYPE STANDARD TABLE.

    CASE e_ucomm.
      WHEN me->mc_fc_select_all.
        IF     layout->mark_field IS NOT INITIAL
           AND line_exists( fcat[ fieldname = layout->mark_field
                                  checkbox  = abap_true ] ).
          ASSIGN outtab->* TO <outtab>.
          LOOP AT <outtab> ASSIGNING FIELD-SYMBOL(<line>).
            ASSIGN COMPONENT layout->mark_field OF STRUCTURE <line> TO FIELD-SYMBOL(<mark>).
            IF sy-subrc = 0 AND me->get_cell_enabled( i_row   = sy-tabix
                                                      i_field = layout->mark_field ) = abap_true.
              <mark> = abap_true.
            ENDIF.
          ENDLOOP.
          soft_refresh( ).
          set_user_command( i_ucomm = space ).
        ENDIF.
      WHEN me->mc_fc_deselect_all.
        IF     layout->mark_field IS NOT INITIAL
           AND line_exists( fcat[ fieldname = layout->mark_field
                                  checkbox  = abap_true ] ).
          ASSIGN outtab->* TO <outtab>.
          LOOP AT <outtab> ASSIGNING <line>.
            ASSIGN COMPONENT layout->mark_field OF STRUCTURE <line> TO <mark>.
            IF sy-subrc = 0 AND me->get_cell_enabled( i_row   = sy-tabix
                                                      i_field = layout->mark_field ) = abap_true.
              <mark> = abap_false.
            ENDIF.
          ENDLOOP.
          soft_refresh( ).
          set_user_command( i_ucomm = space ).
        ENDIF.
    ENDCASE.
  ENDMETHOD.


  METHOD evf_before_user_command ##NEEDED.
  ENDMETHOD.


  METHOD evf_btn_click ##NEEDED.
  ENDMETHOD.


  METHOD evf_click_col_header ##NEEDED.
  ENDMETHOD.


  METHOD evf_click_row_col ##NEEDED.
  ENDMETHOD.


  METHOD evf_context_menu ##NEEDED.
  ENDMETHOD.


  METHOD evf_context_menu_selected ##NEEDED.
  ENDMETHOD.


  METHOD evf_context_menu_request ##NEEDED.
  ENDMETHOD.


  METHOD evf_data_changed ##NEEDED.
  ENDMETHOD.


  METHOD evf_data_changed_finished ##NEEDED.
  ENDMETHOD.


  METHOD evf_data_changed_internal.
    IF er_data_changed->mt_protocol IS NOT INITIAL.
      show_applog( ).
    ELSE.
      hide_applog( ).
    ENDIF.

    " This lines makes that focus stays on grid
    " while embedded error log appears on the screen.
    " This trick will not work if someone will use own handler
    " for data_changed instead of evf_data_changed
    m_display_protocol = abap_true.

    er_data_changed->display_protocol( ).

    cl_gui_control=>set_focus( EXPORTING  control           = CAST #( me )
                               EXCEPTIONS cntl_error        = 1
                                          cntl_system_error = 2
                                          OTHERS            = 3 ).
    IF sy-subrc = 0.
      m_display_protocol = abap_false.
    ENDIF.
  ENDMETHOD.


  METHOD evf_dblclick_row_col ##NEEDED.
  ENDMETHOD.


  METHOD evf_delayed_callback ##NEEDED.
  ENDMETHOD.


  METHOD evf_delayed_changed_sel_call ##NEEDED.
  ENDMETHOD.


  METHOD evf_delayed_change_selection ##NEEDED.
  ENDMETHOD.


  METHOD evf_delayed_move_current_cell ##NEEDED.
  ENDMETHOD.


  METHOD evf_double_click ##NEEDED.
  ENDMETHOD.


  METHOD evf_double_click_col_separator ##NEEDED.
  ENDMETHOD.


  METHOD evf_drop_external_file ##NEEDED.
  ENDMETHOD.


  METHOD evf_f1 ##NEEDED.
  ENDMETHOD.


  METHOD evf_hotspot_click ##NEEDED.
  ENDMETHOD.


  METHOD evf_menu_button ##NEEDED.
  ENDMETHOD.


  METHOD evf_ondrag ##NEEDED.
  ENDMETHOD.


  METHOD evf_ondrop ##NEEDED.
  ENDMETHOD.


  METHOD evf_ondropcomplete ##NEEDED.
  ENDMETHOD.


  METHOD evf_ondropgetflavor ##NEEDED.
  ENDMETHOD.


  METHOD evf_onf1 ##NEEDED.
  ENDMETHOD.


  METHOD evf_onf4 ##NEEDED.
  ENDMETHOD.


  METHOD evf_request_data ##NEEDED.
  ENDMETHOD.


  METHOD evf_subtotal_text ##NEEDED.
  ENDMETHOD.


  METHOD evf_toolbar ##NEEDED.
  ENDMETHOD.


  METHOD evf_toolbar_button_click ##NEEDED.
  ENDMETHOD.


  METHOD evf_toolbar_internal.
    LOOP AT toolbar_added ASSIGNING FIELD-SYMBOL(<tb>).
      INSERT <tb> INTO TABLE e_object->mt_toolbar[].
    ENDLOOP.
    LOOP AT toolbar_disabled ASSIGNING <tb>.
      TRY.
          e_object->mt_toolbar[ function = <tb>-function ]-disabled = abap_true.
        CATCH cx_sy_itab_line_not_found.
          CLEAR sy-subrc.
      ENDTRY.
    ENDLOOP.
    LOOP AT toolbar_deleted ASSIGNING <tb>.
      DELETE e_object->mt_toolbar WHERE function = <tb>-function.
    ENDLOOP.
  ENDMETHOD.


  METHOD evf_toolbar_menubutton_click ##NEEDED.
  ENDMETHOD.


  METHOD evf_toolbar_menu_selected ##NEEDED.
  ENDMETHOD.


  METHOD evf_top_of_page ##NEEDED.
  ENDMETHOD.


  METHOD evf_total_click_row_col ##NEEDED.
  ENDMETHOD.


  METHOD evf_user_command.
    CASE e_ucomm.
      WHEN fc_back OR fc_exit OR fc_up OR fc_cancel.
        LEAVE TO SCREEN 0.
      WHEN fc_mass_replace.
        mass_replace( ).
      WHEN fc_find.
        e_ucomm = '%SC'.
        set_function_code( CHANGING c_ucomm = e_ucomm ).
      WHEN fc_find_next.
        e_ucomm = '%SC+'.
        set_function_code( CHANGING c_ucomm = e_ucomm ).
    ENDCASE.
  ENDMETHOD.


  METHOD exclude_function.
    IF NOT line_exists( exclude_functions[ table_line = iv_ucomm ] ).
      INSERT iv_ucomm INTO TABLE exclude_functions.
    ENDIF.
    r_falv = me.
  ENDMETHOD.


  METHOD create_ex_result_falv.
    DATA lt_lvc_row TYPE lvc_t_row.

    get_selected_rows( IMPORTING et_index_rows = lt_lvc_row ).

    DATA lt_sel_cols  TYPE lvc_t_col.
    DATA lt_sel_cells TYPE lvc_t_cell.

    get_selected_columns( IMPORTING et_index_columns = lt_sel_cols ).

    get_selected_cells( IMPORTING et_cell = lt_sel_cells ).

    DATA ls_lvc_col  TYPE lvc_s_col.
    DATA ls_lvc_row  TYPE lvc_s_row.
    DATA ls_cur_cell TYPE lvc_s_cell.

    CLEAR:
      ls_lvc_row,
      ls_lvc_col.
    get_current_cell( IMPORTING es_row_id = ls_lvc_row
                                es_col_id = ls_lvc_col ).
    ls_cur_cell-col_id-fieldname = ls_lvc_col-fieldname.
    ls_cur_cell-row_id-index = ls_lvc_row-index.

    er_result_table = cl_salv_ex_util=>factory_result_data_table(
      t_selected_rows    = lt_lvc_row
      t_selected_columns = lt_sel_cols
      t_selected_cells   = lt_sel_cells
      r_data             = grid->mt_outtab
      s_layout           = grid->m_cl_variant->ms_layout
      t_fieldcatalog     = grid->m_cl_variant->mt_fieldcatalog
      t_sort             = grid->m_cl_variant->mt_sort
      t_filter           = grid->m_cl_variant->mt_filter
      t_hyperlinks       = grid->mt_hyperlinks
      s_current_cell     = ls_cur_cell
*     hyperlink_entry_column = ls_hyper_entry
*     dropdown_entry_column = ls_dropdown_entry
*     r_top_of_list      = lr_top_of_list
*     r_end_of_list      = lr_end_of_list
*     t_dropdown_values  = lt_drdn
    ).
  ENDMETHOD.


  METHOD export_to_excel.
    DATA version         TYPE string.
    DATA result_data     TYPE REF TO cl_salv_ex_result_data_table.
    DATA salv_intf_descr TYPE REF TO cl_abap_objectdescr.
    DATA file_type       TYPE salv_bs_constant.

    IF NOT (    cl_salv_bs_a_xml_base=>get_version( ) = if_salv_bs_xml=>version_25
             OR cl_salv_bs_a_xml_base=>get_version( ) = if_salv_bs_xml=>version_26 ).
      RETURN.
    ENDIF.

    result_data = create_ex_result_falv( ).

    CASE cl_salv_bs_a_xml_base=>get_version( ).
      WHEN if_salv_bs_xml=>version_25.
        version = if_salv_bs_xml=>version_25.
      WHEN if_salv_bs_xml=>version_26.
        version = if_salv_bs_xml=>version_26.
    ENDCASE.

    " if XLSX is possible then we create it,  if not then MHTML excel file
    salv_intf_descr ?= cl_abap_intfdescr=>describe_by_name( p_name = 'IF_SALV_BS_XML' ).
    IF salv_intf_descr IS NOT INITIAL AND line_exists( salv_intf_descr->attributes[ name = 'C_TYPE_XLSX'  ] ).
      file_type = 10.
    ELSE.
      file_type = 02.
    ENDIF.

    " transformation of data to excel
    cl_salv_bs_tt_util=>if_salv_bs_tt_util~transform( EXPORTING xml_type      = file_type
                                                                xml_version   = version
                                                                r_result_data = result_data
                                                                xml_flavour   = if_salv_bs_c_tt=>c_tt_xml_flavour_export
                                                                gui_type      = if_salv_bs_xml=>c_gui_type_gui
                                                      IMPORTING xml           = rv_xstring ).
  ENDMETHOD.


  METHOD get_cell_enabled.
    FIELD-SYMBOLS <outtab> TYPE STANDARD TABLE.
    FIELD-SYMBOLS <styles> TYPE lvc_t_styl.

    CHECK i_row IS NOT INITIAL AND i_field IS NOT INITIAL.
    get_frontend_layout( IMPORTING es_layout = lvc_layout ).

    " if sy-subrc eq 0. " The value of SY-SUBRC is always set to 0 by CALL METHOD GET_FRONTEND_LAYOUT.
    IF lvc_layout-stylefname IS NOT INITIAL.
      ASSIGN outtab->* TO <outtab>.
      ASSIGN <outtab>[ i_row ] TO FIELD-SYMBOL(<line>).
      IF sy-subrc = 0.
        ASSIGN COMPONENT lvc_layout-stylefname OF STRUCTURE <line> TO <styles>.
        IF sy-subrc = 0.
          ASSIGN <styles>[ fieldname = i_field ] TO FIELD-SYMBOL(<style>).
          IF sy-subrc = 0.
            IF <style>-style = mc_style_enabled.
              r_enabled = abap_true.
              RETURN.
            ELSEIF <style>-style = mc_style_disabled.
              r_enabled = abap_false.
              RETURN.
            ENDIF.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDIF.
    " all cells editable
    IF lvc_layout-edit = abap_true.
      r_enabled = abap_true.
    ELSE.
      get_frontend_fieldcatalog( IMPORTING et_fieldcatalog = fcat ).
      ASSIGN fcat[ fieldname = i_field ] TO FIELD-SYMBOL(<fcat>).
      IF <fcat>-edit = abap_true.
        r_enabled = abap_true.
      ENDIF.
    ENDIF.
    " endif.
  ENDMETHOD.


  METHOD get_file_from_mime.
    cl_mime_repository_api=>get_api( )->get( EXPORTING  i_url       = iv_path
                                             IMPORTING  e_content   = ev_xstring
                                                        e_mime_type = ev_mime_type
                                             EXCEPTIONS OTHERS      = 1 ).
    IF sy-subrc <> 0.
      RETURN.
    ENDIF.
  ENDMETHOD.


  METHOD get_picture_from_se78.
    cl_ssf_xsf_utilities=>get_bds_graphic_as_bmp( EXPORTING  p_object       = 'GRAPHICS'    " SAPscript Graphics Management: Application object
                                                             p_name         = iv_name   " Name
                                                             p_id           = iv_id   " SAPscript Graphics Management: ID
                                                             p_btype        = iv_type   " SAPscript: Type of graphic
                                                  RECEIVING  p_bmp          = rv_xstring   " Graphic Data
                                                  EXCEPTIONS not_found      = 0
                                                             internal_error = 0
                                                             OTHERS         = 0 ).
  ENDMETHOD.


  METHOD hide_applog.
    IF main_split_container IS INITIAL.
      RETURN.
    ENDIF.

    main_split_container->set_row_sash( EXPORTING  id                = 1   " Row Splitter Bar ID
                                                   type              = split_container->type_sashvisible   " Attribute
                                                   value             = 0   " Value
                                        EXCEPTIONS cntl_error        = 0
                                                   cntl_system_error = 0
                                                   OTHERS            = 0 ).
    main_split_container->set_row_height( EXPORTING  id                = 2 " Row ID
                                                     height            = 0  " Height
                                          EXCEPTIONS cntl_error        = 0
                                                     cntl_system_error = 0
                                                     OTHERS            = 0 ).
    CLEAR splitter_row_3_height.
  ENDMETHOD.


  METHOD hide_top_of_page.
    IF split_container IS NOT INITIAL.

      split_container->set_row_sash( EXPORTING  id                = 1   " Row Splitter Bar ID
                                                type              = split_container->type_sashvisible   " Attribute
                                                value             = 0   " Value
                                     EXCEPTIONS cntl_error        = 0
                                                cntl_system_error = 0
                                                OTHERS            = 0 ).

      split_container->set_row_height( EXPORTING  id                = 1 " Row ID
                                                  height            = 0  " Height
                                       EXCEPTIONS cntl_error        = 1
                                                  cntl_system_error = 2
                                                  OTHERS            = 3 ).
      IF sy-subrc = 0.
        splitter_row_1_height = 0.
      ENDIF.
    ENDIF.
    r_falv = me.
  ENDMETHOD.


  METHOD lvc_fcat_from_itab.
    DATA table TYPE REF TO data.

    CREATE DATA table LIKE it_table.
    ASSIGN table->* TO FIELD-SYMBOL(<table>).
    TRY.
        cl_salv_table=>factory( IMPORTING r_salv_table = DATA(salv_table)
                                CHANGING  t_table      = <table> ).
        rt_fcat = cl_salv_controller_metadata=>get_lvc_fieldcatalog( r_columns      = salv_table->get_columns( ) " ALV Filter
                                                                     r_aggregations = salv_table->get_aggregations( ) ). " ALV Aggregations
      CATCH cx_root ##NO_HANDLER.
    ENDTRY.
  ENDMETHOD.


  METHOD mass_replace.
    FIELD-SYMBOLS <outtab> TYPE STANDARD TABLE.

    ASSIGN outtab->* TO <outtab>.
    IF sy-subrc = 0.
      CALL FUNCTION 'Z_FALV_MASS_REPLACE'
        EXPORTING
          io_grid   = CAST cl_gui_alv_grid( me )
        CHANGING
          ct_outtab = <outtab>.
    ENDIF.
  ENDMETHOD.


  METHOD pai.
    " TODO: parameter IV_DYNNR is never used (ABAP cleaner)

    DATA ucomm TYPE sy-ucomm.

    ucomm = c_ucomm.
    CLEAR c_ucomm.
    RAISE EVENT user_command EXPORTING e_ucomm = ucomm.

    set_function_code( CHANGING c_ucomm = ucomm ).
  ENDMETHOD.


  METHOD pbo.
    " TODO: parameter IV_DYNNR is never used (ABAP cleaner)

    gui_status->show_gui_status( ).
    RAISE EVENT at_set_pf_status.

    gui_status->show_title( iv_text1 = title_v1
                            iv_text2 = title_v2
                            iv_text3 = title_v3
                            iv_text4 = title_v4
                            iv_text5 = title_v5 ).
    RAISE EVENT at_set_title.
  ENDMETHOD.


  METHOD raise_top_of_page.
    IF    top_of_page_visible_at_start  = abap_false
       OR top_of_page_container        IS INITIAL.
      RETURN.
    ENDIF.

    IF me->top_of_page_doc IS INITIAL.
      top_of_page_doc = NEW cl_dd_document( ).
    ENDIF.

    EXPORT alv_form_html FROM abap_true
           TO MEMORY ID 'ALV_FORM_HTML'.

    list_processing_events( i_event_name = 'TOP_OF_PAGE'
                            i_dyndoc_id  = top_of_page_doc ).

    EXPORT alv_form_html FROM abap_false
           TO MEMORY ID 'ALV_FORM_HTML'.

    top_of_page_doc->display_document( EXPORTING  reuse_control      = 'X'
                                                  parent             = top_of_page_container
                                       EXCEPTIONS html_display_error = 0
                                                  OTHERS             = 0 ).
    show_top_of_page( ).
  ENDMETHOD.


  METHOD refresh_toolbar.
    CONSTANTS m_init_toolbar TYPE string VALUE 'M_INIT_TOOLBAR' ##NO_TEXT.
    CHECK cl_gui_alv_grid=>offline( ) IS INITIAL.
    ASSIGN grid->(m_init_toolbar) TO FIELD-SYMBOL(<init_toolbar>). "S/4 2023 compatible
    IF <init_toolbar> IS ASSIGNED.
      CHECK <init_toolbar> EQ space.
    ENDIF.
    TRY.
        me->set_toolbar_interactive(  ).
      CATCH cx_root.
        "in case method is called before the display of grid
        "no need to do anything with that
        CLEAR sy-subrc.
    ENDTRY.
    r_falv = me.
  ENDMETHOD.


  METHOD save_excel_localy.
    DATA path     TYPE string.
    DATA filename TYPE string.

    IF iv_path IS INITIAL.
      cl_gui_frontend_services=>file_save_dialog( EXPORTING
*                                                     window_title         = window_title
                                                     default_extension    = 'XLSX'
*                                                             default_file_name    = default_file_name
*                                                             with_encoding        = with_encoding
*                                                             file_filter          = file_filter
*                                                             initial_directory    = initial_directory
*                                                             prompt_on_overwrite  = 'X'
                                                  CHANGING   filename             = filename
                                                             path                 = path
                                                             fullpath             = iv_path
*                                                             user_action          = user_action
*                                                             file_encoding        = file_encoding
                                                  EXCEPTIONS cntl_error           = 1
                                                             error_no_gui         = 2
                                                             not_supported_by_gui = 3
                                                             OTHERS               = 4 ).
      IF sy-subrc <> 0.
        RETURN.
      ENDIF.
    ENDIF.

    IF iv_path IS INITIAL.
      RETURN.
    ENDIF.

    DATA(xstring) = export_to_excel( ).
    DATA(xstrsize) = xstrlen( xstring ).
    DATA(solix) = cl_bcs_convert=>xstring_to_solix( xstring ).

    cl_gui_frontend_services=>gui_download( EXPORTING  bin_filesize            = xstrsize
                                                       filename                = iv_path
                                                       filetype                = 'BIN'
                                            CHANGING   data_tab                = solix
                                            EXCEPTIONS file_write_error        = 1
                                                       no_batch                = 2
                                                       gui_refuse_filetransfer = 3
                                                       invalid_type            = 4
                                                       no_authority            = 5
                                                       unknown_error           = 6
                                                       header_not_allowed      = 7
                                                       separator_not_allowed   = 8
                                                       filesize_not_allowed    = 9
                                                       header_too_long         = 10
                                                       dp_error_create         = 11
                                                       dp_error_send           = 12
                                                       dp_error_write          = 13
                                                       unknown_dp_error        = 14
                                                       access_denied           = 15
                                                       dp_out_of_memory        = 16
                                                       disk_full               = 17
                                                       dp_timeout              = 18
                                                       file_not_found          = 19
                                                       dataprovider_exception  = 20
                                                       control_flush_error     = 21
                                                       not_supported_by_gui    = 22
                                                       error_no_gui            = 23
                                                       OTHERS                  = 24 ).
    IF sy-subrc = 0.
      rv_saved = abap_true.
    ENDIF.
  ENDMETHOD.


  METHOD send.
    r_falv = me.

    IF it_recipients IS INITIAL.
      RAISE add_recipient_error.
    ENDIF.
    TRY.
        DATA(request) = cl_bcs=>create_persistent( ).
      CATCH cx_send_req_bcs.
        RAISE create_request_error.
    ENDTRY.

    TRY.
        DATA(document) = cl_document_bcs=>create_document( i_type        = 'HTM'
                                                           i_text        = cl_document_bcs=>string_to_soli( iv_body )
                                                           i_subject     = CONV #( iv_subject )
                                                           i_importance  = iv_importance
                                                           i_sensitivity = iv_sensitivity ).

      CATCH cx_document_bcs.
        RAISE create_document_error.
    ENDTRY.

    DATA(excel) = export_to_excel( ).

    TRY.
        document->add_attachment( i_attachment_type    = 'EXT'
                                  i_att_content_hex    = cl_document_bcs=>xstring_to_solix( excel )
                                  i_attachment_size    = CONV #( xstrlen( excel ) )
                                  i_attachment_subject = COND #( WHEN iv_filename IS NOT INITIAL
                                                                 THEN iv_filename
                                                                 ELSE CONV #( |{ sy-datum }_{ sy-uzeit }.xlsx | ) ) ) ##NO_TEXT.
      CATCH cx_document_bcs.
        RAISE add_attachment_error.
    ENDTRY.

    TRY.

        request->set_document( document ).
      CATCH cx_send_req_bcs.
        RAISE add_document_error.
    ENDTRY.

    LOOP AT it_recipients ASSIGNING FIELD-SYMBOL(<addr>).
      TRY.
          DATA(smtp_addr) = cl_cam_address_bcs=>create_internet_address( <addr>-smtp_addr ).
        CATCH cx_address_bcs.
          RAISE add_recipient_error.
      ENDTRY.

      TRY.
          request->add_recipient( i_recipient  = smtp_addr
                                  i_express    = <addr>-express
                                  i_copy       = <addr>-copy
                                  i_blind_copy = <addr>-blind_copy ).

        CATCH cx_send_req_bcs.
          RAISE add_recipient_error.
      ENDTRY.
    ENDLOOP.

    IF iv_sender IS NOT INITIAL.
      TRY.
          DATA(sender) = cl_cam_address_bcs=>create_internet_address( i_address_string = iv_sender
                                                                      i_address_name   = iv_sender_name ).
        CATCH cx_address_bcs.
          RAISE add_sender_error.
      ENDTRY.

      TRY.
          request->set_sender( i_sender = sender ).
        CATCH cx_send_req_bcs.
          RAISE add_sender_error.
      ENDTRY.
    ENDIF.

    TRY.
        request->set_message_subject( ip_subject = iv_subject ).
      CATCH cx_root ##NO_HANDLER.
    ENDTRY.

    IF iv_immediately = abap_true.
      TRY.
          " set send immediately
          request->set_send_immediately( abap_true ).
        CATCH cx_send_req_bcs.
          RAISE send_immediately_error.
      ENDTRY.

    ENDIF.
    TRY.
        request->send( ).
        IF iv_commit = abap_true.
          COMMIT WORK.
        ENDIF.
      CATCH cx_send_req_bcs.
        RAISE send_error.
    ENDTRY.
  ENDMETHOD.


  METHOD set_cell_button.
    r_falv = me.
    FIELD-SYMBOLS <outtab> TYPE STANDARD TABLE.
    FIELD-SYMBOLS <styles> TYPE lvc_t_styl.
    get_frontend_layout( IMPORTING es_layout = lvc_layout ).
    IF lvc_layout-stylefname IS INITIAL.
      RETURN.
    ENDIF.
    ASSIGN outtab->* TO <outtab>.
    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

    ASSIGN <outtab>[ iv_row ] TO FIELD-SYMBOL(<row>).
    IF sy-subrc = 0.
      ASSIGN COMPONENT lvc_layout-stylefname OF STRUCTURE <row> TO <styles>.
      IF sy-subrc = 0.
        TRY.
            <styles>[ fieldname = iv_fieldname ]-style = mc_style_button.
          CATCH cx_sy_itab_line_not_found.
            INSERT VALUE #( fieldname = iv_fieldname
                            style     = mc_style_button ) INTO TABLE <styles>.
        ENDTRY.
      ENDIF.
    ENDIF.
  ENDMETHOD.

  METHOD set_cell_styles.
    r_falv = me.
    FIELD-SYMBOLS <outtab> TYPE STANDARD TABLE.
    FIELD-SYMBOLS <styles> TYPE lvc_t_styl.
    get_frontend_layout( IMPORTING es_layout = lvc_layout ).
    IF lvc_layout-stylefname IS INITIAL.
      RETURN.
    ENDIF.
    ASSIGN outtab->* TO <outtab>.
    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

    ASSIGN <outtab>[ iv_row ] TO FIELD-SYMBOL(<row>).
    IF sy-subrc = 0.
      ASSIGN COMPONENT lvc_layout-stylefname OF STRUCTURE <row> TO <styles>.
      IF sy-subrc = 0.
        TRY.
            <styles>[ fieldname = iv_fieldname ]-style = iv_style.
            <styles>[ fieldname = iv_fieldname ]-style2 = iv_style2.
          CATCH cx_sy_itab_line_not_found.
            INSERT VALUE #( fieldname = iv_fieldname
                            style     = iv_style
                            style2   =  iv_style2 ) INTO TABLE <styles>.
        ENDTRY.
      ENDIF.
    ENDIF.
  ENDMETHOD.


  METHOD set_cell_color.
    FIELD-SYMBOLS <outtab> TYPE STANDARD TABLE.
    FIELD-SYMBOLS <colors> TYPE lvc_t_scol.

    r_falv = me.
    get_frontend_layout( IMPORTING es_layout = lvc_layout ).
    IF lvc_layout-ctab_fname IS INITIAL.
      RETURN.
    ENDIF.
    ASSIGN outtab->* TO <outtab>.
    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

    ASSIGN <outtab>[ iv_row ] TO FIELD-SYMBOL(<row>).
    IF sy-subrc = 0.
      ASSIGN COMPONENT lvc_layout-ctab_fname OF STRUCTURE <row> TO <colors>.
      IF sy-subrc = 0.
        TRY.
            <colors>[ fname = iv_fieldname ]-color = iv_color.
          CATCH cx_sy_itab_line_not_found.
            INSERT VALUE #( fname = iv_fieldname
                            color = iv_color ) INTO TABLE <colors>.
        ENDTRY.
      ENDIF.
    ENDIF.
  ENDMETHOD.


  METHOD set_cell_disabled.
    FIELD-SYMBOLS <outtab> TYPE STANDARD TABLE.
    FIELD-SYMBOLS <styles> TYPE lvc_t_styl.

    r_falv = me.
    get_frontend_layout( IMPORTING es_layout = lvc_layout ).
    IF lvc_layout-stylefname IS INITIAL.
      RETURN.
    ENDIF.
    ASSIGN outtab->* TO <outtab>.
    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

    ASSIGN <outtab>[ iv_row ] TO FIELD-SYMBOL(<row>).
    IF sy-subrc = 0.
      ASSIGN COMPONENT lvc_layout-stylefname OF STRUCTURE <row> TO <styles>.
      IF sy-subrc = 0.
        TRY.
            <styles>[ fieldname = iv_fieldname ]-style = mc_style_disabled.
          CATCH cx_sy_itab_line_not_found.
            INSERT VALUE #( fieldname = iv_fieldname
                            style     = mc_style_disabled ) INTO TABLE <styles>.
        ENDTRY.
      ENDIF.
    ENDIF.
  ENDMETHOD.


  METHOD set_cell_enabled.
    FIELD-SYMBOLS <outtab> TYPE STANDARD TABLE.
    FIELD-SYMBOLS <styles> TYPE lvc_t_styl.

    r_falv = me.
    get_frontend_layout( IMPORTING es_layout = lvc_layout ).
    IF lvc_layout-stylefname IS INITIAL.
      RETURN.
    ENDIF.
    ASSIGN outtab->* TO <outtab>.
    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

    ASSIGN <outtab>[ iv_row ] TO FIELD-SYMBOL(<row>).
    IF sy-subrc = 0.
      ASSIGN COMPONENT lvc_layout-stylefname OF STRUCTURE <row> TO <styles>.
      IF sy-subrc = 0.
        TRY.
            <styles>[ fieldname = iv_fieldname ]-style = mc_style_enabled.
          CATCH cx_sy_itab_line_not_found.
            INSERT VALUE #( fieldname = iv_fieldname
                            style     = mc_style_enabled ) INTO TABLE <styles>.
        ENDTRY.
      ENDIF.
    ENDIF.
  ENDMETHOD.


  METHOD set_cell_hotspot.
    FIELD-SYMBOLS <outtab> TYPE STANDARD TABLE.
    FIELD-SYMBOLS <styles> TYPE lvc_t_styl.

    r_falv = me.
    get_frontend_layout( IMPORTING es_layout = lvc_layout ).
    IF lvc_layout-stylefname IS INITIAL.
      RETURN.
    ENDIF.
    ASSIGN outtab->* TO <outtab>.
    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

    ASSIGN <outtab>[ iv_row ] TO FIELD-SYMBOL(<row>).
    IF sy-subrc = 0.
      ASSIGN COMPONENT lvc_layout-stylefname OF STRUCTURE <row> TO <styles>.
      IF sy-subrc = 0.
        TRY.
            <styles>[ fieldname = iv_fieldname ]-style = mc_style_hotspot.
          CATCH cx_sy_itab_line_not_found.
            INSERT VALUE #( fieldname = iv_fieldname
                            style     = mc_style_hotspot ) INTO TABLE <styles>.
        ENDTRY.
      ENDIF.
    ENDIF.
  ENDMETHOD.


  METHOD set_editable.
    r_falv = me.
    IF cl_gui_alv_grid=>offline( ) IS NOT INITIAL.
      RETURN.
    ENDIF.
    set_ready_for_input( i_ready_for_input = 1 ).
    IF iv_modify = abap_true.
      register_edit_event( EXPORTING  i_event_id = mc_evt_modified
                           EXCEPTIONS error      = 0
                                      OTHERS     = 0 ).
    ELSE.
      register_edit_event( EXPORTING  i_event_id = mc_evt_enter
                           EXCEPTIONS error      = 0
                                      OTHERS     = 0 ).
    ENDIF.
  ENDMETHOD.


  METHOD set_frontend_fieldcatalog.
    fcat = it_fieldcatalog.
    super->set_frontend_fieldcatalog( fcat ).
  ENDMETHOD.


  METHOD set_frontend_layout.
    lvc_layout = is_layout.
    super->set_frontend_layout( is_layout ).
  ENDMETHOD.


  METHOD set_list_view.
    m_batch_mode = abap_true.
    r_falv = me.
  ENDMETHOD.


  METHOD set_mark_field.
    IF line_exists( fcat[ fieldname = iv_fieldname ] ).
      layout->mark_field = iv_fieldname.
      IF iv_fieldname IS INITIAL.
        RETURN.
      ENDIF.
      column( iv_fieldname )->set_checkbox( abap_true ).
    ENDIF.
  ENDMETHOD.


  METHOD set_output_table.
    GET REFERENCE OF ct_table INTO outtab.
  ENDMETHOD.


  METHOD set_parent.
    parent ?= io_parent.
    r_falv = me.
  ENDMETHOD.


  METHOD set_readonly.
    set_ready_for_input( i_ready_for_input = 0 ).
    r_falv = me.
  ENDMETHOD.


  METHOD set_row_color.
    FIELD-SYMBOLS <outtab> TYPE STANDARD TABLE.
    FIELD-SYMBOLS <color>  TYPE char04.

    r_falv = me.
    get_frontend_layout( IMPORTING es_layout = lvc_layout ).
    IF lvc_layout-info_fname IS INITIAL.
      RETURN.
    ENDIF.
    ASSIGN outtab->* TO <outtab>.
    IF sy-subrc = 0.
      ASSIGN <outtab>[ iv_row ] TO FIELD-SYMBOL(<row>).
      IF sy-subrc = 0.
        ASSIGN COMPONENT lvc_layout-info_fname OF STRUCTURE <row> TO <color>.
        IF sy-subrc = 0.
          <color> = iv_color.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDMETHOD.


  METHOD show_applog.
    r_falv = me.
    IF main_split_container IS INITIAL.
      RETURN.
    ENDIF.

    main_split_container->get_row_height( EXPORTING  id                = 2
                                          IMPORTING  result            = splitter_row_2_height
                                          EXCEPTIONS cntl_error        = 1
                                                     cntl_system_error = 2
                                                     OTHERS            = 3 ).
    IF sy-subrc = 0 AND splitter_row_2_height = 0.
      main_split_container->set_row_sash( EXPORTING  id                = 1   " Row Splitter Bar ID
                                                     type              = split_container->type_sashvisible   " Attribute
                                                     value             = 1   " Value
                                          EXCEPTIONS cntl_error        = 0
                                                     cntl_system_error = 0
                                                     OTHERS            = 0 ).
      main_split_container->get_row_height( EXPORTING  id                = 1   " ALV
                                            IMPORTING  result            = splitter_row_2_height
                                            EXCEPTIONS cntl_error        = 0
                                                       cntl_system_error = 0
                                                       OTHERS            = 0 ).

      main_split_container->get_row_height( EXPORTING  id                = 2   " Row ID
                                            IMPORTING  result            = splitter_row_3_height   " Result Code
                                            EXCEPTIONS cntl_error        = 0
                                                       cntl_system_error = 0
                                                       OTHERS            = 0 ).

      main_split_container->set_row_height( EXPORTING  id                = 2 " error log
                                                       height            = error_log_height
                                            IMPORTING  result            = result
                                            EXCEPTIONS cntl_error        = 0
                                                       cntl_system_error = 0
                                                       OTHERS            = 0 ).

      TRY.
          main_split_container->set_row_height(
            EXPORTING
              id                = 1 " ALV
              height            = CONV #( splitter_row_2_height - error_log_height )
            IMPORTING
              result            = result
            EXCEPTIONS
              cntl_error        = 0
              cntl_system_error = 0
              OTHERS            = 0 ).
        CATCH cx_root ##NO_HANDLER.
      ENDTRY.
    ENDIF.
    CLEAR splitter_row_2_height.
    CLEAR splitter_row_3_height.
  ENDMETHOD.


  METHOD show_top_of_page.
    r_falv = me.
    IF split_container IS INITIAL.
      RETURN.
    ENDIF.

    split_container->set_row_sash( EXPORTING  id                = 1   " Row Splitter Bar ID
                                              type              = split_container->type_sashvisible   " Attribute
                                              value             = 1   " Value
                                   EXCEPTIONS cntl_error        = 0
                                              cntl_system_error = 0
                                              OTHERS            = 0 ).

    split_container->get_row_height( EXPORTING  id                = 1   " Row ID
                                     IMPORTING  result            = splitter_row_1_height   " Result Code
                                     EXCEPTIONS cntl_error        = 1
                                                cntl_system_error = 2
                                                OTHERS            = 3 ).
    IF sy-subrc = 0 AND splitter_row_1_height = 0.
      split_container->set_row_height( EXPORTING  id                = 1 " Row ID
                                                  height            = top_of_page_height
                                       IMPORTING  result            = result
                                       EXCEPTIONS cntl_error        = 0
                                                  cntl_system_error = 0
                                                  OTHERS            = 0 ).
    ENDIF.
    top_of_page_visible_at_start = abap_true.
  ENDMETHOD.


  METHOD soft_refresh.
    refresh_table_display( EXPORTING  is_stable      = CONV #( 'XX' ) " With Stable Rows/Columns
                                      i_soft_refresh = abap_true " Without Sort, Filter, etc.
                           EXCEPTIONS finished       = 0
                                      OTHERS         = 0 ).
    r_falv = me.
  ENDMETHOD.


  METHOD copy_attributes.
    FIELD-SYMBOLS <outtab> TYPE STANDARD TABLE.

    ASSIGN me->outtab->* TO <outtab>.
    i_falv->set_output_table( CHANGING ct_table = <outtab> ).
    i_falv->fcat   = i_falv->lvc_fcat_from_itab( it_table = <outtab> ).
    i_falv->sort   = sort.
    i_falv->filter = filter.
    i_falv->set_frontend_fieldcatalog( it_fieldcatalog = fcat ).
    i_falv->application_log_embedded = application_log_embedded.
    i_falv->built_in_screen          = built_in_screen.
    i_falv->build_columns( ).
    i_falv->layout                        = NEW zcl_falv_layout( io_falv = i_falv ).
    i_falv->gui_status                   ?= gui_status->if_os_clone~clone( ). " clone object
    i_falv->lvc_layout                    = lvc_layout.
    i_falv->variant                       = variant.
    i_falv->top_of_page_height            = top_of_page_height.
    i_falv->top_of_page_visible_at_start  = top_of_page_visible_at_start.
    i_falv->title_v1                      = title_v1.
    i_falv->title_v2                      = title_v2.
    i_falv->title_v3                      = title_v3.
    i_falv->title_v4                      = title_v4.
    i_falv->exclude_functions             = exclude_functions.
    i_falv->toolbar_added                 = toolbar_added.
    i_falv->toolbar_deleted               = toolbar_deleted.
    i_falv->toolbar_disabled              = toolbar_disabled.
    i_falv->m_batch_mode                  = m_batch_mode.
    i_falv->layout->delete_all_buttons = layout->delete_all_buttons.
    i_falv->layout->mark_field         = layout->mark_field.
    i_falv->register_f4_for_fields( it_f4 = grid->mt_f4 ).
  ENDMETHOD.


  METHOD get_columns.
    rt_columns = columns.
  ENDMETHOD.


  METHOD create_by_type.
    DATA lr_output TYPE REF TO data.

    FIELD-SYMBOLS <table> TYPE ANY TABLE.

    DATA(lv_type_name) = i_type->absolute_name.

    IF i_type->kind <> cl_abap_typedescr=>kind_table.
      FREE rv_falv.
      RETURN.
    ENDIF.

    CREATE DATA lr_output TYPE (lv_type_name).
    ASSIGN lr_output->* TO <table>.

    IF i_subclass IS INITIAL.
      i_subclass ?= check_if_called_from_subclass( ).
    ENDIF.

    rv_falv = zcl_falv=>create( EXPORTING i_parent          = i_parent
                                          i_applogparent    = i_applogparent
                                          i_popup           = i_popup
                                          i_applog_embedded = i_applog_embedded
                                          i_subclass        = i_subclass
                                CHANGING  ct_table          = <table> ).
  ENDMETHOD.


  METHOD init_cell_styles.
    " https://tricktresor.de/blog/zellen-verbinden/
    FIELD-SYMBOLS <data> TYPE lvc_s_data.

    " Nur Spalte setze komplette Spalte
    LOOP AT mt_data ASSIGNING <data>.
      <data>-style = 0.
    ENDLOOP.
    call_redraw_after_merging = abap_true.
  ENDMETHOD.


  METHOD set_cell_style.
    " https://tricktresor.de/blog/zellen-verbinden/
    FIELD-SYMBOLS <data> TYPE lvc_s_data.

    IF row IS INITIAL.
      IF col IS INITIAL.
        " Beides leer -> nichts zu tun.
        EXIT.
      ELSE.
        " Nur Spalte setze komplette Spalte
        LOOP AT mt_data ASSIGNING <data>
             WHERE col_pos = col.
*          <data>-style  += style.
*          <data>-style2 += style2.
          ADD style TO <data>-style.
          ADD style2 TO <data>-style2.
        ENDLOOP.
        IF sy-subrc = 0.
          call_redraw_after_merging = abap_true.
        ENDIF.
      ENDIF.
    ELSE.
      IF col IS INITIAL.
        " Nur Zeile eingegeben -> komplette Zeile setzen
        LOOP AT mt_data ASSIGNING <data>
             WHERE row_pos = row.
*          <data>-style  += style.
*          <data>-style2 += style2.
          ADD style TO <data>-style.
          ADD style2 TO <data>-style2.
        ENDLOOP.
        IF sy-subrc = 0.
          call_redraw_after_merging = abap_true.
        ENDIF.
      ELSE.
        ASSIGN mt_data[ row_pos = row
                        col_pos = col ] TO <data>.
        IF sy-subrc = 0.
*          <data>-style  += style.
*          <data>-style2 += style2.
          ADD style TO <data>-style.
          ADD style2 TO <data>-style2.
          call_redraw_after_merging = abap_true.
        ELSE.
          EXIT.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDMETHOD.


  METHOD set_fixed_col_row.
    " https://tricktresor.de/blog/zellen-verbinden/
    set_fixed_cols( col ).
    set_fixed_rows( row ).
    call_redraw_after_merging = abap_true.
  ENDMETHOD.


  METHOD set_merge_horizontally.
    " https://tricktresor.de/blog/zellen-verbinden/
    " ROW - Zeile deren Spalten zusammengeführt werden sollen
    " tab_col_merge - Spalten, die zusammengeführt werden sollen
    FIELD-SYMBOLS <data> TYPE lvc_s_data.
    DATA outputlen TYPE i.

    DATA(cols) = tab_col_merge.

    SORT cols.

    " Die Spalten, die zusammengeführt werden sollen
    LOOP AT cols INTO DATA(col) WHERE col_id > 0.
      " ein paar Prüfungen
      IF col-outputlen <= col-col_id.
        CONTINUE.
      ENDIF.
      outputlen = col-outputlen - col-col_id.
      LOOP AT mt_data ASSIGNING <data>
           WHERE       row_pos       = row
                 AND ( col_pos BETWEEN col-col_id
                                   AND col-outputlen ).
        " Setze wie weit soll gemerged werden Von Spalte in Länge
        " und zwar wird bei der 1 Spalte angefangen
        IF <data>-col_pos = col-col_id.
          <data>-mergehoriz = outputlen.
          " bei allen anderen, die zusammangehören
          " muss der Wert raus, da er aus der 1. Spalte kommt
          " und das mergekennzeichen muss auch weg !
        ELSE.
          CLEAR <data>-mergehoriz.
          CLEAR <data>-value.
        ENDIF.
      ENDLOOP.

    ENDLOOP.
    call_redraw_after_merging = abap_true.
  ENDMETHOD.


  METHOD set_merge_vertically.
    " https://tricktresor.de/blog/zellen-verbinden/

    " ROW - Zeile deren Spalten zusammengeführt werden sollen
    " tab_col_merge - Spalten, die zusammengeführt werden sollen
    FIELD-SYMBOLS <data> TYPE lvc_s_data.
    DATA outputlen TYPE i.

    DATA(rows) = tab_row_merge.
    SORT rows.

    " Die Spalten, die zusammengeführt werden sollen
    LOOP AT rows INTO DATA(row) WHERE row_id > 0.
      " ein paar Prüfungen
      IF row-outputlen <= row-row_id.
        CONTINUE.
      ENDIF.
      outputlen = row-outputlen - row-row_id.
      LOOP AT mt_data ASSIGNING <data>
           WHERE       col_pos       = col
                 AND ( row_pos BETWEEN row-row_id
                                   AND row-outputlen ).
        " Setze wie weit soll gemerged werden Von Spalte in Länge
        " und zwar wird bei der 1 Spalte angefangen
        IF <data>-row_pos = row-row_id.
          <data>-mergevert = outputlen.
          " bei allen anderen, die zusammangehören
          " muss der Wert raus, da er aus der 1. Spalte kommt
          " und das mergekennzeichen muss auch weg !
        ELSE.
          CLEAR <data>-mergevert.
          CLEAR <data>-value.
        ENDIF.
      ENDLOOP.

      call_redraw_after_merging = abap_true.
    ENDLOOP.
  ENDMETHOD.


  METHOD evf_before_first_display ##NEEDED.
  ENDMETHOD.


  METHOD redraw_after_merging_change.
    " https://tricktresor.de/blog/zellen-verbinden/
    set_data_table( CHANGING data_table = mt_data[] ).
    set_auto_redraw( enable = 1 ).
  ENDMETHOD.


  METHOD evf_onf4_internal.
    onf4_internal->handle_onf4( fieldname  = e_fieldname
                                fieldvalue = e_fieldvalue
                                row_no     = es_row_no
                                event_data = er_event_data
                                bad_cells  = et_bad_cells
                                display    = e_display ).
  ENDMETHOD.


  METHOD get_registered_f4_for_fields.
    f4 = grid->mt_f4.
  ENDMETHOD.
ENDCLASS.
