-- auto-generated definition
CREATE TABLE b_risk_evaluation
(
    fac_uid    text                NOT NULL
        PRIMARY KEY
        CONSTRAINT b_risk_evaluation_b_facility_fac_uid_fk
            REFERENCES b_facility,
    column_1u  integer   DEFAULT 5 NOT NULL,
    column_1m  integer   DEFAULT 5 NOT NULL,
    column_1l  integer   DEFAULT 5 NOT NULL,
    column_2u  integer   DEFAULT 5 NOT NULL,
    column_2m  integer   DEFAULT 5 NOT NULL,
    column_2l  integer   DEFAULT 5 NOT NULL,
    column_3u  integer   DEFAULT 5 NOT NULL,
    column_3m  integer   DEFAULT 5 NOT NULL,
    column_3l  integer   DEFAULT 5 NOT NULL,
    column_4u  integer   DEFAULT 5 NOT NULL,
    column_4m  integer   DEFAULT 5 NOT NULL,
    column_4l  integer   DEFAULT 5 NOT NULL,
    column_5u  integer   DEFAULT 5 NOT NULL,
    column_5m  integer   DEFAULT 5 NOT NULL,
    column_5l  integer   DEFAULT 5 NOT NULL,
    column_6u  integer   DEFAULT 5 NOT NULL,
    column_6m  integer   DEFAULT 5 NOT NULL,
    column_6l  integer   DEFAULT 5 NOT NULL,
    column_7u  integer   DEFAULT 5 NOT NULL,
    column_7m  integer   DEFAULT 5 NOT NULL,
    column_7l  integer   DEFAULT 5 NOT NULL,
    column_8u  integer   DEFAULT 5 NOT NULL,
    column_8m  integer   DEFAULT 5 NOT NULL,
    column_8l  integer   DEFAULT 5 NOT NULL,
    column_9u  integer   DEFAULT 5 NOT NULL,
    column_9m  integer   DEFAULT 5 NOT NULL,
    column_9l  integer   DEFAULT 5 NOT NULL,
    column_10u integer   DEFAULT 5 NOT NULL,
    column_10m integer   DEFAULT 5 NOT NULL,
    column_10l integer   DEFAULT 5 NOT NULL,
    eva_ymd    timestamp,
    eva_nam    text,
    eva_chk    selection DEFAULT '0'::selection
);

ALTER TABLE b_risk_evaluation
    OWNER TO postgres;

CREATE INDEX b_risk_evaluation_evm_ymd_index
    ON b_risk_evaluation USING brin (eva_ymd);
