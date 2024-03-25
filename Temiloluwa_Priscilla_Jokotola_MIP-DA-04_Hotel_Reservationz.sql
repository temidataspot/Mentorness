-- total number of reservations
SELECT  COUNT(Booking_ID)
FROM `earnest-vine-416910.hotels.hotel_reservations`
-- 700 reservations were made

-- most popular meal plan amomg guests
SELECT MealPlanType,
  COUNT(*) AS preference_count
FROM `earnest-vine-416910.hotels.hotel_reservations`
GROUP BY MealPlanType
ORDER BY preference_count DESC;
-- Meal Plan 1 is the most popular meal plan among guests with a preference cunt of 527

-- average price per room for reservations involving children
SELECT AVG(AverageRoomPrice) AS average_price_per_room
FROM `earnest-vine-416910.hotels.hotel_reservations`
WHERE Children > 0;
-- $144.6

-- total reservations made for the year 2017
SELECT COUNT (Booking_ID) AS reservation_17
FROM `earnest-vine-416910.hotels.hotel_reservations`
WHERE ArrivalYear = 2017;
-- 123 reservations

-- most commonly booked room type
SELECT RoomTypeReserved,
  COUNT (*) AS room_preference_count
FROM `earnest-vine-416910.hotels.hotel_reservations`
GROUP BY RoomTypeReserved
ORDER BY room_preference_count DESC;
-- Room Type 1 is mostly booked

-- number of reservations falling on a weekend
SELECT COUNT (Booking_ID) AS weekend_reservations
FROM `earnest-vine-416910.hotels.hotel_reservations`
WHERE WeekendNights > 0;
-- 383 reservations were made on a weekend

-- highest and lowest lead time for reservations
SELECT 
  MAX(LeadTime) AS highest_lead_time,
  MIN(LeadTime) AS lowest_lead_time
FROM `earnest-vine-416910.hotels.hotel_reservations`;
-- highest is 0 and lowest is 443

-- most common market segment type for reservation
SELECT MarketSegmentType,
  COUNT (*) AS market_segment_type
FROM `earnest-vine-416910.hotels.hotel_reservations`
GROUP BY MarketSegmentType
ORDER BY market_segment_type DESC;
-- online reservations

-- total number of confirmed bookings
SELECT COUNT (BookingStatus)
FROM `earnest-vine-416910.hotels.hotel_reservations`
WHERE BookingStatus = 'Not_Canceled';
-- 493 confirmed bookings

-- total number of adults and children across all reservations
SELECT
  SUM(Adults) AS total_adults,
  SUM(Children) AS total_children,
  SUM(Adults + Children) AS total_guests
FROM `earnest-vine-416910.hotels.hotel_reservations`
-- 1316 adults, 69 children, and 1385 in total, across all reservations

-- average number of weekend nights for reservations involving children
SELECT AVG(WeekendNights) AS avg_weekend_nights
FROM `earnest-vine-416910.hotels.hotel_reservations`
WHERE Children > 0;
-- approximately a night

-- reservations made in each month of the year 2017 and 2018
SELECT ArrivalYear, ArrivalMonth,
  COUNT(Booking_ID) AS total_reservations
FROM `earnest-vine-416910.hotels.hotel_reservations`
GROUP BY ArrivalYear, ArrivalMonth
ORDER BY ArrivalYear, ArrivalMonth;
-- For 2017(Jan. 3, Feb. 7. March. 1, April. 2, May. 4, June. 3, July. 9, Aug. 13, Sept. 28, Oct. 32, Nov. 10, Dec.11)
-- For 2018 (Jan. 26, Feb. 36. March. 59, April. 46, May. 57, June. 84, July. 33, Aug. 63, Sept. 39, Oct. 63, Nov. 40, Dec.31)

-- average number of nights spent by guests for each room type
SELECT RoomTypeReserved,
  AVG (WeekendNights + WeekNights) AS average_night_spent
FROM `earnest-vine-416910.hotels.hotel_reservations`
WHERE BookingStatus = 'Not_Canceled'
GROUP BY RoomTypeReserved
ORDER BY average_night_spent;
-- values are approximate
-- Room Type 1 - 3 night, type 2 - 3 nights, type 4 - 3 nights, type 5 - 3 nights, type 6 - 3 nights, type 7 - 3 nights

-- most common room type for reservations involving children, and average price for that room type
SELECT RoomTypeReserved,
  COUNT (*) AS number_room_type,
  AVG (AverageRoomPrice) AS average_room_price
FROM `earnest-vine-416910.hotels.hotel_reservations`
WHERE Children > 0
GROUP BY RoomTypeReserved
ORDER BY average_room_price;
-- Room Type 1 with 24 reservations and an average room price of $123

-- market segment type that generates the highest average price per room
SELECT MarketSegmentType,
  MAX(AverageRoomPrice) AS max_segment
FROM `earnest-vine-416910.hotels.hotel_reservations`
GROUP BY MarketSegmentType
ORDER BY max_segment DESC;
-- online market segment generates the highest at a value pf $258