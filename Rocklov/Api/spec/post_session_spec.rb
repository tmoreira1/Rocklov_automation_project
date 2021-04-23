
describe "POST /sessions" do

    context "login com sucesso" do

        before(:all) do
            payload = { email: "tcm1@gmail.com", password: "123qwe"}
            @result = Sessions.new.login(payload)
        end

 it "valida status code" do
    expect(@result.code).to eql 200
 end

 it "valida id do usuário" do
    expect(@result.parsed_response["_id"].length).to eql 24
 
 end

 end


 examples = [
    {
        title: "senha incorreta",
        payload: { email: "tcm1@gmail.com", password: "123456"},
        code: 401,
        error: "Unauthorized"
    },
    {
        title: "usuario não existe",
        payload: { email: "1011@gmail.com", password: "123qwe"},
        code: 401,
        error: "Unauthorized"
    },
    {
        title: "campo email vazio",
        payload: { email: "", password: "123qwe"},
        code: 412,
        error: "required email"
    },
    {
        title: "faltando campo email",
        payload: { password: "123qwe"},
        code: 412,
        error: "required email"
    },
    {
        title: "campo senha vazio",
        payload: { email: "tcm1@gmail.com", password: ""},
        code: 412,
        error: "required password"
    },
    {
        title: "faltando campo senha",
        payload: { email: "tcm1@gmail.com"},
        code: 412,
        error: "required password"
    }
 ]


examples.each do |e|

    context "#{e[:title]}" do

        before(:all) do
            @result = Sessions.new.login(e[:payload])
    
        end
    
    it "valida status code #{e[:code]}" do
    expect(@result.code).to eql e[:code]
    end
    
    it "valida id do usuário" do
    expect(@result.parsed_response["error"]).to eql e[:error]
    
    end
    
    end
        

end
 
end