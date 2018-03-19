module RequestHelper
  def json
    JSON.parser(response.body)
  end
end