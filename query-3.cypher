match(proc:inproc)-[:authored]->(a:author) 
with a limit 50 match(a)<-[:authored]-(pub:publication)
RETURN
CASE 
when count(pub) > 0 then a.name
END

