BEGIN;
TRUNCATE e_facility;
TRUNCATE e_detail;

ALTER TABLE source.e
    ADD geom_new geometry(LineString, 5187);
UPDATE source.e
SET geom_new = st_transform(ST_LineMerge(st_force2d(geom))::geometry(LineString, 5187), 5187)
WHERE geom IS NOT NULL;

INSERT INTO e_facility (fac_uid, fac_nam, fac_len, geom)
SELECT CONCAT('GJ', RIGHT(bjd_cde, 5), 'E', 라벨) AS fac_uid,
       도로번호::text                               AS fac_nam,
       length::numeric(6, 2)                    AS fac_len,
       geom_new                                 AS geom
FROM source.e;

INSERT INTO e_detail (fac_uid)
SELECT fac_uid AS fac_uid
FROM e_facility;

UPDATE e_facility tb
SET fac_adm = CONCAT_WS(' ', vc.hjd_nam, vc.bjd_nam, REPLACE(vc.jibun, ' ', ''))
FROM view_cadaster vc
WHERE st_within(ST_LineInterpolatePoint(tb.geom, 0.5), vc.geom)
  AND vc.hjd_nam <> vc.bjd_nam;

UPDATE e_facility tb
SET fac_adu = CONCAT_WS(' ', vc.hjd_nam, vc.bjd_nam, REPLACE(vc.jibun, ' ', ''))
FROM view_cadaster vc
WHERE st_within(st_startpoint(tb.geom), vc.geom)
  AND vc.hjd_nam <> vc.bjd_nam;

UPDATE e_facility tb
SET fac_adl = CONCAT_WS(' ', vc.hjd_nam, vc.bjd_nam, REPLACE(vc.jibun, ' ', ''))
FROM view_cadaster vc
WHERE st_within(st_endpoint(tb.geom), vc.geom)
  AND vc.hjd_nam <> vc.bjd_nam;

UPDATE e_facility tb
SET fac_adm = CONCAT_WS(' ', vc.hjd_nam, REPLACE(vc.jibun, ' ', ''))
FROM view_cadaster vc
WHERE st_within(ST_LineInterpolatePoint(tb.geom, 0.5), vc.geom)
  AND vc.hjd_nam = vc.bjd_nam;

UPDATE e_facility tb
SET fac_adu = CONCAT_WS(' ', vc.hjd_nam, REPLACE(vc.jibun, ' ', ''))
FROM view_cadaster vc
WHERE st_within(st_startpoint(tb.geom), vc.geom)
  AND vc.hjd_nam = vc.bjd_nam;

UPDATE e_facility tb
SET fac_adl = CONCAT_WS(' ', vc.hjd_nam, REPLACE(vc.jibun, ' ', ''))
FROM view_cadaster vc
WHERE st_within(st_endpoint(tb.geom), vc.geom)
  AND vc.hjd_nam = vc.bjd_nam;
COMMIT;
