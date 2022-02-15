module Event
  def sendEvent(eventName, metadata)
    wilcoId = File.read("../.wilco")
    conn = Faraday.new(
      url: "http://localhost:3002/users/#{wilcoId}/",
      headers: {'Content-Type' => 'application/json'}
    )

    response = conn.post('event') do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = { event: eventName, metadata: metadata}.to_json
    end
  response
  end
end
