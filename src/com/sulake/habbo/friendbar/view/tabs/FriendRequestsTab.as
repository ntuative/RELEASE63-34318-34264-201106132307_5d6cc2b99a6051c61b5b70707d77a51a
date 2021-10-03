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
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.friendbar.data.FriendRequest;
   import flash.display.BitmapData;
   
   public class FriendRequestsTab extends Tab
   {
      
      protected static const const_2001:String = "friendRequestsTabXML";
      
      protected static const ICON:String = "icon";
      
      protected static const const_1015:String = "label";
      
      protected static const const_461:String = "header";
      
      protected static const const_309:String = "canvas";
      
      protected static const const_459:String = "bubble";
      
      protected static const const_665:String = "request_entity_list";
      
      protected static const const_674:String = "name";
      
      protected static const const_1999:String = "badge_counter";
      
      protected static const BUTTON_ACCEPT_ALL:String = "button_accept_all";
      
      protected static const const_2000:String = "click_area_discard_all";
      
      protected static const const_1382:String = "button_close";
      
      protected static const const_1990:String = "button_accept";
      
      protected static const const_1998:String = "click_area_discard";
      
      private static var var_1480:FriendRequestsTab;
      
      private static const const_69:uint = 4292915260;
      
      private static const const_1043:uint = 4294956373;
      
      private static const const_1548:uint = 4289498176;
      
      private static const ENTITY_COLOR_ODD:uint = 4287787558;
       
      
      private var _requests:Array;
      
      private var var_1888:Boolean = false;
      
      private var var_1225:IWindowContainer;
      
      public function FriendRequestsTab()
      {
         super();
         _window = this.allocateRequestsTabWindow();
      }
      
      public static function allocate(param1:Array) : FriendRequestsTab
      {
         var _loc2_:FriendRequestsTab = !!var_1480 ? var_1480 : new FriendRequestsTab();
         _loc2_.var_162 = false;
         _loc2_._requests = param1;
         _loc2_._window.findChildByName(const_1999).caption = String(param1.length);
         return _loc2_;
      }
      
      override public function dispose() : void
      {
         if(_window)
         {
            this.releaseRequestsTabWindow(_window);
            _window = null;
         }
         if(this.var_1225)
         {
            this.var_1225.dispose();
            this.var_1225 = null;
         }
         super.dispose();
      }
      
      override public function recycle() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!disposed)
         {
            if(!var_162)
            {
               if(_window)
               {
                  _loc1_ = _window.findChildByName(const_459) as IBubbleWindow;
                  if(_loc1_)
                  {
                     _loc2_ = _loc1_.content.getChildByName(const_665) as IItemListWindow;
                     if(_loc2_)
                     {
                        while(_loc2_.numListItems > 0)
                        {
                           _loc2_.removeListItemAt(0).dispose();
                        }
                     }
                  }
               }
               this.var_1888 = false;
               this._requests = null;
               var_162 = true;
               var_1480 = this;
            }
         }
      }
      
      override public function select(param1:Boolean) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         if(!selected)
         {
            if(_window)
            {
               _loc2_ = _window.findChildByName(const_459) as IBubbleWindow;
               if(_loc2_)
               {
                  _loc2_.visible = true;
                  if(!this.var_1888)
                  {
                     _loc3_ = _loc2_.content.getChildByName(const_665) as IItemListWindow;
                     if(_loc3_)
                     {
                        _loc7_ = 0;
                        while(_loc7_ < this._requests.length)
                        {
                           _loc4_ = this.var_1225.clone() as IWindowContainer;
                           _loc4_.color = _loc7_ % 2 == 0 ? uint(const_1548) : uint(ENTITY_COLOR_ODD);
                           _loc5_ = this._requests[_loc7_];
                           _loc4_.id = _loc5_.id;
                           _loc4_.getChildByName(const_674).caption = _loc5_.name;
                           _loc6_ = _loc4_.getChildByName(const_309) as IBitmapWrapperWindow;
                           _loc8_ = var_593.getAvatarFaceBitmap(_loc5_.figure);
                           if(_loc8_)
                           {
                              _loc6_.disposesBitmap = false;
                              _loc6_.bitmap = _loc8_;
                              _loc6_.width = _loc8_.width;
                              _loc6_.height = _loc8_.height;
                              _loc6_.disposesBitmap = true;
                           }
                           _loc3_.addListItem(_loc4_);
                           _loc7_++;
                        }
                     }
                  }
                  this.var_1888 = true;
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
         ITextWindow(_window.findChildByTag(const_1015)).underline = exposed;
      }
      
      override protected function conceal() : void
      {
         super.conceal();
         _window.color = !!exposed ? uint(const_1043) : uint(const_69);
         ITextWindow(_window.findChildByTag(const_1015)).underline = exposed;
      }
      
      private function allocateRequestsTabWindow() : IWindowContainer
      {
         var _loc5_:* = null;
         var _loc1_:IWindowContainer = WINDOWING.buildFromXML(ASSETS.getAssetByName(const_2001).content as XML) as IWindowContainer;
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(_loc1_.findChildByName(const_309));
         var _loc3_:IRegionWindow = IRegionWindow(_loc1_.findChildByName(const_461));
         var _loc4_:IBubbleWindow = _loc1_.findChildByName(const_459) as IBubbleWindow;
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
         _loc2_.disposesBitmap = true;
         _loc4_.visible = false;
         _loc4_.y = -(_loc4_.height - (_loc4_.height - _loc4_.margins.bottom)) - 1;
         _loc4_.procedure = this.bubbleEventProc;
         _loc5_ = ASSETS.getAssetByName("add_friends_icon_png") as BitmapDataAsset;
         var _loc6_:IBitmapWrapperWindow = _loc1_.findChildByName(ICON) as IBitmapWrapperWindow;
         _loc6_.disposesBitmap = false;
         _loc6_.bitmap = _loc5_.content as BitmapData;
         var _loc7_:IItemListWindow = _loc4_.content.getChildByName(const_665) as IItemListWindow;
         this.var_1225 = _loc7_.removeListItemAt(0) as IWindowContainer;
         return _loc1_;
      }
      
      private function releaseRequestsTabWindow(param1:IWindowContainer) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
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
            param1.width = name_2;
            param1.height = name_1;
            param1.color = const_69;
            _loc3_ = IBitmapWrapperWindow(param1.findChildByName(const_309));
            _loc3_.bitmap = null;
            ITextWindow(param1.findChildByTag(const_1015)).underline = false;
         }
      }
      
      private function bubbleEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case const_1382:
                  if(selected)
                  {
                     var_593.deSelect(true);
                  }
                  break;
               case BUTTON_ACCEPT_ALL:
                  var_303.acceptAllFriendRequests();
                  break;
               case const_2000:
                  var_303.declineAllFriendRequests();
                  break;
               case const_1990:
                  var_303.acceptFriendRequest(param2.parent.id);
                  break;
               case const_1998:
                  var_303.declineFriendRequest(param2.parent.id);
            }
         }
      }
      
      public function avatarImageReady(param1:FriendRequest, param2:BitmapData) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         if(disposed)
         {
            return;
         }
         var _loc3_:IBubbleWindow = _window.findChildByName(const_459) as IBubbleWindow;
         if(_loc3_)
         {
            _loc4_ = _loc3_.content.getChildByName(const_665) as IItemListWindow;
            if(_loc4_)
            {
               _loc6_ = 0;
               while(_loc6_ < _loc4_.numListItems)
               {
                  _loc5_ = _loc4_.getListItemAt(0) as IWindowContainer;
                  if(_loc5_.id == param1.id)
                  {
                     _loc7_ = _loc5_.getChildByName(const_309) as IBitmapWrapperWindow;
                     _loc7_.disposesBitmap = true;
                     _loc7_.bitmap = param2;
                     _loc7_.width = param2.width;
                     _loc7_.height = param2.height;
                     return;
                  }
                  _loc6_++;
               }
            }
         }
      }
   }
}
