-- borough by borough
-- so we can bail on fails
update 
    atomicpolygon
set 
    geom = ST_CollectionExtract(st_makevalid(geom),3)
where 
    borough = '1'
and not st_isvalid(geom);
-- baddy in the BX requires the collection extract
update 
    atomicpolygon
set 
    geom = ST_CollectionExtract(st_makevalid(geom),3)
where 
    borough = '2'
and not st_isvalid(geom);
update 
    atomicpolygon
set 
    geom = ST_CollectionExtract(st_makevalid(geom),3)
where 
    borough = '3'
and not st_isvalid(geom);
update 
    atomicpolygon
set 
    geom = ST_CollectionExtract(st_makevalid(geom),3)
where 
    borough = '4'
and not st_isvalid(geom);
update 
    atomicpolygon
set 
    geom = ST_CollectionExtract(st_makevalid(geom),3)
where 
    borough = '5'
and not st_isvalid(geom);
