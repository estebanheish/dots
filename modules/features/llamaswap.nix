{config, ...}: {
  flake.nixosModules.llamaswap = {
    pkgs,
    lib,
    ...
  }: let
    port = 11344;
  in {
    services.llama-swap = {
      enable = true;
      inherit port;
      settings = let
        llama-cpp =
          (pkgs.llama-cpp.override {
            rocmSupport = true;
            blasSupport = true;
            rocmGpuTargets = ["gfx1100"];
          }).overrideAttrs (
            oldAttrs: {
              cmakeFlags =
                (oldAttrs.cmakeFlags or [])
                ++ [
                  "-DGGML_NATIVE=ON"
                  "-DGGML_HIP=ON"
                  "-DGPU_TARGETS=gfx1100"
                  "-DCMAKE_BUILD_TYPE=Release"
                  # "-DGGML_HIP_ROCWMMA_FATTN=ON"
                ];
              preConfigure = ''
                export NIX_ENFORCE_NO_NATIVE=0
                ${oldAttrs.preConfigure or ""}
              '';
            }
          );
        llama-server = lib.getExe' llama-cpp "llama-server";
      in {
        healthCheckTimeout = 1000;
        models = let
          env = [
            "XDG_CACHE_HOME=/var/cache/llama-swap"
            "HIP_VISIBLE_DEVICES=0"
          ];
        in {
          "qwend" = {
            cmd = builtins.concatStringsSep " " [
              "${llama-server}"
              "--port \${PORT}"
              "-hf unsloth/Qwen3.6-27B-GGUF:Q4_K_M"
              "--temp 0.6"
              "--top-p 0.95"
              "--top-k 20"
              "--min-p 0.0"
              "--presence-penalty 0.0"
              "--repeat-penalty 1.0"
              "-ngl 999"
              # "-c 32768"
              "-b 2048"
              "-ub 512"
              "-t 16"
              "-tb 16"
              "--flash-attn on"
              "--cache-type-k q4_0"
              "--cache-type-v q4_0"
              "--jinja"
            ];
            inherit env;
          };
          "qwenf" = {
            cmd = builtins.concatStringsSep " " [
              "${llama-server}"
              "--port \${PORT}"
              "-hf unsloth/Qwen3.6-35B-A3B-GGUF:UD-IQ4_XS"
              "--temp 0.6"
              "--top-p 0.95"
              "--top-k 20"
              "--min-p 0.0"
              "--presence-penalty 0.0"
              "--repeat-penalty 1.0"
              # "--ctx-size 262144"
              "-ngl 999"
              # "-c 65536"
              "-b 2048"
              "-ub 512"
              "-t 16"
              "-tb 16"
              "--flash-attn on"
              "--cache-type-k q8_0"
              "--cache-type-v q8_0"
              "--jinja"
            ];
            inherit env;
          };
          "qwens" = {
            cmd = builtins.concatStringsSep " " [
              "${llama-server}"
              "--port \${PORT}"
              "-hf unsloth/Qwen3.6-27B-GGUF:Q5_K_M"
              "--temp 0.6"
              "--top-p 0.95"
              "--top-k 20"
              "--min-p 0.0"
              "--presence-penalty 0.0"
              "--repeat-penalty 1.0"
              "-ngl 999"
              # "-c 32768"
              "-b 2048"
              "-ub 512"
              "-t 16"
              "-tb 16"
              "--flash-attn on"
              "--cache-type-k q4_0"
              "--cache-type-v q4_0"
              "--jinja"
            ];
            inherit env;
          };
        };
      };
    };
    systemd.services.llama-swap.serviceConfig.CacheDirectory = "llama-swap";

    home-manager.users.${config.username} = {
      xdg.desktopEntries.llama-swap = {
        name = "llama-swap WebUI";
        exec = "xdg-open http://localhost:11344";
        terminal = false;
      };
    };
  };
}
