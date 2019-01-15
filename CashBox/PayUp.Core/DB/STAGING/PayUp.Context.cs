﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class PayUpEntities : DbContext
    {
        public PayUpEntities()
            : base("name=PayUpEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<ApiKey> ApiKeys { get; set; }
        public virtual DbSet<Bank> Banks { get; set; }
        public virtual DbSet<BusinessProfile> BusinessProfiles { get; set; }
        public virtual DbSet<CardBlacklist> CardBlacklists { get; set; }
        public virtual DbSet<CompanyProfile> CompanyProfiles { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<InvoiceAttachment> InvoiceAttachments { get; set; }
        public virtual DbSet<Invoice> Invoices { get; set; }
        public virtual DbSet<IpBlacklisting> IpBlacklistings { get; set; }
        public virtual DbSet<LiveTransaction> LiveTransactions { get; set; }
        public virtual DbSet<MerchantLogo> MerchantLogoes { get; set; }
        public virtual DbSet<MerchantStatu> MerchantStatus { get; set; }
        public virtual DbSet<PaymentPageField> PaymentPageFields { get; set; }
        public virtual DbSet<PaymentPage> PaymentPages { get; set; }
        public virtual DbSet<Payout> Payouts { get; set; }
        public virtual DbSet<Plan> Plans { get; set; }
        public virtual DbSet<Priviledge> Priviledges { get; set; }
        public virtual DbSet<ProductField> ProductFields { get; set; }
        public virtual DbSet<ProductName> ProductNames { get; set; }
        public virtual DbSet<ProductPage> ProductPages { get; set; }
        public virtual DbSet<ProductPrice> ProductPrices { get; set; }
        public virtual DbSet<Registration> Registrations { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<SettlementDetail> SettlementDetails { get; set; }
        public virtual DbSet<Settlement> Settlements { get; set; }
        public virtual DbSet<Subscription> Subscriptions { get; set; }
        public virtual DbSet<TeamMember> TeamMembers { get; set; }
        public virtual DbSet<TestTransaction> TestTransactions { get; set; }
        public virtual DbSet<Token> Tokens { get; set; }
        public virtual DbSet<URL> URLs { get; set; }
    }
}
