{
    pkgs ? import <nixpkgs> {}
}:
let 
    nodeDependencies = (pkgs.callPackage ./rose-pine-build/default.nix {}).nodeDependencies;
in
pkgs.mkShell {
    name = "rose-pine-nixos-tty";
    nativeBuildInputs = [
        pkgs.nodejs
    ];
    buildPhase = ''
        ln -s ${nodeDependencies}/lib/node_modules ./node_modules
        export PATH="${nodeDependencies}/bin:$PATH"
    '';
}
