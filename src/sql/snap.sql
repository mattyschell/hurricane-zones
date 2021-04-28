insert into zones_snapped
    (hurricane_zone
    ,geom)
select 
    hurricane_zone
   ,ST_SnapToGrid(geom,.00001)
from 
    zones_simplified 
where 
    hurricane_zone = '0';
--snap 1 to 0
insert into zones_snapped
    (hurricane_zone
    ,geom)
select 
    a.hurricane_zone
   ,ST_SnapToGrid(ST_Snap(a.geom
                         ,(select geom from zones_snapped where hurricane_zone = '0')
                         ,10)
                 ,.00001)
from 
    zones_simplified a
where 
    a.hurricane_zone = '1';
update 
    zones_snapped
set 
    geom = ST_CollectionExtract(st_makevalid(geom),3)
where 
    hurricane_zone = '1'
and not st_isvalid(geom);
--snap 2 to 1
insert into zones_snapped
    (hurricane_zone
    ,geom)
select 
    a.hurricane_zone
   ,ST_SnapToGrid(ST_Snap(a.geom
                         ,(select geom from zones_snapped where hurricane_zone = '1')
                         ,10)
                 ,.00001)
from 
    zones_simplified a
where 
    a.hurricane_zone = '2';
update 
    zones_snapped
set 
    geom = ST_CollectionExtract(st_makevalid(geom),3)
where 
    hurricane_zone = '2'
and not st_isvalid(geom);
--snap 3 to 2
insert into zones_snapped
    (hurricane_zone
    ,geom)
select 
    a.hurricane_zone
   ,ST_SnapToGrid(ST_Snap(a.geom
                         ,(select geom from zones_snapped where hurricane_zone = '2')
                         ,10)
                 ,.00001)
from 
    zones_simplified a
where 
    a.hurricane_zone = '3';
update 
    zones_snapped
set 
    geom = ST_CollectionExtract(st_makevalid(geom),3)
where 
    hurricane_zone = '3'
and not st_isvalid(geom);
--snap 4 to 3
insert into zones_snapped
    (hurricane_zone
    ,geom)
select 
    a.hurricane_zone
   ,ST_SnapToGrid(ST_Snap(a.geom
                         ,(select geom from zones_snapped where hurricane_zone = '3')
                         ,10)
                 ,.00001)
from 
    zones_simplified a
where 
    a.hurricane_zone = '4';
update 
    zones_snapped
set 
    geom = ST_CollectionExtract(st_makevalid(geom),3)
where 
    hurricane_zone = '4'
and not st_isvalid(geom);
--snap 5 to 4
insert into zones_snapped
    (hurricane_zone
    ,geom)
select 
    a.hurricane_zone
   ,ST_SnapToGrid(ST_Snap(a.geom
                         ,(select geom from zones_snapped where hurricane_zone = '4')
                         ,10)
                 ,.00001)
from 
    zones_simplified a
where 
    a.hurricane_zone = '5';
update 
    zones_snapped
set 
    geom = ST_CollectionExtract(st_makevalid(geom),3)
where 
    hurricane_zone = '5'
and not st_isvalid(geom);
--snap 6 to 5
insert into zones_snapped
    (hurricane_zone
    ,geom)
select 
    a.hurricane_zone
   ,ST_SnapToGrid(ST_Snap(a.geom
                         ,(select geom from zones_snapped where hurricane_zone = '5')
                         ,10)
                 ,.00001)
from 
    zones_simplified a
where 
    a.hurricane_zone = '6';
update 
    zones_snapped
set 
    geom = ST_CollectionExtract(st_makevalid(geom),3)
where 
    hurricane_zone = '6'
and not st_isvalid(geom);