@AbapCatalog.sqlViewName: 'ZCDS_SQL_RAJAA4'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Arithmatic Expressions'
@Metadata.ignorePropagatedAnnotations: true
define view ZCDS_DDL_RAJAA4 as select from zsbook_rajaa
{
    carrid as airline_code,
    bookid as booking_number,
    fldate as flight_date,
    loccuram as booking_amount,
    100 as additional_charge,
    loccuram + 100 as new_booking_amount,
    ceil(loccuram + 100) as rounded_new_booking_amount,
    cast(loccuram as abap.fltp) - cast(loccuram as abap.fltp) * 0.30 as discounted_booking_amount,
    
    concat(carrid, bookid) as booking_info,
    length(concat(carrid, bookid)) as col_len,
                        
    case
      when loccurkey = 'EUR'
        then loccuram
      else
        currency_conversion(
          amount               => loccuram,
          source_currency      => loccurkey,
          target_currency      => cast( 'EUR' as abap.cuky(5) ),
          exchange_rate_date   => fldate,
          exchange_rate_type   => 'M',
          error_handling       => 'SET_TO_NULL'
        )
    end as euro_booking_amount            
                       
}
