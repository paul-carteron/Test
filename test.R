library(sf)
library(testthat)

st_as_text_happign <- function(shape, crs){

   if(crs == 4326 & st_crs(shape)$epsg == 4326){
      on.exit(st_axis_order(F))
      st_axis_order(T)
      shape <- st_transform(shape, "CRS:84")
      print("case1")
   }else if (crs == 4326 & st_crs(shape)$epsg != 4326){
      on.exit(st_axis_order(F))
      st_axis_order(T)
      shape <- st_transform(shape, 4326)
      print("case2")
   }else{
      shape <- st_transform(shape, crs)
      print("case3")
   }

   geom <- st_as_text(st_geometry(shape))

   return(geom)
}

shape <- st_sfc(st_point(x = c(-4.344, 47.813)), crs = 4326)
print(st_as_text(st_geometry(shape)))
print(st_as_text_happign(shape, 4326))

expect_match(st_as_text_happign(shape, 4326),
             "POINT (47.813 -4.344)", fixed = TRUE)

