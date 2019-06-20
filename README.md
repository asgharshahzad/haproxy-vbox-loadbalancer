# Virtual machine setup using Vagrant and Oracle VirtualBox
Following setup was done using MacOS Mojave 10.14.5 please use the same operating system to create the environment.

Please make sure this folder contains the following files
1. `Makefile`
2. `README.md`
3. `Vagrantfile`
4. `proxy_bootstrap.sh`
5. `web1_bootstrap.sh`
6. `web2_bootstrap.sh`
7. `test.sh`

## Prerequisites
1. Download and install Oracle VirtualBox 6.x [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. Download and install Vagrant 2.2.4 [Vagrant](https://www.vagrantup.com/downloads.html)

## Setting up and destroying environment
Make sure you are connected to internet as this setup will download and install Apache and HAProxy servers.
Open Terminal here in this folder, and from command line do the following,
1. To setup environment type and hit enter - `make build`
2. To destroy environment type and hit enter - `make destroy`

Note: Above build command should automatically download CentOS 7.x from [Vagrant Cloud](https://vagrantcloud.com/centos/boxes/7/versions/1902.01/providers/virtualbox.box), but if you see any errors then please add box manually using the following command.
After this you can go back to step 1 in this section to deploy environment.
- At the command line type and hit enter - `vagrant box add "centos/7" --provider virtualbox`

## Testing
There are three servers in this setup, all of them were build using CentOS 7.x.
- Proxy - `HAProxy Running on 192.168.0.100`
- Web1 - `Apache Web Server running on 192.168.0.101`
- Web2 - `Apache Web Server running on 192.168.0.102`

- `test.sh` is included in the package. Please do the following to make it executable and run tests.
- Type and hit enter - `chmod +x test.sh` - To test the setup, run "make build", and when environment is up and running and do the following on your terminal
- `./test.sh` - This script will perform curl every second to the load balancer, and this should return "Hello World! from web server 1 or 2, depending which backend server you are connected with.
- Using VirtualBox UI shutdown one backend server and try the above command again, it should work properly. This time response will be from the running server. You can shutdown and bring servers back online to fully test the load balancer.