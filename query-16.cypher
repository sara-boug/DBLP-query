//give the keyword having the highest number of reseachers 
match(k:keyword) with k limit 10
match(k)<-[edge:has_research_topic]-(a:author)
return k.key, count(a)