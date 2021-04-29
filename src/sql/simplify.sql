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
