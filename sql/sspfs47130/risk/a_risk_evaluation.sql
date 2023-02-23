-- auto-generated definition
CREATE TABLE a_risk_evaluation
(
    fac_uid   text                NOT NULL
        PRIMARY KEY
        CONSTRAINT a_risk_evaluation_a_facility_fac_uid_fk
            REFERENCES a_facility,
    column_1  integer   DEFAULT 5 NOT NULL,
    column_2  integer   DEFAULT 5 NOT NULL,
    column_3  integer   DEFAULT 5 NOT NULL,
    column_4  integer   DEFAULT 5 NOT NULL,
    column_5  integer   DEFAULT 5 NOT NULL,
    column_6  integer   DEFAULT 5 NOT NULL,
    column_7  integer   DEFAULT 5 NOT NULL,
    column_8  integer   DEFAULT 5 NOT NULL,
    column_9  integer   DEFAULT 5 NOT NULL,
    column_10 integer   DEFAULT 5 NOT NULL,
    eva_ymd   timestamp,
    eva_nam   text,
    eva_chk   selection DEFAULT '0'::selection
);

ALTER TABLE a_risk_evaluation
    OWNER TO postgres;

CREATE INDEX a_risk_evaluation_evm_ymd_index
    ON a_risk_evaluation USING brin (eva_ymd);
