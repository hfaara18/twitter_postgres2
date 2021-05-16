/*
 * Calculates the hashtags that are commonly used for English tweets containing the word "coronavirus"
 */
select count(*)
from tweets_jsonb
where data ->> 'lang'='en' and to_tsvector('english', COALESCE(data -> 'extended_tweet' -> 'full_text', data -> 'text')) @@to_tsquery('english', 'coronavirus')
;
