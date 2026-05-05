-- This will remove null prices.
DELETE from events
WHERE price IS NULL;

-- This will standardize the event types.
UPDATE events
SET event_type = LOWER(event_type);