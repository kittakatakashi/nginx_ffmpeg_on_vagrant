Vagrant.configure("2") do |config|
  # config.vm.box = "bento/centos-7.2"
  config.vm.box = "tdenny/ffmpeg-box"

  config.vm.network "public_network", :ip => "192.168.0.100" , :bridge => "en0: Wi-Fi (AirPort)"
  # or
  #config.vm.network "private_network", ip: "192.168.0.100"
  config.vm.synced_folder "./", "/vagrant", type: "virtualbox", :owner => "vagrant", :groupe => "vagrant", :mount_options => ['dmode=755', 'fmode=644']
  config.vm.provision "shell", :path => "build.sh", run: "always"
end
