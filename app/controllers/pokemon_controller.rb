class PokemonController < ApplicationController

  def index
    render json: { "message": "ok" }
  end

  def show
    res = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/")
    body = JSON.parse(res.body)
    name  = body["name"]
    id = body["id"]

    types =[]
    body["types"].each do |type|
    types << type["type"]["name"]
    end

    res = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_KEY"]}&q=#{name}&rating=g")
    body = JSON.parse(res.body)
    gif_url = body["data"][0]["url"]

    render json: {
      id: id,
      name: name,
      types: types,
      gif: gif_url
    }
  end

end
