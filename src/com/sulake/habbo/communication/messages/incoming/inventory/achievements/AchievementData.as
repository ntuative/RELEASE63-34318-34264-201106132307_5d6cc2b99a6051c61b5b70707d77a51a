package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1233:int;
      
      private var var_340:String;
      
      private var var_2017:int;
      
      private var var_2764:int;
      
      private var var_2079:int;
      
      private var var_2016:int;
      
      private var var_2015:Boolean;
      
      private var _category:String;
      
      private var var_2765:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1233 = param1.readInteger();
         this.var_340 = param1.readString();
         this.var_2017 = Math.max(1,param1.readInteger());
         this.var_2764 = param1.readInteger();
         this.var_2079 = param1.readInteger();
         this.var_2016 = param1.readInteger();
         this.var_2015 = param1.readBoolean();
         this._category = param1.readString();
         this.var_2765 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_340;
      }
      
      public function get level() : int
      {
         return this.var_1233;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_2017;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2764;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_2079;
      }
      
      public function get currentPoints() : int
      {
         return this.var_2016;
      }
      
      public function get finalLevel() : Boolean
      {
         return this.var_2015;
      }
      
      public function get category() : String
      {
         return this._category;
      }
      
      public function get levelCount() : int
      {
         return this.var_2765;
      }
      
      public function get firstLevelAchieved() : Boolean
      {
         return this.var_1233 > 1 || this.var_2015;
      }
      
      public function setMaxProgress() : void
      {
         this.var_2016 = this.var_2017;
      }
   }
}
