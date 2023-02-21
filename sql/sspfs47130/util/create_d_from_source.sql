BEGIN;
TRUNCATE d_facility;
TRUNCATE d_detail;

ALTER TABLE source.d
    ADD geom_new geometry(Point, 5187);
UPDATE source.d
SET geom_new = st_transform(st_force2d(geom)::geometry(Point, 5187), 5187)
WHERE geom IS NOT NULL;

INSERT INTO d_facility (fac_uid, fac_nam, geom)
SELECT CONCAT('GJ', RIGHT(bjd_cde, 5), 'D', 라벨) AS fac_uid,
       도로번호::text                               AS fac_nam,
       geom_new                                 AS geom
FROM source.d;

INSERT INTO d_detail (fac_uid)
SELECT fac_uid AS fac_uid
FROM d_facility;

UPDATE d_facility tb
SET fac_adm = CONCAT_WS(' ', vc.hjd_nam, vc.bjd_nam, REPLACE(vc.jibun, ' ', ''))
FROM view_cadaster vc
WHERE st_within(tb.geom, vc.geom)
  AND vc.hjd_nam <> vc.bjd_nam;

UPDATE d_facility tb
SET fac_adm = CONCAT_WS(' ', vc.hjd_nam, REPLACE(vc.jibun, ' ', ''))
FROM view_cadaster vc
WHERE st_within(tb.geom, vc.geom)
  AND vc.hjd_nam = vc.bjd_nam;
COMMIT;
