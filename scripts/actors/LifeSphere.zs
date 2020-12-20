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