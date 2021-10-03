package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1241:String = "M";
      
      public static const const_1798:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_176:Number = 0;
      
      private var var_177:Number = 0;
      
      private var var_453:int = 0;
      
      private var _name:String = "";
      
      private var var_1680:int = 0;
      
      private var var_944:String = "";
      
      private var var_677:String = "";
      
      private var var_2310:String = "";
      
      private var var_2307:int;
      
      private var var_2311:int = 0;
      
      private var var_2305:String = "";
      
      private var var_2309:int = 0;
      
      private var var_2306:int = 0;
      
      private var var_2308:String = "";
      
      private var var_193:Boolean = false;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_193 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_193)
         {
            this._x = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_176;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_193)
         {
            this.var_176 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_177;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_193)
         {
            this.var_177 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_453;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_193)
         {
            this.var_453 = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_193)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this.var_1680;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_193)
         {
            this.var_1680 = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_944;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_193)
         {
            this.var_944 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this.var_677;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_193)
         {
            this.var_677 = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2310;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_193)
         {
            this.var_2310 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_2307;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_193)
         {
            this.var_2307 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2311;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_193)
         {
            this.var_2311 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2305;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_193)
         {
            this.var_2305 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2309;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_193)
         {
            this.var_2309 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2306;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_193)
         {
            this.var_2306 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2308;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_193)
         {
            this.var_2308 = param1;
         }
      }
   }
}
