require "sinatra"

get '/' do
  @post = []
  File.open("data.txt","r") do |file|
    file.each_line do |line|
      @post << line
    end
  end
  erb :index
end

post '/create' do
  point = params[:point].to_i
  comment= params[:comment]
  save_file(point:point,comment:comment)
  redirect '/' 
end

def save_file(point:, comment:)
  File.open("data.txt", "a") do |file|
    file.puts "ポイント：#{point}　コメント：#{comment}"
  end
end