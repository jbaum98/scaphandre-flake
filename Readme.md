# Scaphandre flake

This is a [nix](https://nixos.org/) flake for [Scaphandre](https://github.com/hubblo-org/scaphandre)

To drop into a shell with `scaphandre` available, run
```sh
nix shell "github:mmai/scaphandre-flake"
```
Alternatively, you can use your local version of nixpkgs, which may trigger a rebuild but will not require downloading a copy of nixpkgs at the version pinned in this repository:
```sh
nix shell "github:mmai/scaphandre-flake" --override-input nixpkgs nixpkgs
```
