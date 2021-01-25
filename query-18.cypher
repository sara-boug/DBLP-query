//for the author Maurizio Pighin, for every reserach topic, provide all the related articles 
match(k:keyword)<-[edge:has_research_topic]-(a:author{name:"Maurizio Pighin"})
with k, a 
match(a)<-[:authored]-(ar:article)-[:contains]->(k)
return  a.name as author,  collect(ar.title) as articles , k.key as serachTopic