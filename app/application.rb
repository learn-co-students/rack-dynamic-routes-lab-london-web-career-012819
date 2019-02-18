
class Application
  def call(env)
    response = Rack::Response.new
    request = Rack::Request.new(env)

    if request.path.match(/items/)
      item_name = request.path.split("/items/").last
      item = Item.all.find { |item| item.name == item_name}
      if item != nil
        item_price = item.price
        response.write item_price
      else
        response.status = 400
        response.write "Item not found"
      end

    else
      response.status = 404
      response.write "Route not found"
    end

    response.finish

  end
end
