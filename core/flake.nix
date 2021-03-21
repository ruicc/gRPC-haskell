{
  description = "grpc-haskell-core";

  outputs = { self }:
    let
      grpc-haskell-set = (import ../release.nix);
    in
      {
        packages.x86_64-linux.grpc-haskell-core = grpc-haskell-set.grpc-haskell-core-linux;
        packages.x86_64-darwin.grpc-haskell-core = grpc-haskell-set.grpc-haskell-core-darwin;

        packages.x86_64-linux.grpc = grpc-haskell-set.grpc-linux;
        packages.x86_64-darwin.grpc = grpc-haskell-set.grpc-darwin;

        defaultPackage.x86_64-linux = self.packages.x86_64-linux.grpc-haskell-core;
        defaultPackage.x86_64-darwin = self.packages.x86_64-darwin.grpc-haskell-core;
      };
}
