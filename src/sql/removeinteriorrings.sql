insert into zones_exterior (
    hurricane_zone
   ,geom
)
select 
    hurricane_zone
   ,ST_Collect(ST_MakePolygon(geom)) As geom
from (
    select hurricane_zone
          ,ST_ExteriorRing((ST_Dump(geom)).geom) As geom
    FROM zones
    ) s
group by hurricane_zone;