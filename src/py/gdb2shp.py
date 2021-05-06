import arcpy
import os
import sys

# Draft_EvacZone_20210504.gdb
filegdb = sys.argv[1]
# AtomicPolygon_EvacZone_Draft_20210416
featureclass = sys.argv[2]


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
       
arcpy.FeatureClassToFeatureClass_conversion(os.path.join(datadir
                                                        ,filegdb
                                                        ,featureclass)
                                            ,datadir
                                            ,'atomicpolygon.shp')

                                            