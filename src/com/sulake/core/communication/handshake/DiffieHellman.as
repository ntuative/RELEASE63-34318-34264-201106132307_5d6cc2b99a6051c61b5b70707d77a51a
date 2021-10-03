package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1030:BigInteger;
      
      private var var_2664:BigInteger;
      
      private var var_2099:BigInteger;
      
      private var var_2908:BigInteger;
      
      private var var_1649:BigInteger;
      
      private var var_2100:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1649 = param1;
         this.var_2100 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1649.toString() + ",generator: " + this.var_2100.toString() + ",secret: " + param1);
         this.var_1030 = new BigInteger();
         this.var_1030.fromRadix(param1,param2);
         this.var_2664 = this.var_2100.modPow(this.var_1030,this.var_1649);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_2099 = new BigInteger();
         this.var_2099.fromRadix(param1,param2);
         this.var_2908 = this.var_2099.modPow(this.var_1030,this.var_1649);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2664.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2908.toRadix(param1);
      }
   }
}
