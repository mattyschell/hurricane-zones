# hurricane-zones

1. Export source ESRI file geodatabase to the dreaded shapeile

```
CALL c:\Progra~1\ArcGIS\Pro\bin\Python\scripts\propy.bat .\src\py\gdb2shp.py 
```

2. Set up and import dreaded shapefile into a PostGIS database

```shell
export PGUSER=scratchuser
export PGPASSWORD=PostGisIsMyDataBae!
export PGDATABASE=scratchdatabase
./src/importdreadedshapefile.sh
```

3. Clean up atomic polygons

```shell
psql -f src/sql/cleanup.sql
```

3. Aggregate atomic polygons on zones

```shell
psql -f src/sql/aggregate.sql
```

4. Clean up fully contained small interior rings

```shell
psql -f src/sql/functionfilterrings.sql
psql -f src/sql/removesmallinteriorrings.sql
```

5. Remove Zone X and Update Zone 7

```shell
psql -f src/sql/update_zones.sql
```


6. Simplify 

Visvalingham-Whyatt simplification should remove spikes at zone boundaries and
some gaps. However some gaps and overlaps may remain, requiring additional edge matching work. This is TBD.

```shell
psql -f src/sql/simplify.sql
```


7. Transform to WGS84 and column formatting

```shell
psql -f src/sql/transform.sql
```

8. Export to geojson

```shell
C:\"Program Files"\"QGIS 3.16"\bin\ogr2ogr.exe -f GeoJSON hurricane_zones.geojson "PG:host=localhost dbname=scratchdatabase user=scratchuser password=PostGisIsMyDataBae!" -sql "select zone,geog from zones_out" -lco COORDINATE_PRECISION=6
```

output: hurricane_zones.geojson

9. Convert to topojson

[Mapshaper](https://mapshaper.org/) for now, ogr2ogr doesnt output topojson.

output: hurricane_zones.json