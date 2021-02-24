require 'pg'


conn = PG.connect(
    dbname: "controllerpg_development",
    port: 5432,
    user: "gabrielrioux",
    password: ENV["POSTGRES_DEV_PASSWORD"]
)

for id in elevators
    conn.exect_params(
        "INSERT INTO fact_elevator (serial_number, date_of_commissioning, building_id, customer_id, building_city)
        values ($1, $2, $3, $4, $5, );",
        [
            :elevators.serial_number,
            :elevators.date_of_commissioning,
            :buildings.id,
            :customers.id,
            :buildings.building_adresse.building_city
        ]
    )
end