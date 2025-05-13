SELECT 
    C.CAR_ID,
    C.CAR_TYPE,
    floor((C.DAILY_FEE*30)*(1-d.discount_rate/100)) as fee
FROM CAR_RENTAL_COMPANY_CAR C
JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN D 
    ON C.CAR_TYPE = D.CAR_TYPE 
    AND D.DURATION_TYPE = '30일 이상'
WHERE (c.CAR_TYPE = '세단' OR c.CAR_TYPE = 'SUV') 
AND NOT EXISTS (
    SELECT 1
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY h
    WHERE 
    c.car_id = h.car_id AND
    h.END_DATE >= '2022-11-01' AND
    h.START_DATE <='2022-11-30'
)
AND (c.daily_fee *30)>=500000 and (c.daily_fee *30)<2000000
ORDER BY daily_fee desc,
         car_type ASC,
         CAR_ID desc;