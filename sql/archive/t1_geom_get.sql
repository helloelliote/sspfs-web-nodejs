EXPLAIN (ANALYZE,VERBOSE,TIMING,COSTS,BUFFERS)
SELECT JSONB_BUILD_OBJECT(
               'id', CONCAT(pk1_1, pk1_2, pk1_3, pk1_4),
               'geom', ST_AsGeoJSON(ST_Transform(geom, 4326), 6)::jsonb,
--                'properties', TO_JSONB(t1_geom.*) - 'pk1_1' - 'geom'
               'properties', NULL
           ) AS feature
FROM t1_geom
WHERE geom IS NOT NULL
  AND st_transform(geom, 4326) && st_makeenvelope(
        129.221595,
        35.853902,
        129.228236,
        35.858059,
        4326
    );

EXPLAIN (ANALYZE,VERBOSE,TIMING,COSTS,BUFFERS)
SELECT CONCAT(pk1_1, pk1_2, pk1_3, pk1_4)::text AS id,
       ST_AsGeoJSON(
               ST_Transform(geom, 4326),
               6
           )::jsonb                             AS geom
FROM t1_geom
WHERE geom IS NOT NULL
  AND st_transform(geom, 4326) && st_makeenvelope(
        129.221595,
        35.853902,
        129.228236,
        35.858059,
        4326
    );
