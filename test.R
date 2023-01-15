library(sf)

# axis_order FALSE
shape <- st_sfc(st_point(x = c(-4.344, 47.813)), crs = 4326)
geom <- st_as_text(st_geometry(shape))
print(geom)

st_axis_order(F)
shape <- st_transform(shape, "CRS:84")
geom <- st_as_text(st_geometry(shape))
print(geom)

# axis_order TRUE
shape <- st_sfc(st_point(x = c(-4.344, 47.813)), crs = 4326)
geom <- st_as_text(st_geometry(shape))
print(geom)

st_axis_order(T)
shape <- st_transform(shape, "CRS:84")
geom <- st_as_text(st_geometry(shape))
print(geom)
