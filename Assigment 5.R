Ananya
20013004


library('RPostgres')



con <- dbConnect(RPostgres::Postgres(),
                 dbname = "postgres",
                 host = "localhost",
                 port = 5432,
                 user = "postgres",
                 password = 'Theo0505!@')

dbExistsTable(con,'bk_total')

query <- "SELECT COUNT(*) FROM bk_total;"

result <- dbGetQuery(con, query)

print(result)
