library(sf)
crs <- 4326

# case 1 : crs == 4326 & st_crs(shape)$epsg == 4326
shape <- st_sfc(st_point(x = c(-4.344, 47.813)), crs = 4326)
print( st_as_text(st_geometry(shape)))
print(st_axis_order())
st_crs(shape)$epsg # expect : 4326
st_axis_order(T)
print(st_axis_order())
shape <- st_transform(shape, "CRS:84") 
print( st_as_text(st_geometry(shape))) #expect : "POINT (47.813 -4.344)"
st_axis_order(F)
print(st_axis_order())

# case 2 : crs == 4326 & st_crs(shape)$epsg != 4326
shape <- st_sfc(st_point(x = c(151147, 6771387)), crs = 2154)
print( st_as_text(st_geometry(shape)))
print(st_axis_order())
st_crs(shape)$epsg # expect : 2154
st_axis_order(T)
print(st_axis_order())
shape <- st_transform(shape, 4326) 
print(st_as_text(st_geometry(shape))) #expect : "POINT (47.813 -4.344)"
st_axis_order(F)
print(st_axis_order())
