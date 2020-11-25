function-pool zfalv.                        "MESSAGE-ID ..
class lcl_output definition deferred.

types: t_output type ref to lcl_output.
types: tt_output type sorted table of t_output with unique key table_line.
data: current_guid type char22.
data: outputs type tt_output.
data: okcode type sy-ucomm.
data: call_stack type standard table of char22.
field-symbols: <out> type t_output.
include lzfalvd01.                         " Local class definition

DATA: dummy_container TYPE REF TO cl_gui_container.
DATA: create_dummy_container TYPE abap_bool.

data: g_par01_type type char255.
data: g_par02_type type char255.
data: g_par03_type type char255.
data: g_par04_type type char255.
data: g_par05_type type char255.
data: g_par06_type type char255.
data: g_par07_type type char255.
data: g_par08_type type char255.
data: g_par09_type type char255.
data: g_par10_type type char255.
data: g_wait type c.
data: g_fieldname type string.
data: g_okcode type sy-ucomm.
field-symbols: <fcat> type lvc_s_fcat.
field-symbols: <any> type any.

define add_param_descr.
  concatenate 'P_DESC' &1 into g_fieldname.
  assign (g_fieldname) to <any>.
  if sy-subrc eq 0.
    <any> = &2.
  endif.
  concatenate 'P_WITH' &1 into g_fieldname.
  assign (g_fieldname) to <any>.
  if sy-subrc eq 0.
    <any> = text-s02.
  endif.
  concatenate 'P_CLEA' &1 into g_fieldname.
  assign (g_fieldname) to <any>.
  if sy-subrc eq 0.
    <any> = text-s03.
  endif.
end-of-definition.

define change_parametr_type.
  data: f_type type string.
  concatenate 'G_PAR' &1 '_TYPE' into g_fieldname.
  concatenate &2 '-' &3 into f_type.
  assign (g_fieldname) to <any>.
  if sy-subrc eq 0.
    <any> = f_type.
  endif.
end-of-definition.


*--------------------------------------------------------------------*
* begin of selection screens
*--
define add_ss_line.
  selection-screen begin of line.
  selection-screen comment 1(14) p_clea&1.
  parameters: p_parc&1 as checkbox user-command p_parc&1.
  selection-screen comment 18(10) p_desc&1.
  parameters: p_parf&1 like (g_par&1_type) lower case.
  selection-screen comment 77(6) p_with&1.
  parameters: p_part&1 like (g_par&1_type) lower case.

  "selection-screen comment 51(10) p_with&1.
  selection-screen end of line.
end-of-definition.



"mass replace ss
selection-screen begin of screen 1001.
add_ss_line: 01, 02, 03, 04, 05, 06, 07, 08, 09, 10.
selection-screen end of screen 1001.


at selection-screen output.
  if sy-dynnr eq 1001.
    lcl_output=>set_ss1001_status( ).
     set titlebar 'TITLE' with text-s01.
    loop at screen.
      if screen-name cp '*P_*01*' and g_par01_type is initial.
        clear: p_parf01, p_part01.
        screen-active = 0.
        modify screen.
      endif.
      if screen-name cp '*P_*02*' and g_par02_type is initial.
        clear: p_parf02, p_part02.
        screen-active = 0.
        modify screen.
      endif.
      if screen-name cp '*P_*03*' and g_par03_type is initial.
        clear: p_parf03, p_part03.
        screen-active = 0.
        modify screen.
      endif.
      if screen-name cp '*P_*04*' and g_par04_type is initial.
        clear: p_parf04, p_part04.
        screen-active = 0.
        modify screen.
      endif.
      if screen-name cp '*P_*05*' and g_par05_type is initial.
        clear: p_parf05, p_part05.
        screen-active = 0.
        modify screen.
      endif.
      if screen-name cp '*P_*06*' and g_par06_type is initial.
        clear: p_parf06, p_part06.
        screen-active = 0.
        modify screen.
      endif.
      if screen-name cp '*P_*07*' and g_par07_type is initial.
        clear: p_parf07, p_part07.
        screen-active = 0.
        modify screen.
      endif.
      if screen-name cp '*P_*08*' and g_par08_type is initial.
        clear: p_parf08, p_part08.
        screen-active = 0.
        modify screen.
      endif.
      if screen-name cp '*P_*09*' and g_par09_type is initial.
        clear: p_parf09, p_part09.
        screen-active = 0.
        modify screen.
      endif.
      if screen-name cp '*P_*10*' and g_par10_type is initial.
        clear: p_parf10, p_part10.
        screen-active = 0.
        modify screen.
      endif.
      if screen-name+0(6) eq 'P_PARF'.
        concatenate 'P_PARC' screen-name+6(2) into g_fieldname.
        assign (g_fieldname) to <any>.
        if sy-subrc eq 0 and <any> is not initial.
          assign (screen-name) to <any>.
          if sy-subrc eq 0.
            clear <any>.
          endif.
          screen-input = 0.
          modify screen.
        elseif sy-subrc eq 0.
          screen-input = 1.
          modify screen.
        endif.
      endif.
    endloop.
  endif.


  if sy-dynnr eq 1001.
    g_okcode = sy-ucomm.
    clear sy-ucomm.
    case g_okcode.
      when 'ENTER'.
        " return.
      when 'CANCEL'.
        clear: p_parf01, p_parf02, p_parf03, p_parf04, p_parf05, p_parf06, p_parf07, p_parf08, p_parf09, p_parf10,
        p_part01, p_part02, p_part03, p_part04, p_part05, p_part06, p_part07, p_part08, p_part09, p_part10        .
        "return.
      when 'P_PARC01' or 'P_PARC02' or 'P_PARC03' or 'P_PARC04' or 'P_PARC05' or 'P_PARC06' or 'P_PARC07' or 'P_PARC08' or
      'P_PARC09' or 'P_PARC10'.

    endcase.
  endif.
