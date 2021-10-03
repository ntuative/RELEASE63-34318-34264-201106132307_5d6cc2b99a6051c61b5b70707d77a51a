package com.sulake.habbo.friendbar.view.tabs
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IBubbleWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowStyle;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.friendbar.data.FriendEntity;
   import com.sulake.habbo.friendbar.data.FriendRequest;
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   
   public class FriendRequestTab extends FriendEntityTab
   {
      
      protected static const const_1991:String = "friendRequestTabXML";
      
      protected static const const_459:String = "bubble";
      
      protected static const const_1120:String = "message";
      
      protected static const const_1990:String = "button_accept";
      
      protected static const const_1382:String = "button_close";
      
      protected static const REGION_REJECT:String = "click_region_reject";
      
      protected static const const_2273:String = "link_reject";
      
      private static const const_69:uint = 14725180;
      
      private static const const_1043:uint = 16766293;
      
      private static var var_1480:FriendRequestTab;
       
      
      private var var_3057:String;
      
      public function FriendRequestTab()
      {
         super();
         _window = this.allocateRequestTabWindow();
         if(_window)
         {
            _window.findChildByName(const_459).visible = false;
         }
      }
      
      public static function allocate(param1:FriendRequest) : FriendRequestTab
      {
         var _loc3_:* = null;
         var _loc2_:FriendRequestTab = !!var_1480 ? var_1480 : new FriendRequestTab();
         _loc2_.var_162 = false;
         if(_loc2_.friend)
         {
            if(_loc2_.friend.figure != param1.figure)
            {
               _loc3_ = IBitmapWrapperWindow(_loc2_._window.findChildByName(const_309));
               _loc3_.bitmap = var_593.getAvatarFaceBitmap(param1.figure);
            }
         }
         _loc2_.friend = new FriendEntity(param1.id,param1.name,null,null,-1,false,false,param1.figure,0,null);
         return _loc2_;
      }
      
      override public function dispose() : void
      {
         if(_window)
         {
            this.releaseRequestTabWindow(_window);
            _window = null;
         }
         super.dispose();
      }
      
      override public function recycle() : void
      {
         if(!disposed)
         {
            if(!var_162)
            {
               var_144 = null;
               var_162 = true;
               var_1480 = this;
            }
         }
      }
      
      override public function select(param1:Boolean) : void
      {
         var _loc2_:* = null;
         if(!selected)
         {
            if(_window)
            {
               _loc2_ = _window.findChildByName(const_459);
               if(_loc2_)
               {
                  _loc2_.visible = true;
               }
            }
            super.select(param1);
         }
      }
      
      override public function deselect(param1:Boolean) : void
      {
         var _loc2_:* = null;
         if(selected)
         {
            if(_window)
            {
               _loc2_ = _window.findChildByName(const_459);
               if(_loc2_)
               {
                  _loc2_.visible = false;
               }
            }
            super.deselect(param1);
         }
      }
      
      override protected function expose() : void
      {
         super.expose();
         _window.color = !!exposed ? uint(const_1043) : uint(const_69);
      }
      
      override protected function conceal() : void
      {
         super.conceal();
         _window.color = !!exposed ? uint(const_1043) : uint(const_69);
      }
      
      private function allocateRequestTabWindow() : IWindowContainer
      {
         var _loc6_:* = null;
         var _loc1_:IWindowContainer = WINDOWING.buildFromXML(ASSETS.getAssetByName(const_1991).content as XML) as IWindowContainer;
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(_loc1_.findChildByName(const_309));
         var _loc3_:IRegionWindow = IRegionWindow(_loc1_.findChildByName(const_461));
         var _loc4_:IWindow = _loc1_.findChildByName(const_377);
         var _loc5_:IBubbleWindow = _loc1_.findChildByName(const_459) as IBubbleWindow;
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.width = name_2;
         _loc1_.height = name_1;
         _loc1_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
         _loc1_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
         _loc1_.addEventListener(WindowMouseEvent.const_25,onMouseOut);
         _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
         _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
         _loc3_.addEventListener(WindowMouseEvent.const_25,onMouseOut);
         _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
         _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
         _loc4_.addEventListener(WindowMouseEvent.const_25,onMouseOut);
         _loc2_.disposesBitmap = true;
         _loc5_.procedure = this.bubbleEventProc;
         _loc5_.y = -(_loc5_.height - (_loc5_.height - _loc5_.margins.bottom)) - 1;
         var _loc7_:IRegionWindow = WINDOWING.create("ICON",WindowType.const_370,WindowStyle.const_106,WindowParam.const_30,new Rectangle(0,0,25,25)) as IRegionWindow;
         _loc7_.mouseThreshold = 0;
         var _loc8_:IBitmapWrapperWindow = WINDOWING.create("BITMAP",WindowType.const_458,WindowStyle.const_106,WindowParam.const_33,new Rectangle(0,0,25,25)) as IBitmapWrapperWindow;
         _loc8_.disposesBitmap = false;
         _loc6_ = ASSETS.getAssetByName("plus_friend_icon_png") as BitmapDataAsset;
         if(_loc6_)
         {
            _loc8_.bitmap = _loc6_.content as BitmapData;
         }
         _loc7_.addChild(_loc8_);
         IItemListWindow(_loc1_.findChildByName(const_377)).addListItemAt(_loc7_,0);
         return _loc1_;
      }
      
      private function releaseRequestTabWindow(param1:IWindowContainer) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 && !param1.disposed)
         {
            param1.procedure = null;
            param1.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
            param1.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
            param1.removeEventListener(WindowMouseEvent.const_25,onMouseOut);
            _loc2_ = IRegionWindow(param1.findChildByName(const_461));
            _loc2_.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
            _loc2_.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
            _loc2_.removeEventListener(WindowMouseEvent.const_25,onMouseOut);
            _loc3_ = param1.findChildByName(const_377);
            _loc3_.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
            _loc3_.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseClick);
            _loc3_.removeEventListener(WindowMouseEvent.const_25,onMouseClick);
            param1.width = name_2;
            param1.height = name_1;
            param1.color = const_69;
            _loc4_ = IBitmapWrapperWindow(param1.findChildByName(const_309));
            _loc4_.bitmap = null;
            ITextWindow(param1.findChildByTag("label")).underline = false;
         }
      }
      
      private function bubbleEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case const_1990:
                  var_303.acceptFriendRequest(var_144.id);
                  break;
               case const_1382:
                  var_303.declineFriendRequest(var_144.id);
                  break;
               case REGION_REJECT:
                  var_303.declineFriendRequest(var_144.id);
            }
         }
      }
      
      public function avatarImageReady(param1:FriendRequest, param2:BitmapData) : void
      {
         var _loc3_:* = null;
         if(!disposed)
         {
            if(friend)
            {
               if(friend.figure == param1.figure)
               {
                  _loc3_ = _window.findChildByName(const_309) as IBitmapWrapperWindow;
                  if(_loc3_)
                  {
                     _loc3_.bitmap = var_593.getAvatarFaceBitmap(param1.figure);
                  }
               }
            }
         }
      }
   }
}
