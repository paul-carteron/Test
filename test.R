library(sf)
library(geojsonsf)
library(methods)

# input
x <- st_sfc(st_point(c(-0.49, 45.42)), crs = 4326)
ressource = "zone-urba"
partition = NULL
categorie = NULL
dTolerance = 0

# Function
if (!is.null(partition)){
      x <- NULL
}

if (methods::is(x, "sf")){
      x <- st_as_sfc(x)
}

# prepare shape
shape <- x %>%
      st_make_valid() %>%
      st_union() %>%
      st_transform(4326) %>%
      st_simplify(dTolerance = dTolerance)

# convert as geojson
res <- sfc_geojson(shape)
print(res)
