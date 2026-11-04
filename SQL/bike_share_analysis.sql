
-- Bike Share Revenue & Pricing Analysis
-- The Bike Company
--
-- Year mapping used in this project:
-- yr_0 = 2021
-- yr_1 = 2022
--
-- Combining the two yearly bike-share tables

WITH cte AS (
    SELECT *
    FROM bike_share_yr_0

    UNION ALL

    SELECT *
    FROM bike_share_yr_1
)

-- Creating the main dataset for analysis

SELECT
    a.dteday,
    a.season,
    a.yr,
    a.weekday,
    a.hr,
    a.rider_type,
    a.riders,
    b.price,
    b.COGS,
    a.riders * b.price AS revenue,
    (a.riders * b.price) - (b.COGS * a.riders) AS profit

FROM cte a

LEFT JOIN cost_table b
    ON a.yr = b.yr;
