
describe "POST /signup" do
    context "novo usuario" do
        before(:all) do
            payload = {name:"Pitty", email: "pitty@bol.com.br", password: "pwd123"}
            MongoDB.new.remove_user(payload[:email])

            @result = Signup.new.create(payload)
        end

        it "valida status code " do
            expect(@result.code).to eql 200
            end
            
            it "valida id do usuário" do
            expect(@result.parsed_response["_id"].length).to eql 24
            
            end
            
    end
    context "usuario ja existe" do
        before(:all) do
            payload = {name:"joao", email: "joao@ig.com.br", password: "pwd123"}
            MongoDB.new.remove_user(payload[:email])

            Signup.new.create(payload)
            @result = Signup.new.create(payload)
        end
            it "deve retornar 409" do
                expect(@result.code).to eql 409
            end

            it "deve retornar mensagem" do
                expect(@result.parsed_response["error"]).to eql "Email already exists :("
            end

    end
end
