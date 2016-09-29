class NCApiGet
  def call(url, headers)
    uri = URI.parse(url)
    https = Net::HTTP.new(uri.host,uri.port)

    https.use_ssl = true
    https.verify_mode = OpenSSL::SSL::VERIFY_NONE
    req = Net::HTTP::Get.new(uri.path, initheader = headers)

    res = https.request(req)

    if res.kind_of? Net::HTTPSuccess
      begin
        resp = JSON.parse(res.body)
      rescue JSON::ParserError => e
        return false
      end
      resp
    else
      "Something went wrong #{res.code} #{res.body}:"
    end
  end
end