match(proc:inproc) 
with proc limit  2
match(proc)-[:authored]->(a:author)<-[:authored]-(ar:article)
return 
case 
when count(ar) > 0  then proc.title
end