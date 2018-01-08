library(patentsview)

### All fields in Patentsview
fields <- fieldsdf

### This function reminds the user what the 7 possible PatentsView API endpoints are.
endpoints <- get_endpoints()

### Patents Fields
patents_fields <- get_fields("patents", groups = c("applications", 
                                                   "cpc_subsections", 
                                                   "patents",
                                                   "years"))

### Search
query <- qry_funs$text_all(patent_abstract = "Healthcare")
search <- search_pv(query, fields = patents_fields, page = 10, per_page = 25)

### dataframe
patents <- data.frame(search$data)
patents <- data.frame(abstract = patents$patents.patent_abstract, 
                      title = patents$patents.patent_title,
                      type = patents$patents.patent_type)

