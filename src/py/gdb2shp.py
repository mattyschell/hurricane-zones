import arcpy
import os

datadir = os.getcwd() + r'\\data\\'

if os.path.isfile(os.path.join(datadir,'atomicpolygon.shp')):
     os.remove(os.path.join(datadir,'atomicpolygon.cpg'))
     os.remove(os.path.join(datadir,'atomicpolygon.dbf'))
     os.remove(os.path.join(datadir,'atomicpolygon.prj'))
     os.remove(os.path.join(datadir,'atomicpolygon.sbn'))
     os.remove(os.path.join(datadir,'atomicpolygon.sbx'))
     os.remove(os.path.join(datadir,'atomicpolygon.shp'))
     os.remove(os.path.join(datadir,'atomicpolygon.shp.xml'))
     os.remove(os.path.join(datadir,'atomicpolygon.shx'))
       
arcpy.FeatureClassToFeatureClass_conversion(os.path.join(datadir, 'Draft_EvacZone_20210416.gdb\AtomicPolygon_EvacZone_Draft_20210416')
                                            ,datadir
                                            ,'atomicpolygon.shp')

                                            