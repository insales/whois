#
# = Ruby Whois
#
# An intelligent pure Ruby WHOIS client and parser.
#
#
# Category::    Net
# Package::     Whois
# Author::      Simone Carletti <weppos@weppos.net>
# License::     MIT License
#
#--
#
#++


require 'whois/answer/parser/base'


module Whois
  class Answer
    class Parser

      #
      # = whois.nic.ly parser
      #
      # Parser for the whois.nic.ly server.
      #
      # NOTE: This parser is just a stub and provides only a few basic methods
      # to check for domain availability and get domain status.
      # Please consider to contribute implementing missing methods.
      # See WhoisNicIt parser for an explanation of all available methods
      # and examples.
      #
      class WhoisNicLy < Base

        property_supported :status do
          if available?
            :available
          else
            :registered
          end
        end

        property_supported :available? do
          @available ||= (content.to_s.strip == "Not found")
        end

        property_supported :registered? do
          !available?
        end


        property_supported :created_on do
          @created_on ||= if content.to_s =~ /Created:\s+(.*)\n/
            Time.parse($1)
          end
        end
        
        property_supported :updated_on do
          @updated_on ||= if content.to_s =~ /Updated:\s+(.*)\n/
            Time.parse($1)
          end
        end
        
        property_supported :expires_on do
          @expires_on ||= if content.to_s =~ /Expired:\s+(.*)\n/
            Time.parse($1)
          end
        end

      end
      
    end
  end
end  