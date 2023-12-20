## standalone home-manager
```shell
sh <(curl -L https://nixos.org/nix/install) --daemon # install nix
nix run home-manager/master -- switch --flake github:estebanheish/dots --impure
```
