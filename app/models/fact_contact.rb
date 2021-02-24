class Factcontact
require 'pg'


conn = PG.connect(
    dbname: "controllerpg_development",
    port: 5432,
    user: "gabrielrioux",
    password: ENV["POSTGRES_DEV_PASSWORD"]
)


def lead
        leads.each do |n|
            conn.exect_params(
                "INSERT INTO fact_contact(id, created_at, company_name, email, project_name)
                values ($1, $2, $3, $4, $5);",
                [
                    :leads.id,
                    :leads.created_at,
                    :leads.company_name,
                    :leads.email,
                    :leads.project_name
                ]                
            )
        end
    end
end


def lead2
        conn.exec( "SELECT id FROM leads" ) do |result|
            puts " id "
                puts " WHAT " %
                row.values_at('id')
        end
    end
end