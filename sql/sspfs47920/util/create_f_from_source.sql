BEGIN;

TRUNCATE f_facility;
TRUNCATE f_detail;

ALTER TABLE source.f
    DROP COLUMN gid;

ALTER TABLE source.f
    ALTER COLUMN geom TYPE geometry(MultiLineString, 5187) USING geom::geometry(MultiLineString, 5187);

UPDATE source.e
SET exm_chk= NULL;

-- 테이블 복사

UPDATE f_facility tf
SET exm_chk = '0'::selection;

COMMIT;
