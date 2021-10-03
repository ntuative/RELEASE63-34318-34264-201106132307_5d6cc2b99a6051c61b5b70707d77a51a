package com.sulake.habbo.ui.widget.purse.indicator
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.ui.widget.IRoomWidgetMessageListener;
   import com.sulake.habbo.ui.widget.events.RoomWidgetPurseUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenCatalogMessage;
   import com.sulake.habbo.ui.widget.purse.ICurrencyIndicator;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.events.IEventDispatcher;
   
   public class CreditsIndicator implements ICurrencyIndicator
   {
       
      
      private const const_2321:uint = 4.291993382E9;
      
      private const const_2322:uint = 4.29080704E9;
      
      private var _view:IWindowContainer;
      
      private var var_2507:IRoomWidgetMessageListener;
      
      private var var_2158:int;
      
      private var _disposed:Boolean = false;
      
      public function CreditsIndicator(param1:IHabboWindowManager, param2:IAssetLibrary)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         super();
         var _loc3_:XmlAsset = param2.getAssetByName("purse_indicator_credits") as XmlAsset;
         if(_loc3_)
         {
            this._view = param1.buildFromXML(_loc3_.content as XML,1) as IWindowContainer;
            this._view.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onCreditsClick);
            this._view.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onOrangeMouseOver);
            this._view.addEventListener(WindowMouseEvent.const_25,this.onOrangeMouseOut);
            _loc4_ = [];
            if(this._view.groupChildrenWithTag("ICON",_loc4_,true) == 1)
            {
               _loc5_ = _loc4_[0] as IBitmapWrapperWindow;
               _loc6_ = param2.getAssetByName("coin_icon").content as BitmapData;
               if(_loc5_)
               {
                  _loc5_.bitmap = _loc6_.clone();
                  _loc5_.width = _loc6_.width;
                  _loc5_.height = _loc6_.height;
               }
            }
         }
      }
      
      public function get view() : IWindowContainer
      {
         return this._view;
      }
      
      public function set widgetMessageListener(param1:IRoomWidgetMessageListener) : void
      {
         this.var_2507 = param1;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         if(this._view)
         {
            this._view.dispose();
            this._view = null;
         }
         this._disposed = true;
      }
      
      public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(!param1)
         {
            return;
         }
         param1.addEventListener(RoomWidgetPurseUpdateEvent.const_74,this.onCreditBalance);
      }
      
      public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetPurseUpdateEvent.const_74,this.onCreditBalance);
      }
      
      private function onCreditBalance(param1:RoomWidgetPurseUpdateEvent) : void
      {
         this.var_2158 = param1.balance;
         if(this._view)
         {
            this._view.findChildByName("credits").caption = this.var_2158.toString();
            this._view.findChildByName("credits_shadow").caption = this.var_2158.toString();
         }
      }
      
      private function onCreditsClick(param1:WindowMouseEvent) : void
      {
         this.var_2507.processWidgetMessage(new RoomWidgetOpenCatalogMessage(RoomWidgetOpenCatalogMessage.const_1354));
      }
      
      private function onOrangeMouseOver(param1:WindowMouseEvent) : void
      {
         this._view.color = this.const_2322;
      }
      
      private function onOrangeMouseOut(param1:WindowMouseEvent) : void
      {
         this._view.color = this.const_2321;
      }
   }
}
