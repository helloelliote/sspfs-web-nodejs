-- st_transform(geom, 4326) 로 인덱스가 존재하면
-- 일반 gist(geom) 보다 검색 속도가 10배 향상됨
/*
    CREATE INDEX t1_geom_geom_index
    ON t1_geom
        USING gist (ST_Transform(geom, 4326))
    WHERE geom IS NOT NULL;
  */
EXPLAIN (ANALYZE,VERBOSE,TIMING,COSTS,BUFFERS)
SELECT *
FROM t1_geom
WHERE geom IS NOT NULL
  AND st_transform(geom, 4326) && st_makeenvelope(
        129.221595,
        35.853902,
        129.228236,
        35.858059,
        4326
    );
