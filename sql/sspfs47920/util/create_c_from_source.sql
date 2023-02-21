BEGIN;

TRUNCATE c_facility;
TRUNCATE c_detail;

ALTER TABLE source.c
    DROP COLUMN gid;

ALTER TABLE source.c
    ALTER COLUMN geom TYPE geometry(Point, 5187) USING geom::geometry(Point, 5187);

UPDATE source.c
SET exm_chk= NULL;

-- 테이블 복사

-- UPDATE source.c
-- SET cat_cde= '0'::selection
-- WHERE cat_cde = '일반교';
-- -- 0: 일반교, 1: 세월교, 2: 복개

ALTER TABLE source.c
    ALTER COLUMN cat_cde TYPE selection USING cat_cde::selection;

UPDATE c_facility tb
SET cat_cde = sc.cat_cde::selection
FROM source.c sc
WHERE sc.fac_uid = tb.fac_uid
  AND sc.cat_cde IS NOT NULL;

UPDATE c_facility tb
SET exm_chk = '0'::selection;

COMMIT;
