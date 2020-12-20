class LifeSphere : Inventory
{
    Default
    {
        Inventory.MaxAmount 10; // 10 should be enough
        Inventory.PickupMessage "$LIFESPHERE" ;
        +INVENTORY.UNDROPPABLE
        scale 0.70;
    }
    States
	{
	Spawn:
		XLIF ABCD 6 Bright;
		Loop;
	}
}

// Define an invulnerability powerup
class GodOneUp : PowerUpGiver
{
    Default
    {
        +INVENTORY.AUTOACTIVATE
        +INVENTORY.ALWAYSPICKUP
        
        // 10 seconds . If negative is second, otherwise ticks (1/35 seconds)
        powerup.duration -10;
        
        // Define the type of powerup (read zdoom wiki)
        Powerup.Type "PowerInvulnerable";
        
         // Color the screen while the powerup is active
        Powerup.Color "Grey";
    }
}
