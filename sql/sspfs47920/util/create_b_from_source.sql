BEGIN;

TRUNCATE b_facility;
TRUNCATE b_detail;

ALTER TABLE source.b
    DROP COLUMN gid;

ALTER TABLE source.b
    ALTER COLUMN geom TYPE geometry(MultiLineString, 5187) USING geom::geometry(MultiLineString, 5187);

UPDATE source.b
SET exm_chk= NULL;

-- 테이블 복사

UPDATE b_facility tb
SET cat_cde = sb.cat_cde::selection
FROM source.b sb
WHERE sb.fac_uid = tb.fac_uid
  AND sb.cat_cde IS NOT NULL;

UPDATE b_facility tb
SET exm_chk = '0'::selection;

COMMIT;
