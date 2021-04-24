#encoding: utf-8


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
            name: "pedais do Tom Morello", 
            category: "Áudio e Tecnologia".force_encoding("ASCII-8BIT"), 
            price: 199, 
        }

        MongoDB.new.remove_equipo(@payload[:name], @user_id)

        equipo = Equipos.new.create(@payload, @user_id)
        @equipos_id = equipo.parsed_response["_id"]
        
       @result = Equipos.new.remove_by_id(@equipo_id, @user_id)
    end

    it "deve retornar 404" do
        expect(@result.code).to eql 404
    end

  end

  context "obter unico equipo" do

        before(:all) do
           @result = Equipos.new.remove_by_id(MongoDB.new.get_mongo_id, @user_id)

        end

        it "deve reotrnar 204" do
            expect(@result.code).to eql 204
        end
  end


end