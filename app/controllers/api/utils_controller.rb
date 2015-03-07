# -*- coding: utf-8 -*-

require 'httparty'
require 'uri'


class Api::UtilsController < ApiController

  ##
  # Get the share counts of an url
  #
  def get_share_count
    url_to_share = params[:url]
    return action_is_forbidden if url_to_share.blank?

    begin
      response = ShareCounter.selected url_to_share, [:facebook, :twitter, :googleplus]
    rescue Exception => e
      puts "Aie ! #{e}"
      response = {'facebook' => 0,'twitter' => 0,'googleplus' => 0}
    end

    # FB seems to be not good, so ask FB directly
    begin
      fb_response = HTTParty.get("http://api.facebook.com/restserver.php?method=links.getStats&format=json&urls=#{URI.escape(url_to_share)}")
      response['facebook'] = fb_response[0]['total_count']
    rescue
      puts "Aie ! Unalbe to call FB"
    end

    respond_with do |format|
      format.json { render :json => response }
    end
  end

end
