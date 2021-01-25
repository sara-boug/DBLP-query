match(a:author) with a limit 500

match(a)<-[r1:authored]-(p:publication)-[:authored]->(a2:author)
with  a, a2 match(a2)<-[:authored]-(p2:publication)-[:authored]->(a3:author{name:"Hector Garcia-Molina"})
return distinct a.name as author1 , a3.name as author2 , 1 as distance

Union 


match(a)<-[r1:authored]-(p:publication)-[:authored]->
(a2:author{name:"Hector Garcia-Molina"})
return distinct a.name as author1 , a2.name as author2 , 0 as distance

