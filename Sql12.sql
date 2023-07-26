-- Film tablosunda film uzunluğu (length) sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?
SELECT COUNT(*) AS film_count_above_average_length
FROM film
WHERE length > (SELECT AVG(length) FROM film);

-- Film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?
SELECT COUNT(*) AS film_count_highest_rental_rate
FROM film
WHERE rental_rate = (SELECT MAX(rental_rate) FROM film);

-- Film tablosunda en düşük rental_rate ve en düşük replacement_cost değerlerine sahip filmleri sıralarız.
SELECT *
FROM film
WHERE rental_rate = (SELECT MIN(rental_rate) FROM film)
AND replacement_cost = (SELECT MIN(replacement_cost) FROM film);

-- Payment tablosunda en fazla sayıda alışveriş yapan müşterileri (customer) sıralarız.
SELECT customer_id, COUNT(*) AS total_payments
FROM payment
GROUP BY customer_id
ORDER BY total_payments DESC
LIMIT 5; -- İlk 5 müşteriyi
