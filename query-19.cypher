//order the authors by the diversity of research topics
match(a:author) with a limit 100
match(a)-[edge:has_research_topic]->(k:keyword)
return distinct a.name  as author, count(k) as  researchTopic 
ORDER BY researchTopic DESC