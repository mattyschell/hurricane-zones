insert into zones_simplified (
        hurricane_zone
       ,geom
) select 
    hurricane_zone
    --ST_SnapToGrid(ST_SimplifyVW(shape,100), 0,0, 1,1)
   ,ST_SimplifyVW(geom, 200)
from zones_exterior;
update 
    zones_simplified
set 
    geom = ST_CollectionExtract(st_makevalid(geom),3)
where not st_isvalid(geom);
-- going big (relatively speaking) here
-- this is a 70ft x 70 ft ring, for example
-- or roughly 4 adjacent brownstones 
update 
    zones_simplified 
set 
    geom = filter_rings(geom,5000);
-- probably not necessary  
update 
    zones_simplified
set 
    geom = ST_CollectionExtract(st_makevalid(geom),3)
where not st_isvalid(geom);  
