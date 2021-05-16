/*
 * Calculates the languages that commonly use the hashtag #coronavirus
 */
select lang, count(*) as count
from (
   select distinct data ->> 'id' as tweet_id, data ->> 'lang' as lang
   from tweets_jsonb
   where (data -> 'extended_tweet' -> 'entities' -> 'hashtags') @> '[{"text": "coronavirus"}]' or (data -> 'entities' -> 'hashtags') @> '[{"text": "coronavirus"}]'
) t
group by lang
order by count desc, lang;
