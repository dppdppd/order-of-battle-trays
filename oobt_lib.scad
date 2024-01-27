// Copyright 2023 Ido Magal
//
// Released under the Creative Commons - Attribution - Non-Commercial - Share Alike License.
// https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode

VERSION = "1.00";
COPYRIGHT_INFO = "\tOrder of Battle Trays\n\thttps://github.com/dppdppd/order_of_battle_trays\n\n\tCopyright 2024 Ido Magal\n\tCreative Commons - Attribution - Non-Commercial - Share Alike.\n\thttps://creativecommons.org/licenses/by-nc-sa/4.0/legalcode";


// key-values helpers
///////////////////////////////////////////////////////////////////////

KE_KEY = 0;
KE_VALUE = 1;

function get_element( table, i ) = table[ i ];
function num_elements( table ) = len( table );

// get the key of a kv
function get_key( table ) = table[KE_KEY];

function __find_key( table, key ) = search( [ key ], table )[ 0 ];
function get_value( table, key, default = false ) = __find_key( table, key ) == [] ? default : table[ __find_key( table, key ) ][ KE_VALUE ];

// count the number of keys matching the parm
function count_keys( table, key, start = 0, stop = -1, idx = 0, sum = 0 ) = 
	let( end = ( stop != -1 && stop < len(table) ) ? stop + 1 : len(table) )
	let( idx = start + idx )
    idx < end ? 
        count_keys( table, key, 0, stop, idx + 1, sum + ( get_key( table[idx] ) == key ? 1 : 0 )) : 
        sum;


// KEY CONSTANTS
///////////////////////////////////////////////////////////////////////
// array indices
KE_TRAY = 0;
KE_BLOCK = 1;
KE_ROW = 2;

TRAY_KV = "TRAY_KV";
TRAY_DIMENSIONS_XY = "TRAY_DIMENSIONS_XY";

BLOCK_KV = "BLOCK_KV";
FLOW_DIRECTION_STR = "FLOW_DIRECTION_STR";
FLOW_DOWN = "FLOW_DOWN";
FLOW_LEFT = "FLOW_LEFT";

ROW_KV = "ROW_KV";
ROW_COUNTERS_N = "ROW_COUNTERS_N";
ROW_DELTA_XY = "ROW_DELTA_XY";

TITLE_STR = "TITLE_STR";
TEXT_PARMS_KV = "TEXT_PARMS_KV ";
TEXT_SIZE_N = "TEXT_SIZE_N ";
TEXT_VALIGN_STR = "TEXT_VALIGN_STR ";
TEXT_HALIGN_STR = "TEXT_HALIGN_STR ";
TEXT_FONT_STR = "TEXT_FONT_STR ";

POSITION_XY = "POSITION_XY";
DISABLED_B = "DISABLED_B";

// DEFAULTS
///////////////////////////////////////////////////////////////////////
U = 13.2; // generous counter width/height

default_tray_dimensions_xy = [100, 100];
default_text_font = ["Arial","Arial","Arial"];
default_text_size = [7,4,4];
default_additional_row_dist_down = [0,-.25];
default_additional_row_dist_left = [0.25,0];
default_flow_direction = FLOW_DOWN;

///////////////////////////////////////////////////////////////////////

SAME_ROW = -1 + default_additional_row_dist_down[1];

// GLOBALS
///////////////////////////////////////////////////////////////////////
g_tray_depth = 2.4;

g_row_floor = 0.4; // thickness of bottom of counter slot aka 'row', thinnest part of the tray
g_row_depth = g_tray_depth - g_row_floor; // depth of the counter slot. Needs to be > thickness of counter
g_row_padding = 0.2; // extra room in the counter slot.

g_tray_upper_depth = 0.6; // the thickness of the text layer aka 3 top layers
g_tray_lower_depth = g_tray_depth - g_tray_upper_depth;

g_magnet_diameter = 6 + 0.3;
g_magnet_depth = 2;
g_magnet_distance_from_edge = 8;

g_make_tweezer_cutouts = true;

color_lower = "#ffff00";
color_upper = "#00ff00";

