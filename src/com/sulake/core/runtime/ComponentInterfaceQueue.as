package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1908:IID;
      
      private var var_1121:Boolean;
      
      private var var_1228:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_1908 = param1;
         this.var_1228 = new Array();
         this.var_1121 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_1908;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1121;
      }
      
      public function get receivers() : Array
      {
         return this.var_1228;
      }
      
      public function dispose() : void
      {
         if(!this.var_1121)
         {
            this.var_1121 = true;
            this.var_1908 = null;
            while(this.var_1228.length > 0)
            {
               this.var_1228.pop();
            }
            this.var_1228 = null;
         }
      }
   }
}
