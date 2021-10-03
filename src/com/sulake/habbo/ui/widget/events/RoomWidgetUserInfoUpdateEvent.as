package com.sulake.habbo.ui.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_111:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_148:String = "RWUIUE_PEER";
      
      public static const TRADE_REASON_OK:int = 0;
      
      public static const const_997:int = 2;
      
      public static const const_861:int = 3;
      
      public static const const_1920:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_1717:String = "";
      
      private var var_2307:int;
      
      private var var_2311:int = 0;
      
      private var var_2306:int = 0;
      
      private var var_677:String = "";
      
      private var var_48:BitmapData = null;
      
      private var var_238:Array;
      
      private var var_1596:int = 0;
      
      private var var_2662:String = "";
      
      private var var_2660:int = 0;
      
      private var var_2661:int = 0;
      
      private var var_2163:Boolean = false;
      
      private var var_1716:String = "";
      
      private var var_2217:Boolean = false;
      
      private var var_2853:Boolean = false;
      
      private var var_2850:Boolean = true;
      
      private var var_1361:int = 0;
      
      private var var_2851:Boolean = false;
      
      private var var_2856:Boolean = false;
      
      private var var_2855:Boolean = false;
      
      private var var_2848:Boolean = false;
      
      private var var_2849:Boolean = false;
      
      private var var_2854:Boolean = false;
      
      private var var_2852:int = 0;
      
      private var var_2164:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_238 = [];
         super(param1,param2,param3);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1717 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1717;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2307 = param1;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2307;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2311 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2311;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2306 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2306;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_677 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_677;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_48 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_48;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_238 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_238;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1596 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1596;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2662 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2662;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2853 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2853;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this.var_1361 = param1;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1361;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2851 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2851;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2856 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2856;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2855 = param1;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2855;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2848 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2848;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2849 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2849;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2854 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2854;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2852 = param1;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2852;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2850 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2850;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_2164 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_2164;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2660 = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_2660;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2661 = param1;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2661;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_2163 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_2163;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1716 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_1716;
      }
      
      public function set allowNameChange(param1:Boolean) : void
      {
         this.var_2217 = param1;
      }
      
      public function get allowNameChange() : Boolean
      {
         return this.var_2217;
      }
   }
}
