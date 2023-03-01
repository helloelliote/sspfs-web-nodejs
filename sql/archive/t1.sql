EXPLAIN (ANALYZE,VERBOSE,TIMING,COSTS,BUFFERS)
SELECT CONCAT(
               pk1_1,
               c1, c2, c3
           ) AS "PNU"
FROM spi47130_2.public.t1
;

EXPLAIN (ANALYZE,VERBOSE,TIMING,COSTS,BUFFERS)
SELECT *
FROM spi47130_2.public.t1_history
WHERE pk1_1 = '4713025332' -- 경주시 안강읍 산대리
  AND pk1_2 = '2'          -- 세천
  AND pk1_3 = '1'          -- 일련 번호
  AND pk1_4 = '0'          -- 주 시설
ORDER BY g2 DESC-- 최신 자료 부터 조회
;

EXPLAIN (ANALYZE,VERBOSE,TIMING,COSTS,BUFFERS)
SELECT CONCAT(t1.pk1_1, c1, c2, c3) AS "PNU",
       t1.pk1_2                     AS "시설종류",
       t1.pk1_4                     AS "부시설종류",
       t1.a1                        AS "시설명칭",
       a2                           AS "관리자",
       a3::date                     AS "대장작성일",
       a4                           AS "소유자",
       b1                           AS "위험시설 지정일",
       b2                           AS "위험시설 지정 고시번호",
       d1                           AS "제원_연장",
       d2                           AS "제원_폭",
       e1                           AS "수혜구역_농경지",
       e2                           AS "수혜구역_동",
       f1                           AS "시설부속물",
       f2                           AS "그 밖의 사항",
       t1i.a1                       AS "이미지",
       t1g.geom
FROM t1
         INNER JOIN t1_image t1i
                    USING (pk1_1, pk1_2, pk1_3, pk1_4)
         INNER JOIN t1_geom t1g
                    USING (pk1_1, pk1_2, pk1_3, pk1_4)
;

-- 이력을 가져오되, 최신 항목이 가장 위에 오도록
-- EXPLAIN
-- SELECT *
-- FROM t2_history
-- WHERE c18 = '9999-12-31'
