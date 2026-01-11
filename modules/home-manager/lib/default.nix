{config}: let
  repoRoot = ../../..;
  repoConfigs = repoRoot + "/configs";
  repoConfigPath = rel: repoConfigs + "/${rel}";

  dotRoot = "${config.home.homeDirectory}/.dots";
  dotConfigs = "${dotRoot}/configs";
  dotConfigPath = rel: "${dotConfigs}/${rel}";
in {
  inherit repoRoot repoConfigs dotRoot dotConfigs;

  linkFile = rel: config.lib.file.mkOutOfStoreSymlink (dotConfigPath rel);
  linkDir = rel: {
    source = config.lib.file.mkOutOfStoreSymlink (dotConfigPath rel);
    recursive = true;
  };

  configPath = dotConfigPath;
  repoPath = repoConfigPath;
  readConfig = rel: builtins.readFile (repoConfigPath rel);
}
