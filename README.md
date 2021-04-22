# hurricane-zones

1. Export source ESRI file geodatabase to the dreaded shapeile

```
CALL c:\Progra~1\ArcGIS\Pro\bin\Python\scripts\propy.bat .\src\py\gdb2shp.py 
```

2. Import dreaded shapefile into a PostGIS database

```shell
export PGUSER=scratchuser
export PGPASSWORD=PostGisIsMyDataBae!
export PGDATABASE=scratchdatabase
./src/py/importdreadedshapefile.sh
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


5. Simplify https://postgis.net/docs/manual-2.5/ST_SimplifyVW.html

```shell
psql -f src/sql/simplify.sql
```

6. Fix gaps and overlaps again

    skip this for now

7. Transform to WGS84 (and maybe limit coordinate precision)

```shell
psql -f src/sql/transform.sql
```

8. Export to geojson

QGIS first time through, ogr2ogr next time.

output: hurricane_zones.geojson

9. Convert to topojson

Mapshaper first time through.

output: hurricane_zones.json