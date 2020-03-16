Function getebv,gl,gb,dis=dis
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

if n_elements(dis) ne 0 then begin
	if max(dis) gt 5.0 then begin
		print,'out of the distance limit of the maps (d < 5 kpc)'
		stop
	endif
endif
n1 = n_elements(gl)
n2 = n_elements(dis)
if n2 eq 0 then begin
	ebv = fltarr(n1,19)
endif else begin
	if n2 ne n1 then begin
		print,'distance arrays must be the same length as gl and gb'
		stop
	endif 
	ebv = fltarr(n1)
endelse

muma = findgen(19)*0.5+4.25
disa = 10.^(muma/5.+1)/1000
cat = mrdfits('res1d.fit',1,h)
for i = 0L, n1-1L do begin
	gli = gl[i]
	gbi = gb[i]
	; First check the sky range of the map
	if abs(gbi) gt 10. then begin
		print,'out of the range of the maps (|b| < 10 deg)'
		stop
	endif

	gcirc, 2, gli, gbi, cat.l, cat.b, darc
	mdarc = min(darc, ind)
	if min(cat[ind[0]].ebr) ge 0. then begin
		yebv = cat[ind[0]].ebr/(3.24-1.91)
	endif else yebv = cat[ind[0]].ebr
	if n2 eq n1 then begin
		ebv[i] = interpol(yebv, disa, dis[i])
	endif else begin
		ebv[i,*] = yebv
	endelse
endfor

return, ebv
end
