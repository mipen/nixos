####Install:
Create new host/decide which host is going to be used.

Run below command inside the host directory:
```
nixos-generate-config --show-hardware-config > hosts/<your-desired-hostname>/hardware.nix
```
Edit `flake.nix` and change the host variable to the host that will be used.
Run the below:
```
NIX_CONFIG="experimental-features = nix-command flakes" 
sudo nixos-rebuild switch --flake .#hostname
```
