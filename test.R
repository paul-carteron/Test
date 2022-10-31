library(sf)

# Test read_sf from url
url <- "https://apicarto.ign.fr/api/gpu/zone-urba?geom=%7B%22type%22%3A%22Point%22%2C%22coordinates%22%3A%5B-0.49000000000000007%2C45.419999999999998%5D%7D"
resp <- read_sf(url)
print(resp)

