CLASS zcl_zscarr_entry_rajaa DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_zscarr_entry_rajaa IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.
    DATA:it_zscarr_rajaa TYPE TABLE OF zscarr_rajaa.

*    read current timestamp
    GET TIME STAMP FIELD DATA(zv_tsl).
*   fill internal table (itab)
    it_zscarr_rajaa = VALUE #(
        ( carrid  ='AA' carrname ='American Airlines' currcode = 'USD' url = 'http://www.aa.com')
        ( carrid  = 'AB' carrname = 'Air Berlin' currcode = 'EUR' url = 'http://www.airberlin.de')
        ( carrid  = 'AC' carrname = 'Air Canada' currcode = 'CAD' url = 'http://www.aircanada.ca')
        ( carrid  = 'AF' carrname = 'Air France' currcode = 'EUR' url = 'http://www.airfrance.fr')
        ( carrid  = 'AZ' carrname = 'Alitalia' currcode = 'EUR' url = 'http://www.alitalia.it')
        ( carrid  = 'BA' carrname = 'British Airways' currcode = 'GBP' url = 'http://www.british-airways.com')
        ( carrid  = 'CO' carrname = 'Continental Airlines' currcode = 'USD' url = 'http://www.continental.com')
        ( carrid  = 'DL' carrname = 'Delta Airlines' currcode = 'USD' url = 'http://www.delta-air.com')
        ( carrid  = 'FJ' carrname = 'Air Pacific' currcode = 'USD' url = 'http://www.airpacific.com')
        ( carrid  = 'JL' carrname = 'Japan Airlines' currcode = 'JPY' url = 'http://www.jal.co.jp')
        ( carrid  = 'LH' carrname = 'Lufthansa' currcode = 'EUR' url = 'http://www.lufthansa.com')
        ( carrid  = 'NG' carrname = 'Lauda Air' currcode = 'EUR' url = 'http://www.laudaair.com')
        ( carrid  = 'NW' carrname = 'Northwest Airlines' currcode = 'USD' url = 'http://www.nwa.com')
        ( carrid  = 'QF' carrname = 'Qantas Airways' currcode = 'AUD' url = 'http://www.qantas.com.au')
        ( carrid  = 'SA' carrname = 'South African Air.' currcode = 'ZAR' url = 'http://www.saa.co.za')
        ( carrid  = 'SQ' carrname = 'Singapore Airlines' currcode = 'SGD' url = 'http://www.singaporeair.com')
        ( carrid  = 'SR' carrname = 'Swiss' currcode = 'CHF' url = 'http://www.swiss.com')
        ( carrid  = 'UA' carrname = 'United Airlines' currcode = 'USD' url = 'http://www.ual.com')

     ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM zscarr_rajaa.
*   insert the new table entries
    INSERT zscarr_rajaa FROM TABLE @it_zscarr_rajaa.

*   check the result
    SELECT * FROM zscarr_rajaa INTO TABLE @it_zscarr_rajaa.
    out->write( sy-dbcnt ).
    out->write( 'data inserted successfully!').

  ENDMETHOD.

ENDCLASS.
