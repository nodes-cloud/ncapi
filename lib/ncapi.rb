require 'uri'
require 'net/http'
require 'net/https'
require 'json'

module NCApi
  def get(endpoint)
    url = "#{NCApiCache.get['url']}/#{endpoint}"
    headers = NCApiCache.get['headers']
    NCApiGet::new::call(url, headers)
  end

  def post(endpoint, form_data, raw_data)
    url = "#{NCApiCache.get['url']}/#{endpoint}"
    headers = NCApiCache.get['headers']
    NCApiPost::new::call(url, headers, form_data, raw_data)
  end

  def get_custom(url, headers)
    NCApiGet::new::call(url, headers)
  end

  def post_custom(url, headers, form_data, raw_data)
    NCApiPost::new::call(url, headers, form_data, raw_data)
  end

  def set_global(key, value)
    NCApiCache::new::set(key, value)
  end
end
