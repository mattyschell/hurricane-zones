insert into zones_simplified (
        hurricane_zone
       ,geom
) select 
    hurricane_zone
    --ST_SnapToGrid(ST_SimplifyVW(shape,100), 0,0, 1,1)
   ,ST_SimplifyVW(geom, 250)
from zones_exterior;
update 
    zones_simplified
set 
    geom = ST_CollectionExtract(st_makevalid(geom),3)
where not st_isvalid(geom);
select 
    sum(ST_NRings(geom)) as exterior_rings_before 
from 
    zones_simplified;
select 
    sum(st_numinteriorrings(the_geom)) as interior_rings_before
from (select (st_dump(geom)).geom as the_geom
      from zones_exterior) as foo;
-- going big (relatively speaking) here
update 
    zones_simplified 
set 
    geom = filter_rings(geom,2000);
-- probably not necessary  
update 
    zones_simplified
set 
    geom = ST_CollectionExtract(st_makevalid(geom),3)
where not st_isvalid(geom);  
select 
    sum(ST_NRings(geom)) as exterior_rings_after 
from 
    zones_simplified;
select 
    sum(st_numinteriorrings(the_geom)) as interior_rings_after
from (select (st_dump(geom)).geom as the_geom
      from zones_exterior) as foo;