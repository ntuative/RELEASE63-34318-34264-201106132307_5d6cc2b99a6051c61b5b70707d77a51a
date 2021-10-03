package com.sulake.habbo.ui.widget.purse
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetGetPurseData;
   import com.sulake.habbo.ui.widget.purse.indicator.CreditsIndicator;
   import com.sulake.habbo.ui.widget.purse.indicator.PixelsIndicator;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   
   public class PurseWidget extends RoomWidgetBase
   {
       
      
      private const const_2036:int = 3;
      
      private var _view:IWindowContainer;
      
      private var var_661:Vector.<ICurrencyIndicator>;
      
      public function PurseWidget(param1:IRoomWidgetHandler, param2:IHabboWindowManager, param3:IAssetLibrary, param4:IHabboLocalizationManager)
      {
         var _loc6_:* = null;
         this.var_661 = new Vector.<ICurrencyIndicator>();
         super(param1,param2,param3,param4);
         var _loc5_:XmlAsset = param3.getAssetByName("purse_widget") as XmlAsset;
         if(_loc5_)
         {
            this._view = param2.buildFromXML(_loc5_.content as XML,1) as IWindowContainer;
            this._view.visible = false;
            _loc6_ = this._view.findChildByName("indicator_itemlist") as IItemListWindow;
            if(_loc6_)
            {
               this.addIndicatorToList(_loc6_,new CreditsIndicator(param2,param3) as ICurrencyIndicator);
               this.addIndicatorToList(_loc6_,new PixelsIndicator(param2,param3) as ICurrencyIndicator);
            }
            this.rePosition();
         }
      }
      
      private function addIndicatorToList(param1:IItemListWindow, param2:ICurrencyIndicator) : void
      {
         param1.addListItem(param2.view);
         this.var_661.push(param2);
      }
      
      private function rePosition() : void
      {
         var _loc1_:IWindowContainer = this._view.desktop;
         this._view.x = _loc1_.width - this._view.width - this.const_2036;
         this._view.y = this.const_2036;
      }
      
      override public function initialize(param1:int = 0) : void
      {
         var _loc2_:* = null;
         messageListener.processWidgetMessage(new RoomWidgetGetPurseData());
         if(this._view)
         {
            for each(_loc2_ in this.var_661)
            {
               _loc2_.widgetMessageListener = messageListener;
            }
            this._view.visible = true;
         }
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(disposed)
         {
            return;
         }
         if(this._view)
         {
            this._view.dispose();
            this._view = null;
         }
         if(this.var_661)
         {
            for each(_loc1_ in this.var_661)
            {
               _loc1_.dispose();
            }
            this.var_661 = null;
         }
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         var _loc2_:* = null;
         if(!param1)
         {
            return;
         }
         for each(_loc2_ in this.var_661)
         {
            _loc2_.registerUpdateEvents(param1);
         }
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            return;
         }
         for each(_loc2_ in this.var_661)
         {
            _loc2_.unregisterUpdateEvents(param1);
         }
      }
   }
}
