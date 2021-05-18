import arcpy
import os
import sys

# Draft_EvacZone_20210504.gdb
filegdb = sys.argv[1]
# AtomicPolygon_EvacZone_Draft_20210416
featureclass = sys.argv[2]


datadir = os.getcwd() + r'\\data\\'

basefile = 'atomicpolygon'

if os.path.isfile(os.path.join(datadir,'{0}.shp'.format(basefile))):
     os.remove(os.path.join(datadir,'{0}.cpg'.format(basefile)))
     os.remove(os.path.join(datadir,'{0}.dbf'.format(basefile)))
     os.remove(os.path.join(datadir,'{0}.prj'.format(basefile)))
     os.remove(os.path.join(datadir,'{0}.sbn'.format(basefile)))
     os.remove(os.path.join(datadir,'{0}.sbx'.format(basefile)))
     os.remove(os.path.join(datadir,'{0}.shp'.format(basefile)))
     os.remove(os.path.join(datadir,'{0}.shp.xml'.format(basefile)))
     os.remove(os.path.join(datadir,'{0}.shx'.format(basefile)))
       
arcpy.FeatureClassToFeatureClass_conversion(os.path.join(datadir
                                                        ,filegdb
                                                        ,featureclass)
                                            ,datadir
                                            ,'{0}.shp'.format(basefile))

                                            