class Platypus {
  class Functions {
    tag = "Platypus"
    file = "platypus\functions";
    class findUrbanZones { description = "Returns a list of locations corresponding to the most urban areas on the map, slightly randomised" };
    class currentBuilding { description = "Returns the building the player is currently inside, determined as the closest building IF that building intersects their modelToWorldVisual" };
    class spawnCCP { description = "Attempts to place a CCP in the player's current building, consuming one PAK if successful" };
    class initCCPAction { description = "Sets up the CCP action"; preInit = 1 };
    class interpolate {};
    class generateSideMissionName {};
    class getRandomCallsign {};
    class showFirstLaunchHelp {};
    class addDiaryEntries {};
    /*class initAmmoBox {};*/
  };
};
