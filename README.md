selenium-liatrio Cookbook
========================
This is a wrapper cookbook that installs selenium with a linux chrome and firefox webdrivers. 

* The main use is for jenkins-liatrio job testing.
* Example rspec chrome and firefox tests exist in /home/vagrant/chrome.rb and firefox.rb which are intended to be used with liatrio/hygieia-dev-unbaked with the spring-petclinic example.

Requirements
------------
Berkshelf

Vagrant

Usage
-----
#### selenium-liatrio::default

`vagrant up`

or 

Just include `selenium-liatrio` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[selenium-liatrio]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Drew Holt <drew@liatrio.com>
