-- Creating table 'tblRainfalls'
CREATE TABLE [dbo].[tblRainfalls] (
    [rfID] int IDENTITY(1,1) NOT NULL,
    [rfDate] datetime  NOT NULL,
    [rfLocation] int  NOT NULL,
    [rfValue] decimal(18,2)  NOT NULL
);
GO
-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [rfLocation] in table 'tblRainfalls'
ALTER TABLE [dbo].[tblRainfalls]
ADD CONSTRAINT [FK_tblRainfall_tblLocationName]
    FOREIGN KEY ([rfLocation])
    REFERENCES [dbo].[tblLocationNames]
        ([lnID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
-- Creating primary key on [rfID] in table 'tblRainfalls'
ALTER TABLE [dbo].[tblRainfalls]
ADD CONSTRAINT [PK_tblRainfalls]
    PRIMARY KEY CLUSTERED ([rfID] ASC);
GO
-- Creating non-clustered index for FOREIGN KEY 'FK_tblRainfall_tblLocationName'
CREATE INDEX [IX_FK_tblRainfall_tblLocationName]
ON [dbo].[tblRainfalls]
    ([rfLocation]);