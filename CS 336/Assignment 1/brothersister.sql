USE `family-relations`;

-- Brother & Sister Table
DROP TABLE IF EXISTS BROTHERSISTER;
CREATE TABLE BROTHERSISTER(bid INT REFERENCES PERSONS(Id), sid INT REFERENCES PERSONS(Id), PRIMARY KEY (bid, sid));

INSERT INTO BROTHERSISTER
SELECT F1.pid AS 'Brother', F2.pid AS 'Sister'
FROM (SELECT * FROM Family WHERE pid IN (SELECT Id FROM PERSONS WHERE Sex = 'M')) F1,
     (SELECT * FROM Family WHERE pid IN (SELECT Id FROM PERSONS WHERE Sex = 'F')) F2
WHERE (F1.fid = F2.fid OR F1.mid = F2.mid) AND F1.pid <> F2.pid;

SELECT * FROM BROTHERSISTER;