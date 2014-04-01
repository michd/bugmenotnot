require 'nokogiri'
require 'open-uri'

class Bugmenotnot
  BUGMENOT_URL_SCHEMA = 'http://bugmenot.com/view/%domain%'
  ITEM_SELECTOR = 'article.account'

  CSS_SELECTORS = {
    :username => 'dl dd:nth-of-type(1)',
    :password => 'dl dd:nth-of-type(2)',
    :other    => 'dl dd:nth-of-type(3):not(.stats)'
  }

  def self.retrieve_logins(site_domain)
    output = []

    doc = Nokogiri::HTML open(BUGMENOT_URL_SCHEMA.sub('%domain%', site_domain))

    doc.css(ITEM_SELECTOR).each do |item|
      login_details = {}

      CSS_SELECTORS.each do |k, v|
        retrieved_value = item.css(v).text.strip
        login_details[k] = retrieved_value unless retrieved_value == ''
      end

      output << login_details
    end

    output

  rescue OpenURI::HTTPError => err
    return [] if err.io.status[0] == '404'
    raise err
  end
end

