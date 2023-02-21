-- TEST --
EXPLAIN (ANALYZE,VERBOSE,TIMING,COSTS,BUFFERS)
SELECT *
FROM sspfs_get_features(
        129.023,
        35.834,
        129.032,
        35.845
    );
-- TEST --
CREATE INDEX a_facility_geom_index_4326
    ON a_facility USING gist (st_transform(geom, 4326));
EXPLAIN (ANALYZE,VERBOSE,TIMING,COSTS,BUFFERS)
SELECT st_transform(geom, 4326)
FROM a_facility;
-- TEST --
EXPLAIN (ANALYZE,VERBOSE,TIMING,COSTS,BUFFERS)
SELECT st_transform(geom, 4326) && st_makeenvelope(
        129.023,
        35.834,
        129.032,
        35.845,
        4326
    )
FROM view_facility;
-- PK3 리 코드를 2 자리로 고정
UPDATE a_facility SET pk3 = LPAD(pk3, 2, '0');
UPDATE b_facility SET pk3 = LPAD(pk3, 2, '0');
UPDATE c_facility SET pk3 = LPAD(pk3, 2, '0');
UPDATE d_facility SET pk3 = LPAD(pk3, 2, '0');
UPDATE e_facility SET pk3 = LPAD(pk3, 2, '0');
UPDATE f_facility SET pk3 = LPAD(pk3, 2, '0');
-- PK4 일련번호를 4 자리로 고정
UPDATE a_facility SET pk5 = LPAD(pk5, 4, '0');
UPDATE b_facility SET pk5 = LPAD(pk5, 4, '0');
UPDATE c_facility SET pk5 = LPAD(pk5, 4, '0');
UPDATE d_facility SET pk5 = LPAD(pk5, 4, '0');
UPDATE e_facility SET pk5 = LPAD(pk5, 4, '0');
UPDATE f_facility SET pk5 = LPAD(pk5, 4, '0');
-- 교량 폭 및 길이가 8.199999999 등으로 무의미한 소숫점 발생 -> 소수점 셋째 자리로 반올림
UPDATE a_facility SET e1 = round(e1, 3);
UPDATE a_facility SET e2 = round(e2, 3);
UPDATE b_facility SET e1 = round(e1, 3);
UPDATE b_facility SET e2 = round(e2, 3);
UPDATE c_facility SET e1 = round(e1, 3);
UPDATE c_facility SET e2 = round(e2, 3);
UPDATE d_facility SET e1 = round(e1, 3);
UPDATE d_facility SET e2 = round(e2, 3);
UPDATE e_facility SET e1 = round(e1, 3);
UPDATE e_facility SET e2 = round(e2, 3);
UPDATE f_facility SET e1 = round(e1, 3);
UPDATE f_facility SET e2 = round(e2, 3);
-- 교량 폭 및 길이가 0 으로 입력되면 NULL
UPDATE a_facility SET e1 = NULL WHERE e1 = 0;
UPDATE a_facility SET e2 = NULL WHERE e2 = 0;
UPDATE b_facility SET e1 = NULL WHERE e1 = 0;
UPDATE b_facility SET e2 = NULL WHERE e2 = 0;
UPDATE c_facility SET e1 = NULL WHERE e1 = 0;
UPDATE c_facility SET e2 = NULL WHERE e2 = 0;
UPDATE d_facility SET e1 = NULL WHERE e1 = 0;
UPDATE d_facility SET e2 = NULL WHERE e2 = 0;
UPDATE e_facility SET e1 = NULL WHERE e1 = 0;
UPDATE e_facility SET e2 = NULL WHERE e2 = 0;
UPDATE f_facility SET e1 = NULL WHERE e1 = 0;
UPDATE f_facility SET e2 = NULL WHERE e2 = 0;
-- [129.0751, 35.8886], [129.075, 35.8886] 같은 무의미한 중복점 정리
UPDATE a_facility SET geom = st_simplifypreservetopology(geom, 4);
UPDATE b_facility SET geom = st_simplifypreservetopology(geom, 4);
UPDATE c_facility SET geom = st_simplifypreservetopology(geom, 4);
UPDATE d_facility SET geom = st_simplifypreservetopology(geom, 4);
UPDATE e_facility SET geom = st_simplifypreservetopology(geom, 4);
UPDATE f_facility SET geom = st_simplifypreservetopology(geom, 4);

-- 오류: ST_Transform: Input geometry has unknown (0) SRID :: 원본 소스 레이어에 SRID (5187) 등을 설정해준다.
