package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class QuestMessageData
   {
       
      
      private var var_2119:String;
      
      private var var_2118:int;
      
      private var var_2114:int;
      
      private var var_2056:int;
      
      private var _id:int;
      
      private var var_2115:Boolean;
      
      private var _type:String;
      
      private var var_2932:String;
      
      private var var_2933:int;
      
      private var var_2116:String;
      
      private var var_2930:int;
      
      private var var_2931:int;
      
      private var var_1652:int;
      
      private var var_2117:Date;
      
      public function QuestMessageData(param1:IMessageDataWrapper)
      {
         this.var_2117 = new Date();
         super();
         this.var_2119 = param1.readString();
         this.var_2118 = param1.readInteger();
         this.var_2114 = param1.readInteger();
         this.var_2056 = param1.readInteger();
         this._id = param1.readInteger();
         this.var_2115 = param1.readBoolean();
         this._type = param1.readString();
         this.var_2932 = param1.readString();
         this.var_2933 = param1.readInteger();
         this.var_2116 = param1.readString();
         this.var_2930 = param1.readInteger();
         this.var_2931 = param1.readInteger();
         this.var_1652 = param1.readInteger();
      }
      
      public function get campaignCode() : String
      {
         return this.var_2119;
      }
      
      public function get localizationCode() : String
      {
         return this.var_2116;
      }
      
      public function get completedQuestsInCampaign() : int
      {
         return this.var_2118;
      }
      
      public function get questCountInCampaign() : int
      {
         return this.var_2114;
      }
      
      public function get activityPointType() : int
      {
         return this.var_2056;
      }
      
      public function get accepted() : Boolean
      {
         return this.var_2115;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get imageVersion() : String
      {
         return this.var_2932;
      }
      
      public function get rewardCurrencyAmount() : int
      {
         return this.var_2933;
      }
      
      public function get completedSteps() : int
      {
         return this.var_2930;
      }
      
      public function get totalSteps() : int
      {
         return this.var_2931;
      }
      
      public function get waitPeriodSeconds() : int
      {
         if(this.var_1652 < 1)
         {
            return 0;
         }
         var _loc1_:Date = new Date();
         var _loc2_:int = _loc1_.getTime() - this.var_2117.getTime();
         return int(Math.max(0,this.var_1652 - Math.floor(_loc2_ / 1000)));
      }
      
      public function getCampaignLocalizationKey() : String
      {
         return "quests." + this.var_2119;
      }
      
      public function getQuestLocalizationKey() : String
      {
         return this.getCampaignLocalizationKey() + "." + this.var_2116;
      }
      
      public function get completedCampaign() : Boolean
      {
         return this._id < 1;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function set accepted(param1:Boolean) : void
      {
         this.var_2115 = param1;
      }
      
      public function get lastQuestInCampaign() : Boolean
      {
         return this.var_2118 >= this.var_2114;
      }
      
      public function get receiveTime() : Date
      {
         return this.var_2117;
      }
      
      public function set waitPeriodSeconds(param1:int) : void
      {
         this.var_1652 = param1;
      }
   }
}
