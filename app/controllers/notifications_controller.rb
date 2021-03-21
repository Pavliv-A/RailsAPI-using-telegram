class NotificationsController < ApplicationController
  require 'net/http'

  def index
    @result = Result.all
    @index = params[:index].to_i
  end

  def best_result
    index = params[:index].to_i
    best_result = sort_results(index)
    if best_result.nil?
      flash[:alert] = 'No more results'
    else
      send_push(best_result)
    end
    redirect_to root_path(index: index + 1)
  end

  private

  def send_push(best_result)
    my_token = 'BOT_TOKEN'
    my_id = 'telegram_id'
    uri = URI('https://api.telegram.org/')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    url = "https://api.telegram.org/#{my_token}/sendMessage?chat_id=#{my_id}&text="
    req = Net::HTTP::Post.new(url + best_result.to_s)
    http.request(req)
  end

  def sort_results(index)
    all_results = []
    results = Result.all
    results.each do |result|
      all_results << { result: result.result, name: result.sportsman_name }
    end
    all_results.sort_by { |result| result[:result] }[index]
  end
end
