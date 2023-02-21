CREATE VIEW view_facility
            (fac_typ, typ_nam, fac_uid, fac_nam, fac_adm, exm_ymd, exm_chk, bjd_cde, bjd_nam, hjd_nam, geom) AS
SELECT 'A'::text                           AS fac_typ, '소교량'::text                         AS typ_nam, a_facility.fac_uid,
       a_facility.fac_nam,
       a_facility.fac_adm,
       a_facility.exm_ymd,
       a_facility.exm_chk,
       bjd.bjd_cde,
       bjd.bjd_nam,
       bjd.hjd_nam,
       st_transform(a_facility.geom, 4326) AS geom
FROM a_facility
         JOIN private.cd_bjd bjd ON "substring"(a_facility.fac_uid, 3, 5) = "right"(bjd.bjd_cde, 5)
WHERE a_facility.geom IS NOT NULL
UNION
SELECT 'B'::text                           AS fac_typ, '세천'::text                          AS typ_nam, b_facility.fac_uid,
       b_facility.fac_nam,
       b_facility.fac_adm,
       b_facility.exm_ymd,
       b_facility.exm_chk,
       bjd.bjd_cde,
       bjd.bjd_nam,
       bjd.hjd_nam,
       st_transform(b_facility.geom, 4326) AS geom
FROM b_facility
         JOIN private.cd_bjd bjd ON "substring"(b_facility.fac_uid, 3, 5) = "right"(bjd.bjd_cde, 5)
WHERE b_facility.geom IS NOT NULL
UNION
SELECT 'C'::text                           AS fac_typ, '취입보'::text                         AS typ_nam, c_facility.fac_uid,
       c_facility.fac_nam,
       c_facility.fac_adm,
       c_facility.exm_ymd,
       c_facility.exm_chk,
       bjd.bjd_cde,
       bjd.bjd_nam,
       bjd.hjd_nam,
       st_transform(c_facility.geom, 4326) AS geom
FROM c_facility
         JOIN private.cd_bjd bjd ON "substring"(c_facility.fac_uid, 3, 5) = "right"(bjd.bjd_cde, 5)
WHERE c_facility.geom IS NOT NULL
UNION
SELECT 'D'::text                           AS fac_typ, '낙차공'::text                         AS typ_nam, d_facility.fac_uid,
       d_facility.fac_nam,
       d_facility.fac_adm,
       d_facility.exm_ymd,
       d_facility.exm_chk,
       bjd.bjd_cde,
       bjd.bjd_nam,
       bjd.hjd_nam,
       st_transform(d_facility.geom, 4326) AS geom
FROM d_facility
         JOIN private.cd_bjd bjd ON "substring"(d_facility.fac_uid, 3, 5) = "right"(bjd.bjd_cde, 5)
WHERE d_facility.geom IS NOT NULL
UNION
SELECT 'E'::text                           AS fac_typ, '농로'::text                          AS typ_nam, e_facility.fac_uid,
       e_facility.fac_nam,
       e_facility.fac_adm,
       e_facility.exm_ymd,
       e_facility.exm_chk,
       bjd.bjd_cde,
       bjd.bjd_nam,
       bjd.hjd_nam,
       st_transform(e_facility.geom, 4326) AS geom
FROM e_facility
         JOIN private.cd_bjd bjd ON "substring"(e_facility.fac_uid, 3, 5) = "right"(bjd.bjd_cde, 5)
WHERE e_facility.geom IS NOT NULL
UNION
SELECT 'F'::text                           AS fac_typ, '마을진입로'::text                       AS typ_nam, f_facility.fac_uid,
       f_facility.fac_nam,
       f_facility.fac_adm,
       f_facility.exm_ymd,
       f_facility.exm_chk,
       bjd.bjd_cde,
       bjd.bjd_nam,
       bjd.hjd_nam,
       st_transform(f_facility.geom, 4326) AS geom
FROM f_facility
         JOIN private.cd_bjd bjd ON "substring"(f_facility.fac_uid, 3, 5) = "right"(bjd.bjd_cde, 5)
WHERE f_facility.geom IS NOT NULL;

ALTER TABLE view_facility
    OWNER TO postgres;
