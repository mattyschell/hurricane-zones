psql -f src/sql/teardown.sql
psql -f src/sql/setup.sql
shp2pgsql -I -s 2263 data/atomicpolygon public.atomicpolygon > data/atomicpolygon.sql 
psql -f data/atomicpolygon.sql