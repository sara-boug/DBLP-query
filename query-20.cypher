// for each author give the number of proceedings, articles, publications
match(a:author) with a limit 100
match(a)<-[:authored]-(ar:article),(a)<-[:authored]-(p:publication), (a)<-[:authored]-(proc:inproc)
return distinct a.name as author , count(distinct p) as publications , count(distinct ar) as articles,count(distinct proc) as proceedings