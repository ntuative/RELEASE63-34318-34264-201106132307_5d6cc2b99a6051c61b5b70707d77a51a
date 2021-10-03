package com.sulake.habbo.notifications
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.users.GetAchievementShareIdComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class AchievementNotification
   {
       
      
      private var var_340:String;
      
      private var var_2884:int;
      
      private var var_1233:int;
      
      private var var_1762:int;
      
      private var var_1640:int;
      
      private var var_2764:int;
      
      private var var_2079:int;
      
      private var _window:IFrameWindow;
      
      private var var_365:ISessionDataManager;
      
      private var var_70:IHabboLocalizationManager;
      
      private var _assets:IAssetLibrary;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_2880:String;
      
      private var var_2879:String;
      
      private var var_2883:String;
      
      private var var_2882:String;
      
      private var _desc:String;
      
      private var var_2881:String;
      
      private var _feedTitleFb:String;
      
      private const const_2053:String = "badge_bg_001_png";
      
      private const const_2306:String = "achievement_bg_001_png";
      
      public function AchievementNotification(param1:String, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:IAssetLibrary, param9:IHabboWindowManager, param10:IHabboLocalizationManager, param11:IHabboConfigurationManager, param12:IHabboCommunicationManager, param13:ISessionDataManager)
      {
         super();
         if(!param8 || !param9 || !param10 || !param11 || !param13)
         {
            return;
         }
         this.var_340 = param1;
         this.var_2884 = param2;
         this.var_1233 = param3;
         this.var_1762 = param4;
         this.var_1640 = param7;
         this.var_2764 = param5;
         this.var_2079 = param6;
         this.var_70 = param10;
         this._assets = param8;
         this.var_365 = param13;
         this._communication = param12;
         param13.events.addEventListener(BadgeImageReadyEvent.const_118,this.onBadgeImageReady);
         var _loc14_:XmlAsset = param8.getAssetByName("achievement_notification_xml") as XmlAsset;
         if(_loc14_ == null)
         {
            return;
         }
         this._window = param9.buildFromXML(_loc14_.content as XML) as IFrameWindow;
         if(this._window == null)
         {
            return;
         }
         this._window.procedure = this.eventHandler;
         this._window.center();
         this.var_2880 = this.var_70.getBadgeName(this.var_340);
         this.var_2879 = this.var_70.getBadgeDesc(this.var_340);
         this.var_2883 = this.var_70.getAchievementNameForFacebook(this.var_340,this.var_365.userName,this.var_365.realName,this.var_1233);
         this.var_2882 = this.var_70.getAchievementDescForFacebook(this.var_340,this.var_365.userName,this.var_365.realName,this.var_1233);
         this._desc = this.registerTextParameters("notifications.text.achievement");
         this.var_2881 = this.registerTextParameters("notifications.text.achievement_facebook");
         this._feedTitleFb = this.registerTextParameters("notifications.text.achievement_facebook_title");
         this.var_70.registerParameter("notifications.text.achievement.achievement_points","achievement_points",this.var_1762.toString());
         this.var_70.registerParameter("notifications.achievement.bonus.value","bonus_points",this.var_1640.toString());
         this.var_70.registerParameter("notifications.achievement.no_facebook","bonus_points",this.var_1640.toString());
         var _loc15_:IWindow = this._window.findChildByName("level_reward_points");
         var _loc16_:String = "notifications.text.achievement.reward." + this.var_2079;
         var _loc17_:String = this.var_2079 == 0 ? "pixels" : "activitypoints";
         this.var_70.registerParameter(_loc16_,_loc17_,"" + this.var_2764);
         _loc15_.caption = this.var_70.getKey(_loc16_);
         this._window.findChildByName("achievement_info").caption = this._desc;
         this.setBadge(param13.getBadgeImage(param1),this.const_2053);
         var _loc18_:BitmapData = (param8.getAssetByName(this.const_2306) as BitmapDataAsset).content as BitmapData;
         var _loc19_:IBitmapWrapperWindow = this._window.findChildByName("achievement_bg") as IBitmapWrapperWindow;
         _loc19_.bitmap = new BitmapData(_loc19_.width,_loc19_.height,true,0);
         _loc19_.bitmap.copyPixels(_loc18_,_loc18_.rect,new Point(0,_loc19_.height - _loc18_.height),null,null,true);
         var _loc20_:Boolean = false;
         if(param11.keyExists("facebook.user"))
         {
            _loc20_ = true;
         }
         var _loc21_:Boolean = true;
         if(param11.getKey("achievement.post.enabled","1") == "0")
         {
            _loc21_ = false;
         }
         var _loc22_:IItemListWindow = this._window.findChildByName("view_items") as IItemListWindow;
         var _loc23_:IWindowContainer = this._window.findChildByName("bonus_container") as IWindowContainer;
         var _loc24_:IWindowContainer = this._window.findChildByName("regular_ok_container") as IWindowContainer;
         var _loc25_:IWindowContainer = this._window.findChildByName("facebook_nag_container") as IWindowContainer;
         var _loc26_:IConnection = this._communication.getHabboMainConnection(null);
         if(this.var_1640 <= 0 || !_loc21_)
         {
            _loc22_.removeListItem(_loc23_);
            _loc22_.removeListItem(_loc25_);
            _loc26_.send(new EventLogMessageComposer("Achievements",this.var_340,"client.show.no_post"));
         }
         else
         {
            _loc22_.removeListItem(_loc24_);
            if(_loc20_)
            {
               _loc22_.removeListItem(_loc25_);
               _loc26_.send(new EventLogMessageComposer("Achievements",this.var_340,"client.show.post"));
            }
            else
            {
               _loc22_.removeListItem(_loc23_);
               _loc26_.send(new EventLogMessageComposer("Achievements",this.var_340,"client.show.no_fb"));
            }
         }
         var _loc27_:int = 32;
         this._window.height = _loc22_.height + _loc27_;
         this._window.header.controls.visible = false;
      }
      
      private function registerTextParameters(param1:String) : String
      {
         this.var_70.registerParameter(param1,"badge_name",this.var_2880);
         this.var_70.registerParameter(param1,"badge_desc",this.var_2879);
         this.var_70.registerParameter(param1,"badge_name_fb",this.var_2883);
         this.var_70.registerParameter(param1,"badge_desc_fb",this.var_2882);
         this.var_70.registerParameter(param1,"level",this.var_1233.toString());
         this.var_70.registerParameter(param1,"name",this.var_365.userName);
         return this.var_70.registerParameter(param1,"realname",this.var_365.realName);
      }
      
      public function dispose() : void
      {
         if(this.var_365 != null)
         {
            this.var_365.events.removeEventListener(BadgeImageReadyEvent.const_118,this.onBadgeImageReady);
            this.var_365 = null;
         }
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
         this.var_70 = null;
         this._assets = null;
         this._communication = null;
      }
      
      private function setText(param1:String, param2:String) : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc3_:ITextWindow = this._window.findChildByName(param1) as ITextWindow;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.text = param2;
      }
      
      private function setImage(param1:String, param2:BitmapData) : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc3_:IBitmapWrapperWindow = this._window.findChildByName(param1) as IBitmapWrapperWindow;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.bitmap = param2;
      }
      
      private function setBadge(param1:BitmapData, param2:String) : void
      {
         var _loc3_:BitmapData = (this._assets.getAssetByName(param2) as BitmapDataAsset).content as BitmapData;
         var _loc4_:BitmapData = _loc3_.clone();
         _loc4_.copyPixels(param1,param1.rect,new Point((_loc3_.width - param1.width) / 2,(_loc3_.height - param1.height) / 2),null,null,true);
         this.setImage("badge_image",_loc4_);
      }
      
      private function onBadgeImageReady(param1:BadgeImageReadyEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.badgeId != this.var_340)
         {
            return;
         }
         this.setBadge(param1.badgeImage,this.const_2053);
      }
      
      public function requestPostDialog(param1:String) : void
      {
         HabboWebTools.facebookAchievementPost(this.var_340,this._feedTitleFb,this.var_2881,param1);
      }
      
      private function eventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:IConnection = this._communication.getHabboMainConnection(null);
         switch(param2.name)
         {
            case "post_to_facebook":
               _loc3_.send(new GetAchievementShareIdComposer(this.var_2884));
               _loc3_.send(new EventLogMessageComposer("Achievements",this.var_340,"client.start_post"));
               this._window.visible = false;
               break;
            case "close":
               _loc3_.send(new EventLogMessageComposer("Achievements",this.var_340,"client.skip_post"));
               this.dispose();
               return;
         }
      }
   }
}
