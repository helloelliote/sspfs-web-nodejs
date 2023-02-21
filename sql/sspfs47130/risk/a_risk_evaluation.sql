-- auto-generated definition
CREATE TABLE a_risk_evaluation AS
SELECT fac_uid
FROM a_facility;

ALTER TABLE a_risk_evaluation
    ADD eva_ymd timestamp;

ALTER TABLE a_risk_evaluation
    ADD eva_nam text;

ALTER TABLE a_risk_evaluation
    ADD eva_chk selection DEFAULT '0'::selection;

ALTER TABLE a_risk_evaluation
    ADD PRIMARY KEY (fac_uid);

ALTER TABLE a_risk_evaluation
    ADD CONSTRAINT a_risk_evaluation_a_facility_fac_uid_fk
        FOREIGN KEY (fac_uid) REFERENCES a_facility;

CREATE INDEX a_risk_evaluation_evm_ymd_index
    ON a_risk_evaluation USING brin (eva_ymd);

ALTER TABLE a_risk_evaluation
    OWNER TO postgres;
