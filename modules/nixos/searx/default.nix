{...}: {
  services.searx = {
    enable = true;
    settings = {
      search.formats = ["json" "html"];
      server.secret_key = "clank";
    };
  };
}
