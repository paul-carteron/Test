library(sf)
library(httr2)

# Test read_sf from url
url <- "https://apicarto.ign.fr/api/gpu/zone-urba?geom=%7B%22type%22%3A%22Point%22%2C%22coordinates%22%3A%5B-0.49000000000000007%2C45.419999999999998%5D%7D"
res1 <- read_sf(url)
print(res1)

# Test read_sf from httr2 string response
res2 <- request(url) %>%
  req_perform() %>%
  resp_body_string() %>% 
  read_sf()
print(res2)
