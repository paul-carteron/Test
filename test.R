library(sf)

dTolerance <- 0

x <- st_sfc(st_point(c(-0.49, 45.42)), crs = 4326)

res <- x %>%
      st_make_valid() %>%
      st_union() %>%
      st_transform(4326) %>%
      st_simplify(dTolerance = dTolerance)
      
print(res)
