# Yandex.XML parser
# Author: https://github.com/krdprog/ - Alexey Tsaplin-Kupaysinov
# License: MIT
require 'nokogiri'
require 'open-uri'

# Get data from Yandex.XML service by XML
# https://xml.yandex.ru/settings/
class YandexXml
  attr_accessor :keyword, :region

  def initialize(user, key)
    @user = user
    @key = key
    @region = region
  end

  # Get data from Yandex.XML by one parameter
  def get_xml(param)
    create_xml_url

    xml = Nokogiri::XML(open(@xml_url))

    result = []

    xml.css(param).each do |i|
      result << i.content
    end

    puts result.inspect
  end

  private

  # Create URL for query from Yandex.XML by XML
  def create_xml_url
    base_url = 'https://yandex.ru/search/xml?'
    tail_url = '&groupby=attr%3Dd.mode%3Ddeep.groups-on-page%3D100.docs-in-group%3D1'
    query_url = URI.encode_www_form([['user', @user], ['key', @key], ['query', @keyword], ['lr', @region]])

    @xml_url = base_url + query_url + tail_url
  end
end
