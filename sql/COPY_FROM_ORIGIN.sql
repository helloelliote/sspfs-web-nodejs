ALTER TABLE f
    ADD geom2 geometry(MultiLineString, 5187);

UPDATE f
SET geom2 = st_force2d(geom);

ALTER TABLE f
    DROP COLUMN layer;

ALTER TABLE f
    DROP COLUMN length;

ALTER TABLE f
    DROP COLUMN nob;

ALTER TABLE f
    DROP COLUMN "도로구?";

ALTER TABLE f
    DROP COLUMN 도로폭;

ALTER TABLE f
    DROP COLUMN s_pnu;

ALTER TABLE f
    DROP COLUMN s_bjd_cd;

ALTER TABLE f
    DROP COLUMN m_pnu;

ALTER TABLE f
    DROP COLUMN m_bjd_cd;

ALTER TABLE f
    DROP COLUMN e_angle;

ALTER TABLE f
    DROP COLUMN e_pnu;

ALTER TABLE f
    DROP COLUMN e_bjd_cd;

-- f 테이블의 gid 를 f_facility 의 fac_uid 와 fac_pid 에, geom2 를 f_facility 의 geom 에 복사한다.

UPDATE f_facility tb
SET fac_uid = CONCAT('GJ', RIGHT(bjd_cde, 5), 'F', 라벨)
FROM f
WHERE tb.fac_pid = gid::text;

UPDATE f_facility tb
SET fac_nam = 도로번
FROM f
WHERE tb.fac_pid = gid::text;

UPDATE f_facility tb
SET fac_adm = CONCAT_WS(' ', hjd_nam, bjd_nam, REPLACE(m_jibun, ' ', ''))
FROM f
WHERE tb.fac_pid = gid::text;

UPDATE f_facility bf
SET fac_adu = CONCAT_WS(' ', hjd_nam, bjd_nam, REPLACE(s_jibun, ' ', ''))
FROM f
WHERE bf.fac_pid = gid::text;

UPDATE f_facility bf
SET fac_adl = CONCAT_WS(' ', hjd_nam, bjd_nam, REPLACE(e_jibun, ' ', ''))
FROM f
WHERE bf.fac_pid = gid::text;

-- fac_pid 를 정리한다.

UPDATE f_facility tb
SET fac_pid = NULL;
