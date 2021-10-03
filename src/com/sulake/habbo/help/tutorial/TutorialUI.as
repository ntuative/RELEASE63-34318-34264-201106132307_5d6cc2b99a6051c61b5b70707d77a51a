package com.sulake.habbo.help.tutorial
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.ChangeUserNameResultMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.CheckUserNameResultMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.avatar.ChangeUserNameMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.avatar.CheckUserNameMessageComposer;
   import com.sulake.habbo.communication.messages.parser.avatar.ChangeUserNameResultMessageParser;
   import com.sulake.habbo.communication.messages.parser.avatar.CheckUserNameResultMessageParser;
   import com.sulake.habbo.help.HabboHelp;
   import com.sulake.habbo.help.INameChangeUI;
   import com.sulake.habbo.help.enum.HabboHelpTutorialEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.events.HabboSessionFigureUpdatedEvent;
   import com.sulake.habbo.window.utils.IAlertDialog;
   
   public class TutorialUI implements INameChangeUI
   {
      
      public static const const_100:String = "TUI_MAIN_VIEW";
      
      public static const const_350:String = "TUI_NAME_VIEW";
      
      public static const const_433:String = "TUI_CLOTHES_VIEW";
      
      public static const const_491:String = "TUI_GUIDEBOT_VIEW";
       
      
      private var var_2462:int = 0;
      
      private var var_2461:int = 0;
      
      private var var_37:HabboHelp;
      
      private var _window:IFrameWindow;
      
      private var var_52:ITutorialUIView;
      
      private var var_410:NameChangeView;
      
      private var var_1322:Boolean = false;
      
      private var var_1323:Boolean = false;
      
      private var var_1629:Boolean = false;
      
      private var var_2064:Boolean = false;
      
      private var var_2830:Boolean;
      
      public function TutorialUI(param1:HabboHelp, param2:Boolean = true)
      {
         super();
         this.var_37 = param1;
         this.var_2830 = param2;
         this.var_37.events.addEventListener(HabboHelpTutorialEvent.const_595,this.onTaskDoneEvent);
         this.var_37.events.addEventListener(HabboHelpTutorialEvent.const_633,this.onTaskDoneEvent);
         this.var_37.events.addEventListener(HabboHelpTutorialEvent.const_586,this.onTaskDoneEvent);
         if(this.var_37.sessionDataManager != null)
         {
            this.var_37.sessionDataManager.events.addEventListener(HabboSessionFigureUpdatedEvent.const_322,this.onFigureUpdate);
         }
      }
      
      public function get help() : HabboHelp
      {
         return this.var_37;
      }
      
      public function get assets() : IAssetLibrary
      {
         return this.var_37.assets;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this.var_37.localization;
      }
      
      public function get myName() : String
      {
         return this.var_37.ownUserName;
      }
      
      public function get hasTasksDone() : Boolean
      {
         return this.var_1322 && this.var_1323 && this.var_1629;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1322;
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1323;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1629;
      }
      
      public function dispose() : void
      {
         this.disposeView();
         if(this.var_37)
         {
            this.var_37.events.removeEventListener(HabboHelpTutorialEvent.const_595,this.onTaskDoneEvent);
            this.var_37.events.removeEventListener(HabboHelpTutorialEvent.const_633,this.onTaskDoneEvent);
            this.var_37.events.removeEventListener(HabboHelpTutorialEvent.const_586,this.onTaskDoneEvent);
            if(this.var_37.sessionDataManager != null)
            {
               this.var_37.sessionDataManager.events.removeEventListener(HabboSessionFigureUpdatedEvent.const_322,this.onFigureUpdate);
            }
            this.var_37 = null;
         }
      }
      
      public function update(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         this.var_1322 = param1;
         this.var_1323 = param2;
         this.var_1629 = param3;
         if(this.var_52 == null || this.var_52.id == const_100)
         {
            this.prepareForTutorial();
            this.showView(const_100);
         }
      }
      
      public function onTaskDoneEvent(param1:HabboHelpTutorialEvent) : void
      {
         switch(param1.type)
         {
            case HabboHelpTutorialEvent.const_595:
               this.var_1629 = true;
               if(this.var_52 != null && this.var_52.id == const_491)
               {
                  this.showView(const_100);
               }
               break;
            case HabboHelpTutorialEvent.const_633:
               if(this.var_52 != null && this.var_52.id == const_433)
               {
                  this.var_2064 = true;
                  this.disposeWindow();
               }
               break;
            case HabboHelpTutorialEvent.const_586:
               if(this.var_2064)
               {
                  this.var_2064 = false;
                  this.showView(const_100);
               }
         }
      }
      
      public function showView(param1:String) : void
      {
         var _loc2_:* = null;
         if(this.hasTasksDone)
         {
            if(this.var_37)
            {
               this.var_37.removeTutorialUI();
            }
            return;
         }
         var _loc3_:Boolean = false;
         if(this._window == null)
         {
            this._window = this.buildXmlWindow("tutorial_frame") as IFrameWindow;
            if(this._window == null)
            {
               return;
            }
            this._window.procedure = this.windowProcedure;
            _loc2_ = this._window.findChildByName("content_list") as IItemListWindow;
            if(_loc2_ == null)
            {
               return;
            }
            this.var_2462 = this._window.width - _loc2_.width;
            this.var_2461 = this._window.height;
            _loc3_ = true;
         }
         _loc2_ = this._window.findChildByName("content_list") as IItemListWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.destroyListItems();
         _loc2_.height = 0;
         if(this.var_52 != null)
         {
            this.var_52.dispose();
         }
         this._window.visible = true;
         switch(param1)
         {
            case const_100:
               if(this.var_410 != null)
               {
                  this.var_410.dispose();
               }
               if(this.var_2830)
               {
                  this.var_52 = new TutorialMainView(_loc2_,this);
                  break;
               }
               this._window.visible = false;
               return;
               break;
            case const_350:
               this._window.visible = false;
               if(this.var_410 == null)
               {
                  this.var_410 = new NameChangeView(this);
               }
               this.var_410.showMainView();
               this.prepareForTutorial();
               break;
            case const_433:
               this.var_52 = new TutorialClothesChangeView(_loc2_,this);
               break;
            case const_491:
               this.var_52 = new TutorialCallGuideBotView(_loc2_,this);
         }
         this._window.height = _loc2_.height + this.var_2461;
         this._window.width = _loc2_.width + this.var_2462;
         if(_loc3_)
         {
            if(this._window == null)
            {
               return;
            }
            this._window.x = this._window.context.getDesktopWindow().width / 2 - this._window.width / 2;
            this._window.y = 0;
         }
      }
      
      public function buildXmlWindow(param1:String, param2:uint = 1) : IWindow
      {
         if(this.var_37 == null || this.var_37.assets == null)
         {
            return null;
         }
         var _loc3_:XmlAsset = XmlAsset(this.var_37.assets.getAssetByName(param1 + "_xml"));
         if(_loc3_ == null || this.var_37.windowManager == null)
         {
            return null;
         }
         return this.var_37.windowManager.buildFromXML(XML(_loc3_.content),param2);
      }
      
      private function disposeWindow(param1:WindowEvent = null) : void
      {
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      private function disposeView() : void
      {
         if(this.var_52 != null)
         {
            this.var_52.dispose();
            this.var_52 = null;
         }
         if(this.var_410 != null)
         {
            this.var_410.dispose();
            this.var_410 = null;
         }
         this.disposeWindow();
      }
      
      public function setRoomSessionStatus(param1:Boolean) : void
      {
         if(param1 == false)
         {
            this.disposeView();
         }
      }
      
      public function prepareForTutorial() : void
      {
         if(this.var_37 == null || this.var_37.events == null)
         {
            return;
         }
         this.var_37.hideUI();
         this.var_37.events.dispatchEvent(new HabboHelpTutorialEvent(HabboHelpTutorialEvent.const_129));
      }
      
      public function windowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(param2.name == "header_button_close")
               {
                  this.disposeView();
               }
         }
      }
      
      public function changeName(param1:String) : void
      {
         this.disposeWindow();
         this.var_37.sendMessage(new ChangeUserNameMessageComposer(param1));
      }
      
      public function checkName(param1:String) : void
      {
         this.disposeWindow();
         this.var_37.sendMessage(new CheckUserNameMessageComposer(param1));
      }
      
      public function onUserNameChanged(param1:String) : void
      {
         var name:String = param1;
         if(!this.var_37 || !this.var_37.localization || !this.var_37.windowManager)
         {
            return;
         }
         this.var_1323 = true;
         this.var_37.localization.registerParameter("help.tutorial.name.changed","name",name);
         this.var_37.windowManager.alert("${generic.notice}","${help.tutorial.name.changed}",0,function(param1:IAlertDialog, param2:WindowEvent):void
         {
            param1.dispose();
         });
         if(this.var_52 != null && (this.var_52.id == const_350 || this.var_52.id == const_100))
         {
            this.showView(const_100);
         }
      }
      
      private function onFigureUpdate(param1:HabboSessionFigureUpdatedEvent) : void
      {
         var _loc2_:* = false;
         if(this.var_37 == null || param1 == null)
         {
            return;
         }
         if(!this.var_1322)
         {
            if(this.var_37.sessionDataManager != null)
            {
               _loc2_ = param1.userId == this.var_37.sessionDataManager.userId;
               if(_loc2_)
               {
                  this.var_37.sessionDataManager.events.removeEventListener(HabboSessionFigureUpdatedEvent.const_322,this.onFigureUpdate);
                  this.onUserChanged();
               }
            }
         }
      }
      
      public function onUserChanged() : void
      {
         this.var_1322 = true;
         if(this.var_52 != null && (this.var_52.id == const_433 || this.var_52.id == const_100))
         {
            this.showView(const_100);
         }
      }
      
      public function onChangeUserNameResult(param1:ChangeUserNameResultMessageEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:ChangeUserNameResultMessageParser = param1.getParser();
         if(_loc2_.resultCode == ChangeUserNameResultMessageEvent.var_592)
         {
            this.var_1323 = true;
            this.showView(TutorialUI.const_100);
         }
         else
         {
            this.var_410.setNameNotAvailableView(_loc2_.resultCode,_loc2_.name,_loc2_.nameSuggestions);
         }
      }
      
      public function onCheckUserNameResult(param1:CheckUserNameResultMessageEvent) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:CheckUserNameResultMessageParser = param1.getParser();
         if(_loc2_.resultCode == ChangeUserNameResultMessageEvent.var_592)
         {
            this.var_410.checkedName = _loc2_.name;
         }
         else
         {
            this.var_410.setNameNotAvailableView(_loc2_.resultCode,_loc2_.name,_loc2_.nameSuggestions);
         }
      }
   }
}
