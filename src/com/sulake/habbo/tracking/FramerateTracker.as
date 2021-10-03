package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1925:int;
      
      private var var_2588:int;
      
      private var var_751:int;
      
      private var var_569:Number;
      
      private var var_2587:Boolean;
      
      private var var_2589:int;
      
      private var var_1924:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function get frameRate() : int
      {
         return Math.round(1000 / this.var_569);
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2588 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2589 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2587 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         ++this.var_751;
         if(this.var_751 == 1)
         {
            this.var_569 = param1;
            this.var_1925 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_751);
            this.var_569 = this.var_569 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2587 && param3 - this.var_1925 >= this.var_2588)
         {
            this.var_751 = 0;
            if(this.var_1924 < this.var_2589)
            {
               param2.trackGoogle("performance","averageFramerate",this.frameRate);
               ++this.var_1924;
               this.var_1925 = param3;
            }
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
