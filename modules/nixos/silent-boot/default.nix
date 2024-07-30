{...}: {
  boot = {
    initrd.verbose = false;
    consoleLogLevel = 0;
    kernelParams = ["quiet" "udev.log_priority=3"];
  };
}
