@AbapCatalog.sqlViewName: 'ZCDS_SQL_RAJAA1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Simple CDS View'
@Metadata.ignorePropagatedAnnotations: true
define view ZCDS_DDL_RAJAA1 as 
select 
from zscarr_rajaa
{
    carrid as airline_code,
    carrname as airline_name,
    currcode as currency_code,
    url as website
}
