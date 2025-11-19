-- 1. readjusted  
SELECT boohbah_id, (select AVG(sync_level) from boohbah_stand_link) as average, name
FROM boohbah_stand_link
JOIN boohbah USING (boohbah_id)
group by boohbah_id, name;  
-- 2. readjusted  
SELECT b.name, s.stand_name
FROM boohbah b
JOIN jojo_stand s
ON b.boohbah_id = s.stand_id
JOIN boohbah_stand_link l ON b.boohbah_id = l.boohbah_id; 
-- 3. correct 
SELECT name, color
FROM boohbah
WHERE energy_level > 80; 
-- 4. correct 
SELECT b.boohbah_id, s.stand_id
FROM boohbah b, jojo_Stand s
JOIN boohbah_stand_link l
ON boohbah_id = l.boohbah_id
WHERE b.boohbah_id = 2; 
-- 5. correct 
SELECT b.name
FROM boohbah b
WHERE b.energy_level > (SELECT AVG(energy_level) FROM boohbah);
-- 6. readjusted 
SELECT name 
FROM boohbah
WHERE energy_level > (SELECT max(power)
                      FROM jojo_stand
                      WHERE season = 3);
-- 7. readjusted  
SELECT b.name, s.stand_name
FROM boohbah b
JOIN boohbah_stand_link l ON b.boohbah_id = l.boohbah_id
JOIN jojo_stand s ON l.stand_id = s.stand_id
WHERE b.energy_level > 80;
-- 8. correct 
SELECT boohbah_id, sync_level
FROM boohbah_stand_link
WHERE sync_level > (select AVG(sync_level) from boohbah_stand_link); 
-- 9. correct 
SELECT boohbah_id, stand_id
FROM boohbah_stand_link
WHERE (boohbah_id, stand_id) IN
      (SELECT boohbah_id, stand_id FROM boohbah_stand_link);
-- 10. adjust 
MERGE INTO boohbah b
USING boohbah_stand_link l
ON (b.boohbah_id = l.stand_id)
WHEN MATCHED THEN
  UPDATE SET b.energy_level = 999; 