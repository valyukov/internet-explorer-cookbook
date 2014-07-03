[![Build Status](https://travis-ci.org/valyukov/internet-explorer-cookbook.svg?branch=master)](https://travis-ci.org/valyukov/internet-explorer-cookbook)

internet-explorer cookbook
==========================
Setup internet explorer on windows


Requirements
------------
Windows 2008 R2
 

Attributes
----------
#### internet-explorer::default
<table>
  <tr>
    <th>node[:ie][:version]</th>
    <th>Integer</th>
    <th>Internet Explorer version to install</th>
    <th>8</th>
  </tr>
</table>

Usage
-----
#### internet-explorer::default
Install on node internet explorer ```node[:ie][:version]``` 

#### internet-explorer::all_zone_protect_mode
This recipe set equal security level to all zones , it needed for correctly work selenium-cluster cookbook

#### internet-explorer::disable_auto_update
Disable internet explorer auto updating 

#### internet-explorer::disable_esc
Disable internet explorer Enhanced Security Configuration (this work only on server version of windows)

#### internet-explorer::disable_first_run_customize
Disable internet explorer first run customization 


Contributing
------------

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: List authors
