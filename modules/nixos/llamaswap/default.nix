{
  pkgs,
  lib,
  ...
}: {
  services.llama-swap = {
    enable = true;
    port = 11344;
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
        "nemo" = {
          cmd = "${llama-server} --port \${PORT} -hf unsloth/Nemotron-3-Nano-30B-A3B-GGUF:Q8_0 --fit-target 1024";
          inherit env;
        };
        "code" = {
          cmd = "${llama-server} --port \${PORT} -hf unsloth/Qwen3-Coder-30B-A3B-Instruct-GGUF:Q8_K_XL --fit-target 1024";
          inherit env;
        };
        "gpt" = {
          cmd = "${llama-server} --port \${PORT} -hf DavidAU/OpenAi-GPT-oss-20b-HERETIC-uncensored-NEO-Imatrix-gguf:Q8_0 --fit-target 1024";
          inherit env;
        };
      };
    };
  };
  systemd.services.llama-swap.serviceConfig.CacheDirectory = "llama-swap";
}
