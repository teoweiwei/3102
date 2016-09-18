-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'tblLocationNames'
CREATE TABLE [dbo].[tblLocationNames] (
    [lnID] int IDENTITY(1,1) NOT NULL,
    [lnLocationName] nvarchar(max)  NOT NULL,
    [lnRegion] nvarchar(max)  NOT NULL, 
    [lnLat] FLOAT NULL, 
    [lnLng] FLOAT NULL
);
GO
-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [lnID] in table 'tblLocationNames'
ALTER TABLE [dbo].[tblLocationNames]
ADD CONSTRAINT [PK_tblLocationNames]
    PRIMARY KEY CLUSTERED ([lnID] ASC);