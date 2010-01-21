require 'net/http'
require 'uri'
require 'zillashop/product_result_set'
require 'zillashop/product_result'
require 'zillashop/brands_result_set'
require 'zillashop/brands_result'

# @author mpd
# @version 1.0
class Zillashop
  class ConfigurationNotFoundError; end

  ENDPOINT_ROOT = "http://catalog.bizrate.com/services/catalog/v1/us/"

  CONFIG = File.join(RAILS_ROOT, 'config', 'zillashop.yml')

  # Create a new Zillashop instance
  #
  # @param [optional, String] config path to the config file. Defaults to RAILS_ROOT/config/zillashop.yml
  def initialize(config = CONFIG)
    conf = config && File.exists?(config) && YAML.load_file(config)[RAILS_ENV]
    raise ConfigurationNotFoundError, "could not find the \"#{config}\" configuration file for Zillashop" unless conf
    @api_key = conf[:api_key] || conf["api_key"] || ''
    @publisher_id = conf[:publisher_id] || conf["publisher_id"] || ''
  end

  # Perform a product search via the Shopzilla Catalog API
  #
  # @param [optional, Hash] options the options to pass to the query. See Shopzilla docs for list.
  # @return [ProductResultSet] the set of results
  def product(options = {})
    ProductResultSet.new search(:product, options)
  end

  # Perform a taxonomy search via the Shopzilla Catalog API
  #
  # @param [optional, Hash] options the options to pass to the query. See Shopzilla docs for list.
  # @return [TaxonomyResultSet] the set of results
  def taxonomy(options = {})
    TaxonomyResultSet.new search(:taxonomy, options)
  end

  # Perform a brand search via the Shopzilla Catalog API
  #
  # @param [optional, Hash] options the options to pass to the query. See Shopzilla docs for list.
  # @return [BrandsResultSet] the set of results
  def brand(options = {})
    BrandsResultSet.new search(:brands, options)
  end

  # Perform a merchant info search via the Shopzilla Catalog API
  #
  # @param [optional, Hash] options the options to pass to the query. See Shopzilla docs for list.
  # @return [MerchantInfoResultSet] the set of results
  # @todo make sure queries with :merchant_info => '814,815,816' do not escape the commas - Shopzilla says this is a known issue
  def merchant_info(options = {})
    MerchantInfoResultSet.new search(:merchant, options)
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
    rescue Exception => e
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
