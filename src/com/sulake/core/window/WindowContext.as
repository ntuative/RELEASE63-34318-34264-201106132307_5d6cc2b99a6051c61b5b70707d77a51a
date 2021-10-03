package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.services.IInternalWindowServices;
   import com.sulake.core.window.services.ServiceManager;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventProcessor;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.MouseEventProcessor;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import com.sulake.core.window.utils.tablet.TabletEventProcessor;
   import com.sulake.core.window.utils.tablet.TabletEventQueue;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, IUpdateReceiver
   {
      
      public static const const_544:uint = 0;
      
      public static const const_1820:uint = 1;
      
      public static const const_2069:int = 0;
      
      public static const const_2254:int = 1;
      
      public static const const_2140:int = 2;
      
      public static const const_2244:int = 3;
      
      public static const const_1925:int = 4;
      
      public static const const_456:int = 5;
      
      public static var var_421:IEventQueue;
      
      private static var var_611:IEventProcessor;
      
      private static var var_1703:uint = const_544;
      
      private static var stage:Stage;
      
      private static var var_170:IWindowRenderer;
       
      
      private var var_2264:EventProcessorState;
      
      private var var_2263:IWindowContextStateListener;
      
      protected var _localization:ICoreLocalizationManager;
      
      protected var var_141:DisplayObjectContainer;
      
      protected var var_3050:Boolean = true;
      
      protected var var_1386:Error;
      
      protected var var_2206:int = -1;
      
      protected var var_1387:IInternalWindowServices;
      
      protected var var_1674:IWindowParser;
      
      protected var var_2993:IWindowFactory;
      
      protected var var_94:IDesktopWindow;
      
      protected var var_1673:SubstituteParentController;
      
      private var _disposed:Boolean = false;
      
      private var var_600:Boolean = false;
      
      private var var_2265:Boolean = false;
      
      private var _name:String;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         super();
         this._name = param1;
         var_170 = param2;
         this._localization = param4;
         this.var_141 = param5;
         this.var_1387 = new ServiceManager(this,param5);
         this.var_2993 = param3;
         this.var_1674 = new WindowParser(this);
         this.var_2263 = param7;
         if(!stage)
         {
            if(this.var_141 is Stage)
            {
               stage = this.var_141 as Stage;
            }
            else if(this.var_141.stage)
            {
               stage = this.var_141.stage;
            }
         }
         Classes.init();
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         this.var_94 = new DesktopController("_CONTEXT_DESKTOP_" + this._name,this,param6);
         this.var_94.limits.maxWidth = param6.width;
         this.var_94.limits.maxHeight = param6.height;
         this.var_141.addChild(this.var_94.getDisplayObject());
         this.var_141.doubleClickEnabled = true;
         this.var_141.addEventListener(Event.RESIZE,this.stageResizedHandler);
         this.var_2264 = new EventProcessorState(var_170,this.var_94,this.var_94,null,this.var_2263);
         inputMode = const_544;
         this.var_1673 = new SubstituteParentController(this);
      }
      
      public static function get inputMode() : uint
      {
         return var_1703;
      }
      
      public static function set inputMode(param1:uint) : void
      {
         var value:uint = param1;
         if(var_421)
         {
            if(var_421 is IDisposable)
            {
               IDisposable(var_421).dispose();
            }
         }
         if(var_611)
         {
            if(var_611 is IDisposable)
            {
               IDisposable(var_611).dispose();
            }
         }
         switch(value)
         {
            case const_544:
               var_421 = new MouseEventQueue(stage);
               var_611 = new MouseEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            case const_1820:
               var_421 = new TabletEventQueue(stage);
               var_611 = new TabletEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            default:
               inputMode = const_544;
               throw new Error("Unknown input mode " + value);
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_141.removeEventListener(Event.RESIZE,this.stageResizedHandler);
            this.var_141.removeChild(IGraphicContextHost(this.var_94).getGraphicContext(true) as DisplayObject);
            this.var_94.destroy();
            this.var_94 = null;
            this.var_1673.destroy();
            this.var_1673 = null;
            if(this.var_1387 is IDisposable)
            {
               IDisposable(this.var_1387).dispose();
            }
            this.var_1387 = null;
            this.var_1674.dispose();
            this.var_1674 = null;
            var_170 = null;
         }
      }
      
      public function getLastError() : Error
      {
         return this.var_1386;
      }
      
      public function getLastErrorCode() : int
      {
         return this.var_2206;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         this.var_1386 = param2;
         this.var_2206 = param1;
         if(this.var_3050)
         {
            throw param2;
         }
      }
      
      public function flushError() : void
      {
         this.var_1386 = null;
         this.var_2206 = -1;
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return this.var_1387;
      }
      
      public function getWindowParser() : IWindowParser
      {
         return this.var_1674;
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return this.var_2993;
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return this.var_94;
      }
      
      public function findWindowByName(param1:String) : IWindow
      {
         return this.var_94.findChildByName(param1);
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:* = null;
         var _loc13_:Class = Classes.getWindowClassByType(param3);
         if(_loc13_ == null)
         {
            this.handleError(WindowContext.const_1925,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = this.var_1673;
            }
         }
         _loc12_ = new _loc13_(param1,param3,param4,param5,this,param6,param8 != null ? param8 : this.var_94,param7,param10,param11,param9);
         if(param2 && param2.length)
         {
            _loc12_.caption = param2;
         }
         return _loc12_;
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == this.var_94)
         {
            this.var_94 = null;
         }
         if(param1.state != WindowState.const_497)
         {
            param1.destroy();
         }
         return true;
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : void
      {
         if(!this.disposed)
         {
            var_170.addToRenderQueue(WindowController(param1),param2,param3);
         }
      }
      
      public function update(param1:uint) : void
      {
         this.var_600 = true;
         if(this.var_1386)
         {
            throw this.var_1386;
         }
         var_611.process(this.var_2264,var_421);
         this.var_600 = false;
      }
      
      public function render(param1:uint) : void
      {
         this.var_2265 = true;
         var_170.update(param1);
         this.var_2265 = false;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(this.var_94 != null && !this.var_94.disposed)
         {
            if(this.var_141 is Stage)
            {
               this.var_94.limits.maxWidth = Stage(this.var_141).stageWidth;
               this.var_94.limits.maxHeight = Stage(this.var_141).stageHeight;
               this.var_94.width = Stage(this.var_141).stageWidth;
               this.var_94.height = Stage(this.var_141).stageHeight;
            }
            else
            {
               this.var_94.limits.maxWidth = this.var_141.width;
               this.var_94.limits.maxHeight = this.var_141.height;
               this.var_94.width = this.var_141.width;
               this.var_94.height = this.var_141.height;
            }
         }
      }
   }
}
