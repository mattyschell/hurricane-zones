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

4. Clean up slivers and gaps


5. Simplify https://postgis.net/docs/manual-2.5/ST_SimplifyVW.html

   ST_SnapToGrid(ST_SimplifyVW(shape,.1), 0,0, 1,1) 

6. Fix gaps and overlaps again

7. Export to geojson


8. Convert to topojson