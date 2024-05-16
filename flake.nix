{
  description = "Pentest lab stuff";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:zebreus/nixpkgs/fix-autopsy";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        rec {
          pkgs = import nixpkgs {
            inherit system;
          };

          name = "hacker-contest-qualification";
          packages.default = pkgs.mkShell {
            buildInputs = with pkgs; [
              python3
              gnumake
              nixpkgs-fmt
              nil
              jq
              curl
              autopsy
              perl
              sleuthkit
              testdisk
              imagemagick
              nmap
              bash
              metasploit
              armitage
            ];
          };
        }
      );
}
