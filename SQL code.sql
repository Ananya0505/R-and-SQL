HW-05
Ananya
20013004

1.-----------------
WITH CTE AS (
    SELECT
        id,
	date,
	security,
        ROW_NUMBER() OVER (PARTITION BY date, security ORDER BY id) AS row_num
    FROM
        public.bank_sec
)
DELETE FROM public.bank_sec
WHERE id IN (
    SELECT id
    FROM CTE
    WHERE row_num > 1
);


2.----------------

SELECT *
FROM public.bank_sec AS sec
LEFT JOIN public.bank_al AS al
ON sec.id = al.id
LIMIT 10;

3.-------------------

CREATE TABLE public.bk_total (
    total_id SERIAL PRIMARY KEY,
    id INT,
    date date,
    security INT,
    assest INT,
    liability INT
);


INSERT INTO public.bk_total (id, date, security, assest, liability)
SELECT sec.id, sec.date, sec.security, al.assest, al.liability
FROM public.bank_sec AS sec
LEFT JOIN public.bank_al AS al
ON sec.id = al.id;

select * from bk_total;

4.--------------------
SELECT 
    EXTRACT(QUARTER FROM date) AS quarter,
    COUNT(CASE WHEN security / assest > 0.2 THEN 1 END) AS banks_with_security_over_20
FROM
    public.bk_total
WHERE
    EXTRACT(YEAR FROM date) = 2002
GROUP BY
    EXTRACT(QUARTER FROM date);
	
5.-------------------

WITH first_quarter AS (
    SELECT
        id,
        liability / assest AS liability_asset_ratio
    FROM
        public.bk_total
    WHERE
        EXTRACT(YEAR FROM date) = 2002
        AND EXTRACT(QUARTER FROM date) = 1
),
second_quarter AS (
    SELECT
        id,
        liability / assest AS liability_asset_ratio
    FROM
        public.bk_total
    WHERE
        EXTRACT(YEAR FROM date) = 2002
        AND EXTRACT(QUARTER FROM date) = 2
)
SELECT
    COUNT(DISTINCT f.id) AS banks_count
FROM
    first_quarter f
JOIN
    second_quarter s ON f.id = s.id
WHERE
    f.liability_asset_ratio > 0.9
    AND s.liability_asset_ratio < 0.9;
