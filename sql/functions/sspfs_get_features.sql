CREATE FUNCTION sspfs_get_features(x_min double precision, y_min double precision, x_max double precision, y_max double precision)
    RETURNS TABLE(id text, pk0 text, pk4 text, a1 text, a2 text, a3 text, a4 text, a5 text, a6 timestamp with time zone, b1 text, b2 timestamp with time zone, b3 timestamp with time zone, c1 numeric, c2 numeric, d1 text, d2 text, d3 text, e1 numeric, e2 numeric, e3 numeric, f1 text, f2 text, g1 text, image jsonb, geom jsonb)
    LANGUAGE plpgsql
AS
$$
BEGIN
    SET enable_seqscan = OFF;
    SET enable_indexscan = ON;
    SET enable_bitmapscan = OFF;
    RETURN
        QUERY
        SELECT CONCAT(vf.pk1, vf.pk2, vf.pk3, vf.pk4, vf.pk5) AS id,
               vf.pk0,
               vf.pk4,
               vf.a1,
               vf.a2,
               vf.a3,
               vf.a4,
               vf.a5,
               vf.a6::timestamptz,
               vf.b1,
               vf.b2::timestamptz,
               vf.b3::timestamptz,
               vf.c1::numeric,
               vf.c2::numeric,
               vf.d1,
               vf.d2,
               vf.d3,
               vf.e1::numeric,
               vf.e2::numeric,
               vf.e3::numeric,
               vf.f1,
               vf.f2,
               vf.g1,
               fi.i1::jsonb                                   AS image,
               st_asgeojson(
                       st_transform(vf.geom, 4326),
                       6
                   )::jsonb                                   AS geom
        FROM view_facility vf
                 INNER JOIN facility_image fi
                            USING (pk1, pk2, pk3, pk4, pk5)
        WHERE vf.geom IS NOT NULL
          AND st_transform(vf.geom, 4326) && st_makeenvelope(
                x_min,
                y_min,
                x_max,
                y_max,
                4326
            );
END;
$$;

ALTER FUNCTION sspfs_get_features(double precision, double precision, double precision, double precision) OWNER TO postgres;
