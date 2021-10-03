package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ObjectMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_176:Number = 0;
      
      private var var_177:Number = 0;
      
      private var var_453:int = 0;
      
      private var var_582:int = 0;
      
      private var var_717:int = 0;
      
      private var _type:int = 0;
      
      private var var_3062:String = "";
      
      private var var_1616:int = -1;
      
      private var _state:int = 0;
      
      private var _data:String = "";
      
      private var var_2403:int = 0;
      
      private var var_2547:Boolean;
      
      private var var_2937:String = null;
      
      private var var_193:Boolean = false;
      
      public function ObjectMessageData(param1:int)
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
      
      public function get sizeX() : int
      {
         return this.var_582;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!this.var_193)
         {
            this.var_582 = param1;
         }
      }
      
      public function get sizeY() : int
      {
         return this.var_717;
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!this.var_193)
         {
            this.var_717 = param1;
         }
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         if(!this.var_193)
         {
            this._type = param1;
         }
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function set state(param1:int) : void
      {
         if(!this.var_193)
         {
            this._state = param1;
         }
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function set data(param1:String) : void
      {
         if(!this.var_193)
         {
            this._data = param1;
         }
      }
      
      public function get staticClass() : String
      {
         return this.var_2937;
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!this.var_193)
         {
            this.var_2937 = param1;
         }
      }
      
      public function get extra() : int
      {
         return this.var_1616;
      }
      
      public function set extra(param1:int) : void
      {
         if(!this.var_193)
         {
            this.var_1616 = param1;
         }
      }
      
      public function get expiryTime() : int
      {
         return this.var_2403;
      }
      
      public function set expiryTime(param1:int) : void
      {
         if(!this.var_193)
         {
            this.var_2403 = param1;
         }
      }
      
      public function get knownAsUsable() : Boolean
      {
         return this.var_2547;
      }
      
      public function set knownAsUsable(param1:Boolean) : void
      {
         this.var_2547 = param1;
      }
   }
}
