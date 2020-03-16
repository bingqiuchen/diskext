# diskext
; --- This program produce the interstellar reddening E(B-V) for certain cordinates (and distances), using the map from Chen et al. (2018)
; --- input parameters
; gl, gb: Galactic coordinates, given by degrees
; dis: distances of the sources, given by kpc;
;      if dis not set, the outputs are E(B-V) values for all distance in the line-of-sight (dis =      0.071     0.089     0.112     0.141     0.178     0.224     0.282     0.355     0.447     0.562     0.708     0.891     1.122     1.413     1.778     2.239     2.818     3.548     4.467) kpc.
; --- output 
; ebv: intergrated dust reddenging values, if gl and gb are arrays, return a array of dimensions [n1], where n1 is the length of the coordinates or [n1,19] if the dis keyword not set. E(B-V) is converted from E(GBP-GRP) using the extinction coefcient from Chen et al.
; The programme now return the values of the nearest pixels. In the future, the 2d interpolation will also be applied.
; wriitten by BQ Chen in July 2018, for more question contact bchen@ynu.edu.cn
; datafile; res1d.fit needed

The file can be download via:
http://paperdata.china-vo.org/diskec/cestar/res1d.fit.zip