make_tray = 0;  // 0 = all trays | n = tray n
make_layer = 0; // 0 = both | 1 = lower layer | 2 = upper layer

t_on = "text on";
t_off = "text off";
t_only = "text_only";
text_layer = t_on;

$fn = $preview ? 12 : 72;


///////////////////////////////////////////////////////////////////////

module Make( table = DATA )
{
    echo( str( "\n\n\n", COPYRIGHT_INFO, "\n\n\tVersion ", VERSION, "\n\n" ));

    if ( make_tray == 0 )
    {
        num_trays = count_keys( table, TRAY_KV );

        for( t = [0:num_trays-1])
        {
            translate([ 300*t,0,0])
            MakeTray( table, t, 2 );
        }

        for( t = [0:num_trays-1])
        {
            translate([ 300*t,-300,0])
            MakeTray( table, t, 1 );
        }        
    }

    else 
    {
        MakeTray( table, make_tray - 1, make_layer );
    }          
}
    
module MakeTray( table, tidx, make_layer )
{
    // FUNCTIONS
    function is_disabled( table ) = get_value( table, DISABLED_B, default = false);
    function has_title( table ) = get_title( table ) != "";
    function get_title( table ) = get_value( table, TITLE_STR, default = "");

    function get_text_parms( table ) = table[search( [TEXT_PARMS_KV], table, 0 )[0][0]];
    function get_text_size( table ) = get_value( get_text_parms( table ), TEXT_SIZE_N, default = 
                                                                            get_key(table) == TRAY_KV ? default_text_size[KE_TRAY]:
                                                                            get_key(table) == BLOCK_KV ? default_text_size[KE_BLOCK]:
                                                                            get_key(table) == ROW_KV ? default_text_size[KE_ROW]:
                                                                            20);
    function get_text_valign( table ) = get_value( get_text_parms( table ), TEXT_VALIGN_STR, default = 
                                                                            get_key(table) == TRAY_KV ? "center":
                                                                            get_key(table) == BLOCK_KV ? "baseline":
                                                                            get_key(table) == ROW_KV ? "baseline":
                                                                            "center");
    function get_text_halign( table ) = get_value( get_text_parms( table ), TEXT_HALIGN_STR, default =
                                                                            get_key(table) == TRAY_KV ? "center":
                                                                            get_key(table) == BLOCK_KV ? "left":
                                                                            get_key(table) == ROW_KV ? "center":
                                                                            "center");
    function get_text_font( table ) = get_value( get_text_parms( table ), TEXT_FONT_STR, default = 
                                                                            get_key(table) == TRAY_KV ? default_text_font[KE_TRAY]:
                                                                            get_key(table) == BLOCK_KV ? default_text_font[KE_BLOCK]:
                                                                            get_key(table) == ROW_KV ? default_text_font[KE_ROW]:
                                                                            "Arial");
    function get_text_position( table ) = [ get_value( get_text_parms( table ), POSITION_XY, default =
                                                                            get_key(table) == TRAY_KV ? [get_tray_width()/2,0]:
                                                                            get_key(table) == BLOCK_KV ? [0,0]:
                                                                            get_key(table) == ROW_KV ? [0,0]:
                                                                            [0,0]).x * U,
                                            get_value( get_text_parms( table ), POSITION_XY, default =
                                                                            get_key(table) == TRAY_KV ? [get_tray_width()/2,0]:
                                                                            get_key(table) == BLOCK_KV ? [0,0]:
                                                                            get_key(table) == ROW_KV ? [0,0]:
                                                                            [0,0]).y * -U
                                            ];                     

    function get_title_metrics( table ) = textmetrics( get_title( table ), 
                                            size = get_text_size( table ), 
                                            font= get_text_font( table ), 
                                            halign= get_text_halign( table ),  
                                            valign= get_text_valign( table ));  


    function get_tray( tidx ) = get_element( table, tidx );
    function get_tray_dimensions() = get_value( this_tray, TRAY_DIMENSIONS_XY, default = default_tray_dimensions_xy);
    function get_tray_width() = get_tray_dimensions().x;
    function get_tray_height() = get_tray_dimensions().y;
    function get_tray_depth() = g_tray_depth;
    //////////////////////////////////////////
    
