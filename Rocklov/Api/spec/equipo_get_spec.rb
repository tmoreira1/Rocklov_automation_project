
describe "GET /equipos/{equipos_id}" do
before(:all) do
    payload = { email: "to@mate.com", password: "pwd123" }
    result = Sessions.new.login(payload)
    @user_id = result.parsed_response["_id"]
end
    context "obter unico equipo" do
    before(:all) do

        thumbnail = File.open(File.join(Dir.pwd, "spec/fixtures/images", "sanfona.jpg"),"rb")
        @payload = { 
            thumbnail:  thumbnail, 
            name: "sanfona", 
            category: "outros", 
            price: 467, 
        }

        MongoDB.new.remove_equipo(@payload[:name], @user_id)

        equipo = Equipos.new.create(@payload, @user_id)
        @equipos_id = equipo.parsed_response["_id"]
        
       @result = Equipos.new.find_by_id(@equipo_id, @user_id)
    end

    it "deve retornar 200" do
        expect(@result.code).to eql 200
    end

  end

end