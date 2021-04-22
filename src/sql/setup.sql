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
create table zones_exterior (
    gid serial primary key
   ,hurricane_zone varchar(1)
   ,geom geometry(MULTIPOLYGON)
);
create table zones_simplified (
    gid serial primary key
   ,hurricane_zone varchar(1)
   ,geom geometry(MULTIPOLYGON)
);
create table zones_out (
    gid serial primary key
   ,hurricane_zone varchar(1)
   ,geog geography(MULTIPOLYGON,4326)
);