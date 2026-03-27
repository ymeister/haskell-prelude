{
  source-repository-packages = {
    prelude = ./../.;

    higher-kinded = ./../deps/higher-kinded/higher-kinded;
    higher-kinded-data = ./../deps/higher-kinded/higher-kinded-data;
    higher-kinded-types = ./../deps/higher-kinded/higher-kinded-types;
  };

  extraCabalProject = [
    (builtins.readFile ./../cabal.project.config)
  ];
}
