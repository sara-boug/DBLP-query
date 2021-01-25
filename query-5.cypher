match(v:venue) 
with v limit  3  match(v)<-[:contributed_to]-(a:author)<-[:authored]-(p:publication) 
return distinct v.type as type, count(p) as publication, collect( distinct a.name) as authors 
