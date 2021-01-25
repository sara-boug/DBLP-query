/* For each keyword give the number of publications*/
match(k:keyword) with k limit 20
// limiting the number of keywords to 20 to be searched 
match(k)<-[:contains]-(p:publication)
return k.key as keyword  , count(p) as publications