CREATE FUNCTION sspfs_get_feature(idn text)
    RETURNS TABLE(id text, image jsonb, geom text)
    LANGUAGE plpgsql
AS
$$
BEGIN
    RETURN
        QUERY
        SELECT CONCAT(vf.pk1, vf.pk2, vf.pk3, vf.pk4, vf.pk5) AS id,
               fi.i1::jsonb                                   AS image,
               NULL                                           AS geom
        FROM view_facility vf
                 INNER JOIN facility_image fi
                            USING (pk1, pk2, pk3, pk4, pk5)
        WHERE CONCAT(vf.pk1, vf.pk2, vf.pk3, vf.pk4, vf.pk5) = idn;
END;
$$;

ALTER FUNCTION sspfs_get_feature(text) OWNER TO postgres;
