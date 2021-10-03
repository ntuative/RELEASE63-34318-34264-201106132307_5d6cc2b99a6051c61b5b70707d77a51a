package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   public class SaveableRoomSettingsData
   {
       
      
      private var _roomId:int;
      
      private var _name:String;
      
      private var var_1688:String;
      
      private var var_2571:int;
      
      private var _password:String;
      
      private var var_1578:int;
      
      private var var_2640:int;
      
      private var var_921:Array;
      
      private var var_2637:Array;
      
      private var var_2574:Boolean;
      
      private var var_2638:Boolean;
      
      private var var_2639:Boolean;
      
      private var var_2635:Boolean;
      
      private var var_2634:int;
      
      private var var_2636:int;
      
      public function SaveableRoomSettingsData()
      {
         super();
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2574;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         this.var_2574 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return this.var_2638;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         this.var_2638 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return this.var_2639;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         this.var_2639 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return this.var_2635;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         this.var_2635 = param1;
      }
      
      public function get wallThickness() : int
      {
         return this.var_2634;
      }
      
      public function set wallThickness(param1:int) : void
      {
         this.var_2634 = param1;
      }
      
      public function get floorThickness() : int
      {
         return this.var_2636;
      }
      
      public function set floorThickness(param1:int) : void
      {
         this.var_2636 = param1;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function set roomId(param1:int) : void
      {
         this._roomId = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get description() : String
      {
         return this.var_1688;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1688 = param1;
      }
      
      public function get doorMode() : int
      {
         return this.var_2571;
      }
      
      public function set doorMode(param1:int) : void
      {
         this.var_2571 = param1;
      }
      
      public function get password() : String
      {
         return this._password;
      }
      
      public function set password(param1:String) : void
      {
         this._password = param1;
      }
      
      public function get categoryId() : int
      {
         return this.var_1578;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1578 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return this.var_2640;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         this.var_2640 = param1;
      }
      
      public function get tags() : Array
      {
         return this.var_921;
      }
      
      public function set tags(param1:Array) : void
      {
         this.var_921 = param1;
      }
      
      public function get controllers() : Array
      {
         return this.var_2637;
      }
      
      public function set controllers(param1:Array) : void
      {
         this.var_2637 = param1;
      }
   }
}
