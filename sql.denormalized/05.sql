/*
 * Calculates the hashtags that are commonly used for English tweets containing the word "coronavirus"
 */

SELECT
    '#' || tags as tag, count(*) as count
FROM (
  select distinct data ->> 'id' as tweet_id,
     jsonb_array_elements(COALESCE(data->'extended_tweet' -> 'entities' -> 'hashtags', '[]') || COALESCE(data -> 'entities' -> 'hashtags', '[]'))->>'text' as tags
    from tweets_jsonb
    where data ->> 'lang'='en' and to_tsvector('english', COALESCE(data -> 'extended_tweet' -> 'full_text', data -> 'text')) @@to_tsquery('english', 'coronavirus')
) t
group by tag
order by count desc, tag
limit 1000;



