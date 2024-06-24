{
  description = "Pentest lab stuff";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:zebreus/nixpkgs/fix-autopsy";
    old-nixpkgs.url = "github:nixos/nixpkgs/21.11";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      old-nixpkgs,
    }:
    flake-utils.lib.eachDefaultSystem (system: rec {
      pkgs = import nixpkgs { inherit system; };
      old-pkgs = import old-nixpkgs { inherit system; };

      name = "hacker-contest-qualification";
      packages.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          (pkgs.python3.withPackages (python-pkgs: [
            python-pkgs.beautifulsoup4
            python-pkgs.types-beautifulsoup4
            python-pkgs.random2
            python-pkgs.requests
            python-pkgs.lxml
            python-pkgs.lxml-stubs
          ]))
          (old-pkgs.python2.withPackages (python-pkgs: [ python-pkgs.requests ]))
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
          joomscan
          dirb
          dirbuster
          gospider
          thc-hydra
          john
          sqlmap
          wprecon
          wpscan
          deno
          wfuzz
        ];
      };
    });
}
