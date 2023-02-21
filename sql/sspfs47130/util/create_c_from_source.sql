BEGIN;
TRUNCATE c_facility;
TRUNCATE c_detail;

ALTER TABLE source.c
    ADD geom_new geometry(Point, 5187);
UPDATE source.c
SET geom_new = st_transform(st_force2d(geom)::geometry(Point, 5187), 5187)
WHERE geom IS NOT NULL;

INSERT INTO c_facility (fac_uid, fac_nam, geom)
SELECT CONCAT('GJ', RIGHT(bjd_cde, 5), 'C', 라벨) AS fac_uid,
       도로번호::text                               AS fac_nam,
       geom_new                                 AS geom
FROM source.c;

INSERT INTO c_detail (fac_uid)
SELECT fac_uid AS fac_uid
FROM c_facility;

UPDATE c_facility tb
SET fac_adm = CONCAT_WS(' ', vc.hjd_nam, vc.bjd_nam, REPLACE(vc.jibun, ' ', ''))
FROM view_cadaster vc
WHERE st_within(tb.geom, vc.geom)
  AND vc.hjd_nam <> vc.bjd_nam;

UPDATE c_facility tb
SET fac_adm = CONCAT_WS(' ', vc.hjd_nam, REPLACE(vc.jibun, ' ', ''))
FROM view_cadaster vc
WHERE st_within(tb.geom, vc.geom)
  AND vc.hjd_nam = vc.bjd_nam;
COMMIT;
