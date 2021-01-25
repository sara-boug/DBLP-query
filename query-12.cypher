/*for a given keyword, give the name of the author having the highest number of publications regarding that keyword */
match(k:keyword{key:"security"})<-[:has_research_topic]-(a:author)
// since the number of authors is really big, so it is limited to 100 authors
// note that it can be modified, or directly omitted
with a limit 700
match(a)<-[:authored]-(p:publication)
return count(p) as publications, a.name as author 
order by  publications desc limit 1
