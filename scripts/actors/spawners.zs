// Create a TangoMedkit4Spawner from TangoMedkit, otherwise the spawner doesn't work
class TangoMedkit4Spawner : TangoMedkit{}

// RandomSpawner for or the TangoMedkit or the LifeSphere
class TangoMedkitSpawner : RandomSpawner replaces TangoMedkit
{
   Default
   {
        DropItem "TangoMedkit4Spawner", 255,1;
        DropItem "LifeSphere",255,1;
   }
}
