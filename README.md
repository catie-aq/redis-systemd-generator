# Redis server generation 


## Generate the service 

`ruby generate.rb name port password`

Please save the name and port ! 
You will be able to connect afterward: 

`redis-cli -h host -p  port -a 'password'`

The host could be `localhost` or the name/IP of the server you use.

## Install the service 

`sudo ruby install.rb name`

Test your connection, ex: `redis-cli -h data.peac2h.io -p  8442 -a 'qeMeuaHzad8G6K0gCtlEVLQsr5yAT4FJSk9BDmNhZ'`