    this_tray = get_tray( tidx );
    //echo( this_tray = this_tray );

   // echo(make_layer=make_layer);

	if ( !is_disabled( this_tray ))
    SliceTray()
	{
        ProcessForPreview()
        translate( [ U, -U, 0 ])
        {
            MakeTrayTitle();
            
            MakeTrayBlocks();
        }
	}

    module MakeTrayBox()
    {
        translate( [0, -get_tray_height(), 0 ])
        MakeCube([ get_tray_width(), get_tray_height(), g_tray_depth ]);   
    }

    // supports falling back to 2d
    module MakeCube( dimensions, center = false )
    {
        cube( dimensions, center );
    }

    module MakeMagnetSlots()
    {
        if ( text_layer != t_only )
        {
            translate([get_tray_width()/2, -get_tray_height()/2,0])
            translate([0, 0, g_magnet_depth/2 - 0.01])
            {
                PlaceInFourCorners()
                MakeSingleMagnetSlot();
            }
        }

        module MakeSingleMagnetSlot()
        {
           translate( [get_tray_width()/2 - g_magnet_distance_from_edge, get_tray_height()/2 - g_magnet_distance_from_edge,0])
                cylinder( h = g_magnet_depth, d = g_magnet_diameter, center = true );
        }
    }     
    
    // if $preview, make the rendering easier to design with
    module ProcessForPreview()
    {
        if ($preview)
        {
            frame = 10;

            difference()
            {
                translate( [0 - frame/2, -get_tray_height() - frame/2, 0 ])
                MakeCube([ get_tray_width() + frame, get_tray_height() + frame, g_tray_depth ]); 
                
                MakeTrayBox();
            }

            MakeTrayNotches_square();

            MakeMagnetSlots();
        
            children();
        }
        else
        {
            difference()
            {
                MakeTrayBox();
                
                children();

                MakeTrayNotches_square();

                MakeMagnetSlots();
            }
        }
    
    }
    
    // construct only top or bottom. Separate for colors.
    module SliceTray()
    {
        if ( make_layer == 1 || make_layer == 0 )
        {
            color( color_lower )
            intersection()
            {
                translate([ -get_tray_width(), -2*get_tray_height(), 0])
                MakeCube([ 3*get_tray_width(), 3*get_tray_height(), g_tray_lower_depth ]);
                
                children();
            }
        }
        
        if ( make_layer == 2 || make_layer == 0 )
        {
            color( color_upper )
            intersection()
            {
                translate([ -get_tray_width(), -2*get_tray_height(), g_tray_lower_depth])
                MakeCube([ 3*get_tray_width(), 3*get_tray_height(), g_tray_upper_depth ]);
                
                children();
            }   
        }

    }
    
    ////////////////////////////////////////////////////
    module MakeText( table )
    {    

        x_offset = get_text_halign( table ) == "left" ? 0 :
            get_text_halign( table ) == "right" ? U :
            get_text_halign( table ) == "center" ? U/2 : 0;

        if ( text_layer != t_off && make_layer != 1 )
       // echo( text=get_title( table ),text_pos=get_text_position(table))
        translate( get_text_position(table) )
        translate([0,0,g_tray_lower_depth])
        translate([x_offset,0,0])
        {
            //color("red")cube();

            linear_extrude( height = g_tray_upper_depth, scale=1)
            text(get_title( table ), 
                    size = get_text_size( table ), 
                    font= get_text_font( table ), 
                    halign= get_text_halign( table ),  
                    valign= get_text_valign( table )); 
        }
    }    

    module MakeTrayTitle()
    {
        MakeText( this_tray ); 
    }

    module MakeTrayNotches_square()
    {
        diam = 5;
        height = 10;
        
        translate([get_tray_width()/2, -get_tray_height()/2,0])
        {
            PlaceInFourCorners()
            {
                translate( [get_tray_width()/2, get_tray_height()/2 - get_tray_height()/4,0])
                    MakeCube( [diam,diam,height], center = true ); 
                    
                translate( [get_tray_width()/2 - get_tray_height()/4, get_tray_height()/2,0])
                    MakeCube( [diam,diam,height], center = true );
            }
        }
    } 

