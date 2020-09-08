#!/usr/bin/env bash


for page in $(seq 68)
do
  echo "Page $page"
  downloads=$(
    curl --silent "https://digitalcollections.tcd.ie/concern/works/hm50tr726?locale=en&page=$page" | 
      grep -E --only-matching "/downloads/\w+" |
      uniq |
      tail -n +2
   )
   i=0
   for d in $downloads
   do 
     i=$(($i+1))
     file="kells-$page-$i.jpg"
     echo $file
     curl "https://digitalcollections.tcd.ie$d" > $file
   done
done
