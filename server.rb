#set :views, File.dirname(__FILE__) + '/views'
require 'sinatra'
require 'csv'
require 'pry'
require 'shotgun'



before do
  @teams = {}

 CSV.foreach('roster.csv', headers: true) do |row|

    if @teams[row[3]].is_a?(Array)
        @teams[row[3]] << {
        first: row[0],
        last: row[1],
        position: row[2]
    }
    else
        @teams[row[3]] = []
        @teams[row[3]] << {
        first: row[0],
        last: row[1],
        position: row[2]
      }
    end
end
  @team_names = @teams.keys
end

get '/' do
  erb :index
end

get '/:team' do
  @name = params[:team]
  erb :teams
end

set :views_folder, File.dirname(__FILE__) + '/views'





