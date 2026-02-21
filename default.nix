{ pkgs ? import <nixpkgs> {} }:

let
  # Ensure we use the same version as our shell.nix
  beamPackages = pkgs.beam.packagesWith pkgs.erlang_27;
  pname = "hodgepodge";
  version = "0.0.1";
  src = ./hodgepodge/.;
in
beamPackages.mixRelease {
  inherit pname version src;

  # 1. Dependency Management
  # Nix builds are "sandboxed" (no internet). 
  # You'll need to run 'nix-build' once, let it fail, 
  # and copy the 'got: sha256-...' hash into the 'hash' field below.
  mixFodDeps = beamPackages.fetchMixDeps {
    pname = "${pname}-deps";
    inherit version src;
    hash = "sha256-QbBJ50vHiBUUrdtG1zXIApSyaqQ1yGj/vJPoZxHHb98="; 
  };

  # 2. Build Environment
  MIX_ENV = "prod";

  # 3. Post-Build: Generate Swagger Specs
  # If you want to bake the JSON swagger file into the build output
  postBuild = ''
    # Optional: run a mix task here if you have a generator
  '';

  # 4. Installation
  # This creates a self-contained executable in $out/bin/my_api
  installPhase = ''
    mix do compile, release --path $out
  '';

  meta = with pkgs.lib; {
    description = "Self-contained Phoenix API with Postgres support";
    platforms = platforms.unix;
  };
}