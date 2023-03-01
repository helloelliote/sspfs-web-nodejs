-- auto-generated definition
CREATE TABLE c_detail
(
    fac_uid text NOT NULL
        CONSTRAINT c_detail_pk
            PRIMARY KEY,
    cat_imp selection DEFAULT '1'::selection,
    fac_len numeric,
    fac_hgt numeric,
    str_bod selection DEFAULT '0'::selection,
    str_wal selection DEFAULT '0'::selection,
    str_flr selection DEFAULT '0'::selection,
    str_jnt selection DEFAULT '0'::selection,
    str_hzd selection DEFAULT '0'::selection,
    fun_stt selection DEFAULT '0'::selection,
    fun_mch selection DEFAULT '0'::selection,
    dep_stt selection DEFAULT '2'::selection,
    etc_env selection DEFAULT '2'::selection,
    etc_fsh selection DEFAULT '1'::selection,
    eva_sur selection DEFAULT '1'::selection,
    eva_inf selection DEFAULT '0'::selection,
    eva_ope selection DEFAULT '0'::selection,
    eva_opi text
);

ALTER TABLE c_detail
    OWNER TO postgres;
