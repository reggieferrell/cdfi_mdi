packages <- c("haven", "ggplot2", "gapminder", "tidyverse", "dplyr", "stringr", "readxl", "tidyr", "reshape2",
              "lubridate", "viridis", "haven", "janitor", "wesanderson", "cowplot", "forcats", "ggrepel", 
              "hrbrthemes","sf","tigris", "censusapi","tmap", "tidycensus", "mapview","ggmap",
              "readxl","writexl","vroom","WriteXLS","openxlsx","fuzzyjoin","tidygeocoder",
              "tidytuesdayR","httr","jsonlite","rvest")
# invisible(lapply(packages, install.packages, character.only = TRUE))
invisible(lapply(packages, library, character.only = TRUE))

##########
#Using API key on banks.data.fdic.go to get financial institution data 
#Using (https://banks.data.fdic.gov/docs/#/Financials/getFinancials) for definitions
#########

#Filter 1 pulls basic bank descriptives. Missing CDFI information. 
filter_01 <- httr::GET("https://banks.data.fdic.gov/api/institutions?filters=DATEUPDT%3A%5B%222024-01-01%22%20TO%20%2A%20%5D&fields=ZIP%2CCB%2COFFDOM%2CADDRESS%2CCBSA%2CCBSA_NO%2CBKCLASS%2CSTCHRTR%2CULTCERT%2CWEBADDR%2CTE01N528%2CTE01N529%2CSTCNTY%2CMSA%2CNETINC%2CSPECGRPN%2CSASSER%2CNETINCQ%2CMUTUAL%2CLATITUDE%2CMDI_STATUS_DESC%2CMDI_STATUS_CODE%2CLONGITUDE%2CINSAGNT1%2CINSFDIC%2CCITY%2CCOUNTY%2CSTNAME%2CSTALP%2CNAME%2CACTIVE%2CCERT%2CCBSA%2CASSET%2CNETINC%2CDEP%2CDEPDOM%2CROE%2CROA%2CDATEUPDT%2COFFICES%2C%20DEP%2CEQ%2CFDICREGN&sort_by=OFFICES&sort_order=DESC&limit=5000&offset=0&format=json&download=false&filename=data_file") 
str(filter_01) #double checking to make sure there is no error (400)
str(filter_01$content)

#COnvert raw content
institution_info <- httr::content(filter_01, as="text")
str(institution_info)

#Convert JSON string to a dataframe and view
institution_JSON <- jsonlite::fromJSON(institution_info)
view(institution_JSON)
str(institution_JSON$data)


#Filter 2 pulls basic bank descriptives. Missing CDFI information. 
filter_02 <- httr::GET


