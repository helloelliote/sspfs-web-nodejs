BEGIN;
TRUNCATE a_facility;
TRUNCATE a_detail;

ALTER TABLE source.a
    ADD geom_new geometry(Point, 5187);
UPDATE source.a
SET geom_new = st_transform(st_force2d(geom)::geometry(Point, 5187), 5187)
WHERE geom IS NOT NULL;

INSERT INTO a_facility (fac_uid, fac_nam, geom)
SELECT CONCAT('GJ', RIGHT(bjd_cde, 5), 'A', 라벨) AS fac_uid,
       도로번호::text                               AS fac_nam,
       geom_new                                 AS geom
FROM source.a;

INSERT INTO a_detail (fac_uid)
SELECT fac_uid AS fac_uid
FROM a_facility;

UPDATE a_facility tb
SET fac_adm = CONCAT_WS(' ', vc.hjd_nam, vc.bjd_nam, REPLACE(vc.jibun, ' ', ''))
FROM view_cadaster vc
WHERE st_within(tb.geom, vc.geom);

TRUNCATE b_facility;
TRUNCATE b_detail;

ALTER TABLE source.b
    ADD geom_new geometry(LineString, 5187);
UPDATE source.b
SET geom_new = st_transform(ST_LineMerge(st_force2d(geom))::geometry(LineString, 5187), 5187)
WHERE geom IS NOT NULL;

INSERT INTO b_facility (fac_uid, fac_nam, fac_len, geom)
SELECT CONCAT('GJ', RIGHT(bjd_cde, 5), 'B', 라벨) AS fac_uid,
       도로번호::text                               AS fac_nam,
       length::numeric(6, 2)                    AS fac_len,
       geom_new                                 AS geom
FROM source.b;

INSERT INTO b_detail (fac_uid)
SELECT fac_uid AS fac_uid
FROM b_facility;

UPDATE b_facility tb
SET fac_adm = CONCAT_WS(' ', vc.hjd_nam, vc.bjd_nam, REPLACE(vc.jibun, ' ', ''))
FROM view_cadaster vc
WHERE st_within(ST_LineInterpolatePoint(tb.geom, 0.5), vc.geom);

UPDATE b_facility tb
SET fac_adu = CONCAT_WS(' ', vc.hjd_nam, vc.bjd_nam, REPLACE(vc.jibun, ' ', ''))
FROM view_cadaster vc
WHERE st_within(st_startpoint(tb.geom), vc.geom);

UPDATE b_facility tb
SET fac_adl = CONCAT_WS(' ', vc.hjd_nam, vc.bjd_nam, REPLACE(vc.jibun, ' ', ''))
FROM view_cadaster vc
WHERE st_within(st_endpoint(tb.geom), vc.geom);

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
WHERE st_within(tb.geom, vc.geom);
TRUNCATE d_facility;
TRUNCATE d_detail;

/*
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
WHERE st_within(tb.geom, vc.geom);
*/

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
WHERE st_within(ST_LineInterpolatePoint(tb.geom, 0.5), vc.geom);

UPDATE e_facility tb
SET fac_adu = CONCAT_WS(' ', vc.hjd_nam, vc.bjd_nam, REPLACE(vc.jibun, ' ', ''))
FROM view_cadaster vc
WHERE st_within(st_startpoint(tb.geom), vc.geom);

UPDATE e_facility tb
SET fac_adl = CONCAT_WS(' ', vc.hjd_nam, vc.bjd_nam, REPLACE(vc.jibun, ' ', ''))
FROM view_cadaster vc
WHERE st_within(st_endpoint(tb.geom), vc.geom);

TRUNCATE f_facility;
TRUNCATE f_detail;

ALTER TABLE source.f
    ADD geom_new geometry(LineString, 5187);
UPDATE source.f
SET geom_new = st_transform(ST_LineMerge(st_force2d(geom))::geometry(LineString, 5187), 5187)
WHERE geom IS NOT NULL;

INSERT INTO f_facility (fac_uid, fac_nam, fac_len, geom)
SELECT CONCAT('GJ', RIGHT(bjd_cde, 5), 'F', 라벨) AS fac_uid,
       도로번호::text                               AS fac_nam,
       length::numeric(6, 2)                    AS fac_len,
       geom_new                                 AS geom
FROM source.f;

INSERT INTO f_detail (fac_uid)
SELECT fac_uid AS fac_uid
FROM f_facility;

UPDATE f_facility tb
SET fac_adm = CONCAT_WS(' ', vc.hjd_nam, vc.bjd_nam, REPLACE(vc.jibun, ' ', ''))
FROM view_cadaster vc
WHERE st_within(ST_LineInterpolatePoint(tb.geom, 0.5), vc.geom);

UPDATE f_facility tb
SET fac_adu = CONCAT_WS(' ', vc.hjd_nam, vc.bjd_nam, REPLACE(vc.jibun, ' ', ''))
FROM view_cadaster vc
WHERE st_within(st_startpoint(tb.geom), vc.geom);

UPDATE f_facility tb
SET fac_adl = CONCAT_WS(' ', vc.hjd_nam, vc.bjd_nam, REPLACE(vc.jibun, ' ', ''))
FROM view_cadaster vc
WHERE st_within(st_endpoint(tb.geom), vc.geom);
COMMIT;
