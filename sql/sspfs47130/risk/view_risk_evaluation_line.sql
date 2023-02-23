CREATE OR REPLACE VIEW view_risk_evaluation_line
            (fac_typ, typ_nam, fac_uid, fac_nam, fac_adm, exm_ymd, bjd_cde, bjd_nam, hjd_nam, eva_ymd, eva_nam, eva_chk,
             geom)
AS
SELECT 'B'::text                   AS fac_typ,
       '세천'::text                  AS typ_nam,
       tf.fac_uid,
       tf.fac_nam,
       tf.fac_adm,
       tf.exm_ymd,
       bjd.bjd_cde,
       bjd.bjd_nam,
       bjd.hjd_nam,
       tre.eva_ymd,
       tre.eva_nam,
       tre.eva_chk,
       st_transform(tf.geom, 5187) AS geom
FROM b_facility tf
         JOIN private.cd_bjd bjd ON "substring"(tf.fac_uid, 3, 5) = "right"(bjd.bjd_cde, 5)
         JOIN b_risk_evaluation tre ON tf.fac_uid = tre.fac_uid
WHERE tf.geom IS NOT NULL
  AND tf.exm_chk = '1'::selection
UNION
SELECT 'E'::text                   AS fac_typ,
       '농로'::text                  AS typ_nam,
       tf.fac_uid,
       tf.fac_nam,
       tf.fac_adm,
       tf.exm_ymd,
       bjd.bjd_cde,
       bjd.bjd_nam,
       bjd.hjd_nam,
       tre.eva_ymd,
       tre.eva_nam,
       tre.eva_chk,
       st_transform(tf.geom, 5187) AS geom
FROM e_facility tf
         JOIN private.cd_bjd bjd ON "substring"(tf.fac_uid, 3, 5) = "right"(bjd.bjd_cde, 5)
         JOIN e_risk_evaluation tre ON tf.fac_uid = tre.fac_uid
WHERE tf.geom IS NOT NULL
  AND tf.exm_chk = '1'::selection
UNION
SELECT 'F'::text                   AS fac_typ,
       '마을진입로'::text               AS typ_nam,
       tf.fac_uid,
       tf.fac_nam,
       tf.fac_adm,
       tf.exm_ymd,
       bjd.bjd_cde,
       bjd.bjd_nam,
       bjd.hjd_nam,
       tre.eva_ymd,
       tre.eva_nam,
       tre.eva_chk,
       st_transform(tf.geom, 5187) AS geom
FROM f_facility tf
         JOIN private.cd_bjd bjd ON "substring"(tf.fac_uid, 3, 5) = "right"(bjd.bjd_cde, 5)
         JOIN f_risk_evaluation tre ON tf.fac_uid = tre.fac_uid
WHERE tf.geom IS NOT NULL
  AND tf.exm_chk = '1'::selection;

ALTER TABLE view_risk_evaluation_line
    OWNER TO postgres;
