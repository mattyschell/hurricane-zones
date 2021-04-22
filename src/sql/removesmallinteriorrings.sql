insert into zones_exterior (
    hurricane_zone
   ,geom
)
select 
    hurricane_zone
   ,filter_rings(geom,100) As geom
from zones;
-- Dont think we need this any more
--update 
--    zones_exterior
--set 
--    geom = st_makevalid(geom)
--where not st_isvalid(geom);

