/*
 * Calculates the hashtags that are commonly used with the hashtag #coronavirus
 */
SELECT
    '#' || tags as tag, count(*) as count
FROM (
  select distinct data ->> 'id' as tweet_id,
     jsonb_array_elements(COALESCE(data->'extended_tweet' -> 'entities' -> 'hashtags', '[]') || COALESCE(data -> 'entities' -> 'hashtags', '[]'))->>'text' as tags 
    from tweets_jsonb
    where (data -> 'extended_tweet' -> 'entities' -> 'hashtags') @> '[{"text": "coronavirus"}]' or (data -> 'entities' -> 'hashtags') @> '[{"text": "coronavirus"}]'
     ) t
  group by tag
  order by count desc, tag
  limit 1000;
