# Define a user account. Don't forget to set a password with ‘passwd’.
# Change "olma" with your own username, the description can be whatever you want.

{ config, ... }: {

    users.users."olma" = {
    isNormalUser = true;
    description = "Olma";
    extraGroups = [ "networkmanager" "wheel" ]; 
  }; 

}
