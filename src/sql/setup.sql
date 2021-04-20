create table borough_zones (
    gid serial primary key
   ,hurricane_zone varchar(1)
   ,geom geometry(MULTIPOLYGON)
);
create table zones (
    gid serial primary key
   ,hurricane_zone varchar(1)
   ,geom geometry(MULTIPOLYGON)
);