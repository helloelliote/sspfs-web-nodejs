-- auto-generated definition
CREATE TABLE b_risk_evaluation AS
SELECT fac_uid
FROM b_facility;

ALTER TABLE b_risk_evaluation
    ADD eva_ymd timestamp;

ALTER TABLE b_risk_evaluation
    ADD eva_nam text;

ALTER TABLE b_risk_evaluation
    ADD eva_chk selection DEFAULT '0'::selection;

ALTER TABLE b_risk_evaluation
    ADD PRIMARY KEY (fac_uid);

ALTER TABLE b_risk_evaluation
    ADD CONSTRAINT b_risk_evaluation_b_facility_fac_uid_fk
        FOREIGN KEY (fac_uid) REFERENCES b_facility;

CREATE INDEX b_risk_evaluation_evm_ymd_index
    ON b_risk_evaluation USING brin (eva_ymd);

ALTER TABLE b_risk_evaluation
    OWNER TO postgres;
