CREATE TABLE events (
    event_time TIMESTAMP,
    event_type VARCHAR(20),
    product_id BIGINT,
    category_id BIGINT,
    category_code TEXT,
    brand TEXT,
    price FLOAT,
    user_id BIGINT,
    user_session TEXT
);