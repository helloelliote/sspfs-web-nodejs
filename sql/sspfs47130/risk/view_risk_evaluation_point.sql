CREATE OR REPLACE VIEW view_risk_evaluation_point
            (fac_typ, typ_nam, fac_uid, fac_nam, fac_adm, exm_ymd, bjd_cde, bjd_nam, hjd_nam, eva_ymd, eva_nam, eva_chk,
             geom)
AS
SELECT 'A'::text                   AS fac_typ,
       '소교량'::text                 AS typ_nam,
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
FROM a_facility tf
         JOIN private.cd_bjd bjd ON "substring"(tf.fac_uid, 3, 5) = "right"(bjd.bjd_cde, 5)
         JOIN a_risk_evaluation tre ON tf.fac_uid = tre.fac_uid
WHERE tf.geom IS NOT NULL
  AND tf.exm_chk = '1'::selection
UNION
SELECT 'C'::text                   AS fac_typ,
       '취입보'::text                 AS typ_nam,
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
FROM c_facility tf
         JOIN private.cd_bjd bjd ON "substring"(tf.fac_uid, 3, 5) = "right"(bjd.bjd_cde, 5)
         JOIN c_risk_evaluation tre ON tf.fac_uid = tre.fac_uid
WHERE tf.geom IS NOT NULL
  AND tf.exm_chk = '1'::selection
UNION
SELECT 'D'::text                   AS fac_typ,
       '낙차공'::text                 AS typ_nam,
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
FROM d_facility tf
         JOIN private.cd_bjd bjd ON "substring"(tf.fac_uid, 3, 5) = "right"(bjd.bjd_cde, 5)
         JOIN d_risk_evaluation tre ON tf.fac_uid = tre.fac_uid
WHERE tf.geom IS NOT NULL
  AND tf.exm_chk = '1'::selection;

ALTER TABLE view_risk_evaluation_point
    OWNER TO postgres;
