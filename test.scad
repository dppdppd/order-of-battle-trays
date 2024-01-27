
include <oobt_lib.scad>


SIMPLE_TEST = [
    [TRAY_KV,
        [TITLE_STR, "Army of the Title"],
        [TRAY_DIMENSIONS_XY, [100,250]],

        [BLOCK_KV,
        // [DISABLED_B, true],
            [TITLE_STR, "I Corps"],
            [POSITION_XY, [0,1]],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 1],
            ],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 3],
                [TITLE_STR, "1st"],
            ],
        ],
    ]
];


TEXT_TEST = [
    [TRAY_KV,
        [TITLE_STR, "Army of the Title"],
        [TRAY_DIMENSIONS_XY, [100,250]],

        [BLOCK_KV,
           // [DISABLED_B, true],
            [TITLE_STR, "I Corps"],
            [POSITION_XY, [0,1]],
            [TEXT_PARMS_KV,
                [TEXT_SIZE_N, 6],
                [TEXT_VALIGN_STR, "baseline"],
                [TEXT_HALIGN_STR, "left"],
                [TEXT_FONT_STR, ],
                [POSITION_XY, [10.25,0.5]],
            ],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 1],
            ],
        ]        
    ]
];


FLOW_TEST = [
    [TRAY_KV,
        [TITLE_STR, "Army of the Title"],
        [TRAY_DIMENSIONS_XY, [200,250]],

        [BLOCK_KV,
            [FLOW_DIRECTION_STR, FLOW_DOWN],
           // [DISABLED_B, true],
            [TITLE_STR, "I Corps"],
            [POSITION_XY, [0,1]],
            
            [ROW_KV,
                [ROW_COUNTERS_N, 3],
            ],
            [ROW_KV,
                [ROW_COUNTERS_N, 2],
            ],   
            [ROW_KV,
                [ROW_COUNTERS_N, 1],
            ],             
                     
        ]        
    ]
];


Make( FLOW_TEST );