# 원본 `.SHP` 자료에서 DB 로 불러오기

- QGIS 프로젝트에서 `.SHP` 파일을 불러온다.
- 각 레이어를 `Export` -> `객체를 다른이름으로 저장` 선택 후 **영문이름**으로 저장한다.
- PostGIS 프로그램을 실행 후 `.SHP` 를 추가하여 Import 한다.
- 각각의 필드에 맞추어 `UPDATE` 문을 실행한다.

## 원본테이블 > 실제테이블 값 복사

- 원본테이블의 `geom` 이 Z 값을 가진다면, 이를 제거 및 동부원점 적용한 geom2 컬럼 생성

```
ALTER TABLE b
    ADD geom2 geometry(MultiLineString, 5187);
UPDATE b
SET geom2 = st_force2d(geom);
```

- 사용되지 않는 원본테이블의 컬럼 제거

```
ALTER TABLE b
    DROP COLUMN layer;

ALTER TABLE b
    DROP COLUMN nob;

ALTER TABLE b
    DROP COLUMN "도로구분";

ALTER TABLE b
    DROP COLUMN 도로폭;

ALTER TABLE b
    DROP COLUMN s_pnu;

ALTER TABLE b
    DROP COLUMN s_bjd_cd;

ALTER TABLE b
    DROP COLUMN m_pnu;

ALTER TABLE b
    DROP COLUMN m_bjd_cd;

ALTER TABLE b
    DROP COLUMN e_angle;

ALTER TABLE b
    DROP COLUMN e_pnu;

ALTER TABLE b
    DROP COLUMN e_bjd_cd;
```

- `FAC_UID` 및 `FAC_PID` 에 임시로 `gid` 를, `geom` 에 `geom2` 의 값을 복사

- `FAC_UID` 값 업데이트

```
UPDATE b_facility tb
SET fac_uid = CONCAT('GJ', RIGHT(bjd_cde, 5), 'B', 라벨)
FROM b
WHERE tb.fac_pid = gid::text;
```

- `FAC_NAM` 시설물명 업데이트

```
UPDATE b_facility tb
SET fac_nam = 도로번호
FROM b
WHERE tb.fac_pid = gid::text;
```

- `FAC_ADM` 주소 또는 중점주소 업데이트

```
UPDATE b_facility tb
SET fac_adm = CONCAT_WS(' ', hjd_nam, bjd_nam, REPLACE(m_jibun, ' ', ''))
FROM b
WHERE tb.fac_pid = gid::text;
```

- `FAC_ADM` 시점주소 업데이트

```
UPDATE b_facility tb
SET fac_adu = CONCAT_WS(' ', hjd_nam, bjd_nam, REPLACE(s_jibun, ' ', ''))
FROM b
WHERE tb.fac_pid = gid::text;
```

- `FAC_ADM` 종점주소 업데이트

```
UPDATE b_facility tb
SET fac_adl = CONCAT_WS(' ', hjd_nam, bjd_nam, REPLACE(e_jibun, ' ', ''))
FROM b
WHERE tb.fac_pid = gid::text;
```

- `FAC_PID` 원상복구

```
UPDATE b_facility tb
SET fac_pid = NULL;
```
