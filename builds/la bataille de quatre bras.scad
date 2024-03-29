
include <../oobt_lib.scad>

make_tray = 1;
make_layer = 0;

default_tray_dimensions_xy = [250, 230];
default_text_size = [7,3.5,3.5];

default_text_font = [
                    "TeX Gyre Schola:style=Bold",
                    "TeX Gyre Schola:style=Bold",
                    "TeX Gyre Schola:style=Bold"
                    ];

qb_cover_text_parms = 
        [TEXT_PARMS_KV,
            [POSITION_XY, [default_tray_dimensions_xy.x/2/U-1.5, default_tray_dimensions_xy.y/2/U -1]],
            [TEXT_SIZE_N, 10],
            [TEXT_VALIGN_STR, "center"]
        ];

qb_tray_text_parms = 
        [TEXT_PARMS_KV,
            [POSITION_XY, [0, .1]],
            [TEXT_SIZE_N, 6],
            [TEXT_VALIGN_STR, "bottom"],
            [TEXT_HALIGN_STR, "left"]
        ];  

qb_tray_french_text_parms = 
        [TEXT_PARMS_KV,
            [POSITION_XY, [0, 0.1]],
            [TEXT_SIZE_N, 6],
            [TEXT_VALIGN_STR, "bottom"],
            [TEXT_HALIGN_STR, "left"]
        ];               

qb_title_low_countries = "The Army of the Low Countries";
qb_title_north = "L’Armée du Nord";

///////////////////////////////////////////

Make( QB_DATA );

