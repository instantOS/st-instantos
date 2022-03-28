#! /usr/bin/env nix-shell
#! nix-shell --pure shell.nix

{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
    buildInputs = with pkgs; [
    gnumake pkg-config
    xorg.libX11.dev
    xorg.libXft
    xorg.libXinerama
    xorg.libXcursor
    freetype
    harfbuzz ];

    shellHook = ''
    export SSH_AUTH_SOCK=/run/user/$UID/keyring/ssh
    export GIT_SSL_CAINFO=/etc/ssl/certs/ca-certificates.crt
    export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
  '';
}