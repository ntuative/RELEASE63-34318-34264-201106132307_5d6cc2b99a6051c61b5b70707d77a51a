package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_1041:IAssetLoader;
      
      private var var_2539:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         this.var_2539 = param1;
         this.var_1041 = param2;
      }
      
      public function get assetName() : String
      {
         return this.var_2539;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return this.var_1041;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_1041 != null)
            {
               if(!this.var_1041.disposed)
               {
                  this.var_1041.dispose();
                  this.var_1041 = null;
               }
            }
            super.dispose();
         }
      }
   }
}
