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
    
    public partial class IpBlacklisting
    {
        public int IpBlacklistingID { get; set; }
        public string MerchantID { get; set; }
        public string IpAddress { get; set; }
        public string Country { get; set; }
        public string Reason { get; set; }
        public string Date { get; set; }
    }
}
