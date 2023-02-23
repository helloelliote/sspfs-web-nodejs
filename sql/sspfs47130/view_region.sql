CREATE VIEW view_region(bjd_cde, bjd_nam, hjd_nam, geom) AS
SELECT cd_bjd.bjd_cde,
       cd_bjd.bjd_nam,
       cd_bjd.hjd_nam,
       st_transform(cd_bjd.geom, 4326) AS geom
FROM private.cd_bjd
WHERE cd_bjd.geom IS NOT NULL;

ALTER TABLE view_region
    OWNER TO postgres;
