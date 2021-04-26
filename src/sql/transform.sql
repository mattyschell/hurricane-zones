--TODO: consider rounding or truncating coordinates here
-- review https://postgis.net/docs/ST_SnapToGrid.html
insert into zones_out (
    zone
   ,geog
) select 
    hurricane_zone::int2 as zone
   ,st_transform(geom,4326)
from zones_simplified;