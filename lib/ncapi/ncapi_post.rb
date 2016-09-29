class NCApiPost
  def call(url, headers, form_data, raw_data)
    uri = URI.parse(url)
    https = Net::HTTP.new(uri.host,uri.port)
    https.use_ssl = true
    https.verify_mode = OpenSSL::SSL::VERIFY_NONE
    req = Net::HTTP::Post.new(uri.path, initheader = headers)
    req.set_form_data(form_data)

    res = https.request(req)

    if res.kind_of? Net::HTTPSuccess
      begin
        resp = JSON.parse(res.body)
      rescue JSON::ParserError => e
        return false
      end
      resp
    else
      "Something went wrong #{res.code}: #{res.message}"
    end
  end
end