package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_1705:String = "";
      
      private var var_2007:String = "";
      
      private var var_2727:String = "";
      
      private var var_2901:Number = 0;
      
      private var var_2900:Number = 0;
      
      private var var_2543:Number = 0;
      
      private var var_2544:Number = 0;
      
      private var var_2319:Boolean = false;
      
      private var var_2318:Boolean = false;
      
      private var var_2321:Boolean = false;
      
      private var var_2320:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_1705 = param2;
         this.var_2007 = param3;
         this.var_2727 = param4;
         this.var_2901 = param5;
         this.var_2900 = param6;
         this.var_2543 = param7;
         this.var_2544 = param8;
         this.var_2319 = param9;
         this.var_2318 = param10;
         this.var_2321 = param11;
         this.var_2320 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_1705;
      }
      
      public function get canvasId() : String
      {
         return this.var_2007;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2727;
      }
      
      public function get screenX() : Number
      {
         return this.var_2901;
      }
      
      public function get screenY() : Number
      {
         return this.var_2900;
      }
      
      public function get localX() : Number
      {
         return this.var_2543;
      }
      
      public function get localY() : Number
      {
         return this.var_2544;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2319;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2318;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2321;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2320;
      }
   }
}
