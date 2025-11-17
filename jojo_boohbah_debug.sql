-- 1. 
SELECT boohbah_id, (select AVG(sync_level) from boohbah_stand_link) as average, name
FROM boohbah_stand_link
JOIN boohbah USING (boohbah_id)
order BY boohbah_id;  
-- 2.
SELECT b.name, s.stand_name
FROM boohbah b
JOIN jojo_stand s
ON b.boohbah_id = s.stand_id;
-- 3. 
SELECT name, color
FROM boohbah
WHERE energy_level > 80; 
-- 4. 
SELECT b.boohbah_id, s.stand_id
FROM boohbah b, jojo_Stand s
JOIN boohbah_stand_link l
ON boohbah_id = l.boohbah_id
WHERE b.boohbah_id = 2; 
-- 5. 
SELECT b.name
FROM boohbah b
WHERE b.energy_level > (SELECT AVG(energy_level) FROM boohbah);
-- 6. 
SELECT name
FROM boohbah
WHERE energy_level > all (SELECT power
                      FROM jojo_stand
                      WHERE season = 3);
-- 7. 
SELECT b.name, s.stand_name
FROM boohbah b, jojo_stand s
WHERE b.energy_level > 80 and boohbah_id = stand_id;
-- 8. 
SELECT boohbah_id, sync_level
FROM boohbah_stand_link
WHERE sync_level > (select AVG(sync_level) from boohbah_stand_link); 
-- 9. 
SELECT boohbah_id, stand_id
FROM boohbah_stand_link
WHERE (boohbah_id, stand_id) IN
      (SELECT boohbah_id, stand_id FROM boohbah_stand_link);
-- 10. 
MERGE INTO boohbah b
USING jojo_stand s
ON (b.boohbah_id = s.stand_id)
WHEN MATCHED THEN
  UPDATE SET b.energy_level = 999; 