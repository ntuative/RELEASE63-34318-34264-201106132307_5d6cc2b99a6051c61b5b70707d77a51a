package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   
   public class QuestController implements IDisposable, IUpdateReceiver
   {
       
      
      private var _questEngine:HabboQuestEngine;
      
      private var var_574:QuestsList;
      
      private var var_483:QuestDetails;
      
      private var _questCompleted:QuestCompleted;
      
      private var var_407:QuestTracker;
      
      private var var_699:NextQuestTimer;
      
      public function QuestController(param1:HabboQuestEngine)
      {
         super();
         this._questEngine = param1;
         this.var_407 = new QuestTracker(this._questEngine);
         this.var_574 = new QuestsList(this._questEngine);
         this.var_483 = new QuestDetails(this._questEngine);
         this._questCompleted = new QuestCompleted(this._questEngine);
         this.var_699 = new NextQuestTimer(this._questEngine);
      }
      
      public function onToolbarClick() : void
      {
         this.var_574.onToolbarClick();
      }
      
      public function onQuests(param1:Array, param2:Boolean) : void
      {
         this.var_574.onQuests(param1,param2);
      }
      
      public function onQuest(param1:QuestMessageData) : void
      {
         this.var_407.onQuest(param1);
         this.var_483.onQuest(param1);
         this._questCompleted.onQuest(param1);
         this.var_699.onQuest(param1);
      }
      
      public function onQuestCompleted(param1:QuestMessageData) : void
      {
         this.var_407.onQuestCompleted(param1);
         this.var_483.onQuestCompleted(param1);
         this._questCompleted.onQuestCompleted(param1);
      }
      
      public function onQuestCancelled() : void
      {
         this.var_407.onQuestCancelled();
         this.var_483.onQuestCancelled();
         this._questCompleted.onQuestCancelled();
         this.var_699.onQuestCancelled();
      }
      
      public function onRoomEnter() : void
      {
         this.var_407.onRoomEnter();
      }
      
      public function onRoomExit() : void
      {
         this.var_574.onRoomExit();
         this.var_407.onRoomExit();
         this.var_483.onRoomExit();
         this.var_699.onRoomExit();
      }
      
      public function update(param1:uint) : void
      {
         this._questCompleted.update(param1);
         this.var_407.update(param1);
         this.var_699.update(param1);
         this.var_574.update(param1);
         this.var_483.update(param1);
      }
      
      public function dispose() : void
      {
         this._questEngine = null;
         if(this.var_574)
         {
            this.var_574.dispose();
            this.var_574 = null;
         }
         if(this.var_407)
         {
            this.var_407.dispose();
            this.var_407 = null;
         }
         if(this.var_483)
         {
            this.var_483.dispose();
            this.var_483 = null;
         }
         if(this._questCompleted)
         {
            this._questCompleted.dispose();
            this._questCompleted = null;
         }
         if(this.var_699)
         {
            this.var_699.dispose();
            this.var_699 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._questEngine == null;
      }
      
      public function get questsList() : QuestsList
      {
         return this.var_574;
      }
      
      public function get questDetails() : QuestDetails
      {
         return this.var_483;
      }
      
      public function get questTracker() : QuestTracker
      {
         return this.var_407;
      }
   }
}
