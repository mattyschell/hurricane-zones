insert into XXX (
    hurricane_zone
   ,geom
)
select 
    hurricane_zone
   ,st_buffer(st_buffer(geom,-1,'join=mitre'),1,'join=mitre')
   --,st_intersection(st_buffer(st_buffer(geom,-1,'join=mitre'),1,'join=mitre'),geom) 
from 
    zones_exterior; 
    