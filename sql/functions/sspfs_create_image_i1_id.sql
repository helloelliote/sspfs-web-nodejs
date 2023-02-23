CREATE FUNCTION sspfs_create_image_i1_id() RETURNS integer
    LANGUAGE sql
AS
$$
UPDATE facility_image AS fi

SET i1 =

        (SELECT JSONB_AGG(new_jsonb)

         FROM JSONB_ARRAY_ELEMENTS(fi.i1) target_jsonb,

              LATERAL JSONB_SET(target_jsonb, '{id}',

                                CONCAT('"', fi.pk1, fi.pk2, fi.pk3, fi.pk4, fi.pk5, '"')::jsonb) new_jsonb)

RETURNING 1

$$;

ALTER FUNCTION sspfs_create_image_i1_id() OWNER TO postgres;
