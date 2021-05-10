select 
    sum(ST_NRings(geom)) as exterior_rings_before 
from 
    zones;
select 
    sum(st_numinteriorrings(the_geom)) as interior_rings_before
from (select (st_dump(geom)).geom as the_geom
      from zones) as foo;
insert into zones_exterior (
    hurricane_zone
   ,geom
)
select 
    hurricane_zone
   ,filter_rings(geom,100) As geom
from zones;
select 
    sum(ST_NRings(geom)) as exterior_rings_after 
from 
    zones_exterior;
select 
    sum(st_numinteriorrings(the_geom)) as interior_rings_after
from (select (st_dump(geom)).geom as the_geom
      from zones_exterior) as foo;
-- Dont think we need this any more
--update 
--    zones_exterior
--set 
--    geom = st_makevalid(geom)
--where not st_isvalid(geom);