    module MakeTrayNotches_angled()
    {
        diam = 5;
        height = g_tray_depth + 0.01;
        
        M = [   [ 1 , 0,    0,  0   ],
                [ 0.3 , 1,    0,  0   ],  // The "0.7" is the skew value; pushed along the y axis as z changes.
                [ 0 , 0,    1,  0   ],
                [ 0 , 0,    0,  1   ] ] ;

        module HookIndent()
        {
            union()
            {
                multmatrix(M)
                cube( [diam,diam,height], center = true );

                mirror([1,0,0])
                multmatrix(M)
                cube( [diam,diam,height], center = true );
            }
        }

        module LeftHookIndent()
        {
            rotate(90,[0,0,1])
            HookIndent();

        }

        translate([get_tray_width()/2, -get_tray_height()/2,g_tray_depth/2 + -0.01])
        {
            PlaceInFourCorners()
            {
                translate( [get_tray_width()/2, get_tray_height()/4,0])
                    HookIndent();
                    
            translate( [get_tray_width()/4, get_tray_height()/2,0])
                    LeftHookIndent();
            }
        }
    } 
    
    module MakeTrayBlocks()
    {
        // FUNCTIONS
    	function get_num_blocks( start = 0 ) = count_keys( this_tray, BLOCK_KV, start = start );
        ////////////////////////////////////////////////////

        if ( get_num_blocks() > 0)
    	for( bidx = [ 0: get_num_blocks() - 1 ] )
        {
            MakeBlock( bidx );
        }
    
        ////////////////////////////////////////////////////
        module MakeBlock( bidx )
        {
            // FUNCTIONS
            ////////////////////////////////////////////////////
            function is_block( idx) = get_key( get_element( this_tray, idx)) == BLOCK_KV;
            function get_block_bidx( idx ) = count_keys( this_tray, BLOCK_KV, stop = idx ) - 1;
            function get_block( bidx, idx = 0 ) =
                is_block( idx ) && ( get_block_bidx( idx ) == bidx ) || ( idx > num_elements( this_tray) ) ?
                    get_element( this_tray, idx ) :
                    get_block( bidx, idx = idx + 1 );
            
            function get_block_position() = [ 
            get_value( this_block, POSITION_XY, default = [0,0]).x * U, 
            get_value( this_block, POSITION_XY, default = [0,0]).y * -U ];

            function get_flow_direction() = get_value( this_block, FLOW_DIRECTION_STR, default = default_flow_direction );

            ////////////////////////////////////////////////////
                        
            this_block = get_block( bidx );
            //echo( this_block = this_block);
            //echo( block_position = get_block_position());
            
            if (!is_disabled(this_block ))                
            translate( get_block_position() )
            {		
                {                
                    MakeBlockTitle();
                    
                    MakeBlockRows();
                }
            }  
            
            ////////////////////////////////////////////////////
            module MakeBlockTitle()
            {
                if ( has_title( this_block ) )
                {
                    //echo( title_height = get_title_height());
                    //translate([0,0.125*U,0])
                    title_height = get_title_metrics( this_block ).size[1];

                    translate([0, title_height, 0])
                    {
                        //#color("red")cube(center=true);
                        MakeText( this_block );
                    }
                   // text(get_title( this_block ), size = 6, font="IM FELL English SC", halign= "left", valign="baseline");  
                }
            }
            
            module MakeBlockRows()
            {
                function get_num_rows() = count_keys( this_block, ROW_KV );

                if ( get_num_rows() > 0 )
               	for( ridx = [ 0: get_num_rows() - 1 ] )
                {
                    MakeRow( ridx );
                }
                
