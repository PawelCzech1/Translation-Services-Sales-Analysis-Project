select 
	sum(zst.`Przychód brutto [zł]` )					as 'Przychód_całkowity' 
from zestawienie_sprzedazy_tlumaczen zst 

select 
	sum(zst.`Przychód brutto [zł]` )
	,sum(zst.`Dochód brutto` )
from zestawienie_sprzedazy_tlumaczen zst


update zestawienie_sprzedazy_tlumaczen zst 
set `Dochód netto [zł]` = round(zst.`Dochód netto [zł]` / 100, 2)
	

select * from zestawienie_sprzedazy_tlumaczen zst 

update zestawienie_sprzedazy_tlumaczen zst 
set `Dochód brutto` = round(zst.`Dochód brutto` /100, 2)



