{
  description = "SisyphusOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    # nix-index-database.url = "github:nix-community/nix-index-database";
    # nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
    ags.url = "github:Aylur/ags";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      host = "liam-lptp";
      username = "liam";
      modsPath = (self + "/modules");
      sysModsPath = (modsPath + "/system");
      pkgsPath = (sysModsPath + "/pkgs");
      homeModsPath = (modsPath + "/home-manager");
      programsPath = (homeModsPath + "/programs");
      configPath = (homeModsPath + "/config");
      wallpapersPath = (configPath + "/wallpapers");
      scriptsPath = (self + "/scripts");
      hostsPath = (self + "/hosts");

      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };
    in {
      nixosConfigurations = {
        "${host}" = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit system;
            inherit inputs;
            inherit username;
            inherit host;
            inherit modsPath;
            inherit sysModsPath;
            inherit pkgsPath;
            inherit homeModsPath;
            inherit programsPath;
            inherit configPath;
            inherit wallpapersPath;
            inherit scriptsPath;
            inherit hostsPath;
          };
          modules = [
            ./hosts/${host}/config.nix
            inputs.stylix.nixosModules.stylix
            # inputs.nix-index-database.nixosModules.nix-index
            inputs.chaotic.nixosModules.default
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = {
                inherit username;
                inherit inputs;
                inherit host;
                inherit modsPath;
                inherit sysModsPath;
                inherit pkgsPath;
                inherit homeModsPath;
                inherit programsPath;
                inherit configPath;
                inherit wallpapersPath;
                inherit scriptsPath;
                inherit hostsPath;
              };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.users.${username} = import ./hosts/${host}/home.nix;
            }
          ];
        };
      };
    };
}
