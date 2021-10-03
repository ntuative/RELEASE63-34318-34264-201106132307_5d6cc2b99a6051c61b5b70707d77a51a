package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_3022:uint;
      
      private var _root:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var var_652:IWindowContext;
      
      private var var_1183:IMouseDraggingService;
      
      private var var_1182:IMouseScalingService;
      
      private var var_1185:IMouseListenerService;
      
      private var var_1181:IFocusManagerService;
      
      private var var_1184:IToolTipAgentService;
      
      private var var_1180:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_3022 = 0;
         this._root = param2;
         this.var_652 = param1;
         this.var_1183 = new WindowMouseDragger(param2);
         this.var_1182 = new WindowMouseScaler(param2);
         this.var_1185 = new WindowMouseListener(param2);
         this.var_1181 = new FocusManager(param2);
         this.var_1184 = new WindowToolTipAgent(param2);
         this.var_1180 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1183 != null)
         {
            this.var_1183.dispose();
            this.var_1183 = null;
         }
         if(this.var_1182 != null)
         {
            this.var_1182.dispose();
            this.var_1182 = null;
         }
         if(this.var_1185 != null)
         {
            this.var_1185.dispose();
            this.var_1185 = null;
         }
         if(this.var_1181 != null)
         {
            this.var_1181.dispose();
            this.var_1181 = null;
         }
         if(this.var_1184 != null)
         {
            this.var_1184.dispose();
            this.var_1184 = null;
         }
         if(this.var_1180 != null)
         {
            this.var_1180.dispose();
            this.var_1180 = null;
         }
         this._root = null;
         this.var_652 = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1183;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1182;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1185;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1181;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1184;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1180;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
