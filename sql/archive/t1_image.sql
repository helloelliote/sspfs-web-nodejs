EXPLAIN (ANALYZE,VERBOSE,TIMING,COSTS,BUFFERS)
UPDATE t1_image
SET a1 = '[
  {
    "type": "start",
    "url": "www.daum.net"
  },
  {
    "type": "end",
    "url": "www.naver.com"
  }
]'::jsonb
WHERE pk1_4 = '1';

EXPLAIN (ANALYZE,VERBOSE,TIMING,COSTS,BUFFERS)
SELECT *
FROM t1_image
WHERE a1 @> '[{"type":"start"}]'
;

CREATE INDEX t1_photo_a1_gin_index
    ON t1_image USING gin (a1);
