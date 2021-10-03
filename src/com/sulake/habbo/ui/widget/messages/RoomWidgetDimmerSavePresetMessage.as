package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_986:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2835:int;
      
      private var var_2836:int;
      
      private var _color:uint;
      
      private var var_1201:int;
      
      private var var_2837:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_986);
         this.var_2835 = param1;
         this.var_2836 = param2;
         this._color = param3;
         this.var_1201 = param4;
         this.var_2837 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2835;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2836;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1201;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2837;
      }
   }
}
