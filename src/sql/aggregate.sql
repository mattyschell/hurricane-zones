--divide and konkorr
insert into borough_zones (
    hurricane_zone
   ,geom
) 
select 
    hurricane_ as hurricane_zone
   ,ST_Multi(st_union(geom)) as geom         
from 
    atomicpolygon
where 
    borough = '1'
group by hurricane_;
insert into borough_zones (
    hurricane_zone
   ,geom
) 
select 
    hurricane_ as hurricane_zone
   ,ST_Multi(st_union(geom)) as geom         
from 
    atomicpolygon
where 
    borough = '2'
group by hurricane_;
insert into borough_zones (
    hurricane_zone
   ,geom
) 
select 
    hurricane_ as hurricane_zone
   ,ST_Multi(st_union(geom)) as geom         
from 
    atomicpolygon
where 
    borough = '3'
group by hurricane_;
insert into borough_zones (
    hurricane_zone
   ,geom
) 
select 
    hurricane_ as hurricane_zone
   ,ST_Multi(st_union(geom)) as geom         
from 
    atomicpolygon
where 
    borough = '4'
group by hurricane_;
insert into borough_zones (
    hurricane_zone
   ,geom
) 
select 
    hurricane_ as hurricane_zone
   ,ST_Multi(st_union(geom)) as geom         
from 
    atomicpolygon
where 
    borough = '5'
group by hurricane_;
--finally
insert into zones (
    hurricane_zone
   ,geom
) 
select 
    hurricane_zone as hurricane_zone
   ,ST_Multi(st_union(geom)) as geom         
from 
    borough_zones
group by hurricane_zone;