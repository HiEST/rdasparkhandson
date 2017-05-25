```
MBP:virtualbox dcarrera$ vboxmanage list vms
"tiacos-environment_tiacos_1486544985047_75797" {0b6f0f86-3a0f-4530-a0b6-6312cc926d10}
```

```
vagrant package --base tiacos-environment_tiacos_1486544985047_75797 --output tiacos_base.0.1.box
==> tiacos-environment_tiacos_1486544985047_75797: Exporting VM...
==> tiacos-environment_tiacos_1486544985047_75797: Compressing package to: /Users/dcarrera/Desktop/tiacos-environment/tiacos_base.0.1.box
```

To upload, you need to create first a new release, and then create a provider (without uploading an image). After that, it can be uploaded with the API as described below

```
curl 'https://atlas.hashicorp.com/api/v1/box/USERNAME/tiacos/version/0.3/provider/virtualbox/upload?access_token=<token>
```
Following the steps of:
https://atlas.hashicorp.com/help/vagrant/boxes/create
