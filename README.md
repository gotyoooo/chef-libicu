libicu Cookbook
============
* Installs libicu from source
* ICU of the description is here [ICU - International Components for Unicode](http://site.icu-project.org)

Requirements
------------
### Platforms
- Linux (test by CentOS6)

#### cookbook
- build-essential

Attributes
----------
* `node['libicu']['version']` - version of libicu.
* `node['libicu']['prefix']`  - prefix of install path.

Usage
-----
Just include `libicu` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[libicu]"
  ]
}
```

License and Authors
-------------------
* Author:: ken gotoh (lss.ken8927@gmail.com)

```text
Copyright 2015, Ken Gotoh

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```