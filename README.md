appserver Cookbook
==================
This is a Tomcat / Jenkins App Server.  This cookbook stands up a server with Oracle JDK 7, Tomcat, and Jenkins.

Requirements
------------
Currently this cookbook only seems to work on Debian Systems (tested on Ubuntu-14.04).

e.g.
#### packages
- `java` - appserver needs java to run / build apps
- `tomcat` - appserver needs tomcat to run your apps
- `maven` - appserver needs maven to build your apps
- `jenkins` - appserver needs jenkins to CI your code

Attributes
----------
N/A: It's all stock for now.

e.g.
#### appserver::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['appserver']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### appserver::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `appserver` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[appserver]"
  ]
}
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: List authors
