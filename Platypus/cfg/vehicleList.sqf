//Syntax for entries:
//["name to be shown in list", "vehicle_class_name", cp_cost, {array of functions to be executed with the vehicle as only argument}],
vehicleList = []
  ["Small Transport Truck 1 (seats 6)", "I_G_Offroad_01_F", 4, {}],
  ["Small Transport Truck 2 (seats 9)", "I_G_Van_01_transport_F", 6, {}],
  ["Hunter Unarmed", "B_MRAP_01_F", 5, {}],
  ["Hunter HMG", "B_MRAP_01_hmg_F", 18, {}],
  ["Hunter GMG", "B_MRAP_01_gmg_F", 25, {}],
  ["AMV-7 Marshall", "B_APC_Wheeled_01_cannon_F", 35, {}],
  ["HEMTT Transport Covered", "B_Truck_01_covered_F", 8, {}],
  ["AH-9 Pawnee ", "B_Heli_Light_01_armed_F", 25, {}],
  ["AH-99 Blackfoot", "B_Heli_Attack_01_F", 45, {}],
  ["MH-9 Hummingbird", "B_Heli_Light_01_F", 15, {}],
  ["M-900 Civilian Copter", "C_Heli_Light_01_civil_F", 12, {}],
  ["Mi-290Black Taru Sling", "O_Heli_Transport_04_F", 18, {
    {_this execVM "\a3\Air_F_Heli\Heli_Transport_04\Scripts\Heli_Transport_04_basic_black.sqf";}}
  ],
  ["UH-80 Ghosthawk", "B_Heli_Transport_01_F", 22, {}],
  ["CH-67 Huron", "B_Heli_Transport_03_F", 26, {}],
  ["IFV-6c Panther", "B_APC_Tracked_01_rcws_F", 25, {}],
  ["ATV", "B_Quadbike_01_F", 1, {}],
  ["IFV-6c Cheetah", "B_APC_Tracked_01_AA_F", 30, {}],
  ["M2A1 Slammer", "B_MBT_01_cannon_F", 40, {}],
  ["CRV-6e Bobcat", "B_APC_Tracked_01_CRV_F", 28, {}],
  ["SF SUV", "C_Offroad_01_F", 2, {
    { sleep 1;
      _this setObjectTexture {0, "#(argb,8,8,3)color(0.141,0.118,0.082,1)"};
      _this animate ["Hidepolice", 1};
      _this animate ["Hideservices", 1};
      _this animate ["Hidebackpacks", 0};
      _this animate ["Hidebumper1", 0};
      _this animate ["Hidebumper2", 0};
      _this animate ["Hideconstruction", 0};
      _this animate ["Hidedoor1", 1};
      _this animate ["Hidedoor2", 1};
      _this animate ["Hidedoor3", 1};
      _this animate ["Hideglass2", 1};
    }}
  ],
  ["MLRS Artillery ", "B_MBT_01_mlrs_F", 75, {}],
  ["Scorcher Artillery ", "B_MBT_01_arty_F", 75, {}],
  ["Fuel Truck ", "B_G_Van_01_fuel_F", 10, {}],
  ["BUY ONLY AT AIRPORTS A-164 CAS", "B_Plane_CAS_01_F", 45, {}],
  ["M2A4 SlammerUP", "B_MBT_01_TUSK_F", 40, {}],
  ["Stomper RCWS Autonomous", "B_UGV_01_rcws_F", 20, {}],
  ["Stomper Autonomous Recon", "B_UGV_01_F", 10, {}],
  ["UAV GreyHawk w/ATG Missiles", "B_UAV_02_F", 15, {}],
  ["UAV GreyHawk w/Bombs", "B_UAV_02_CAS_F", 15, {}],
  ["UAV Darter", "B_UAV_01_F", 5, {}],
  ["HEMTT Medical", "B_T_Truck_01_medical_F", 10, {
      _this setVariable ["ace_medical_isMedicalVehicle", true];
    }
  ]
];
