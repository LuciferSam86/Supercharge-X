// Note the original actor name is medIkit, while I'm naming it medkit instead
class TangoMedkit : Medikit replaces Medikit
{
	Default
   {
      Tag "Medkit";
      Inventory.PickupMessage "$TANGO_MEDKIT";
      Health.LowMessage 25, "$TANGO_MEDKIT";
      Inventory.PickupSound "items/health";
   }
	States
	{
	Spawn:
		TMED A -1;
		Stop;
	}
}