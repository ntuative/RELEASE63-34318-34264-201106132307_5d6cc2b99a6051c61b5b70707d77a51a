package com.sulake.core.utils.profiler.tracking
{
   import flash.display.BitmapData;
   
   public class TrackedBitmapData extends BitmapData
   {
      
      public static const const_2250:int = 16777215;
      
      public static const const_1172:int = 8191;
      
      public static const const_1177:int = 8191;
      
      public static const const_2267:int = 1;
      
      public static const const_1339:int = 1;
      
      public static const const_1366:int = 1;
      
      private static var var_578:uint = 0;
      
      private static var var_579:uint = 0;
       
      
      private var _owner:Object;
      
      private var _disposed:Boolean = false;
      
      public function TrackedBitmapData(param1:*, param2:int, param3:int, param4:Boolean = true, param5:uint = 4.294967295E9)
      {
         if(param2 > const_1172)
         {
            param2 = const_1172;
         }
         else if(param2 < const_1339)
         {
            param2 = const_1339;
         }
         if(param3 > const_1177)
         {
            param3 = const_1177;
         }
         else if(param3 < const_1366)
         {
            param3 = const_1366;
         }
         super(param2,param3,param4,param5);
         ++var_578;
         var_579 += param2 * param3 * 4;
         this._owner = param1;
      }
      
      public static function get numInstances() : uint
      {
         return var_578;
      }
      
      public static function get allocatedByteCount() : uint
      {
         return var_579;
      }
      
      override public function dispose() : void
      {
         if(!this._disposed)
         {
            var_579 -= width * height * 4;
            --var_578;
            this._disposed = true;
            this._owner = null;
            super.dispose();
         }
      }
   }
}
