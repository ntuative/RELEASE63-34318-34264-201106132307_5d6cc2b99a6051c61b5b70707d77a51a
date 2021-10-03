package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_1598:IID;
      
      private var var_2013:String;
      
      private var var_116:IUnknown;
      
      private var var_854:uint;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1598 = param1;
         this.var_2013 = getQualifiedClassName(this.var_1598);
         this.var_116 = param2;
         this.var_854 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1598;
      }
      
      public function get iis() : String
      {
         return this.var_2013;
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_116;
      }
      
      public function get references() : uint
      {
         return this.var_854;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_116 == null;
      }
      
      public function dispose() : void
      {
         this.var_1598 = null;
         this.var_2013 = null;
         this.var_116 = null;
         this.var_854 = 0;
      }
      
      public function reserve() : uint
      {
         return ++this.var_854;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_854) : uint(0);
      }
   }
}
