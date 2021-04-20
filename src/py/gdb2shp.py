import arcpy
import os

datadir = os.getcwd() + r'\\data\\'
       
arcpy.FeatureClassToFeatureClass_conversion(os.path.join(datadir, 'Draft_EvacZone_20210416.gdb\AtomicPolygon_EvacZone_Draft_20210416')
                                            ,datadir
                                            ,'atomicpolygon.shp')

                                            