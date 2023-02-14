{
  description = "Scaphandre";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/release-22.11";

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "i686-linux" "aarch64-linux" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
      # Memoize nixpkgs for different platforms for efficiency.
      nixpkgsFor = forAllSystems (system:
        import nixpkgs {
          inherit system;
          overlays = [ self.overlay ];
        }
      );
    in
    {
      overlay = final: prev: {
        scaphandre = prev.callPackage ./deriv.nix {};
      };

      packages = forAllSystems (system: {
        inherit (nixpkgsFor.${system}) scaphandre;
      });

      defaultPackage = forAllSystems (system: self.packages.${system}.scaphandre);

      # devShell = forAllSystems (system: (import ./shell.nix { pkgs = nixpkgs.legacyPackages.${system}; }));

      # scaphandre service module
      # nixosModule = (import ./module.nix);

    };
}
