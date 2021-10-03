package com.sulake.habbo.communication.messages.parser.moderation
{
   public class IssueMessageData
   {
      
      public static const const_187:int = 1;
      
      public static const const_415:int = 2;
      
      public static const const_1915:int = 3;
       
      
      private var var_2429:int;
      
      private var _state:int;
      
      private var var_1578:int;
      
      private var _reportedCategoryId:int;
      
      private var var_1806:int;
      
      private var _priority:int;
      
      private var var_2426:int = 0;
      
      private var var_2425:int;
      
      private var var_2428:String;
      
      private var var_1609:int;
      
      private var var_2031:String;
      
      private var var_2432:int;
      
      private var var_2427:String;
      
      private var _message:String;
      
      private var var_2411:int;
      
      private var var_952:String;
      
      private var var_1660:int;
      
      private var var_2424:String;
      
      private var var_397:int;
      
      private var var_2431:String;
      
      private var var_2430:String;
      
      private var var_2368:int;
      
      private var var_2366:int;
      
      public function IssueMessageData(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:String, param9:int, param10:String, param11:int, param12:String, param13:String, param14:int, param15:String, param16:int, param17:String, param18:int, param19:String, param20:String, param21:int, param22:int)
      {
         super();
         this.var_2429 = param1;
         this._state = param2;
         this.var_1578 = param3;
         this._reportedCategoryId = param4;
         this.var_1806 = param5;
         this._priority = param6;
         this.var_2425 = param7;
         this.var_2428 = param8;
         this.var_1609 = param9;
         this.var_2031 = param10;
         this.var_2432 = param11;
         this.var_2427 = param12;
         this._message = param13;
         this.var_2411 = param14;
         this.var_952 = param15;
         this.var_1660 = param16;
         this.var_2424 = param17;
         this.var_397 = param18;
         this.var_2431 = param19;
         this.var_2430 = param20;
         this.var_2368 = param21;
         this.var_2366 = param22;
      }
      
      public function get issueId() : int
      {
         return this.var_2429;
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function get categoryId() : int
      {
         return this.var_1578;
      }
      
      public function get reportedCategoryId() : int
      {
         return this._reportedCategoryId;
      }
      
      public function get timeStamp() : int
      {
         return this.var_1806;
      }
      
      public function get priority() : int
      {
         return this._priority + this.var_2426;
      }
      
      public function get reporterUserId() : int
      {
         return this.var_2425;
      }
      
      public function get reporterUserName() : String
      {
         return this.var_2428;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1609;
      }
      
      public function get reportedUserName() : String
      {
         return this.var_2031;
      }
      
      public function get pickerUserId() : int
      {
         return this.var_2432;
      }
      
      public function get pickerUserName() : String
      {
         return this.var_2427;
      }
      
      public function get message() : String
      {
         return this._message;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2411;
      }
      
      public function get roomName() : String
      {
         return this.var_952;
      }
      
      public function get roomType() : int
      {
         return this.var_1660;
      }
      
      public function get flatType() : String
      {
         return this.var_2424;
      }
      
      public function get flatId() : int
      {
         return this.var_397;
      }
      
      public function get flatOwnerName() : String
      {
         return this.var_2431;
      }
      
      public function get roomResources() : String
      {
         return this.var_2430;
      }
      
      public function get unitPort() : int
      {
         return this.var_2368;
      }
      
      public function get worldId() : int
      {
         return this.var_2366;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         this.var_2426 = param1;
      }
      
      public function getOpenTime(param1:int) : String
      {
         var _loc2_:int = (param1 - this.var_1806) / 1000;
         var _loc3_:int = _loc2_ % 60;
         var _loc4_:int = _loc2_ / 60;
         var _loc5_:int = _loc4_ % 60;
         var _loc6_:int = _loc4_ / 60;
         var _loc7_:String = _loc3_ < 10 ? "0" + _loc3_ : "" + _loc3_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         var _loc9_:String = _loc6_ < 10 ? "0" + _loc6_ : "" + _loc6_;
         return _loc9_ + ":" + _loc8_ + ":" + _loc7_;
      }
   }
}
