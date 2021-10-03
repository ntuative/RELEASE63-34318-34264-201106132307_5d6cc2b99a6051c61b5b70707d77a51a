package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class ToolbarClickTracker
   {
       
      
      private var var_1411:IHabboTracking;
      
      private var var_1698:Boolean = false;
      
      private var var_2684:int = 0;
      
      private var var_1976:int = 0;
      
      public function ToolbarClickTracker(param1:IHabboTracking)
      {
         super();
         this.var_1411 = param1;
      }
      
      public function dispose() : void
      {
         this.var_1411 = null;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_1698 = Boolean(parseInt(param1.getKey("toolbar.tracking.enabled","1")));
         this.var_2684 = parseInt(param1.getKey("toolbar.tracking.max.events","100"));
      }
      
      public function track(param1:String) : void
      {
         if(!this.var_1698)
         {
            return;
         }
         ++this.var_1976;
         if(this.var_1976 <= this.var_2684)
         {
            this.var_1411.trackGoogle("toolbar",param1);
         }
      }
   }
}
