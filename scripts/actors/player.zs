class TangoDoomPlayer : DoomPlayer
{
   Default
   {
      Player.DisplayName "Default";
      Player.startItem "TangoPistol";
      Player.startItem "TangoFist";
      Player.StartItem "Clip", 50;
      Player.StartItem "PistolAmmo", 8;
      Player.StartItem "ShotgunAmmo", 8;
      Player.StartItem "AssaultRifleAmmo", 48;
      Player.StartItem "ScrapAmmo", 4;
      Player.StartItem "PlasmaRifleAmmo", 40;
      Player.WeaponSlot 1, "TangoChainsaw", "TangoFist";
      Player.WeaponSlot 2, "TangoPistol";
      Player.WeaponSlot 3, "TangoShotgun", "TangoSuperShotgun";
      Player.WeaponSlot 4, "TangoAssaultRifle", "TangoChaingun", "TangoScrapGun";
      Player.WeaponSlot 5, "TangoStomper", "TangoRocketLauncher";
      Player.WeaponSlot 6, "TangoPlasmaRifle";
      Player.WeaponSlot 7, "TangoBFG9000";
   }
   
	// Override the Die function
    override void Die(Actor source, Actor inflictor, int dmgflags, Name MeansOfDeath)
	{
		// If the player have not Extra lives anymore it dies
        if (!FindInventory("LifeSphere"))
        {
			// Do the standard function (notice the super keyword)
            super.Die(source, inflictor, dmgflags, MeansOfDeath);
        }
	}

	// Override the DamageMobj function
    override int DamageMobj(Actor inflictor, Actor source, int damage, Name mod, int flags, double angle)
	{
		Name prevType = damageType;
		int prevSpecial = special1;

		// get the dagamage from the standard
        int newDam = super.DamageMobj(inflictor, source, damage, mod, flags, angle);

		// if the health and I have still LifeSpheres
        if (health <= 0 && FindInventory("LifeSphere"))
		{
			damageType = prevType;
			special1 = prevSpecial;
         
          //A_PrintBold("You have been ressurected by the life sphere!",0);
			
			// Get the max health for the actor
            health = GetMaxHealth();
			
            // set the health
            player.health = health;
			
            // Take one LifeSphere
            TakeInventory("LifeSphere", 1);
            
            // Give a temporary god mode
            GiveInventory("GodOneUp",1);
            
            // Count how many Life Spheres the player have
            int countLifeSpheres;
            countLifeSpheres = CountInv("LifeSphere");
            string message;
            
            if(countLifeSpheres > 0)
            {  
               // The player has at least 1 sphere
               message = String.Format("\ccYou still have \c[TangoGreen]%i\cc lives",countLifeSpheres);            
            }
            else
            {
               // No more spheres
               message = "\c[TangoRedLight]You have no more lives!";
            }
            
            A_PrintBold(message);
 		}
		return newDam;
	}
   
}

