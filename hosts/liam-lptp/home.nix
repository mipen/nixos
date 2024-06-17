{ config, pkgs, inputs, username, host, configPath, modsPath, scriptsPath
, programsPath, hostsPath, ... }: {

  imports = [ configPath programsPath ];

  options = { };

  config = {
    
  };
}
