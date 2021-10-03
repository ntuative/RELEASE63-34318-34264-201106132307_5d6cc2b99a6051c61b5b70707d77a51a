package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionViralFurniStatusEvent extends RoomSessionEvent
   {
      
      public static const const_505:String = "RSVFS_STATUS";
      
      public static const const_622:String = "RSVFS_RECEIVED";
       
      
      private var var_191:String;
      
      private var var_234:int;
      
      private var var_422:int = -1;
      
      private var _shareId:String;
      
      private var var_2266:String;
      
      private var var_2267:Boolean;
      
      private var var_1431:int = 0;
      
      public function RoomSessionViralFurniStatusEvent(param1:String, param2:IRoomSession, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param2,param3,param4);
         this.var_422 = this.status;
         this._shareId = this.shareId;
      }
      
      public function get objectId() : int
      {
         return this.var_234;
      }
      
      public function get status() : int
      {
         return this.var_422;
      }
      
      public function get shareId() : String
      {
         return this._shareId;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2266;
      }
      
      public function get giftWasReceived() : Boolean
      {
         return this.var_2267;
      }
      
      public function get itemCategory() : int
      {
         return this.var_1431;
      }
      
      public function set objectId(param1:int) : void
      {
         this.var_234 = param1;
      }
      
      public function set status(param1:int) : void
      {
         this.var_422 = param1;
      }
      
      public function set shareId(param1:String) : void
      {
         this._shareId = param1;
      }
      
      public function set firstClickUserName(param1:String) : void
      {
         this.var_2266 = param1;
      }
      
      public function set giftWasReceived(param1:Boolean) : void
      {
         this.var_2267 = param1;
      }
      
      public function set itemCategory(param1:int) : void
      {
         this.var_1431 = param1;
      }
      
      public function get campaignID() : String
      {
         return this.var_191;
      }
      
      public function set campaignID(param1:String) : void
      {
         this.var_191 = param1;
      }
   }
}
