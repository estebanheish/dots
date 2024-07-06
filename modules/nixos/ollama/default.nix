{...}: {
  services.ollama = {
    enable = true;
    acceleration = "rocm";
  };
  services.open-webui = {
    enable = true;
    port = 11111;
    openFirewall = true;
    environment = {
      OLLAMA_API_BASE_URL = "http://localhost:11434";
      WEBUI_AUTH = "False";
    };
  };
}
