delete from 
    zones_exterior 
where 
    hurricane_zone = 'X';
update 
    zones_exterior 
set 
    hurricane_zone = '0' 
where 
    hurricane_zone = '7';
