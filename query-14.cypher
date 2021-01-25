/* for a given keyword-sim give the number keywords related to it */
match(ks:keyword_sim)<-[:similar_to]-(k:keyword) return  ks.key as key , count(k.key)  as similarities 
