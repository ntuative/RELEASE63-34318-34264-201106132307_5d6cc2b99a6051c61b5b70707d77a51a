package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetTeaserDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_508:String = "RWTDUE_TEASER_DATA";
      
      public static const const_967:String = "RWTDUE_GIFT_DATA";
      
      public static const const_720:String = "RWTDUE_GIFT_RECEIVED";
       
      
      private var var_234:int;
      
      private var _data:String;
      
      private var var_422:int;
      
      private var var_191:String;
      
      private var var_2266:String;
      
      private var var_2267:Boolean;
      
      private var var_1431:int = 0;
      
      private var var_2909:String;
      
      public function RoomWidgetTeaserDataUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function get objectId() : int
      {
         return this.var_234;
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function get status() : int
      {
         return this.var_422;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2266;
      }
      
      public function get giftWasReceived() : Boolean
      {
         return this.var_2267;
      }
      
      public function get ownRealName() : String
      {
         return this.var_2909;
      }
      
      public function get itemCategory() : int
      {
         return this.var_1431;
      }
      
      public function set status(param1:int) : void
      {
         this.var_422 = param1;
      }
      
      public function set data(param1:String) : void
      {
         this._data = param1;
      }
      
      public function set firstClickUserName(param1:String) : void
      {
         this.var_2266 = param1;
      }
      
      public function set giftWasReceived(param1:Boolean) : void
      {
         this.var_2267 = param1;
      }
      
      public function set ownRealName(param1:String) : void
      {
         this.var_2909 = param1;
      }
      
      public function set objectId(param1:int) : void
      {
         this.var_234 = param1;
      }
      
      public function get campaignID() : String
      {
         return this.var_191;
      }
      
      public function set campaignID(param1:String) : void
      {
         this.var_191 = param1;
      }
      
      public function set itemCategory(param1:int) : void
      {
         this.var_1431 = param1;
      }
   }
}
