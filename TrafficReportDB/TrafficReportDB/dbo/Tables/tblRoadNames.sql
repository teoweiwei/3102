-- Creating table 'tblRoadNames'
CREATE TABLE [dbo].[tblRoadNames] (
    [rnID] int  NOT NULL,
    [rnRoadName] nvarchar(max)  NOT NULL,
    [rnLocation] int  NULL,
    [rnSpeedLimit] int  NULL
);
GO
-- Creating foreign key on [rnLocation] in table 'tblRoadNames'
ALTER TABLE [dbo].[tblRoadNames]
ADD CONSTRAINT [FK_tblRoadName_tblLocationName]
    FOREIGN KEY ([rnLocation])
    REFERENCES [dbo].[tblLocationNames]
        ([lnID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
-- Creating primary key on [rnID] in table 'tblRoadNames'
ALTER TABLE [dbo].[tblRoadNames]
ADD CONSTRAINT [PK_tblRoadNames]
    PRIMARY KEY CLUSTERED ([rnID] ASC);
GO
-- Creating non-clustered index for FOREIGN KEY 'FK_tblRoadName_tblLocationName'
CREATE INDEX [IX_FK_tblRoadName_tblLocationName]
ON [dbo].[tblRoadNames]
    ([rnLocation]);