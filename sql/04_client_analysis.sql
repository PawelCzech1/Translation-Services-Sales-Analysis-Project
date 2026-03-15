select * from zestawienie_sprzedazy_tlumaczen zst 

select 
	zst.`Rodzaj klienta` 
	,sum(zst.`Przychód brutto [zł]` )				as przychod
from zestawienie_sprzedazy_tlumaczen zst 		
group by `Rodzaj klienta` 
order by przychod desc

-- zysk z klienta

select 
	ROUND(zst.`Przychód brutto [zł]` - zst.`Koszty [zł]`  ) 		as zysk_z_klienta
from zestawienie_sprzedazy_tlumaczen zst 
order by zysk_z_klienta  desc

-- zysk z klienta 

select
	(zst.`Przychód brutto [zł]` - zst.`Koszty [zł]` ) / zst.`Przychód brutto [zł]` * 100
from zestawienie_sprzedazy_tlumaczen zst 


select
	zst.`Województwo klienta` 
	,zst.`Rodzaj klienta` 
	,count(zst.`Liczba zleceń` )			as liczba_zlecen
from zestawienie_sprzedazy_tlumaczen zst 
group by `Województwo klienta`, `Rodzaj klienta` 
order by `Województwo klienta` asc
