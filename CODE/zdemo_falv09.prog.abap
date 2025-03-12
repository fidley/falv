"! This is demo for FALV with cell settings
"! done by Lukasz Pegiel for http://abapblog.com
report zdemo_falv09.

types: begin of t_sflight.
        include type sflight.
types:  styles type lvc_t_styl,
        end of t_sflight.

data: sflight type standard table of t_sflight.


class lcl_test definition inheriting from zcl_falv.
  public section.

  protected section.
    "redefinition of event handler
    methods evf_hotspot_click redefinition.
  private section.

endclass.

class lcl_test implementation.

  method evf_hotspot_click.
    case e_column_id-fieldname.
      when 'SEATSMAX'.
        me->set_cell_disabled(
          exporting
            iv_fieldname = e_column_id-fieldname
            iv_row       = es_row_no-row_id
        ).
        me->set_cell_button(
          exporting
            iv_fieldname = 'PRICE'
            iv_row       = es_row_no-row_id
        ).

        me->set_cell_hotspot(
          exporting
            iv_fieldname = 'CARRID'
            iv_row       = es_row_no-row_id
        ).



        set_cell_styles(
          EXPORTING
            iv_fieldname = 'CARRID'
            iv_row       = es_row_no-row_id
            iv_style  = '00000020'
*            style2 =
        ).
        me->soft_refresh( ).
    endcase.
  endmethod.

endclass.

start-of-selection.

  select * up to 100 rows
  into corresponding fields of table @sflight
  from sflight.

  "creation of falv with local redefinition
  data falv type ref to lcl_test.
  falv ?= lcl_test=>create( exporting  i_subclass = cl_abap_classdescr=>describe_by_name( p_name = 'LCL_TEST' )
                              changing ct_table = sflight    ) .


  "Add title variable
  falv->title_v1 = 'ZDEMO_FALV09'.

  "set whole grid editable
  falv->layout->set_edit( abap_true ).
  falv->set_editable( iv_modify = abap_true ).

  "Set style column name
  falv->layout->set_stylefname( 'STYLES' ).

  falv->column( 'SEATSMAX' )->set_hotspot( abap_true  ).

  "Display full screen grid
  falv->display( ).
