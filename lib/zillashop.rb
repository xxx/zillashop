require 'net/http'
require 'uri'
require 'zillashop/product_result_set'
require 'zillashop/product_result'
require 'zillashop/brands_result_set'
require 'zillashop/brands_result'

class Zillashop
  class ConfigurationNotFoundError; end

  ENDPOINT_ROOT = "http://catalog.bizrate.com/services/catalog/v1/us/"

  CONFIG = File.join(RAILS_ROOT, 'config', 'zillashop.yml')

  def initialize
    conf = CONFIG && File.exists?(CONFIG) && YAML.load_file(CONFIG)[RAILS_ENV]
    raise ConfigurationNotFoundError, "could not find the \"#{CONFIG}\" configuration file for Zillashop" unless conf
    @api_key = conf[:api_key] || conf["api_key"] || ''
    @publisher_id = conf[:publisher_id] || conf["publisher_id"] || ''
  end

  def product(options = {})
    ProductResultSet.new search(:product, options)
  end

  def taxonomy(options = {})
    search(:taxonomy, options)
  end

  def brand(options = {})
    BrandsResultSet.new search(:brands, options)
  end

  def merchant_info(options = {})
    search(:merchant, options)
  end

  private

  def search(endpoint, options = {})
    url_str = "#{Zillashop::ENDPOINT_ROOT + endpoint.to_s}/?" + param_string(options)
    url = URI.parse(url_str)
    response = Net::HTTP.start(url.host, url.port) do |http|
      http.get("#{url.path}?#{url.query}")
    end
    
    begin
      Hash.from_xml(response.body)
    rescue NoMethodError
      {}
    end
  end

  def param_string(params)
    params.reverse_merge! :api_key => @api_key, :publisher_id => @publisher_id
    params.map do |key, val|
      "#{parameter_for_url(key)}=#{CGI.escape(val.to_s)}"
    end.join('&')
  end

  def parameter_for_url(parm)
    cam = parm.to_s.camelize
    cam[0..0].downcase + cam[1..-1]
  end
end
