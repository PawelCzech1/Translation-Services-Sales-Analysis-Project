select 
max(Data)
,min(Data)
from zestawienie_sprzedazy_tlumaczen zst 

alter table zestawienie_sprzedazy_tlumaczen
add column Data_fix DATE

update zestawienie_sprzedazy_tlumaczen
set Data_fix = str_to_date(data,  '%d.%m.%Y')

select * from zestawienie_sprzedazy_tlumaczen

alter table zestawienie_sprzedazy_tlumaczen
drop column data

alter table zestawienie_sprzedazy_tlumaczen
change column Data_fix Data Date

select  * from zestawienie_sprzedazy_tlumaczen zst 

update  zestawienie_sprzedazy_tlumaczen
set `Cena jed. Netto` =	round(`Cena jed. Netto` / 100, 2)
	,`Przychód brutto [zł]` = round(`Przychód brutto [zł]`  / 100, 2)
	,`udział procentowy` = round(`udział procentowy` / 10,2)
	,`Liczba zleceń` = round(`Liczba zleceń`  / 100, 0)

	
	select * from zestawienie_sprzedazy_tlumaczen zst 
	limit 3
	
update  zestawienie_sprzedazy_tlumaczen zst 
set `tax` =	round(tax / 100, 2)  
	,`Cena jednostkowa [zł]` = round(`Cena jednostkowa [zł]` /100, 2)
	, `Koszty [zł]`  = round(`Koszty [zł]` / 100,2)

	
	select * from  zestawienie_sprzedazy_tlumaczen zst 
	limit 3
	
	update zestawienie_sprzedazy_tlumaczen zst 
	set Id_transakcji  = zst.Id_transakcji / 100  
	
	select * from zestawienie_sprzedazy_tlumaczen zst 
	limit 3;
	
	describe zestawienie_sprzedazy_tlumaczen zst ;

	desc zestawienie_sprzedazy_tlumaczen zst 