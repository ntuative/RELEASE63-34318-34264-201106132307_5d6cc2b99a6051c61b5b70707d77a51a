package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_176:Number = 0;
      
      private var var_177:Number = 0;
      
      private var var_2651:Number = 0;
      
      private var var_2647:Number = 0;
      
      private var var_2649:Number = 0;
      
      private var var_2646:Number = 0;
      
      private var var_453:int = 0;
      
      private var var_2650:int = 0;
      
      private var var_352:Array;
      
      private var var_2648:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_352 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_176 = param3;
         this.var_177 = param4;
         this.var_2651 = param5;
         this.var_453 = param6;
         this.var_2650 = param7;
         this.var_2647 = param8;
         this.var_2649 = param9;
         this.var_2646 = param10;
         this.var_2648 = param11;
         this.var_352 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_176;
      }
      
      public function get z() : Number
      {
         return this.var_177;
      }
      
      public function get localZ() : Number
      {
         return this.var_2651;
      }
      
      public function get targetX() : Number
      {
         return this.var_2647;
      }
      
      public function get targetY() : Number
      {
         return this.var_2649;
      }
      
      public function get targetZ() : Number
      {
         return this.var_2646;
      }
      
      public function get dir() : int
      {
         return this.var_453;
      }
      
      public function get dirHead() : int
      {
         return this.var_2650;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2648;
      }
      
      public function get actions() : Array
      {
         return this.var_352.slice();
      }
   }
}
