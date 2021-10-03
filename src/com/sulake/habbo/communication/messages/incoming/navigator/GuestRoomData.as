package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_397:int;
      
      private var var_759:Boolean;
      
      private var var_952:String;
      
      private var _ownerName:String;
      
      private var var_2571:int;
      
      private var var_2566:int;
      
      private var var_2570:int;
      
      private var var_1688:String;
      
      private var var_2573:int;
      
      private var var_2568:Boolean;
      
      private var var_869:int;
      
      private var var_1578:int;
      
      private var var_2569:String;
      
      private var var_921:Array;
      
      private var var_2567:RoomThumbnailData;
      
      private var var_2574:Boolean;
      
      private var var_2572:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_921 = new Array();
         super();
         this.var_397 = param1.readInteger();
         this.var_759 = param1.readBoolean();
         this.var_952 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2571 = param1.readInteger();
         this.var_2566 = param1.readInteger();
         this.var_2570 = param1.readInteger();
         this.var_1688 = param1.readString();
         this.var_2573 = param1.readInteger();
         this.var_2568 = param1.readBoolean();
         this.var_869 = param1.readInteger();
         this.var_1578 = param1.readInteger();
         this.var_2569 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_921.push(_loc4_);
            _loc3_++;
         }
         this.var_2567 = new RoomThumbnailData(param1);
         this.var_2574 = param1.readBoolean();
         this.var_2572 = param1.readBoolean();
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
      
      public function get flatId() : int
      {
         return this.var_397;
      }
      
      public function get event() : Boolean
      {
         return this.var_759;
      }
      
      public function get roomName() : String
      {
         return this.var_952;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2571;
      }
      
      public function get userCount() : int
      {
         return this.var_2566;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2570;
      }
      
      public function get description() : String
      {
         return this.var_1688;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2573;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2568;
      }
      
      public function get score() : int
      {
         return this.var_869;
      }
      
      public function get categoryId() : int
      {
         return this.var_1578;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2569;
      }
      
      public function get tags() : Array
      {
         return this.var_921;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2567;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2574;
      }
      
      public function get displayRoomEntryAd() : Boolean
      {
         return this.var_2572;
      }
   }
}
