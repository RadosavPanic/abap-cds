@AbapCatalog.sqlViewName: 'ZCDS_SQL_RAJAA2'
@EndUserText.label: 'Annotations'
@Metadata.ignorePropagatedAnnotations: true
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@AbapCatalog.buffering.status: #ACTIVE
@AbapCatalog.buffering.type: #SINGLE
@ClientHandling.type: #CLIENT_DEPENDENT
define view ZCDS_DDL_RAJAA2 as 
select 
from zsbook_rajaa
{
    carrid as airline_code,
    connid as flight_number,
    fldate as flight_date,    
    bookid as booking_number,
    customid as customer_number,
    @Semantics.amount.currencyCode: 'local_currency_key'
    loccuram as local_currency_amount,
    @Semantics.currencyCode: true
    loccurkey as local_currency_key
}
