# hurricane-zones

Given an input of atomic polygons with zone values, produce topojson hurricane zones for https://github.com/CityOfNewYork/hurricane. 

1. Export source ESRI file geodatabase to the dreaded shapeile

```
CALL c:\Progra~1\ArcGIS\Pro\bin\Python\scripts\propy.bat .\src\py\gdb2shp.py EvacZone_20210517.gdb EvacZone_20210517
```

2. Tear down anything, set up and import dreaded shapefile into a PostGIS database

```shell
export PGUSER=scratchuser
export PGPASSWORD=PostGisIsMyDataBae!
export PGDATABASE=scratchdatabase
./src/importdreadedshapefile.sh
```

3. Clean up atomic polygons

Run 2x to ensure no updates on second pass.

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

5. Tweak Any Values and Types

```shell
psql -f src/sql/updatezones.sql
```

6. Simplify 

Visvalingham-Whyatt simplification should remove spikes at zone boundaries and some gaps. However some gaps and overlaps may remain, requiring additional edge matching work. After simplification we'll remove large remaining interior rings.

```shell
psql -f src/sql/simplify.sql
```

7. Review and manual fix

Visually review zones_simplified.  If this is intended to be a final-ish version manual cleanup of gaps and overlaps should happen here.

8. Transform to WGS84 and any final output formatting

```shell
psql -f src/sql/transform.sql
```

9. Export to geojson

```shell
C:\"Program Files"\"QGIS 3.16"\bin\ogr2ogr.exe -f GeoJSON hurricane_zones.geojson "PG:host=localhost dbname=scratchdatabase user=scratchuser password=PostGisIsMyDataBae!" -sql "select zone,geog from zones_out" -lco COORDINATE_PRECISION=6
```

output: hurricane_zones.geojson

10. Convert to topojson

[Mapshaper](https://mapshaper.org/) for now, ogr2ogr doesnt output topojson.

output: hurricane_zones.json