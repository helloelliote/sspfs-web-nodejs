BEGIN;

TRUNCATE a_facility;
TRUNCATE a_detail;

ALTER TABLE source.a
    DROP COLUMN gid;

ALTER TABLE source.a
    ALTER COLUMN geom TYPE geometry(Point, 5187) USING geom::geometry(Point, 5187);

UPDATE source.a
SET exm_chk= NULL;

-- 테이블 복사

UPDATE source.a
SET cat_cde= '0'::selection
WHERE cat_cde = '일반교';
-- 0: 일반교, 1: 세월교, 2: 복개

ALTER TABLE source.a
    ALTER COLUMN cat_cde TYPE selection USING cat_cde::selection;

ALTER TABLE source.a
    ALTER COLUMN cat_typ TYPE selection USING (cat_typ::varchar)::selection;

ALTER TABLE source.a
    ALTER COLUMN cat_pos TYPE selection USING (cat_pos::varchar)::selection;

ALTER TABLE source.a
    ALTER COLUMN cat_fun TYPE selection USING (cat_fun::varchar)::selection;

UPDATE a_facility tb
SET cat_cde = sa.cat_cde::selection
FROM source.a sa
WHERE sa.fac_uid = tb.fac_uid
  AND sa.cat_cde IS NOT NULL;

UPDATE a_facility tb
SET exm_chk = '0'::selection;

COMMIT;
