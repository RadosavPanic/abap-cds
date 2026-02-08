CLASS   zcl_zsflight_entry_rajaa DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_zsflight_entry_rajaa IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.
    DATA:it_zsflight_rajaa TYPE TABLE OF zsflight_rajaa.

*    read current timestamp
    GET TIME STAMP FIELD DATA(zv_tsl).
*   fill internal table (itab)
    it_zsflight_rajaa = VALUE #(

( carrid = 'AA' connid = '0017' fldate = '20260101' PRICE = '422.94' CURRENCY = 'USD' PLANETYPE = '747-400' SEATSMAX =       385  SEATSOCC =       364  PAYMENTSUM = '187100.51' SEATSMAX_B
=        31  SEATSOCC_B =        29  SEATSMAX_F =        21  SEATSOCC_F =        19  )
( carrid = 'AZ' connid = '0555' fldate = '20260101' PRICE = '185.' CURRENCY = 'EUR' PLANETYPE = 'A319-100' SEATSMAX =       120  SEATSOCC =       118  PAYMENTSUM = '266788.85' SEATSMAX_B
=         8  SEATSOCC_B =         8  SEATSMAX_F =         8  SEATSOCC_F =         7  )
( carrid = 'AZ' connid = '0789' fldate = '20260101' PRICE = '103.' CURRENCY = 'EUR' PLANETYPE = 'A380-800' SEATSMAX =       475  SEATSOCC =       451  PAYMENTSUM = '542686.40' SEATSMAX_B
=        30  SEATSOCC_B =        28  SEATSMAX_F =        20  SEATSOCC_F =        20  )
( carrid = 'AZ' connid = '0790' fldate = '20260101' PRICE = '101.' CURRENCY = 'EUR' PLANETYPE = '747-400' SEATSMAX =       385  SEATSOCC =       370  PAYMENTSUM = '461917.56' SEATSMAX_B =
       31  SEATSOCC_B =        29  SEATSMAX_F =        21  SEATSOCC_F =        21  )
( carrid = 'QF' connid = '0006' fldate = '20260101' PRICE = '788.64' CURRENCY = 'AUD' PLANETYPE = '767-200' SEATSMAX =       260  SEATSOCC =       251  PAYMENTSUM = '235085.80' SEATSMAX_B
=        21  SEATSOCC_B =        20  SEATSMAX_F =        11  SEATSOCC_F =        10  )
( carrid = 'SQ' connid = '0002' fldate = '20260102' PRICE = '232.4' CURRENCY = 'SGD' PLANETYPE = 'A380-800' SEATSMAX =       475  SEATSOCC =       473  PAYMENTSUM = '127630.65' SEATSMAX_B
=        30  SEATSOCC_B =        30  SEATSMAX_F =        20  SEATSOCC_F =        20  )
( carrid = 'SQ' connid = '0015' fldate = '20260101' PRICE = '232.4' CURRENCY = 'SGD' PLANETYPE = 'A380-800' SEATSMAX =       475  SEATSOCC =       467  PAYMENTSUM = '125989.3' SEATSMAX_B
=        30  SEATSOCC_B =        29  SEATSMAX_F =        20  SEATSOCC_F =        20  )
( carrid = 'SQ' connid = '0988' fldate = '20260102' PRICE = '910.15' CURRENCY = 'SGD' PLANETYPE = 'A340-600' SEATSMAX =       330  SEATSOCC =       325  PAYMENTSUM = '376820.71'
SEATSMAX_B =        30  SEATSOCC_B =        30  SEATSMAX_F =        20  SEATSOCC_F =        20  )
( carrid = 'UA' connid = '0941' fldate = '20260102' PRICE = '879.82' CURRENCY = 'USD' PLANETYPE = '767-200' SEATSMAX =       260  SEATSOCC =       251  PAYMENTSUM = '264087.23' SEATSMAX_B
=        21  SEATSOCC_B =        20  SEATSMAX_F =        11  SEATSOCC_F =        11  )

   ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM zsflight_rajaa.
*   insert the new table entries
    INSERT zsflight_rajaa FROM TABLE @it_zsflight_rajaa.

*   check the result
    SELECT * FROM zsflight_rajaa INTO TABLE @it_zsflight_rajaa.
    out->write( sy-dbcnt ).
    out->write( 'data inserted successfully!').

  ENDMETHOD.

ENDCLASS.
