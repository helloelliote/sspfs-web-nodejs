-- auto-generated definition
CREATE TABLE a_detail
(
    fac_uid text NOT NULL
        CONSTRAINT a_detail_pk
            PRIMARY KEY,
    cat_typ selection DEFAULT '0'::selection,
    cat_pos selection DEFAULT '0'::selection,
    cat_fun selection DEFAULT '0'::selection,
    cat_imp selection DEFAULT '1'::selection,
    fac_len numeric,
    fac_wid numeric,
    fac_hgt numeric,
    fac_gap numeric,
    sec_flr selection DEFAULT '1'::selection,
    sec_wid numeric,
    sec_hgt numeric,
    sec_dia numeric,
    sec_col integer,
    riv_upp numeric,
    riv_mid numeric,
    riv_low numeric,
    str_dmg selection DEFAULT '1'::selection,
    str_reb selection DEFAULT '1'::selection,
    str_hol selection DEFAULT '1'::selection,
    str_old selection DEFAULT '2'::selection,
    fld_dmg selection DEFAULT '1'::selection,
    fld_wal selection DEFAULT '1'::selection,
    etc_trf selection DEFAULT '1'::selection,
    etc_trh selection DEFAULT '1'::selection,
    eva_stt selection DEFAULT '1'::selection,
    eva_sur selection DEFAULT '1'::selection,
    eva_pxm selection DEFAULT '1'::selection,
    eva_inf selection DEFAULT '1'::selection,
    eva_roa selection DEFAULT '0'::selection,
    eva_ope selection DEFAULT '0'::selection,
    eva_opi text
);

ALTER TABLE a_detail
    OWNER TO postgres;
