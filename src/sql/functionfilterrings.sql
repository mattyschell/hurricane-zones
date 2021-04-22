--thanks Simon
--https://www.spdba.com.au/filtering-rings-in-polygon-postgis/
CREATE OR REPLACE FUNCTION filter_rings(geometry, double precision)
  RETURNS geometry AS
$BODY$
SELECT ST_BuildArea(ST_Collect(b.final_geom)) as filtered_geom
  FROM (SELECT ST_MakePolygon((/* Get outer ring of polygon */
    SELECT ST_ExteriorRing(a.the_geom) as outer_ring /* ie the outer ring */
    ), ARRAY(/* Get all inner rings > a particular area */
     SELECT ST_ExteriorRing(b.geom) as inner_ring
       FROM (SELECT (ST_DumpRings(a.the_geom)).*) b
      WHERE b.path[1] > 0 /* ie not the outer ring */
        AND ST_Area(b.geom) > $2
    ) ) as final_geom
         FROM (SELECT ST_GeometryN(ST_Multi($1),/*ST_Multi converts any Single Polygons to MultiPolygons */
                                   generate_series(1,ST_NumGeometries(ST_Multi($1)))
                                   ) as the_geom
               ) a
       ) b
$BODY$
  LANGUAGE 'sql' IMMUTABLE;