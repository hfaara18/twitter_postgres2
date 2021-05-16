CREATE INDEX tweet_tags_idx_idtweetstag ON tweet_tags(id_tweets, tag);
CREATE INDEX tweets_idx_idtweetslang ON tweets(id_tweets, lang);
CREATE INDEX tweets_idx_engtext ON tweets USING gin(to_tsvector('english', text));
