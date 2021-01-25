// query 10 using shortest path
match(a)
with a limit 4
match path =ShortestPath((a1:author{name:"Hector Garcia-Molina"})-[:authored*]-(a))  
return a1.name as from ,   a.name as to , length(path) as length