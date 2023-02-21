-- auto-generated definition
CREATE TABLE f_risk_evaluation AS
SELECT fac_uid
FROM f_facility;

ALTER TABLE f_risk_evaluation
    ADD eva_ymd timestamp;

ALTER TABLE f_risk_evaluation
    ADD eva_nam text;

ALTER TABLE f_risk_evaluation
    ADD eva_chk selection DEFAULT '0'::selection;

ALTER TABLE f_risk_evaluation
    ADD PRIMARY KEY (fac_uid);

ALTER TABLE f_risk_evaluation
    ADD CONSTRAINT f_risk_evaluation_f_facility_fac_uid_fk
        FOREIGN KEY (fac_uid) REFERENCES f_facility;

CREATE INDEX f_risk_evaluation_evm_ymd_index
    ON f_risk_evaluation USING brin (eva_ymd);

ALTER TABLE f_risk_evaluation
    OWNER TO postgres;
