require 'pg'


conn = PG.connect(
    dbname: "controllerpg_development",
    port: 5432,
    user: "gabrielrioux",
    password: ENV["POSTGRES_DEV_PASSWORD"]
)

DECLARE l = 1
while l <= counts[customers]
    conn.exect_params(
        "INSERT INTO dim_customers(created_at, company_name, ervice_technical_authority_full_name, service_technical_authority_email, number_of_elevator, customers_city)
        values ($1, $2, $3, $4, $5, $6);",
        [

        ]
    )
    l += 1
end
