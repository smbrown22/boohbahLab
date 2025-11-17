-- JoJo + Boohbah DB Setup Script
-- Drops existing tables safely, then recreates all three with sample data.

BEGIN  
    EXECUTE IMMEDIATE 'DROP TABLE boohbah_stand_link';  
EXCEPTION WHEN OTHERS THEN NULL;  
END;  
/

BEGIN  
    EXECUTE IMMEDIATE 'DROP TABLE jojo_stand';  
EXCEPTION WHEN OTHERS THEN NULL;  
END;  
/

BEGIN  
    EXECUTE IMMEDIATE 'DROP TABLE boohbah';  
EXCEPTION WHEN OTHERS THEN NULL;  
END;  
/

CREATE TABLE boohbah (
    boohbah_id   NUMBER PRIMARY KEY,
    name         VARCHAR2(20),
    color        VARCHAR2(20),
    energy_level NUMBER
);

INSERT INTO boohbah VALUES (1, 'Humbah', 'Yellow', 85);
INSERT INTO boohbah VALUES (2, 'Zumbah', 'Purple', 92);
INSERT INTO boohbah VALUES (3, 'Jumbah', 'Blue', 77);
INSERT INTO boohbah VALUES (4, 'Jingbah', 'Pink', 88);


CREATE TABLE jojo_stand (
    stand_id     NUMBER PRIMARY KEY,
    stand_name   VARCHAR2(30),
    stand_user   VARCHAR2(30),
    power        NUMBER,
    season       NUMBER
);

INSERT INTO jojo_stand VALUES (1, 'Star Platinum', 'Jotaro', 95, 3);
INSERT INTO jojo_stand VALUES (2, 'The World', 'Dio', 98, 3);
INSERT INTO jojo_stand VALUES (3, 'Crazy Diamond', 'Josuke', 90, 4);
INSERT INTO jojo_stand VALUES (4, 'Echoes', 'Koichi', 78, 4);


CREATE TABLE boohbah_stand_link (
    link_id      NUMBER PRIMARY KEY,
    boohbah_id   NUMBER,
    stand_id     NUMBER,
    sync_level   NUMBER,
    FOREIGN KEY (boohbah_id) REFERENCES boohbah(boohbah_id),
    FOREIGN KEY (stand_id) REFERENCES jojo_stand(stand_id)
);

INSERT INTO boohbah_stand_link VALUES (1, 1, 1, 30);
INSERT INTO boohbah_stand_link VALUES (2, 2, 2, 45);
INSERT INTO boohbah_stand_link VALUES (3, 3, 3, 20);
INSERT INTO boohbah_stand_link VALUES (4, 4, 4, 50);

COMMIT;
