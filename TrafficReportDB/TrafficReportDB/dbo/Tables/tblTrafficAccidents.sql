-- Creating table 'tblTrafficAccidents'
CREATE TABLE [dbo].[tblTrafficAccidents] (
    [taID] int  NOT NULL,
    [taDateTime] datetime  NOT NULL,
    [taRoadName] int  NULL,
    [taLat] float  NULL,
    [taLong] float  NULL,
    [taDescription] nvarchar(max)  NULL
);
GO
-- Creating foreign key on [taRoadName] in table 'tblTrafficAccidents'
ALTER TABLE [dbo].[tblTrafficAccidents]
ADD CONSTRAINT [FK_tblTrafficAccident_tblRoadName]
    FOREIGN KEY ([taRoadName])
    REFERENCES [dbo].[tblRoadNames]
        ([rnID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
-- Creating primary key on [taID] in table 'tblTrafficAccidents'
ALTER TABLE [dbo].[tblTrafficAccidents]
ADD CONSTRAINT [PK_tblTrafficAccidents]
    PRIMARY KEY CLUSTERED ([taID] ASC);
GO
-- Creating non-clustered index for FOREIGN KEY 'FK_tblTrafficAccident_tblRoadName'
CREATE INDEX [IX_FK_tblTrafficAccident_tblRoadName]
ON [dbo].[tblTrafficAccidents]
    ([taRoadName]);