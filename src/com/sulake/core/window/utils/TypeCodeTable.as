package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_761;
         param1["badge"] = const_745;
         param1["bitmap"] = const_458;
         param1["border"] = const_888;
         param1["border_notify"] = const_1752;
         param1["bubble"] = const_903;
         param1["bubble_pointer_up"] = const_1185;
         param1["bubble_pointer_right"] = const_1207;
         param1["bubble_pointer_down"] = const_1213;
         param1["bubble_pointer_left"] = const_1176;
         param1["button"] = const_590;
         param1["button_thick"] = const_763;
         param1["button_icon"] = const_1783;
         param1["button_group_left"] = const_989;
         param1["button_group_center"] = const_867;
         param1["button_group_right"] = const_810;
         param1["canvas"] = const_747;
         param1["checkbox"] = const_876;
         param1["closebutton"] = const_1147;
         param1["container"] = const_400;
         param1["container_button"] = const_939;
         param1["display_object_wrapper"] = const_801;
         param1["dropmenu"] = const_594;
         param1["dropmenu_item"] = const_645;
         param1["frame"] = const_391;
         param1["frame_notify"] = const_1987;
         param1["header"] = const_944;
         param1["html"] = const_1200;
         param1["icon"] = const_1307;
         param1["itemgrid"] = const_1173;
         param1["itemgrid_horizontal"] = const_606;
         param1["itemgrid_vertical"] = const_845;
         param1["itemlist"] = WINDOW_TYPE_ITEMLIST;
         param1["itemlist_horizontal"] = const_430;
         param1["itemlist_vertical"] = const_419;
         param1["label"] = const_793;
         param1["maximizebox"] = const_1903;
         param1["menu"] = const_1830;
         param1["menu_item"] = const_1886;
         param1["submenu"] = const_1178;
         param1["minimizebox"] = const_1768;
         param1["notify"] = const_1692;
         param1["null"] = const_716;
         param1["password"] = const_931;
         param1["radiobutton"] = const_722;
         param1["region"] = const_370;
         param1["restorebox"] = const_1906;
         param1["scaler"] = const_543;
         param1["scaler_horizontal"] = const_1979;
         param1["scaler_vertical"] = const_1944;
         param1["scrollbar_horizontal"] = const_573;
         param1["scrollbar_vertical"] = const_811;
         param1["scrollbar_slider_button_up"] = const_1278;
         param1["scrollbar_slider_button_down"] = const_1293;
         param1["scrollbar_slider_button_left"] = const_1152;
         param1["scrollbar_slider_button_right"] = const_1257;
         param1["scrollbar_slider_bar_horizontal"] = const_1254;
         param1["scrollbar_slider_bar_vertical"] = const_1234;
         param1["scrollbar_slider_track_horizontal"] = const_1381;
         param1["scrollbar_slider_track_vertical"] = const_1236;
         param1["scrollable_itemlist"] = const_1975;
         param1["scrollable_itemlist_vertical"] = const_541;
         param1["scrollable_itemlist_horizontal"] = const_1357;
         param1["selector"] = const_949;
         param1["selector_list"] = const_879;
         param1["submenu"] = const_1178;
         param1["tab_button"] = const_853;
         param1["tab_container_button"] = const_1165;
         param1["tab_context"] = const_429;
         param1["tab_content"] = const_1243;
         param1["tab_selector"] = const_871;
         param1["text"] = const_750;
         param1["input"] = const_936;
         param1["toolbar"] = const_1938;
         param1["tooltip"] = const_443;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
