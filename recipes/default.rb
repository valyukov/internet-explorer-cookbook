include_recipe 'windows'

::Chef::Recipe.send(:include, Chef::Mixin::PowershellOut)

cmd = powershell_out("(Get-Command \'C:\\Program Files\\Internet Explorer\\iexplore.exe\').FileVersionInfo.ProductVersion")
log "Full current IE version: #{cmd.stdout.chomp}"

version = cmd.stdout.chomp.split('.').first.to_i
log "Current IE version: #{version}"

if node[:ie][:version] < version
  fail 'Recipe can\'t downgrade internet explorer'
end

unless node[:ie][:installer][:pkg].nil?
  installer_pkg = "#{Chef::Config[:file_cache_path]}/ie_installer_#{node[:ie][:version]}.exe"
  remote_file "#{Chef::Config[:file_cache_path]}/ie_installer_#{node[:ie][:version]}.exe" do
    source node[:ie][:installer][:pkg]
    action :create
    not_if { version.eql?(node[:ie][:version]) }
  end
  batch 'install_internet_explorer' do
    code "#{installer_pkg} #{node[:ie][:installer][:args]}"
    notifies :request, 'windows_reboot[30]', :delayed
    not_if { version.eql?(node[:ie][:version]) }
    returns 3010
  end
end

windows_reboot 30 do
  reason "Update Internet Explorer #{node[:ie][:version]}"
  action :nothing
end
