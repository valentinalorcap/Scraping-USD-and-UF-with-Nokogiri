require 'nokogiri'
require 'net/http'
require 'uri'
require 'date'

uri = URI.parse('https://si3.bcentral.cl/Bdemovil/BDE/IndicadoresDiarios?parentMenuName=Indicadores%20diarios&fecha=22-11-2022')

response = Net::HTTP.get_response(uri)

CurrencyService = Hash.new

html = response.body
parsed_data = Nokogiri::HTML.parse(html)
puts parsed_data.xpath("//td[@class='col-xs-2 text-center']")[0].content


def values(date_from, date_to)
  (Date.parse(date_from)...Date.parse(date_to)).each do |fecha|
    puts fecha
    uri = URI.parse('https://si3.bcentral.cl/Bdemovil/BDE/IndicadoresDiarios?parentMenuName=Indicadores%20diarios&fecha=' + fecha.to_s[8...10] + '-' + fecha.to_s[5...7] + '-' + fecha.to_s[0...4])
    response = Net::HTTP.get_response(uri)
    
    html = response.body
    parsed_data = Nokogiri::HTML.parse(html)
    puts parsed_data.xpath("//td[@class='col-xs-2 text-center']")[0].content
  end
end

puts value(18-10-2022, 25-10-2022)