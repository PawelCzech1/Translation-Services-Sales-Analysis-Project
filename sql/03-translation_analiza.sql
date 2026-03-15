
select version() 

select * from zestawienie_sprzedazy_tlumaczen zst 
-- porównanie miesiąca do miesiąca
 -- zastosowany self join -> łączenie tabeli z samą sobą 


select distinct
	DATE_FORMAT(zst1.`data` , '%y-%m')			as 'year_month'
	,zst1.`Przychód brutto [zł]` 				as 'obecny_przychód' 
	,zst2.`Przychód brutto [zł]` 				as 'Poprzedni przychód'
from zestawienie_sprzedazy_tlumaczen zst1
join zestawienie_sprzedazy_tlumaczen zst2
  on DATE_FORMAT(zst1.data, '%Y-%m') = DATE_FORMAT(DATE_SUB(zst2.data, INTERVAL 1 MONTH), '%Y-%m')
order by DATE_FORMAT(zst1.`data` , '%y-%m')

-- Lag() usage (MoM)

select 
	DATE_FORMAT(zst.`data` , '%Y-%m') 									as 'Year_month'
    ,zst.`Przychód brutto [zł]` 											as 'current_month'
    ,lag(zst.`Przychód brutto [zł]`) over (order by zst.data) 			as 'Previous_month'
from zestawienie_sprzedazy_tlumaczen zst
order by 'Year_month' desc;

  -- gross margin count 

select 
	(zst.`Cena jednostkowa [zł]`* zst.`Liczba zleceń`  - zst.`Koszty [zł]` ) /( zst.`Cena jednostkowa [zł]`* zst.`Liczba zleceń`) *100 			 	as 'margin'
from zestawienie_sprzedazy_tlumaczen zst 
order by margin asc


-- które usługi generują najwiekszy przychód

select 
	zst.`Rodzaj usługi` 
	,sum(zst.`Przychód brutto [zł]` )		as przychody
from zestawienie_sprzedazy_tlumaczen zst 
group by 1
order by przychody desc 


-- rentownść 
select distinct
	DATE_FORMAT(zst.`data`, '%Y' )													as year
	,zst.`Rodzaj usługi` 
	,round(zst.`Dochód netto [zł]` / zst.`Przychód brutto [zł]`  * 100,2)			as rentownosc
from zestawienie_sprzedazy_tlumaczen zst 
order by year desc, rentownosc desc 

select 
	zst.`Przychód brutto [zł]` 
	,zst.`Dochód netto [zł]` 
from zestawienie_sprzedazy_tlumaczen zst 
