BEGIN;

TRUNCATE e_facility;
TRUNCATE e_detail;

ALTER TABLE source.e
    DROP COLUMN gid;

ALTER TABLE source.e
    ALTER COLUMN geom TYPE geometry(MultiLineString, 5187) USING geom::geometry(MultiLineString, 5187);

UPDATE source.e
SET exm_chk= NULL;

-- 테이블 복사

UPDATE e_facility te
SET exm_chk = '0'::selection;

COMMIT;
