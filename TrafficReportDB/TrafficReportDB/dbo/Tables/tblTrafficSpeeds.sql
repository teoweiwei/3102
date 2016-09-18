-- Creating table 'tblTrafficSpeeds'
CREATE TABLE [dbo].[tblTrafficSpeeds] (
    [tsID] int IDENTITY(1,1) NOT NULL,
    [tsDateTime] datetime  NOT NULL,
    [tsRoadName] int  NULL,
    [tsMinSpeed] int  NULL,
    [tsMaxSpeed] int  NULL
);
GO
-- Creating foreign key on [tsRoadName] in table 'tblTrafficSpeeds'
ALTER TABLE [dbo].[tblTrafficSpeeds]
ADD CONSTRAINT [FK_tblTrafficSpeed_tblRoadName]
    FOREIGN KEY ([tsRoadName])
    REFERENCES [dbo].[tblRoadNames]
        ([rnID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
-- Creating primary key on [tsID] in table 'tblTrafficSpeeds'
ALTER TABLE [dbo].[tblTrafficSpeeds]
ADD CONSTRAINT [PK_tblTrafficSpeeds]
    PRIMARY KEY CLUSTERED ([tsID] ASC);
GO
-- Creating non-clustered index for FOREIGN KEY 'FK_tblTrafficSpeed_tblRoadName'
CREATE INDEX [IX_FK_tblTrafficSpeed_tblRoadName]
ON [dbo].[tblTrafficSpeeds]
    ([tsRoadName]);