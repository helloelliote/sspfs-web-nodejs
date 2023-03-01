-- auto-generated definition
CREATE TABLE theme_farm_area
(
    gid  text NOT NULL
        CONSTRAINT ref_farm_area_pk
            PRIMARY KEY,
    id_b double precision,
    구역명  text,
    geom geometry(MultiPolygon, 5187)
);

ALTER TABLE theme_farm_area
    OWNER TO postgres;
