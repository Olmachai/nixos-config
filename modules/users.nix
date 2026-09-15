# Define a user account. Don't forget to set a password with ‘passwd’.

{ config, ... }: {

    users.users."olma" = {
    isNormalUser = true;
    description = "Olma";
    extraGroups = [ "networkmanager" "wheel" ]; 
  }; 

}