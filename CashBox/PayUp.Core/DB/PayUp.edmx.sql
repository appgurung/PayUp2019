
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/19/2022 11:59:24
-- Generated from EDMX file: C:\DevBox\DotNet\Web\Core\PayUp2019\CashBox\PayUp.Core\DB\PayUp.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [payup];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[ApiKeys]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ApiKeys];
GO
IF OBJECT_ID(N'[dbo].[Banks]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Banks];
GO
IF OBJECT_ID(N'[dbo].[BusinessProfiles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BusinessProfiles];
GO
IF OBJECT_ID(N'[dbo].[CardBlacklists]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CardBlacklists];
GO
IF OBJECT_ID(N'[dbo].[CompanyProfiles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CompanyProfiles];
GO
IF OBJECT_ID(N'[dbo].[Customers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Customers];
GO
IF OBJECT_ID(N'[dbo].[InvoiceAttachments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InvoiceAttachments];
GO
IF OBJECT_ID(N'[dbo].[Invoices]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Invoices];
GO
IF OBJECT_ID(N'[dbo].[IpBlacklistings]', 'U') IS NOT NULL
    DROP TABLE [dbo].[IpBlacklistings];
GO
IF OBJECT_ID(N'[dbo].[LiveTransactions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LiveTransactions];
GO
IF OBJECT_ID(N'[dbo].[MerchantLogoes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MerchantLogoes];
GO
IF OBJECT_ID(N'[dbo].[MerchantStatus]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MerchantStatus];
GO
IF OBJECT_ID(N'[dbo].[PaymentPageFields]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PaymentPageFields];
GO
IF OBJECT_ID(N'[dbo].[PaymentPages]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PaymentPages];
GO
IF OBJECT_ID(N'[dbo].[Payouts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Payouts];
GO
IF OBJECT_ID(N'[dbo].[Plans]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Plans];
GO
IF OBJECT_ID(N'[dbo].[Priviledges]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Priviledges];
GO
IF OBJECT_ID(N'[dbo].[ProductFields]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductFields];
GO
IF OBJECT_ID(N'[dbo].[ProductNames]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductNames];
GO
IF OBJECT_ID(N'[dbo].[ProductPages]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductPages];
GO
IF OBJECT_ID(N'[dbo].[ProductPrices]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductPrices];
GO
IF OBJECT_ID(N'[dbo].[Registrations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Registrations];
GO
IF OBJECT_ID(N'[dbo].[Roles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Roles];
GO
IF OBJECT_ID(N'[dbo].[SettlementDetails]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SettlementDetails];
GO
IF OBJECT_ID(N'[dbo].[Settlements]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Settlements];
GO
IF OBJECT_ID(N'[dbo].[Subscriptions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Subscriptions];
GO
IF OBJECT_ID(N'[dbo].[TeamMembers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TeamMembers];
GO
IF OBJECT_ID(N'[dbo].[TestTransactions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TestTransactions];
GO
IF OBJECT_ID(N'[dbo].[Tokens]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tokens];
GO
IF OBJECT_ID(N'[dbo].[URLs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[URLs];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'ApiKeys'
CREATE TABLE [dbo].[ApiKeys] (
    [KeyID] int IDENTITY(1,1) NOT NULL,
    [MerchantID] nvarchar(100)  NULL,
    [TestPrivateKey] nvarchar(100)  NULL,
    [TestPublicKey] nvarchar(100)  NULL,
    [LivePrivateKey] nvarchar(100)  NULL,
    [LivePublicKey] nvarchar(100)  NULL,
    [isLiveMode] bit  NULL
);
GO

-- Creating table 'Banks'
CREATE TABLE [dbo].[Banks] (
    [BankID] int IDENTITY(1,1) NOT NULL,
    [BankName] nvarchar(100)  NULL,
    [SortCode] nvarchar(100)  NULL
);
GO

-- Creating table 'BusinessProfiles'
CREATE TABLE [dbo].[BusinessProfiles] (
    [BusinessProfileID] int IDENTITY(1,1) NOT NULL,
    [MerchantID] nvarchar(100)  NULL,
    [BusinessName] nvarchar(100)  NULL,
    [PhysicalAddress] nvarchar(100)  NULL,
    [WebsiteLink] nvarchar(100)  NULL,
    [FacebookLink] nvarchar(100)  NULL,
    [TwitterLink] nvarchar(100)  NULL,
    [InstagramLink] nvarchar(100)  NULL,
    [YoutubeLink] nvarchar(100)  NULL
);
GO

-- Creating table 'CardBlacklists'
CREATE TABLE [dbo].[CardBlacklists] (
    [CardBlacklistID] int IDENTITY(1,1) NOT NULL,
    [MerchantID] nvarchar(100)  NULL,
    [CardIssuerer] nvarchar(100)  NULL,
    [FirstSixDigits] nvarchar(100)  NULL,
    [LastFourDigits] nvarchar(100)  NULL,
    [CardType] nvarchar(100)  NULL,
    [IssuingCountry] nvarchar(100)  NULL,
    [Date] nvarchar(100)  NULL
);
GO

-- Creating table 'CompanyProfiles'
CREATE TABLE [dbo].[CompanyProfiles] (
    [CompanyProfileID] int IDENTITY(1,1) NOT NULL,
    [MerchantID] nvarchar(100)  NULL,
    [RcNo] nvarchar(100)  NULL,
    [DocName] nvarchar(150)  NULL
);
GO

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [CustomerID] int IDENTITY(1,1) NOT NULL,
    [MerchantID] nvarchar(100)  NULL,
    [CustomerCode] nvarchar(100)  NULL,
    [CustomerName] nvarchar(100)  NULL,
    [PhoneNo] nvarchar(100)  NULL,
    [Email] nvarchar(100)  NULL,
    [DateAdded] nvarchar(100)  NULL
);
GO

-- Creating table 'InvoiceAttachments'
CREATE TABLE [dbo].[InvoiceAttachments] (
    [AttachmentID] int IDENTITY(1,1) NOT NULL,
    [InvoiceID] nvarchar(100)  NULL,
    [DocName] nvarchar(100)  NULL
);
GO

-- Creating table 'Invoices'
CREATE TABLE [dbo].[Invoices] (
    [InvoiceID] int IDENTITY(1,1) NOT NULL,
    [MerchantID] nvarchar(100)  NULL,
    [InvoiceCode] nvarchar(100)  NULL,
    [Status] nvarchar(100)  NULL,
    [CustomerEmail] nvarchar(100)  NULL,
    [RequestedBy] nvarchar(100)  NULL,
    [Amount] nvarchar(100)  NULL,
    [Description] nvarchar(100)  NULL,
    [isAttachmentAllowed] bit  NULL,
    [DateRequested] nvarchar(100)  NULL
);
GO

-- Creating table 'IpBlacklistings'
CREATE TABLE [dbo].[IpBlacklistings] (
    [IpBlacklistingID] int IDENTITY(1,1) NOT NULL,
    [MerchantID] nvarchar(100)  NULL,
    [IpAddress] nvarchar(100)  NULL,
    [Country] nvarchar(100)  NULL,
    [Reason] nvarchar(100)  NULL,
    [Date] nvarchar(50)  NULL
);
GO

-- Creating table 'LiveTransactions'
CREATE TABLE [dbo].[LiveTransactions] (
    [TransactionID] int IDENTITY(1,1) NOT NULL,
    [MerchantID] nvarchar(100)  NULL,
    [Email] nvarchar(100)  NULL,
    [MerchantTransactionRef] nvarchar(100)  NULL,
    [CardProcessorTransactionRef] nvarchar(100)  NULL,
    [Amount] nvarchar(100)  NULL,
    [Purpose] nvarchar(100)  NULL,
    [ResponseCode] nvarchar(100)  NULL,
    [TransactionStatus] nvarchar(100)  NULL,
    [IpAddress] nvarchar(100)  NULL,
    [Date] nvarchar(100)  NULL,
    [TimeStamp] nvarchar(100)  NULL
);
GO

-- Creating table 'MerchantLogoes'
CREATE TABLE [dbo].[MerchantLogoes] (
    [MerchantLogoID] int IDENTITY(1,1) NOT NULL,
    [MerchantID] nvarchar(100)  NULL,
    [LogoName] nvarchar(100)  NULL
);
GO

-- Creating table 'MerchantStatus'
CREATE TABLE [dbo].[MerchantStatus] (
    [MerchantStatusID] int IDENTITY(1,1) NOT NULL,
    [MerchantID] nvarchar(100)  NULL,
    [isLiveMode] bit  NULL
);
GO

-- Creating table 'PaymentPageFields'
CREATE TABLE [dbo].[PaymentPageFields] (
    [FieldID] int IDENTITY(1,1) NOT NULL,
    [PaymentPageID] nvarchar(100)  NULL,
    [PaymentField] nvarchar(100)  NULL
);
GO

-- Creating table 'PaymentPages'
CREATE TABLE [dbo].[PaymentPages] (
    [PaymentmentPageID] int IDENTITY(1,1) NOT NULL,
    [MerchantID] nvarchar(100)  NULL,
    [PageName] nvarchar(100)  NULL,
    [PageDescription] nvarchar(100)  NULL,
    [Amount] nvarchar(100)  NULL,
    [RedirectLink] nvarchar(100)  NULL,
    [CustomLink] nvarchar(100)  NULL,
    [SuccessMessage] nvarchar(100)  NULL,
    [Type] nvarchar(100)  NULL,
    [Link] nvarchar(100)  NULL,
    [Date] nvarchar(100)  NULL
);
GO

-- Creating table 'Payouts'
CREATE TABLE [dbo].[Payouts] (
    [PayoutID] int IDENTITY(1,1) NOT NULL,
    [MerchantID] nvarchar(100)  NULL,
    [RequestCode] nvarchar(100)  NULL,
    [Status] nvarchar(100)  NULL,
    [TotalTransactions] nvarchar(100)  NULL,
    [Amount] nvarchar(100)  NULL,
    [SettlementDate] nvarchar(100)  NULL
);
GO

-- Creating table 'Plans'
CREATE TABLE [dbo].[Plans] (
    [PlanID] int IDENTITY(1,1) NOT NULL,
    [MerchantID] nvarchar(100)  NULL,
    [PlanCode] nvarchar(100)  NULL,
    [PlanName] nvarchar(100)  NULL,
    [PlanDescription] nvarchar(100)  NULL,
    [PlanAmount] nvarchar(100)  NULL,
    [Interval] nvarchar(100)  NULL,
    [InvioiceLimit] nvarchar(100)  NULL,
    [Date] nvarchar(100)  NULL
);
GO

-- Creating table 'Priviledges'
CREATE TABLE [dbo].[Priviledges] (
    [PriviledgeID] int IDENTITY(1,1) NOT NULL,
    [RoleID] nvarchar(100)  NULL,
    [PriviledgeType] nvarchar(100)  NULL
);
GO

-- Creating table 'ProductFields'
CREATE TABLE [dbo].[ProductFields] (
    [ProductFieldID] int IDENTITY(1,1) NOT NULL,
    [FieldName] nvarchar(100)  NULL,
    [ProductPageID] nvarchar(100)  NULL,
    [MerchantRef] nvarchar(100)  NULL,
    [TransactionStatus] nvarchar(100)  NULL
);
GO

-- Creating table 'ProductNames'
CREATE TABLE [dbo].[ProductNames] (
    [ProductNameID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(100)  NULL,
    [ProductPageID] nvarchar(100)  NULL
);
GO

-- Creating table 'ProductPages'
CREATE TABLE [dbo].[ProductPages] (
    [ProductPageID] int IDENTITY(1,1) NOT NULL,
    [MerchantID] nvarchar(100)  NULL,
    [ProductDescription] nvarchar(100)  NULL,
    [RedirectLink] nvarchar(100)  NULL,
    [CustomLink] nvarchar(100)  NULL,
    [Type] nvarchar(100)  NULL,
    [Link] nvarchar(100)  NULL,
    [PageName] nvarchar(100)  NULL,
    [SuccessMessage] nvarchar(100)  NULL,
    [Date] nvarchar(100)  NULL
);
GO

-- Creating table 'ProductPrices'
CREATE TABLE [dbo].[ProductPrices] (
    [ProductPriceID] int IDENTITY(1,1) NOT NULL,
    [Price] nvarchar(100)  NULL,
    [ProductPageID] nvarchar(100)  NULL
);
GO

-- Creating table 'Registrations'
CREATE TABLE [dbo].[Registrations] (
    [RegistrationID] int IDENTITY(1,1) NOT NULL,
    [BusinessName] nvarchar(100)  NULL,
    [PhoneNo] nvarchar(100)  NULL,
    [Email] nvarchar(100)  NULL,
    [Password] nvarchar(200)  NULL,
    [Date] nvarchar(50)  NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [dbo].[Roles] (
    [RoleID] int IDENTITY(1,1) NOT NULL,
    [RoleName] nchar(100)  NULL,
    [RoleDescription] nchar(150)  NULL
);
GO

-- Creating table 'SettlementDetails'
CREATE TABLE [dbo].[SettlementDetails] (
    [SettlementDetailID] int IDENTITY(1,1) NOT NULL,
    [MerchantID] nvarchar(100)  NULL,
    [AccountName] nvarchar(100)  NULL,
    [AccountNo] nvarchar(100)  NULL,
    [BankName] nvarchar(100)  NULL,
    [SortCode] nvarchar(100)  NULL
);
GO

-- Creating table 'Settlements'
CREATE TABLE [dbo].[Settlements] (
    [SettlementID] int IDENTITY(1,1) NOT NULL,
    [MerchantID] nvarchar(100)  NULL,
    [SettlementRef] nvarchar(100)  NULL,
    [Amount] nvarchar(100)  NULL,
    [Status] nvarchar(100)  NULL,
    [Date] nvarchar(100)  NULL
);
GO

-- Creating table 'Subscriptions'
CREATE TABLE [dbo].[Subscriptions] (
    [SubscriptionID] int IDENTITY(1,1) NOT NULL,
    [MerchantID] nvarchar(100)  NULL,
    [PlanID] nvarchar(100)  NULL,
    [CustomerName] nvarchar(100)  NULL,
    [CustomerEmail] nvarchar(100)  NULL,
    [Amount] nvarchar(100)  NULL,
    [Status] nvarchar(100)  NULL
);
GO

-- Creating table 'TeamMembers'
CREATE TABLE [dbo].[TeamMembers] (
    [TeamID] int IDENTITY(1,1) NOT NULL,
    [MerchantID] nvarchar(100)  NULL,
    [UserName] nvarchar(100)  NULL,
    [Password] nvarchar(100)  NULL,
    [Role] nvarchar(100)  NULL,
    [LastLogin] nvarchar(100)  NULL
);
GO

-- Creating table 'TestTransactions'
CREATE TABLE [dbo].[TestTransactions] (
    [TransactionID] int IDENTITY(1,1) NOT NULL,
    [MerchantID] nvarchar(100)  NULL,
    [Email] nvarchar(100)  NULL,
    [MerchantTransactionRef] nvarchar(100)  NULL,
    [Amount] nvarchar(100)  NULL,
    [Purpose] nvarchar(100)  NULL,
    [ResponseCode] nvarchar(100)  NULL,
    [TransactionStatus] nvarchar(100)  NULL,
    [IpAddress] nvarchar(100)  NULL,
    [Date] nvarchar(100)  NULL,
    [TimeStamp] nvarchar(100)  NULL
);
GO

-- Creating table 'Tokens'
CREATE TABLE [dbo].[Tokens] (
    [TokenID] int IDENTITY(1,1) NOT NULL,
    [MerchantID] nvarchar(100)  NULL,
    [TokenNo] nvarchar(100)  NULL,
    [CardType] nvarchar(100)  NULL,
    [MaskedCardNo] nvarchar(100)  NULL,
    [ExpiryDate] nvarchar(100)  NULL
);
GO

-- Creating table 'URLs'
CREATE TABLE [dbo].[URLs] (
    [UriID] int IDENTITY(1,1) NOT NULL,
    [MerchantID] nvarchar(100)  NULL,
    [WebhookURL] nvarchar(100)  NULL,
    [CallBackURL] nvarchar(100)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [KeyID] in table 'ApiKeys'
ALTER TABLE [dbo].[ApiKeys]
ADD CONSTRAINT [PK_ApiKeys]
    PRIMARY KEY CLUSTERED ([KeyID] ASC);
GO

-- Creating primary key on [BankID] in table 'Banks'
ALTER TABLE [dbo].[Banks]
ADD CONSTRAINT [PK_Banks]
    PRIMARY KEY CLUSTERED ([BankID] ASC);
GO

-- Creating primary key on [BusinessProfileID] in table 'BusinessProfiles'
ALTER TABLE [dbo].[BusinessProfiles]
ADD CONSTRAINT [PK_BusinessProfiles]
    PRIMARY KEY CLUSTERED ([BusinessProfileID] ASC);
GO

-- Creating primary key on [CardBlacklistID] in table 'CardBlacklists'
ALTER TABLE [dbo].[CardBlacklists]
ADD CONSTRAINT [PK_CardBlacklists]
    PRIMARY KEY CLUSTERED ([CardBlacklistID] ASC);
GO

-- Creating primary key on [CompanyProfileID] in table 'CompanyProfiles'
ALTER TABLE [dbo].[CompanyProfiles]
ADD CONSTRAINT [PK_CompanyProfiles]
    PRIMARY KEY CLUSTERED ([CompanyProfileID] ASC);
GO

-- Creating primary key on [CustomerID] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([CustomerID] ASC);
GO

-- Creating primary key on [AttachmentID] in table 'InvoiceAttachments'
ALTER TABLE [dbo].[InvoiceAttachments]
ADD CONSTRAINT [PK_InvoiceAttachments]
    PRIMARY KEY CLUSTERED ([AttachmentID] ASC);
GO

-- Creating primary key on [InvoiceID] in table 'Invoices'
ALTER TABLE [dbo].[Invoices]
ADD CONSTRAINT [PK_Invoices]
    PRIMARY KEY CLUSTERED ([InvoiceID] ASC);
GO

-- Creating primary key on [IpBlacklistingID] in table 'IpBlacklistings'
ALTER TABLE [dbo].[IpBlacklistings]
ADD CONSTRAINT [PK_IpBlacklistings]
    PRIMARY KEY CLUSTERED ([IpBlacklistingID] ASC);
GO

-- Creating primary key on [TransactionID] in table 'LiveTransactions'
ALTER TABLE [dbo].[LiveTransactions]
ADD CONSTRAINT [PK_LiveTransactions]
    PRIMARY KEY CLUSTERED ([TransactionID] ASC);
GO

-- Creating primary key on [MerchantLogoID] in table 'MerchantLogoes'
ALTER TABLE [dbo].[MerchantLogoes]
ADD CONSTRAINT [PK_MerchantLogoes]
    PRIMARY KEY CLUSTERED ([MerchantLogoID] ASC);
GO

-- Creating primary key on [MerchantStatusID] in table 'MerchantStatus'
ALTER TABLE [dbo].[MerchantStatus]
ADD CONSTRAINT [PK_MerchantStatus]
    PRIMARY KEY CLUSTERED ([MerchantStatusID] ASC);
GO

-- Creating primary key on [FieldID] in table 'PaymentPageFields'
ALTER TABLE [dbo].[PaymentPageFields]
ADD CONSTRAINT [PK_PaymentPageFields]
    PRIMARY KEY CLUSTERED ([FieldID] ASC);
GO

-- Creating primary key on [PaymentmentPageID] in table 'PaymentPages'
ALTER TABLE [dbo].[PaymentPages]
ADD CONSTRAINT [PK_PaymentPages]
    PRIMARY KEY CLUSTERED ([PaymentmentPageID] ASC);
GO

-- Creating primary key on [PayoutID] in table 'Payouts'
ALTER TABLE [dbo].[Payouts]
ADD CONSTRAINT [PK_Payouts]
    PRIMARY KEY CLUSTERED ([PayoutID] ASC);
GO

-- Creating primary key on [PlanID] in table 'Plans'
ALTER TABLE [dbo].[Plans]
ADD CONSTRAINT [PK_Plans]
    PRIMARY KEY CLUSTERED ([PlanID] ASC);
GO

-- Creating primary key on [PriviledgeID] in table 'Priviledges'
ALTER TABLE [dbo].[Priviledges]
ADD CONSTRAINT [PK_Priviledges]
    PRIMARY KEY CLUSTERED ([PriviledgeID] ASC);
GO

-- Creating primary key on [ProductFieldID] in table 'ProductFields'
ALTER TABLE [dbo].[ProductFields]
ADD CONSTRAINT [PK_ProductFields]
    PRIMARY KEY CLUSTERED ([ProductFieldID] ASC);
GO

-- Creating primary key on [ProductNameID] in table 'ProductNames'
ALTER TABLE [dbo].[ProductNames]
ADD CONSTRAINT [PK_ProductNames]
    PRIMARY KEY CLUSTERED ([ProductNameID] ASC);
GO

-- Creating primary key on [ProductPageID] in table 'ProductPages'
ALTER TABLE [dbo].[ProductPages]
ADD CONSTRAINT [PK_ProductPages]
    PRIMARY KEY CLUSTERED ([ProductPageID] ASC);
GO

-- Creating primary key on [ProductPriceID] in table 'ProductPrices'
ALTER TABLE [dbo].[ProductPrices]
ADD CONSTRAINT [PK_ProductPrices]
    PRIMARY KEY CLUSTERED ([ProductPriceID] ASC);
GO

-- Creating primary key on [RegistrationID] in table 'Registrations'
ALTER TABLE [dbo].[Registrations]
ADD CONSTRAINT [PK_Registrations]
    PRIMARY KEY CLUSTERED ([RegistrationID] ASC);
GO

-- Creating primary key on [RoleID] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [PK_Roles]
    PRIMARY KEY CLUSTERED ([RoleID] ASC);
GO

-- Creating primary key on [SettlementDetailID] in table 'SettlementDetails'
ALTER TABLE [dbo].[SettlementDetails]
ADD CONSTRAINT [PK_SettlementDetails]
    PRIMARY KEY CLUSTERED ([SettlementDetailID] ASC);
GO

-- Creating primary key on [SettlementID] in table 'Settlements'
ALTER TABLE [dbo].[Settlements]
ADD CONSTRAINT [PK_Settlements]
    PRIMARY KEY CLUSTERED ([SettlementID] ASC);
GO

-- Creating primary key on [SubscriptionID] in table 'Subscriptions'
ALTER TABLE [dbo].[Subscriptions]
ADD CONSTRAINT [PK_Subscriptions]
    PRIMARY KEY CLUSTERED ([SubscriptionID] ASC);
GO

-- Creating primary key on [TeamID] in table 'TeamMembers'
ALTER TABLE [dbo].[TeamMembers]
ADD CONSTRAINT [PK_TeamMembers]
    PRIMARY KEY CLUSTERED ([TeamID] ASC);
GO

-- Creating primary key on [TransactionID] in table 'TestTransactions'
ALTER TABLE [dbo].[TestTransactions]
ADD CONSTRAINT [PK_TestTransactions]
    PRIMARY KEY CLUSTERED ([TransactionID] ASC);
GO

-- Creating primary key on [TokenID] in table 'Tokens'
ALTER TABLE [dbo].[Tokens]
ADD CONSTRAINT [PK_Tokens]
    PRIMARY KEY CLUSTERED ([TokenID] ASC);
GO

-- Creating primary key on [UriID] in table 'URLs'
ALTER TABLE [dbo].[URLs]
ADD CONSTRAINT [PK_URLs]
    PRIMARY KEY CLUSTERED ([UriID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------