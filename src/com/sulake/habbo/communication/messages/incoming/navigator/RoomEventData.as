package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var var_1933:Boolean;
      
      private var var_2596:int;
      
      private var var_2594:String;
      
      private var var_397:int;
      
      private var var_2597:int;
      
      private var var_1777:String;
      
      private var var_2598:String;
      
      private var var_2595:String;
      
      private var var_921:Array;
      
      private var _disposed:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         this.var_921 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1933 = false;
            return;
         }
         this.var_1933 = true;
         this.var_2596 = int(_loc2_);
         this.var_2594 = param1.readString();
         this.var_397 = int(param1.readString());
         this.var_2597 = param1.readInteger();
         this.var_1777 = param1.readString();
         this.var_2598 = param1.readString();
         this.var_2595 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            this.var_921.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_921 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get ownerAvatarId() : int
      {
         return this.var_2596;
      }
      
      public function get ownerAvatarName() : String
      {
         return this.var_2594;
      }
      
      public function get flatId() : int
      {
         return this.var_397;
      }
      
      public function get eventType() : int
      {
         return this.var_2597;
      }
      
      public function get eventName() : String
      {
         return this.var_1777;
      }
      
      public function get eventDescription() : String
      {
         return this.var_2598;
      }
      
      public function get creationTime() : String
      {
         return this.var_2595;
      }
      
      public function get tags() : Array
      {
         return this.var_921;
      }
      
      public function get exists() : Boolean
      {
         return this.var_1933;
      }
   }
}
