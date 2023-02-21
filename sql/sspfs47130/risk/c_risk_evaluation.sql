-- auto-generated definition
CREATE TABLE c_risk_evaluation AS
SELECT fac_uid
FROM c_facility;

ALTER TABLE c_risk_evaluation
    ADD eva_ymd timestamp;

ALTER TABLE c_risk_evaluation
    ADD eva_nam text;

ALTER TABLE c_risk_evaluation
    ADD eva_chk selection DEFAULT '0'::selection;

ALTER TABLE c_risk_evaluation
    ADD PRIMARY KEY (fac_uid);

ALTER TABLE c_risk_evaluation
    ADD CONSTRAINT c_risk_evaluation_c_facility_fac_uid_fk
        FOREIGN KEY (fac_uid) REFERENCES c_facility;

CREATE INDEX c_risk_evaluation_evm_ymd_index
    ON c_risk_evaluation USING brin (eva_ymd);

ALTER TABLE c_risk_evaluation
    OWNER TO postgres;
