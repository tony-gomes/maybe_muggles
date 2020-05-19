class SearchService
  def get_phoenix_members(house)
    house = get(house)
    members = house[:characters]
    members
  end

  private

  def get(house)
    house_id = return_house_id(house)
    return_house(house_id)
  end

  def return_house_id(house)
    response = conn_houses.get('houses') do |req|
      req.params['key'] = ENV['POTTER_API_KEY']
      req.body = {query: 'houses'}.to_json
    end

    houses_result = JSON.parse(response.body, symbolize_names: true)
    houses_result.select(house: house)[:houseId]
  end

  def return_house(house_id)
    response = conn_houses.get('houses') do |req|
      req.body = {query: "#{house_id}"}.to_json
    end

    houses_result = JSON.parse(response.body, symbolize_names: true)
    houses_result.select(house: house)[:houseId]
  end

  def conn_houses
    conn = Faraday.new(
      url: 'https://www.potterapi.com/v1/',
      params: {key: ENV['POTTER_API_KEY']},
      headers: {'Content-Type' => 'application/json'}
    )
  end

  def conn(house_id)
    Faraday.get "https://www.potterapi.com/v1/houses/#{house_id}"
  end
end
