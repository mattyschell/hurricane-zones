insert into borough_zones (hurricane_zone, geom)
select hurricane_ as hurricane_zone,
       st_union(geom) as geom         
  from atomicpolygon
  where borough = '5'
  group by hurricane_;
  