CREATE OR REPLACE VIEW view_risk_evaluation_a
            (fac_uid, fac_nam, fac_adm, exm_ymd, bjd_cde, bjd_nam, hjd_nam, eva_ymd, eva_nam, eva_chk, geom) AS
SELECT af.fac_uid,
       af.fac_nam,
       af.fac_adm,
       af.exm_ymd,
       bjd.bjd_cde,
       bjd.bjd_nam,
       bjd.hjd_nam,
       are.eva_ymd,
       are.eva_nam,
       are.eva_chk,
       st_transform(af.geom, 5187) AS geom
FROM a_facility af
         JOIN private.cd_bjd bjd ON "substring"(af.fac_uid, 3, 5) = "right"(bjd.bjd_cde, 5)
         JOIN a_risk_evaluation are ON af.fac_uid = are.fac_uid
WHERE af.geom IS NOT NULL
  AND af.exm_chk = '1'::selection;

ALTER TABLE view_risk_evaluation_a
    OWNER TO postgres;
