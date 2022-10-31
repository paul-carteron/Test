library(sf)
library(geojsonsf)
library(methods)
library(httr2)

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

# param
param <- list(
      geom = switch(is.null(x) + 1, sfc_geojson(shape), NULL),
      partition = partition,
      categorie = categorie
)

# build url
req <- request("https://apicarto.ign.fr/api/gpu") %>%
      req_user_agent("happign (https://paul-carteron.github.io/happign/)") %>%
      req_url_path_append(ressource) %>%
      req_url_query(!!!param)
print(req)

# made request
res <- req %>%
      req_perform() %>%
      resp_body_string() %>%
      read_sf()
print(res)
