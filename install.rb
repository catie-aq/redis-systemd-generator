require 'erb'
require 'fileutils'

@name = ARGV[0] 

p "Installing the configuration file"
`sudo cp generated/redis-#{@name}.conf /etc/redis/redis-#{@name}.conf`

p "Installing the service file"
`sudo cp generated/redis-#{@name}.service /usr/lib/systemd/system/redis-#{@name}.service`

p "Enable & start the service"
`sudo systemctl daemon-reload`
`sudo systemctl start redis-#{@name}`
`sudo systemctl enable redis-#{@name}`

