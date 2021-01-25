match(a:author) 
with a limit 10 match(a)<-[r1:authored]-(p:publication)-[r2:authored]->(a2:author) 
where a.name<>a2.name
return a.name ,count(distinct p) as jount_pubs, count( distinct a2) as co_authors
