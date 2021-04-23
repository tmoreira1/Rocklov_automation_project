require_relative "base_api"

class Equipos < BaseApi

    def create(payload, user_id)

        return self.class.post(
            "/equipos",
           body: payload,
           headers: {
           "user_id": user_id,
    },
)
    end
    def find_by_id(equipo_id, user_id)
        return self.class.get(
            "/equipos/#{equipo_id}",
            headers: {
            "user_id": user_id,
            },
        )
    end
end
