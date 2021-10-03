package com.sulake.habbo.ui.widget.purse
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.ui.widget.IRoomWidgetMessageListener;
   import flash.events.IEventDispatcher;
   
   public interface ICurrencyIndicator
   {
       
      
      function dispose() : void;
      
      function get view() : IWindowContainer;
      
      function set widgetMessageListener(param1:IRoomWidgetMessageListener) : void;
      
      function registerUpdateEvents(param1:IEventDispatcher) : void;
      
      function unregisterUpdateEvents(param1:IEventDispatcher) : void;
   }
}
