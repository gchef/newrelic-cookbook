install = (node[:newrelic][:action] == "install")
wan_up = `ping -c 1 -W 1 8.8.8.8`.index(/1 (?:packets )?received/)

apt_repository "newrelic" do
  uri "http://download.newrelic.com/debian"
  distribution "newrelic"
  components %w[non-free]
  keyserver "subkeys.pgp.net"
  key "548C16BF"
  action (wan_up && install ? :add : :remove)
end

package "newrelic-sysmond" do
  action (wan_up && install ? :install : :purge)
end

service "newrelic-sysmond"

if install
  template "nrsysmond.cfg" do
    path "#{node[:newrelic][:dir]}/nrsysmond.cfg"
    owner "root"
    group "root"
    mode "0644"
    backup false
    notifies :restart, resources(:service => "newrelic-sysmond"), :delayed
  end
else
  directory "#{node[:newrelic][:dir]}" do
    action :delete
    recursive true
  end
end

service "newrelic-sysmond" do
  supports :status => true, :restart => true, :reload => true
  action (wan_up && install ? [:enable, :start] : [:disable, :stop])
  only_if "[ -e /etc/init.d/newrelic-sysmond ]"
end

file "/etc/init.d/newrelic-sysmond" do
  action :delete
  not_if { install }
end

user "newrelic" do
  action :remove
  not_if { install }
end
