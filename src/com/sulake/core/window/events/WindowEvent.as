package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   
   public class WindowEvent
   {
      
      public static const const_1988:String = "WE_DESTROY";
      
      public static const const_329:String = "WE_DESTROYED";
      
      public static const const_1785:String = "WE_OPEN";
      
      public static const const_1784:String = "WE_OPENED";
      
      public static const const_1727:String = "WE_CLOSE";
      
      public static const const_1884:String = "WE_CLOSED";
      
      public static const const_1782:String = "WE_FOCUS";
      
      public static const const_335:String = "WE_FOCUSED";
      
      public static const const_1816:String = "WE_UNFOCUS";
      
      public static const const_1758:String = "WE_UNFOCUSED";
      
      public static const const_1875:String = "WE_ACTIVATE";
      
      public static const const_501:String = "WE_ACTIVATED";
      
      public static const const_1726:String = "WE_DEACTIVATE";
      
      public static const const_636:String = "WE_DEACTIVATED";
      
      public static const const_361:String = "WE_SELECT";
      
      public static const const_48:String = "WE_SELECTED";
      
      public static const const_486:String = "WE_UNSELECT";
      
      public static const const_588:String = "WE_UNSELECTED";
      
      public static const const_1719:String = "WE_LOCK";
      
      public static const const_1976:String = "WE_LOCKED";
      
      public static const const_1924:String = "WE_UNLOCK";
      
      public static const const_1745:String = "WE_UNLOCKED";
      
      public static const const_926:String = "WE_ENABLE";
      
      public static const const_308:String = "WE_ENABLED";
      
      public static const const_827:String = "WE_DISABLE";
      
      public static const const_273:String = "WE_DISABLED";
      
      public static const WINDOW_EVENT_RELOCATE:String = "WE_RELOCATE";
      
      public static const const_434:String = "WE_RELOCATED";
      
      public static const const_1275:String = "WE_RESIZE";
      
      public static const const_39:String = "WE_RESIZED";
      
      public static const const_1887:String = "WE_MINIMIZE";
      
      public static const const_1951:String = "WE_MINIMIZED";
      
      public static const const_1724:String = "WE_MAXIMIZE";
      
      public static const const_1787:String = "WE_MAXIMIZED";
      
      public static const const_1713:String = "WE_RESTORE";
      
      public static const const_1865:String = "WE_RESTORED";
      
      public static const const_522:String = "WE_CHILD_ADDED";
      
      public static const const_440:String = "WE_CHILD_REMOVED";
      
      public static const const_223:String = "WE_CHILD_RELOCATED";
      
      public static const const_166:String = "WE_CHILD_RESIZED";
      
      public static const const_331:String = "WE_CHILD_ACTIVATED";
      
      public static const const_488:String = "WE_PARENT_ADDED";
      
      public static const const_1802:String = "WE_PARENT_REMOVED";
      
      public static const const_1700:String = "WE_PARENT_RELOCATED";
      
      public static const const_775:String = "WE_PARENT_RESIZED";
      
      public static const const_1214:String = "WE_PARENT_ACTIVATED";
      
      public static const const_177:String = "WE_OK";
      
      public static const const_531:String = "WE_CANCEL";
      
      public static const const_110:String = "WE_CHANGE";
      
      public static const const_607:String = "WE_SCROLL";
      
      public static const const_113:String = "";
      
      private static const POOL:Array = [];
       
      
      protected var _type:String;
      
      protected var _window:IWindow;
      
      protected var var_732:IWindow;
      
      protected var var_1125:Boolean;
      
      protected var var_499:Boolean;
      
      protected var var_162:Boolean;
      
      protected var var_733:Array;
      
      public function WindowEvent()
      {
         super();
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false) : WindowEvent
      {
         var _loc5_:WindowEvent = POOL.length > 0 ? POOL.pop() : new WindowEvent();
         _loc5_._type = param1;
         _loc5_._window = param2;
         _loc5_.var_732 = param3;
         _loc5_.var_499 = param4;
         _loc5_.var_162 = false;
         _loc5_.var_733 = POOL;
         return _loc5_;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get target() : IWindow
      {
         return this._window;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_732;
      }
      
      public function get cancelable() : Boolean
      {
         return this.var_499;
      }
      
      public function recycle() : void
      {
         if(this.var_162)
         {
            throw new Error("Event already recycled!");
         }
         this.var_732 = null;
         this._window = null;
         this.var_162 = true;
         this.var_1125 = false;
         this.var_733.push(this);
      }
      
      public function clone() : WindowEvent
      {
         return allocate(this._type,this.window,this.related,this.cancelable);
      }
      
      public function preventDefault() : void
      {
         this.preventWindowOperation();
      }
      
      public function isDefaultPrevented() : Boolean
      {
         return this.var_1125;
      }
      
      public function preventWindowOperation() : void
      {
         if(this.cancelable)
         {
            this.var_1125 = true;
            return;
         }
         throw new Error("Attempted to prevent window operation that is not cancelable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1125;
      }
      
      public function stopPropagation() : void
      {
         this.var_1125 = true;
      }
      
      public function stopImmediatePropagation() : void
      {
         this.var_1125 = true;
      }
      
      public function toString() : String
      {
         return "WindowEvent { type: " + this._type + " cancelable: " + this.var_499 + " window: " + this._window + " }";
      }
   }
}
