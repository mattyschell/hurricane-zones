shp2pgsql -I -s 2263 data/atomicpolygon public.atomicpolygon > data/atomicpolygon.sql
psql -f data/atomicpolygon.sql