-- auto-generated definition
CREATE TABLE e_risk_evaluation AS
SELECT fac_uid
FROM e_facility;

ALTER TABLE e_risk_evaluation
    ADD eva_ymd timestamp;

ALTER TABLE e_risk_evaluation
    ADD eva_nam text;

ALTER TABLE e_risk_evaluation
    ADD eva_chk selection DEFAULT '0'::selection;

ALTER TABLE e_risk_evaluation
    ADD PRIMARY KEY (fac_uid);

ALTER TABLE e_risk_evaluation
    ADD CONSTRAINT e_risk_evaluation_e_facility_fac_uid_fk
        FOREIGN KEY (fac_uid) REFERENCES e_facility;

CREATE INDEX e_risk_evaluation_evm_ymd_index
    ON e_risk_evaluation USING brin (eva_ymd);

ALTER TABLE e_risk_evaluation
    OWNER TO postgres;
