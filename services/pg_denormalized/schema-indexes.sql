create index on tweets_jsonb using gin((data -> 'extended_tweets' -> 'entities' -> 'hashtags'));

create index tweets_jsonb_exthashtags on tweets_jsonb using gin((data -> 'extended_tweet' -> 'entities' -> 'hashtags'));

create index tweets_jsonb_text on tweets_jsonb using gin(to_tsvector('english', data->'extended_tweet'->>'full_text'), to_tsvector('english', data->>'text'));
