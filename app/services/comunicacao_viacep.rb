class ComunicacaoViacep

    def buscar(cep)
    
        url = "https://viacep.com.br/ws/#{@cep}/json/"

        retorno = JSON.parse(Net::HTTP.get(URI(url)))

        if retorno["erro"]
            {erro: "CEP não existe"}
        else
        endereco = GravacaoViacep.new(retorno).Gravar
            {end: endereco, municipio: endereco.cidade}
        end
    
    rescue JSON::ParseError=> exception
            {erro: "O CEP é inválido"}
    rescue SocketError => exception
        {erro: "Falha de rede"}
    rescue => exception
            {erro: "Ligar no suporte"}
    end

end