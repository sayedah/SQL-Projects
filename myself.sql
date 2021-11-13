/*1. myself*/
select *
from Player P
where LOWER(P.name) like '%' || P.login || '%'
order by P.login ASC;
