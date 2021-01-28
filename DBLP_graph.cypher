CALL apoc.load.xml("file:///api2.xml")
YIELD value 
unwind value._children as result
unwind result._children  as hits 
unwind hits._children as infos
with [i in infos where i._type="info"][0] as info
with [item in info._children where item._type = "authors"][0] AS authors, info
with [item in authors._children where item._type = "author" ] AS author_arrs,
[item in info._children where item._type = "title"][0] AS titles, 
[item in info._children where item._type = "venue"][0] AS venues, 
[item in info._children where item._type = "year"][0] AS years,
[item in info._children where item._type = "type"][0] AS types,
[item in info._children where item._type = "key"][0] AS keys, 
[item in info._children where item._type = "url"][0] AS urls,
[item in info._children where item._type = "ee"][0] AS ees
unwind(author_arrs) as author_arr
unwind(titles)as title
unwind(venues)as venue
unwind(years) as year 
unwind(types) as type 
unwind(keys)  as key 
unwind(urls)  as url
unwind(ees)   as ee
Merge(v:venue { name: venue._text, type: type._text, url:url._text})
Merge(p:publication {title: title._text, key: key._text,url: url._text, year: year._text, ee:ee._text })

foreach(a in author_arr| 
       Merge(au:author{id : a.pid, name: a._text})
       Merge(au)<-[:authored]-(p)
       Merge(au)-[:contributed_to]->(v))
 
return *