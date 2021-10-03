package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_195;
         param1["bound_to_parent_rect"] = const_103;
         param1["child_window"] = const_1269;
         param1["embedded_controller"] = const_1379;
         param1["resize_to_accommodate_children"] = WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN;
         param1["input_event_processor"] = const_30;
         param1["internal_event_handling"] = const_901;
         param1["mouse_dragging_target"] = const_246;
         param1["mouse_dragging_trigger"] = const_435;
         param1["mouse_scaling_target"] = const_371;
         param1["mouse_scaling_trigger"] = const_662;
         param1["horizontal_mouse_scaling_trigger"] = const_287;
         param1["vertical_mouse_scaling_trigger"] = const_275;
         param1["observe_parent_input_events"] = const_1186;
         param1["optimize_region_to_layout_size"] = const_523;
         param1["parent_window"] = const_1289;
         param1["relative_horizontal_scale_center"] = const_216;
         param1["relative_horizontal_scale_fixed"] = const_141;
         param1["relative_horizontal_scale_move"] = const_410;
         param1["relative_horizontal_scale_strech"] = const_437;
         param1["relative_scale_center"] = const_1198;
         param1["relative_scale_fixed"] = const_786;
         param1["relative_scale_move"] = const_1181;
         param1["relative_scale_strech"] = const_1141;
         param1["relative_vertical_scale_center"] = const_217;
         param1["relative_vertical_scale_fixed"] = const_168;
         param1["relative_vertical_scale_move"] = const_303;
         param1["relative_vertical_scale_strech"] = const_354;
         param1["on_resize_align_left"] = const_788;
         param1["on_resize_align_right"] = const_609;
         param1["on_resize_align_center"] = const_509;
         param1["on_resize_align_top"] = const_981;
         param1["on_resize_align_bottom"] = const_506;
         param1["on_resize_align_middle"] = const_659;
         param1["on_accommodate_align_left"] = const_1273;
         param1["on_accommodate_align_right"] = const_546;
         param1["on_accommodate_align_center"] = const_921;
         param1["on_accommodate_align_top"] = const_1286;
         param1["on_accommodate_align_bottom"] = const_561;
         param1["on_accommodate_align_middle"] = const_951;
         param1["route_input_events_to_parent"] = const_489;
         param1["use_parent_graphic_context"] = const_33;
         param1["draggable_with_mouse"] = const_1271;
         param1["scalable_with_mouse"] = const_1228;
         param1["reflect_horizontal_resize_to_parent"] = const_587;
         param1["reflect_vertical_resize_to_parent"] = const_640;
         param1["reflect_resize_to_parent"] = const_327;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1374;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
