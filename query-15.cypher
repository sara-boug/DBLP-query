// for each conference , give the conference name and the  number of contributors 
match(v:venue{type:"conf"}) with v limit 20 
match(v)<-[:contributed_to]-(a:author)
return v.name as conf_name, count(a) as contributors