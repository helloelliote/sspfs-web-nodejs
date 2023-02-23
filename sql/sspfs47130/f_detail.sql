-- auto-generated definition
CREATE TABLE f_detail
(
    fac_uid  text NOT NULL
        CONSTRAINT f_detail_pk
            PRIMARY KEY,
    cat_funl selection DEFAULT '0'::selection,
    cat_funm selection DEFAULT '0'::selection,
    cat_funu selection DEFAULT '0'::selection,
    cat_impl selection DEFAULT '1'::selection,
    cat_impm selection DEFAULT '1'::selection,
    cat_impu selection DEFAULT '1'::selection,
    str_widl numeric,
    str_widm numeric,
    str_widu numeric,
    str_pavl selection DEFAULT '0'::selection,
    str_pavm selection DEFAULT '0'::selection,
    str_pavu selection DEFAULT '0'::selection,
    str_shpl selection DEFAULT '0'::selection,
    str_shpm selection DEFAULT '0'::selection,
    str_shpu selection DEFAULT '0'::selection,
    str_safl selection DEFAULT '2'::selection,
    str_safm selection DEFAULT '2'::selection,
    str_safu selection DEFAULT '2'::selection,
    str_snkl selection DEFAULT '0'::selection,
    str_snkm selection DEFAULT '0'::selection,
    str_snku selection DEFAULT '0'::selection,
    fun_pavl selection DEFAULT '0'::selection,
    fun_pavm selection DEFAULT '0'::selection,
    fun_pavu selection DEFAULT '0'::selection,
    fun_unpl selection DEFAULT '0'::selection,
    fun_unpm selection DEFAULT '0'::selection,
    fun_unpu selection DEFAULT '0'::selection,
    fun_flal selection DEFAULT '0'::selection,
    fun_flam selection DEFAULT '0'::selection,
    fun_flau selection DEFAULT '0'::selection,
    dmg_subl selection DEFAULT '0'::selection,
    dmg_subm selection DEFAULT '0'::selection,
    dmg_subu selection DEFAULT '0'::selection,
    dmg_sewl selection DEFAULT '0'::selection,
    dmg_sewm selection DEFAULT '0'::selection,
    dmg_sewu selection DEFAULT '0'::selection,
    etc_posl selection DEFAULT '0'::selection,
    etc_posm selection DEFAULT '0'::selection,
    etc_posu selection DEFAULT '0'::selection,
    eva_rivl selection DEFAULT '1'::selection,
    eva_rivm selection DEFAULT '1'::selection,
    eva_rivu selection DEFAULT '1'::selection,
    eva_posl selection DEFAULT '1'::selection,
    eva_posm selection DEFAULT '1'::selection,
    eva_posu selection DEFAULT '1'::selection,
    eva_prxl selection DEFAULT '0'::selection,
    eva_prxm selection DEFAULT '0'::selection,
    eva_prxu selection DEFAULT '0'::selection,
    eva_infl selection DEFAULT '1'::selection,
    eva_infm selection DEFAULT '1'::selection,
    eva_infu selection DEFAULT '1'::selection,
    eva_opel selection DEFAULT '0'::selection,
    eva_opem selection DEFAULT '0'::selection,
    eva_opeu selection DEFAULT '0'::selection,
    eva_opil text,
    eva_opim text,
    eva_opiu text
);

ALTER TABLE f_detail
    OWNER TO postgres;
