// check whether two authors have a common search topic, if this is the case give the keyword else return 0 Hector Garcia-Molina
match(a2:author{name:"Hector Garcia-Molina"})-[:has_research_topic]->(k:keyword)<-[:has_research_topic]-(a1:author{name :"Maurizio Pighin"})
return 
case 
when k is null then 0
else collect(k.key)
end as common_search_topic