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
-- make sure the source is good before continuing
select case count(*) 
       when 0 then 'OK'
       else 'Error, ' || count(*) || ' bad zone values! '
       end
from atomicpolygon
where zone not in ('1','2','3','4','5','6','7','X')
or zone is null;
