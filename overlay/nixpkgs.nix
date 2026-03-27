final: prev:

{
  haskellPackages = prev.haskellPackages.extend (self: super: {
    prelude = self.callCabal2nix "prelude" ./../. {};
  });
}
