{user, ...}: {
  hardware.i2c.enable = true;
  users.users.${user}.extraGroups = ["i2c"];
}
