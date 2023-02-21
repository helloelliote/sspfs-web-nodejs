CREATE OR REPLACE VIEW view_risk_evaluation_b
            (fac_uid, fac_nam, fac_adm, exm_ymd, bjd_cde, bjd_nam, hjd_nam, eva_ymd, eva_nam, eva_chk, geom) AS
SELECT bf.fac_uid,
       bf.fac_nam,
       bf.fac_adm,
       bf.exm_ymd,
       bjd.bjd_cde,
       bjd.bjd_nam,
       bjd.hjd_nam,
       bre.eva_ymd,
       bre.eva_nam,
       bre.eva_chk,
       st_transform(bf.geom, 5187) AS geom
FROM b_facility bf
         JOIN private.cd_bjd bjd ON "substring"(bf.fac_uid, 3, 5) = "right"(bjd.bjd_cde, 5)
         JOIN b_risk_evaluation bre ON bf.fac_uid = bre.fac_uid
WHERE bf.geom IS NOT NULL
  AND bf.exm_chk = '1'::selection;

ALTER TABLE view_risk_evaluation_b
    OWNER TO postgres;
