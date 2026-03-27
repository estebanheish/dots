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
                  "DGGML_HIP_ROCWMMA_FATTN=ON"
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
          "qwen" = {
            cmd = ''
              ${llama-server}
              --port ''${PORT}
              -hf unsloth/Qwen3.5-35B-A3B-GGUF:UD-Q8_K_XL
              --fit-target 2048
              --temp 1.0
              --top-p 0.95
              --top-k 20
              --min-p 0.0
              --presence-penalty 1.5
              --repeat-penalty 1.0
            '';
            inherit env;
          };
          "qwen_instruct" = {
            cmd = ''
              ${llama-server}
              --port ''${PORT}
              -hf unsloth/Qwen3.5-35B-A3B-GGUF:UD-Q8_K_XL
              --fit-target 2048
              --temp 0.7
              --top-p 0.8
              --top-k 20
              --min-p 0.0
              --presence-penalty 1.5
              --repeat-penalty 1.0
              --chat-template-kwargs '{"enable_thinking":false}'
            '';
            inherit env;
          };
          "qwentiny" = {
            cmd = "${llama-server} --port \${PORT} -hf unsloth/Qwen3.5-9B-GGUF:UD-Q8_K_XL --fit-target 2048";
            inherit env;
          };
          "glm" = {
            cmd = "${llama-server} --port \${PORT} -hf unsloth/GLM-4.7-Flash-GGUF:Q8_0 --fit-target 2048 --temp 1.0 --top-p 0.95 --repeat-penalty 1.0 --ctx-size 131072 --cache-type-k q8_0 --cache-type-v q8_0";
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
