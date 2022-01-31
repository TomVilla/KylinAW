-- roll-up
select ds.salesterritorycountry, ds.salesterritoryregion, sum(f.orderquantity) total_quantity
from factinternetsales f
join dimsalesterritory ds ON ds.salesterritorykey = f.salesterritorykey
group by rollup(ds.salesterritorycountry, ds.salesterritoryregion);


-- drill-dowwn
select  d.calendaryear, d.calendarsemester, sum(f.orderquantity) total_quantity
from factinternetsales f
join dimdate d on f.orderdatekey = d.datekey
join dimcustomer c on f.customerkey = c.customerkey
group by (d.calendaryear,d.calendarsemester)
order by d.calendaryear desc


-- dice
select  p.color ,sum(f.orderquantity) total
from factinternetsales f
join dimproduct p on f.productkey = p.productkey
join dimproductcategory pc on p.productcategorykey = pc.productcategorykey
where pc.englishproductcategoryname='Bikes'
group by (p.color)
