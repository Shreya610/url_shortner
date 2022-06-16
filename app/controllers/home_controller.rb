require 'resolv'
require 'geocoder'
class HomeController < ApplicationController
 def index

  if params['url']!="" and params['url']!=nil
   @sh=UrlShort.find_by(url: params['url'])
   if @sh
    
    redirect_to root_path
   else
    u=params['url'].split("//")
    dom=u[1].split("/")
    puts dom[0]
    @address=Resolv.getaddresses(dom[0])
    Geocoder::Configuration.timeout = 10
    @country = Geocoder.address(@address[0])
    @url=params['url']   
    @short=request.original_url+SecureRandom.base58(5)
    @shortner=UrlShort.new
    @shortner.url=params["url"]
    @shortner.shorturl=@short
    @shortner.ipaddress=@address[0]
    @shortner.country=@country
    @shortner.clicks=1

    @shortner.save
   end
  else
   @short=nil  
   @url=""
  end
 end
 def redirectToUrl
   @sh=UrlShort.find_by(shorturl: request.original_url)
   if @sh
    @sh.clicks=@sh.clicks+1
    @sh.save
    redirect_to "#{@sh.url}", allow_other_host: true
   else
     render :plain => "Not Available"
   end
 end
 def stats
  @shorts=UrlShort.all
 end
end
