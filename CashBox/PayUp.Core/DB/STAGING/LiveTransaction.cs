//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PayUp.Core.DB.STAGING
{
    using System;
    using System.Collections.Generic;
    
    public partial class LiveTransaction
    {
        public int TransactionID { get; set; }
        public string MerchantID { get; set; }
        public string Email { get; set; }
        public string MerchantTransactionRef { get; set; }
        public string CardProcessorTransactionRef { get; set; }
        public string Amount { get; set; }
        public string Purpose { get; set; }
        public string ResponseCode { get; set; }
        public string TransactionStatus { get; set; }
        public string IpAddress { get; set; }
        public string Date { get; set; }
        public string TimeStamp { get; set; }
    }
}
