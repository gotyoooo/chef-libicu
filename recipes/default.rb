#
# Cookbook Name:: libicu
# Recipe:: default
# Author:: ken gotoh (lss.ken8927@gmail.com)
#
# Copyright 2015, Ken Gotoh
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include_recipe "build-essential"

version = node['libicu']['version']
prefix = node['libicu']['prefix']

version_underscore = version.sub(/./,"_")

remote_file "#{Chef::Config[:file_cache_path]}/icu4c-#{version_underscore}-src.tgz" do
  source "http://download.icu-project.org/files/icu4c/#{version}/icu4c-#{version_underscore}-src.tgz"
  not_if {::File.exists?("#{prefix}/lib/icu/#{version}")}
  notifies :run, "script[install-libicu]", :immediately
end

script "install-libicu" do
  interpreter "bash"
  only_if {::File.exists?("#{Chef::Config[:file_cache_path]}/icu4c-#{version_underscore}-src.tgz")}
  flags "-e -x"
  code <<-EOH
    cd /usr/local/src
    tar xzf #{Chef::Config[:file_cache_path]}/icu4c-#{version_underscore}-src.tgz
    cd icu/source
    ./configure --prefix=#{prefix}
    make
    make install
  EOH
end

file "libicu-tarball-cleanup" do
  path "#{Chef::Config[:file_cache_path]}/icu4c-#{version_underscore}-src.tgz"
  action :delete
end

