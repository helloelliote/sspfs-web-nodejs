-- auto-generated definition
CREATE TABLE d_risk_evaluation AS
SELECT fac_uid
FROM d_facility;

ALTER TABLE d_risk_evaluation
    ADD eva_ymd timestamp;

ALTER TABLE d_risk_evaluation
    ADD eva_nam text;

ALTER TABLE d_risk_evaluation
    ADD eva_chk selection DEFAULT '0'::selection;

ALTER TABLE d_risk_evaluation
    ADD PRIMARY KEY (fac_uid);

ALTER TABLE d_risk_evaluation
    ADD CONSTRAINT d_risk_evaluation_d_facility_fac_uid_fk
        FOREIGN KEY (fac_uid) REFERENCES d_facility;

CREATE INDEX d_risk_evaluation_evm_ymd_index
    ON d_risk_evaluation USING brin (eva_ymd);

ALTER TABLE d_risk_evaluation
    OWNER TO postgres;
