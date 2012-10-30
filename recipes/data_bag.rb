#
# Cookbook Name:: group
# Recipe:: databag
#
# Copyright 2012, Blue Box Group, LLC
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
#

bag = group_data_bag = node["group"]["data_bag_name"]
groups = Array(node["groups"])

# only manage the subset of groups specified in the node attrs
groups.each do |g|
  group = data_bag_item(bag, g)
  group_name = group['group_name'] || group['id']
  group_account group_name do
    %w{ group_name gid members append system }.each do |attr|
      send(attr, group[attr]) if group[attr]
    end
    action group['action'].to_sym if group['action']
  end
end