                module MakeRow( ridx )
                {
                    ////////////////////////////////////////////////////
                    function is_row( idx ) = get_key( get_element( this_block, idx)) == ROW_KV;
                    function get_row_idx( idx ) = count_keys( this_block, ROW_KV, stop = idx ) - 1;
                    function get_row( ridx, idx = 0 ) =
                        is_row( idx ) && get_row_idx( idx) == ridx || ( idx > num_elements( this_block) )?
                            get_element( this_block, idx ) :
                            get_row( ridx, idx = idx + 1 );
                    function get_row_distance( ridx ) = 
                        [   get_value( get_row( ridx ), ROW_DELTA_XY, default = [0, 0]).x * U,
                            get_value( get_row( ridx ), ROW_DELTA_XY, default = [0, 0]).y * -U ];
                            
                    function get_row_dimensions ( ridx ) = [ get_num_counters( ridx ) * U, U ];
                    function get_flow_add(ridx) =   get_flow_direction() == FLOW_LEFT ?   [ get_row_dimensions( ridx ).x, 0 ] :
                                                    get_flow_direction() == FLOW_DOWN ?    [ 0, -get_row_dimensions( ridx ).y, 0 ] :
                                                    [0,0];

                    function get_additional_row_dist() = get_flow_direction() == FLOW_LEFT ? default_additional_row_dist_left : 
                                                         get_flow_direction() == FLOW_DOWN ? default_additional_row_dist_down : 
                                                         [0,0];

                    function get_row_position( stop, ridx = 0, pos = [0,0,0] ) = 
                        //echo( "------",stop = stop, ridx = ridx, get_row_distance( ridx )/-U, pos = pos )

                        ridx < stop  ?
                        get_row_position( stop = stop,
                            ridx = ridx + 1,
                            pos = [
                                    pos.x + get_row_distance( ridx ).x + get_flow_add( ridx ).x, 
                                    pos.y + get_row_distance( ridx ).y + get_flow_add( ridx ).y,
                                    0
                                ]):
                        pos + [
                            get_row_distance( ridx ).x + ridx * get_additional_row_dist().x * U, 
                            get_row_distance( ridx ).y + ridx * get_additional_row_dist().y * U,
                             0];
                        
                    function get_num_counters( ridx = ridx ) = get_value( get_row( ridx ), ROW_COUNTERS_N, default = 1 );
                    ////////////////////////////////////////////////////  
                    
                    this_row = get_row( ridx );                   
                    if ( !is_disabled( this_row ))
                    {                    
                        translate( get_row_position( ridx ) )
                        { 
                            //echo( ridx=ridx,rowpos_x=get_row_position( ridx ).x/U, rowpos_y=get_row_position( ridx ).y/U)

                            translate([0,-U/2,0]) // text starts top left corner
                            MakeRowTitle();
                                
                            translate([0, 0, g_row_floor])
                            translate([ 0, -U, 0])
                            {                        
                                translate([ -g_row_padding, -g_row_padding, 0])
                                MakeCube([ 
                                    get_num_counters() * U + 2*g_row_padding,
                                    U + 2*g_row_padding, 
                                    g_row_depth
                                ]);

                                if ( g_make_tweezer_cutouts )
                                for( i = [0:get_num_counters() - 1])
                                {
                                    tweezers_width = U/3;
                                    tweezers_height = U + 4;

                                    translate([( i + 0.5 ) * U, U/2 ,g_row_depth/2])
                                    cube([tweezers_width,tweezers_height,g_row_depth], center = true);
                                }
                            }
                        }
                    }
                    
                    ////////////////////////////////////////////////////
                    module MakeRowTitle()
                    {
                      //  translate([ -title_height/2 - 1, 0, 0])
                        translate([ -1, 0, 0])
                        translate([ 0, -U/2, 0])                        
                        rotate([0,0,90])
                        MakeText( this_row );
                      //  text(get_title( this_row ), size = 5, font="IM FELL English SC", halign= "center",  valign="top");   
                    }
                }
            }
        }
    }
    

	function add( vector, stop, idx = 0, sum = 0 ) = 
		idx < stop ? 
			add( vector, stop, idx + 1, sum + vector[idx]) : 
			sum;

}

module PlaceInFourCorners()
{
    children();

mirror([0,1,0])
    children();

    mirror([1,0,0])
    children(); 

    mirror([1,0,0])
    mirror([0,1,0])
    children();   
}