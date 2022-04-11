-- How many listings are in Lincoln Park?

-- +----------+
-- | 272      |
-- +----------+

select count(*) from listings where neighborhood = "Lincoln Park";
