{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/dd9f73e7d34486b09b966738ace161e621a0480b";
  };

  outputs = { self, nixpkgs }:
    let
      grpc-haskell-attrs = (import ./release.nix);
    in
      {
        packages.x86_64-linux.grpc-haskell-core = grpc-haskell-attrs.grpc-haskell-core-linux;
        packages.x86_64-darwin.grpc-haskell-core = grpc-haskell-attrs.grpc-haskell-core-darwin;

        packages.x86_64-linux.grpc-haskell = grpc-haskell-attrs.grpc-haskell-linux;
        packages.x86_64-darwin.grpc-haskell = grpc-haskell-attrs.grpc-haskell-darwin;

        packages.x86_64-linux.grpc-haskell-no-tests = grpc-haskell-attrs.grpc-haskell-no-tests-linux;
        packages.x86_64-darwin.grpc-haskell-no-tests = grpc-haskell-attrs.grpc-haskell-no-tests-darwin;

        packages.x86_64-linux.grpc = grpc-haskell-attrs.grpc-linux;
        packages.x86_64-darwin.grpc = grpc-haskell-attrs.grpc-darwin;

        defaultPackage.x86_64-linux = self.packages.x86_64-linux.grpc-haskell-no-tests;
        defaultPackage.x86_64-darwin = self.packages.x86_64-darwin.grpc-haskell-no-tests;
      };
}
