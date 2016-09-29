require 'uri'
require 'net/http'
require 'net/https'
require 'json'

library_files = Dir[File.join(File.dirname(__FILE__), '/ncapi/**/*.rb')].sort
library_files.each do |file|
  require file
end

module NCApi
  def self.get(endpoint)
    url = "#{NCApiCache.get['url']}/#{endpoint}"
    headers = NCApiCache.get['headers']
    NCApiGet::new::call(url, headers)
  end

  def self.post(endpoint, form_data, raw_data)
    url = "#{NCApiCache.get['url']}/#{endpoint}"
    headers = NCApiCache.get['headers']
    NCApiPost::new::call(url, headers, form_data, raw_data)
  end

  def self.get_custom(url, headers)
    NCApiGet::new::call(url, headers)
  end

  def self.post_custom(url, headers, form_data, raw_data)
    NCApiPost::new::call(url, headers, form_data, raw_data)
  end

  def self.set_global(key, value)
    NCApiCache.set(key, value)
  end
end
