select * from zestawienie_sprzedazy_tlumaczen zst 
limit 1

select 
	DATE_FORMAT(zst.`Data` ,'%Y-%M')							as 'Year and monthr'	
	,count(*) 													as 'Numbers_of_orders'
	,round(sum( zst.`Przychód brutto [zł]` ),2)					as 'Total_revenue'
	,round(avg(zst.`Przychód brutto [zł]` ), 2) 				as 'Average_revenue'
from zestawienie_sprzedazy_tlumaczen zst 
group by 1
order by 1

select 
	DATE_FORMAT(zst.`Data` ,'%Y')								as 'Year'	
	,count(*) 													as 'Numbers_of_orders'
	,round(sum( zst.`Przychód brutto [zł]` ),2)					as 'Total_revenue'
	,round(avg(zst.`Przychód brutto [zł]` ), 2) 				as 'Average_revenue'
from zestawienie_sprzedazy_tlumaczen zst 
group by 1
order by 1

select
	DATE_FORMAT(zst.`Data`, '%Y  %m')
	,SUM(zst.`Przychód brutto [zł]` )		as revenue
from zestawienie_sprzedazy_tlumaczen zst 
group by 1;


select 
	DATE_FORMAT(`Data` ,'%y-%m')					as year_month
	,`Przychód brutto [zł]` 						as current revenue
	,lag(`Przychód brutto [zł]` )	
	over (order by zst.`Id_transakcji` )			a	s previous revenue
from zestawienie_sprzedazy_tlumaczen zst


select
    DATE_FORMAT(tl1.`Data`, '%y-%m') as year_month,
    tl1.`Przychód brutto [zł]` as `current_revenue`,
    lag(tl1.`Przychód brutto [zł]`) over (order by tl1.id_transakcji) as `previous_revenue`
from zestawienie_sprzedazy_tlumaczen tl1;


select version()



