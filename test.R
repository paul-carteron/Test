library(sf)

pt <- st_sfc(st_point(c(0, 60)), crs = 2154)
st_axis_order(F)
print(st_transform(pt, 4326)[[1]])

st_axis_order(T)
print(st_transform(pt, 4326)[[1]])

