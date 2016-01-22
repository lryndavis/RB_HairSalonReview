require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/client")
require("./lib/stylist")
require("pg")
require("pry")

DB = PG.connect({:dbname => 'hair_salon_test'})

get('/') do
  erb(:index)
end

get('/stylist_list') do
  @stylists = Stylist.all()
  erb(:stylist_list)
end

get('/client_list') do
  @clients = Client.all()
  erb(:client_list)
end

post('/stylist_list') do
  name = params.fetch("stylist")
  stylist = Stylist.new({:id => nil, :name => name})
  stylist.save()
  @stylists = Stylist.all()
  erb(:stylist_list)
end
