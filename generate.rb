require 'erb'
require 'fileutils'

folder_name = 'generated'

FileUtils.mkdir_p folder_name

CHARS = ('0'..'9').to_a + ('A'..'Z').to_a + ('a'..'z').to_a
def random_password(length=10)
  CHARS.sort_by { rand }.join[0...length]
end

@name, @port, @pass = ARGV 

@name = random_password(4)         if @name.nil?
@port = 8000 + (rand * 1000).to_i  if @port.nil?
@pass = random_password(45)        if @pass.nil?

p "Creating for @name: #{@name}, with @port: #{@port}, and password: #{@pass}"

service = File.read("redis.service.erb")
conf =    File.read("redis.conf.erb")

service_gen = ERB.new(service).result()
conf_gen =    ERB.new(conf).result()

File.write("#{folder_name}/redis-#{@name}.service",   service_gen)
File.write("#{folder_name}/redis-#{@name}.conf", conf_gen)

p "Connections will be like this after install (for data.peac2h.io host):" 
p "redis-cli -h data.peac2h.io -p #{@port} -a '#{@pass}'