QB_DATA = [

    [TRAY_KV,
        [TITLE_STR, "La Bataille des Quatre Bras"],
        qb_cover_text_parms,
    ],

	[TRAY_KV,
        [TITLE_STR, qb_title_low_countries],
        qb_tray_text_parms,

        [BLOCK_KV,
           // [DISABLED_B, true],
    //        [TITLE_STR, "Army Staff"],

            [POSITION_XY, [0,0.5]],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 7]
            ],
        ],
        
		[BLOCK_KV,
           // [DISABLED_B, true],
            [TITLE_STR, "I Corps"],
            [TEXT_PARMS_KV,
                [TEXT_SIZE_N, 5],
            ],
            [POSITION_XY, [13,1.5]],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 2],
            ],
        ],
        
		[BLOCK_KV,
         //   [DISABLED_B, true],
            [TITLE_STR, "1st Inf Div"],            
            [POSITION_XY, [0,3]],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 1],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 4],
                [ROW_DELTA_XY, [1.125,SAME_ROW]],
            ],
            [ROW_KV,
                [TITLE_STR, "1 1"],  

                [ROW_COUNTERS_N, 1],
                [ROW_DELTA_XY, [4.75,SAME_ROW]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 8],
                [ROW_DELTA_XY, [1.125, SAME_ROW]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 1],
                [TITLE_STR, "1 2"],    
                [ROW_DELTA_XY, [-1.125,.25]],            
            ],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 8],
                [ROW_DELTA_XY, [1.125, SAME_ROW]],
            ],
            
        ],

		[BLOCK_KV,
           // [DISABLED_B, true],
            [TITLE_STR, "3rd Inf Div"],            
            [POSITION_XY, [0,6.5]],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 1],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 4],
                [ROW_DELTA_XY, [1.125,SAME_ROW]],
            ],
            [ROW_KV,
                [TITLE_STR, "3 5"],            
                [ROW_COUNTERS_N, 1],
                [ROW_DELTA_XY, [4.75,SAME_ROW]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 8],
                [ROW_DELTA_XY, [1.125, SAME_ROW]],
            ],
            [ROW_KV,
                [TITLE_STR, "3 2"],            
                [ROW_COUNTERS_N, 1],
                [ROW_DELTA_XY, [-1.125,.25]],

            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 9],
                [ROW_DELTA_XY, [1.125, SAME_ROW]],
            ],
            [ROW_KV,
                [TITLE_STR, "3 1"],            
                [ROW_COUNTERS_N, 1],
                [ROW_DELTA_XY, [-1.125,.25]],

            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 7],
                [ROW_DELTA_XY, [1.125, SAME_ROW]],
            ],
                     
        ],
        
        [BLOCK_KV,
            //[DISABLED_B, true],
            [TITLE_STR, "2nd DB Inf Div"],            
            [POSITION_XY, [0.25,11.75]],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 1],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 4],
                [ROW_DELTA_XY, [1.125, SAME_ROW]],
            ],
            [ROW_KV,
                [TITLE_STR, "2 1"],                        
                [ROW_COUNTERS_N, 1],
                [ROW_DELTA_XY, [-1.125,.25]],
            ],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 5],
                [ROW_DELTA_XY, [1.125,SAME_ROW]],
            ],
            [ROW_KV,
                [TITLE_STR, "2 2"],           
                [ROW_COUNTERS_N, 1],
                [ROW_DELTA_XY, [-1.125,0.25]],

            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 6],
                [ROW_DELTA_XY, [1.125,SAME_ROW]],
            ],                   
        ],

		[BLOCK_KV,
           // [DISABLED_B, true],
            [TITLE_STR, "3rd DB Inf Div"],            
            [POSITION_XY, [8.75,11.75]],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 1],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 4],
                [ROW_DELTA_XY, [1.125,SAME_ROW]],
            ],
            [ROW_KV,
                [TITLE_STR, "1 1"],  

                [ROW_COUNTERS_N, 1],
                [ROW_DELTA_XY, [-1.125,.25]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 6],
                [ROW_DELTA_XY, [1.125,SAME_ROW]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 1],
                [TITLE_STR, "1 2"],    
                [ROW_DELTA_XY, [-1.125,.25]],            
            ],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 6],
                [ROW_DELTA_XY, [1.125,SAME_ROW]],
            ],
        ],        

    ],
    
	[TRAY_KV,
     //   [TITLE_STR, qb_title_low_countries],
     //   qb_tray_text_parms,

		[BLOCK_KV,
           // [DISABLED_B, true],
            [TITLE_STR, "II Corps"],
            [TEXT_PARMS_KV,
                [TEXT_SIZE_N, 5],
            ],            
            [POSITION_XY, [0,0.5]],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 2],
            ],
        ],
        
		[BLOCK_KV,
         //   [DISABLED_B, true],
            [TITLE_STR, "2nd Inf Div"],            
            [POSITION_XY, [0,2.75]],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 1],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 4],
                [ROW_DELTA_XY, [1.125,SAME_ROW]],
            ],
            [ROW_KV,
                [TITLE_STR, "2 3"],  

                [ROW_COUNTERS_N, 1],
                [ROW_DELTA_XY, [5, -3]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 4],
                [ROW_DELTA_XY, [1.125, SAME_ROW]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 4],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 3],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 1],
                [TITLE_STR, "2 1"],    
                [ROW_DELTA_XY, [-7.25,-0.25]],            
            ],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 4],
                [ROW_DELTA_XY, [1.125, SAME_ROW]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 4],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 1],
                [TITLE_STR, "2 3H"],    
                [ROW_DELTA_XY, [5,-1.25]],            
            ],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 4],
                [ROW_DELTA_XY, [1.125, SAME_ROW]],
            ],  
                      
            
        ],

        [BLOCK_KV,
         //   [DISABLED_B, true],
            [TITLE_STR, "4th Inf Div"],            
            [POSITION_XY, [12,1.]],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 1],
                [TITLE_STR, "4 4"], 
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 4],
                [ROW_DELTA_XY, [1.125,SAME_ROW]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 3],
                [ROW_DELTA_XY, [0,0]],
            ],
           [ROW_KV,
                [ROW_COUNTERS_N, 2],
                [ROW_DELTA_XY, [0,0]],
            ],
        ],

 [BLOCK_KV,
           // [DISABLED_B, true],
            [TITLE_STR, "Cavalry Corps"],  
            [TEXT_PARMS_KV,
                [TEXT_SIZE_N, 5],
            ],                      
            [POSITION_XY, [0,8.5]],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 1],
            ],
            [ROW_KV,
                            [TITLE_STR, "RHA"],            

                [ROW_COUNTERS_N, 1],
                [ROW_DELTA_XY, [2,SAME_ROW]], 
            ],      
            [ROW_KV,
                [ROW_COUNTERS_N, 12],
                [ROW_DELTA_XY, [1.125,SAME_ROW]], 
            ],      

            [ROW_KV,
               [TITLE_STR, "1"],            
                [ROW_COUNTERS_N, 1],
                [ROW_DELTA_XY, [-1.125,0.25]], 
            ],      
            [ROW_KV,
                [ROW_COUNTERS_N, 4],
                [ROW_DELTA_XY, [1.125,SAME_ROW]],
            ],
            [ROW_KV,
               [TITLE_STR, "2"],            
                [ROW_COUNTERS_N, 1],
                [ROW_DELTA_XY, [4.5,SAME_ROW]],
            ],      
            [ROW_KV,
                [ROW_COUNTERS_N, 3],
                [ROW_DELTA_XY, [1.125,SAME_ROW]], 
            ],    
            [ROW_KV,
               [TITLE_STR, "3"],            
                [ROW_COUNTERS_N, 1],
                [ROW_DELTA_XY, [3.5,SAME_ROW]],
            ],      
            [ROW_KV,
                [ROW_COUNTERS_N, 3],
                [ROW_DELTA_XY, [1.125,SAME_ROW]], 
            ],                
            [ROW_KV,
               [TITLE_STR, "4"],            
                [ROW_COUNTERS_N, 1],
                [ROW_DELTA_XY, [-13.375,0.25]], 
            ],      
            [ROW_KV,
                [ROW_COUNTERS_N, 3],
                [ROW_DELTA_XY, [1.125,SAME_ROW]], 
            ],
            [ROW_KV,
               [TITLE_STR, "5"],            
                [ROW_COUNTERS_N, 1],
                [ROW_DELTA_XY, [3.5,SAME_ROW]], 
            ],      
            [ROW_KV,
                [ROW_COUNTERS_N, 2],
                [ROW_DELTA_XY, [1.125,SAME_ROW]], 
            ],                       
            [ROW_KV,
               [TITLE_STR, "6"],            
                [ROW_COUNTERS_N, 1],
                [ROW_DELTA_XY, [2.5,SAME_ROW]],   
            ],                  
            [ROW_KV,
                [ROW_COUNTERS_N, 3],
                [ROW_DELTA_XY, [1.125,SAME_ROW]], 
            ],    
           [ROW_KV,
               [TITLE_STR, "7"],            
                [ROW_COUNTERS_N, 1],
                [ROW_DELTA_XY, [3.5,SAME_ROW]],  
            ],  
            [ROW_KV,
                [ROW_COUNTERS_N, 3],
                [ROW_DELTA_XY, [1.125,SAME_ROW]], 
            ],                               
        ],

        [BLOCK_KV,
           // [DISABLED_B, true],
            [TITLE_STR, "DB Cavalry Div"],            
            [POSITION_XY, [0,13.75]],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 1],
            ],
            [ROW_KV,
                             [TITLE_STR, "HB"],

                [ROW_COUNTERS_N, 4],
                [ROW_DELTA_XY, [1.5,SAME_ROW]],
            ], 
           

            [ROW_KV,
                [ROW_COUNTERS_N, 1],
               [TITLE_STR, "Hvy"],
                [TEXT_PARMS_KV,
                    [POSITION_XY, [0, -.075]],
                ],
                [ROW_DELTA_XY, [4.5,SAME_ROW]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 3],
                [ROW_DELTA_XY, [1.125,SAME_ROW]],
            ],   

            [ROW_KV,
                [ROW_COUNTERS_N, 1],
                 [TITLE_STR, "1 Lt"],
                [ROW_DELTA_XY, [3.5,SAME_ROW]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 2],
                [ROW_DELTA_XY, [1.125,SAME_ROW]],
            ],
           [ROW_KV,
                [ROW_COUNTERS_N, 1],
                 [TITLE_STR, "2 Lt"],
                [ROW_DELTA_XY, [2.5,SAME_ROW]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 2],
                [ROW_DELTA_XY, [1.125,SAME_ROW]],
            ],                              
        ],     

    ],
    
	[TRAY_KV,
        [BLOCK_KV,
          //  [DISABLED_B, true],
            [TITLE_STR, "Reserve Corps"],
            [TEXT_PARMS_KV,
                [TEXT_SIZE_N, 5],
            ],            
            [POSITION_XY, [0,1]],
        ],

        [BLOCK_KV,

         //   [DISABLED_B, true],
            // [TITLE_STR, "5th Inf Div"],            
            [POSITION_XY, [0,1]],
            [ROW_KV,
                [ROW_COUNTERS_N, 1],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 10],
                [ROW_DELTA_XY, [1.125,SAME_ROW]],
            ],
            [ROW_KV,
                [TITLE_STR, "5 8"],            
                [ROW_COUNTERS_N, 1],
                [ROW_DELTA_XY, [0,0.25]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 8],
                [ROW_DELTA_XY, [1.125,SAME_ROW]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 1],
                [TITLE_STR, "5 9"],    
                [ROW_DELTA_XY, [-1.125,0.25]],            
            ],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 8],
                [ROW_DELTA_XY, [1.125,SAME_ROW]],
            ],

            [ROW_KV,
                [TITLE_STR, "5 5"],    
                [ROW_COUNTERS_N, 1],
                [ROW_DELTA_XY, [-1.125,0.25]],

            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 4],
                [ROW_DELTA_XY, [1.125,SAME_ROW]],
            ],
        ],

        [BLOCK_KV,
           // [DISABLED_B, true],
      //      [TITLE_STR, "6th Inf Div"],            
            [POSITION_XY, [1.125,7]],
            
            // [ROW_KV,
            //     [ROW_COUNTERS_N, 1],
            // ],
        //    [ROW_KV,
        //        [ROW_COUNTERS_N, 2],
      //          [ROW_DELTA_XY, [1.125,SAME_ROW]],
       //     ],
           [ROW_KV,
                [TITLE_STR, "6 10"],    
                [ROW_COUNTERS_N, 1],
             //   [ROW_DELTA_XY, [-1.125,0]],

            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 6],
                [ROW_DELTA_XY, [1.125,SAME_ROW]],
            ], 
           [ROW_KV,
                [TITLE_STR, "6 4"],    
                [ROW_COUNTERS_N, 1],
                [ROW_DELTA_XY, [6.75,SAME_ROW]],

            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 4],
                [ROW_DELTA_XY, [1.125,SAME_ROW]],
            ],            
        ],
        
        [BLOCK_KV,
         //   [DISABLED_B, true],
            [TITLE_STR, "Brunswick"],            
            [POSITION_XY, [0,10]],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 2],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 4],
                [ROW_DELTA_XY, [2.125,SAME_ROW]],
            ],
            [ROW_KV,
                [TITLE_STR, "AG"],            
                [ROW_COUNTERS_N, 4],
                [ROW_DELTA_XY, [0,.25]],
            ],
            
            // [ROW_KV,
            //     [ROW_COUNTERS_N, 4],
            //     [ROW_DELTA_XY, [1.125,SAME_ROW]],
            // ],

            [ROW_KV,
                [TITLE_STR, "Lt"],            
                [ROW_COUNTERS_N, 1],
                [ROW_DELTA_XY, [5,-2.75]],

            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 4],
                [ROW_DELTA_XY, [1.125,SAME_ROW]],
            ],
            [ROW_KV,
                [TITLE_STR, "Ln"],            
                [ROW_COUNTERS_N, 1],
                [ROW_DELTA_XY, [-1.125,0.25]],

            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 3],
                [ROW_DELTA_XY, [1.125,SAME_ROW]],
            ],                
        ],

        [BLOCK_KV,
           // [DISABLED_B, true],
            [TITLE_STR, "Nassau"],            
            [POSITION_XY, [0,14]],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 1],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 3],
                [ROW_DELTA_XY, [1.125,SAME_ROW]],
            ]
        ]        
    ],

	[TRAY_KV,
        [TITLE_STR, qb_title_north],
        qb_tray_french_text_parms,

        [BLOCK_KV,
           // [DISABLED_B, true],
            [POSITION_XY, [0,0.5]],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 2]
            ],
        ],
        
        [BLOCK_KV,
           // [DISABLED_B, true],
            [TITLE_STR, "Garde Impériale"],
            [TEXT_PARMS_KV,
                [TEXT_SIZE_N, 5],
            ],                            
            [POSITION_XY, [6.5,1.5]],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 1],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 4],
                [ROW_DELTA_XY, [1.125, SAME_ROW]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 5],
                [ROW_DELTA_XY, [4.25 , SAME_ROW]],
            ],

            [ROW_KV,
                [ROW_COUNTERS_N, 5],
                [ROW_DELTA_XY, [0,.25]],
            ],

        ],
        [BLOCK_KV,
          //  [DISABLED_B, true],
            [TITLE_STR, "III Corps de Cavalerie"],   
            [TEXT_PARMS_KV,
                [TEXT_SIZE_N, 5],
            ],                         
            [POSITION_XY, [0,5]],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 1],
            ],
            
            [ROW_KV,
                [TITLE_STR, "11"], 
                [ROW_COUNTERS_N, 1],
                [ROW_DELTA_XY, [1.75, SAME_ROW]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 2],
                [ROW_DELTA_XY, [1.125, SAME_ROW]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 4],
                [ROW_DELTA_XY, [2.125,SAME_ROW]],
            ],
            
            [ROW_KV,
                [TITLE_STR, "12"], 
                [ROW_COUNTERS_N, 1],
                [ROW_DELTA_XY, [-3.25, 0.25]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 2],
                [ROW_DELTA_XY, [1.125, SAME_ROW]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 4],
                [ROW_DELTA_XY, [2.125,SAME_ROW]],
            ],
        ],
		[BLOCK_KV,
          //  [DISABLED_B, true],
            [TITLE_STR, "I Corps"],
            [POSITION_XY, [11,8.5]],
            [TEXT_PARMS_KV,
                [TEXT_SIZE_N, 5],
            ],  
            [ROW_KV,
                [ROW_COUNTERS_N, 5],
            ],
        ],
        
		[BLOCK_KV,
         //   [DISABLED_B, true],
            [POSITION_XY, [0.25,10]],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 1],
                [TITLE_STR, "1"],  
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 2],
                [ROW_DELTA_XY, [1.125,SAME_ROW]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 3],
                [ROW_DELTA_XY, [2.25,SAME_ROW]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 3],
                [ROW_DELTA_XY, [3.125,SAME_ROW]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 3],
                [ROW_DELTA_XY, [3.125,SAME_ROW]],
            ],            
            [ROW_KV,
                [ROW_COUNTERS_N, 3],
                [ROW_DELTA_XY, [3.125,SAME_ROW]],
            ],        
        ],

		[BLOCK_KV,
         //   [DISABLED_B, true],
            [POSITION_XY, [0.25, 11.5]],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 1],
                [TITLE_STR, "2"],  
            ],

            [ROW_KV,
                [ROW_COUNTERS_N, 2],
                [ROW_DELTA_XY, [1.125,SAME_ROW]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 4],
                [ROW_DELTA_XY, [2.25,SAME_ROW]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 3],
                [ROW_DELTA_XY, [4.125,SAME_ROW]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 3],
                [ROW_DELTA_XY, [3.125,SAME_ROW]],
            ],            
            [ROW_KV,
                [ROW_COUNTERS_N, 3],
                [ROW_DELTA_XY, [3.125,SAME_ROW]],
            ],        
        ],
	
		[BLOCK_KV,
         //   [DISABLED_B, true],

            [POSITION_XY, [0.25,13]],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 1],
                [TITLE_STR, "3"],  
            ],

            [ROW_KV,
                [ROW_COUNTERS_N, 2],
                [ROW_DELTA_XY, [1.125,SAME_ROW]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 3],
                [ROW_DELTA_XY, [2.25,SAME_ROW]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 3],
                [ROW_DELTA_XY, [3.125,SAME_ROW]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 3],
                [ROW_DELTA_XY, [3.125,SAME_ROW]],
            ],            
            [ROW_KV,
                [ROW_COUNTERS_N, 3],
                [ROW_DELTA_XY, [3.125,SAME_ROW]],
            ],        
        ],



    ],
    
	[TRAY_KV,

		[BLOCK_KV,
           // [DISABLED_B, true],
            [TITLE_STR, "II Corps"],
            [POSITION_XY, [0,2]],
            [TEXT_PARMS_KV,
                [TEXT_SIZE_N, 5],
            ],  
            [ROW_KV,
                [ROW_COUNTERS_N, 5],
            ],
        ],
        
		[BLOCK_KV,
           // [DISABLED_B, true],
                     
            [POSITION_XY, [0,4]],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 1],
                [TITLE_STR, "5"],   
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 2],
                [ROW_DELTA_XY, [1.125,SAME_ROW]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 5],
                [ROW_DELTA_XY, [-1.125,0.125]],                
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 3],
                [ROW_DELTA_XY, [5.125,SAME_ROW]], 
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 3],
                [ROW_DELTA_XY, [3.125,SAME_ROW]], 
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 4],
                [ROW_DELTA_XY, [3.125,SAME_ROW]], 
            ],
       
        ],

		[BLOCK_KV,
           // [DISABLED_B, true],
                     
            [POSITION_XY, [0,7]],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 1],
                [TITLE_STR, "6"],   
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 2],
                [ROW_DELTA_XY, [1.125,SAME_ROW]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 4],
                [ROW_DELTA_XY, [-1.125,0.125]],                
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 3],
                [ROW_DELTA_XY, [4.125,SAME_ROW]], 
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 4],
                [ROW_DELTA_XY, [3.125,SAME_ROW]], 
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 4],
                [ROW_DELTA_XY, [4.125,SAME_ROW]], 
            ],
        ],

		[BLOCK_KV,
           // [DISABLED_B, true],
                     
            [POSITION_XY, [0,10]],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 1],
                [TITLE_STR, "9"],   
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 2],
                [ROW_DELTA_XY, [1.125,SAME_ROW]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 3],
                [ROW_DELTA_XY, [-1.125,0.125]],                
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 4],
                [ROW_DELTA_XY, [3.125,SAME_ROW]], 
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 4],
                [ROW_DELTA_XY, [4.125,SAME_ROW]], 
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 4],
                [ROW_DELTA_XY, [4.125,SAME_ROW]], 
            ],
        ],

		[BLOCK_KV,
           // [DISABLED_B, true],
                     
            [POSITION_XY, [0,13.5]],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 1],
                [TITLE_STR, "2C"],   
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 2],
                [ROW_DELTA_XY, [1.125,SAME_ROW]],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 2],
                [ROW_DELTA_XY, [2.125,SAME_ROW]], 
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 2],
                [ROW_DELTA_XY, [2.125,SAME_ROW]], 
            ],
        ],


    ],
];
