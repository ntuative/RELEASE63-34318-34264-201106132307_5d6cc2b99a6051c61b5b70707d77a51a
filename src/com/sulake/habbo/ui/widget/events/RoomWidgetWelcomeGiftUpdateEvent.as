package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetWelcomeGiftUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_579:String = "rwwgue_welcome_gift_widget_status";
       
      
      private var var_1514:String;
      
      private var var_1206:Boolean;
      
      private var var_975:Boolean;
      
      private var _furniId:int;
      
      private var var_2392:Boolean;
      
      public function RoomWidgetWelcomeGiftUpdateEvent(param1:Boolean = false, param2:Boolean = false)
      {
         super(const_579,param1,param2);
      }
      
      public function get email() : String
      {
         return this.var_1514;
      }
      
      public function get isVerified() : Boolean
      {
         return this.var_1206;
      }
      
      public function get allowEmailChange() : Boolean
      {
         return this.var_975;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get requestedByUser() : Boolean
      {
         return this.var_2392;
      }
      
      public function set email(param1:String) : void
      {
         this.var_1514 = param1;
      }
      
      public function set isVerified(param1:Boolean) : void
      {
         this.var_1206 = param1;
      }
      
      public function set allowEmailChange(param1:Boolean) : void
      {
         this.var_975 = param1;
      }
      
      public function set furniId(param1:int) : void
      {
         this._furniId = param1;
      }
      
      public function set requestedByUser(param1:Boolean) : void
      {
         this.var_2392 = param1;
      }
   }
}
