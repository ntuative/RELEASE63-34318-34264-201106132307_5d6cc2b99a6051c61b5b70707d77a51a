package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   import flash.geom.Point;
   
   public class QuestDetails implements IDisposable
   {
      
      private static const const_1445:int = 56;
      
      private static const const_698:int = 5;
      
      private static const const_1576:int = 5;
      
      private static const const_1085:Point = new Point(8,8);
      
      private static const const_1575:Array = ["PLACE_ITEM","PLACE_FLOOR","PLACE_WALLPAPER","PET_DRINK","PET_EAT"];
       
      
      private var _questEngine:HabboQuestEngine;
      
      private var _window:IFrameWindow;
      
      private var var_1955:Boolean;
      
      private var var_137:QuestMessageData;
      
      private var var_1562:int;
      
      public function QuestDetails(param1:HabboQuestEngine)
      {
         super();
         this._questEngine = param1;
      }
      
      public function dispose() : void
      {
         this._questEngine = null;
         this.var_137 = null;
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._questEngine == null;
      }
      
      public function onQuest(param1:QuestMessageData) : void
      {
         if(this.var_1955)
         {
            this.var_1955 = false;
            this.showDetails(param1);
         }
         else if(this.var_137 == null || this.var_137.id != param1.id)
         {
            this.close();
         }
      }
      
      public function onQuestCompleted(param1:QuestMessageData) : void
      {
         this.close();
      }
      
      public function onQuestCancelled() : void
      {
         this.close();
      }
      
      public function onRoomExit() : void
      {
         this.close();
      }
      
      private function close() : void
      {
         if(this._window)
         {
            this._window.visible = false;
         }
      }
      
      public function showDetails(param1:QuestMessageData) : void
      {
         if(this._window && this._window.visible)
         {
            this._window.visible = false;
            return;
         }
         this.openDetails(param1);
      }
      
      private function openDetails(param1:QuestMessageData) : void
      {
         var _loc10_:* = null;
         this.var_137 = param1;
         if(param1 == null)
         {
            return;
         }
         if(this._window == null)
         {
            this._window = IFrameWindow(this._questEngine.getXmlWindow("QuestDetails"));
            this._window.findChildByTag("close").procedure = this.onDetailsWindowClose;
            this._window.center();
            _loc10_ = this._questEngine.questController.questsList.createListEntry();
            _loc10_.x = const_1085.x;
            _loc10_.y = const_1085.y;
            this._window.content.addChild(_loc10_);
            this._window.findChildByName("catalog_link_region").procedure = this.onCatalogLink;
         }
         _loc10_ = IWindowContainer(this._window.findChildByName("entry_container"));
         this._questEngine.questController.questsList.refreshEntryDetails(_loc10_,param1);
         var _loc2_:* = this.var_137.waitPeriodSeconds > 0;
         var _loc3_:ITextWindow = ITextWindow(_loc10_.findChildByName("hint_txt"));
         var _loc4_:int = this.getTextHeight(_loc3_);
         if(!_loc2_)
         {
            _loc3_.caption = this._questEngine.getQuestHint(param1);
            _loc3_.height = _loc3_.textHeight + const_1576;
         }
         _loc3_.visible = !_loc2_;
         var _loc5_:int = this.getTextHeight(_loc3_) - _loc4_;
         var _loc6_:IRegionWindow = IRegionWindow(this._window.findChildByName("catalog_link_region"));
         var _loc7_:Boolean = const_1575.indexOf(param1.type) > -1 && !_loc2_;
         _loc6_.y = _loc3_.y + _loc3_.height + const_698;
         var _loc8_:int = 0;
         if(_loc7_ && !_loc6_.visible)
         {
            _loc8_ = const_698 + _loc6_.height;
         }
         if(!_loc7_ && _loc6_.visible)
         {
            _loc8_ = -const_698 - _loc6_.height;
         }
         _loc6_.visible = _loc7_;
         var _loc9_:IWindowContainer = IWindowContainer(_loc10_.findChildByName("quest_container"));
         _loc9_.height += _loc5_ + _loc8_;
         this._questEngine.questController.questsList.setEntryHeight(_loc10_);
         this._window.height = _loc10_.height + const_1445;
         this._window.visible = true;
         this._window.activate();
      }
      
      private function getTextHeight(param1:ITextWindow) : int
      {
         return !!param1.visible ? int(param1.height) : 0;
      }
      
      private function onDetailsWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this._window.visible = false;
         }
      }
      
      public function set openForNextQuest(param1:Boolean) : void
      {
         this.var_1955 = param1;
      }
      
      private function onCatalogLink(param1:WindowEvent, param2:IWindow = null) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this._questEngine.openCatalog(this.var_137);
         }
      }
      
      public function update(param1:uint) : void
      {
         if(this._window == null || !this._window.visible)
         {
            return;
         }
         this.var_1562 -= param1;
         if(this.var_1562 > 0)
         {
            return;
         }
         this.var_1562 = NextQuestTimer.const_742;
         var _loc2_:Boolean = this._questEngine.questController.questsList.refreshDelay(this._window,this.var_137);
         if(_loc2_)
         {
            this.openDetails(this.var_137);
         }
      }
   }
}
