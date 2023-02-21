-- auto-generated definition
CREATE TABLE theme_plan
(
    gid     text NOT NULL
        CONSTRAINT ref_plan_pk
            PRIMARY KEY,
    mnum    text,
    alias   text,
    remark  text,
    ntfdate timestamp,
    geom    geometry(MultiPolygon, 5187)
);

ALTER TABLE theme_plan
    OWNER TO postgres;
