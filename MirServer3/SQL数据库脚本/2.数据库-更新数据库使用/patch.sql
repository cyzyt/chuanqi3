IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CONFIG') AND NAME='FLD_SVRSTATE')
 BEGIN
 ALTER TABLE [dbo].[TBL_CONFIG] ADD [FLD_SVRSTATE][int] NOT NULL DEFAULT ((0))
 END
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CONFIG') AND NAME='FLD_SERCONFIG')
 BEGIN
 ALTER TABLE [dbo].[TBL_CONFIG] ADD [FLD_SERCONFIG] varchar(MAX) NULL
 END
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CONFIG') AND NAME='FLD_ADDRLIST')
 BEGIN
 ALTER TABLE [dbo].[TBL_CONFIG] ADD [FLD_ADDRLIST] varchar(MAX) NULL 
 END
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CONFIG') AND NAME='RegistWhiteList')
 BEGIN
 ALTER TABLE [dbo].[TBL_CONFIG] ADD [RegistWhiteList][varchar](MAX) NULL
 END
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CONFIG') AND NAME='DisableTime')
 BEGIN
 ALTER TABLE [dbo].[TBL_CONFIG] ADD [DisableTime] datetime NULL
 END
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CONFIG') AND NAME='DisableHFCount')
 BEGIN
 ALTER TABLE [dbo].[TBL_CONFIG] ADD [DisableHFCount] [int] NOT NULL DEFAULT ((0))
 END
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CHARACTER') AND NAME='FLD_HAIRCOLOR')
 BEGIN
 ALTER TABLE [dbo].[TBL_CHARACTER] ADD [FLD_HAIRCOLOR][int] NOT NULL DEFAULT ((0))
 END
 ELSE
 ALTER TABLE [dbo].[TBL_CHARACTER] ALTER COLUMN [FLD_HAIRCOLOR][int]
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CHARACTER') AND NAME='FLD_ATTRJSON')
 BEGIN
 ALTER TABLE [dbo].[TBL_CHARACTER] ADD [FLD_ATTRJSON] varchar(MAX) NULL 
 END
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CHARACTER') AND NAME='FLD_SDKCHANNEL')
 BEGIN
 ALTER TABLE [dbo].[TBL_CHARACTER] ADD [FLD_SDKCHANNEL][varchar](128) NULL
 END
GO

IF EXISTS (select name from syscolumns where id=object_id(N'TBL_MAIL') AND NAME='Memo')
 BEGIN
 ALTER TABLE [dbo].[TBL_MAIL] ALTER COLUMN [Type][int]
 ALTER TABLE [dbo].[TBL_MAIL] ALTER COLUMN [Memo][varchar](4096) NULL
 END
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CHARACTER') AND NAME='FLD_DELETEDATETIME')
 BEGIN
 ALTER TABLE [dbo].[TBL_CHARACTER] ADD [FLD_DELETEDATETIME] [datetime] NULL
 END
GO

ALTER TABLE dbo.TBL_CHARACTER ALTER COLUMN FLD_MAPNAME varchar(50)
go

IF NOT EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_MERGECLEARDATA]') AND type IN ('U'))
BEGIN
CREATE TABLE [dbo].[TBL_MERGECLEARDATA](
	[nId] [int] IDENTITY(1,1) NOT NULL,
	[nServerId] [int] NULL,
	[tTime] [datetime] NULL,
	[sType] [varchar](100) NULL,
	[sReason] [varchar](100) NULL,
	[sDBName] [varchar](100) NULL,
	[sAccount] [varchar](100) NULL,
	[sUserId] [varchar](100) NULL,
	[sUserName] [varchar](100) NULL,
	[sMemo] [varchar](max) NULL,
	[nJob] [int] NULL,
	[nLevel] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[nId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE INDEX [idx1] ON [dbo].[TBL_MERGECLEARDATA]
([nServerId] ASC) 

CREATE INDEX [idx2] ON [dbo].[TBL_MERGECLEARDATA]
([tTime] ASC) 

CREATE INDEX [idx3] ON [dbo].[TBL_MERGECLEARDATA]
([sAccount] ASC) 

CREATE INDEX [idx4] ON [dbo].[TBL_MERGECLEARDATA]
([sUserId] ASC) 

CREATE INDEX [idx5] ON [dbo].[TBL_MERGECLEARDATA]
([sUserName] ASC) 

END
GO

IF NOT EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_QUESTINFO]') AND type IN ('U'))
BEGIN
	CREATE TABLE [dbo].[TBL_QUESTINFO] (
	  [FLD_ID] int IDENTITY(1,1) NOT NULL,
	  [questid] varchar(30)  DEFAULT ((0)) NULL,
	  [questStatus] smallint DEFAULT ((0)) NULL,
	  [questMsg] varchar(30) DEFAULT ('') NULL,
	  [questdate] [datetime] NULL
	)
	ALTER TABLE [dbo].[TBL_QUESTINFO] SET (LOCK_ESCALATION = TABLE)

END
GO

ALTER PROCEDURE [dbo].[HUM_INFO_ADD]
@sAccount VARCHAR(128),
@sChrName VARCHAR(50),
@btSex SMALLINT,
@btJob SMALLINT,
@sUserID VARCHAR(50),
@sSdkId VARCHAR(50) = '',
@sServerID VARCHAR(50) = '',
@sHeroName VARCHAR(50) = '',
@sHeroID VARCHAR(50) = '',
@sSdk_channel VARCHAR(128) = '',
@bWhite BIT = 0
AS
BEGIN
IF EXISTS (SELECT FLD_ID FROM TBL_CHARACTER WHERE (FLD_CHARACTER like @sChrName+'%') or (FLD_CHARACTER like 'S'+@sServerID+'_'+@sChrName+'%') )
   RETURN(1)

  DECLARE @nNum INT
  DECLARE @IsFirstChar INT
  DECLARE @iRegCount INT
  DECLARE @iRegis INT
  DECLARE @tStartTime DATETIME
  DECLARE @tDisableTime DATETIME
  DECLARE @DisableHFCount INT=0
  DECLARE @HFCount INT=0

	SELECT TOP 1 @iRegCount = iRegCount,@iRegis=Regis,@tStartTime=StartTime,@tDisableTime=DisableTime,@DisableHFCount=ISNULL(DisableHFCount,0),@HFCount=ISNULL(HfCount,0)
	FROM dbo.TBL_CONFIG WITH(NOLOCK)
	SET @iRegCount= ISNULL(@iRegCount, 0)
	SET @iRegis= ISNULL(@iRegis, 0)

	IF @DisableHFCount>0 AND @HFCount>=@DisableHFCount AND @bWhite=0
	BEGIN
		RETURN(8)
	END

	IF @tDisableTime IS NOT NULL AND GETDATE() > @tDisableTime and @bWhite=0
	BEGIN
		RETURN(8)
	END

	IF (@iRegis > 0) AND (@tStartTime IS NOT NULL) AND (@bWhite=0)
	BEGIN
		IF DATEDIFF(DAY,@tStartTime,GETDATE()) > @iRegis
			RETURN(8)
	END

	IF (@iRegCount <> 0) AND (@bWhite=0)
	BEGIN
		DECLARE @nTotal INT
		SELECT @nTotal = COUNT(DISTINCT FLD_ACCOUNT) FROM TBL_CHARACTER WHERE FLD_DELETED = 0;
		IF (@nTotal >= @iRegCount)
			RETURN(8)
	END
	
	 SELECT @nNum = COUNT(*) FROM TBL_CHARACTER WHERE FLD_ACCOUNT=@sAccount AND (FLD_DELETED=0) AND FLD_SERVERID=@sServerID
	 
	IF @nNum >= 2
		RETURN(3)
		
	IF @nNum >= 1
		SET @IsFirstChar = 0
	ELSE
		SET @IsFirstChar = 1 

	INSERT INTO TBL_CHARACTER
	(
	FLD_USERID,
	FLD_CHARACTER,
	FLD_ACCOUNT,
	FLD_SEX,
	FLD_JOB,
	FLD_UPDATEDATETIME,
	FLD_MAKEDATE, 
	FLD_ISFIRSTCHAR, 
	FLD_MAPNAME,
	FLD_HOMEMAP,
	FLD_SDKID,
	FLD_SERVERID,
	FLD_HEROUSERID,
	FLD_HERONAME,
	FLD_SDKCHANNEL
	)

	VALUES
	(
	@sUserID,
	@sChrName,
	@sAccount,
	@btSex,
	@btJob,
	getdate(),
	getdate(),
	@IsFirstChar,
	'',
	'',
	@sSdkId,
	@sServerID,
	@sHeroID,
	@sHeroName,
	@sSdk_channel

	)

  declare @new_sn varchar(50)
  declare @len int
	set @len = 10-len(@sServerID)

	declare @new_id int
	set @new_id=@@identity

	set @new_sn=convert(varchar,DATEDIFF(s, '1970-01-01 00:00:00', GETUTCDATE()))
		+ right('000000'+cast(@new_id as varchar),6)
		+ substring(convert(varchar,rand()),3,3)
		
	set @new_sn=@sServerID + replicate('0', @len) + @new_sn
	update TBL_CHARACTER set FLD_USERID=@new_sn where FLD_ID=@new_id
	set @sUserId = @new_sn

  RETURN(0)
	
END
GO

ALTER PROCEDURE [dbo].[HUM_INFO_UPDATE]
@sUserID VARCHAR(50),
@sChrName VARCHAR(50),
@MapName VARCHAR(50),
@Cx SMALLINT,
@Cy SMALLINT,
@Dir SMALLINT,
@Hair SMALLINT,
@HairColor INT,
@Sex SMALLINT,
@Job SMALLINT,
@nLevel INT,
@Hp BIGINT,
@Mp BIGINT,
@Exp BIGINT,
@Gold INT,
@sHomeMap VARCHAR(50),
@Hx SMALLINT,
@Hy SMALLINT,
@PkPoint INT,
@AllowGroup tinyint,
@btF9 INT,
@AttackMode tinyint,
@FightZoneDie tinyint,
@BodyLuck FLOAT,
@InChealth INT,
@IncSpell INT,
@IncHealing INT,
@BonusPoint INT,
@HungerStatus INT,
@StatusTimeAr binary(800),
@Relevel tinyint,
@GameGold INT,
@CreditPoint INT,
@MasterName VARCHAR(50),
@Master tinyint,
@DearName VARCHAR(50),
@StoragePwd VARCHAR(10),
@GamePoint INT,
@PayMentPoint INT,
@LockLogon tinyint,
@Contribution INT,
@AllowGuildRecall tinyint,
@GroupRecallTime INT,
@AllowGroupRecall tinyint,
@QuestUnitOpen binary(128),
@QuestUnit binary(128),
@QuestFlag binary(128),
@Money binary(400),
@MarryCount INT,
@Bonus_Dc INT,
@Bonus_Mc INT,
@Bonus_Sc INT,
@Bonus_Ac INT,
@Bonus_Mac INT,
@Bonus_Hp INT,
@Bonus_Mp INT,
@Bonus_Hit INT,
@Bonus_Speed INT,
@Bonus_X2 INT,
@Ee tinyint,
@Sysvar binary(400),
@uvar binary(1020),
@offlinetime datetime,
@Feathure VARCHAR(200),
@SuckDamageCount INT,
@SuckDamageBiLi INT,
@SuckDamageRate tinyint,
@SndaItemBoxOpened TINYINT,
@Dc BIGINT,
@sHeroName VARCHAR(50),
@sHeroUid VARCHAR(50),
@appendstring varchar(max),
@appendstringjson VARCHAR(MAX)=''
AS
IF EXISTS(SELECT FLD_ID FROM TBL_CHARACTER WHERE FLD_USERID=@sUserID)
BEGIN
UPDATE TBL_CHARACTER SET
FLD_UPDATEDATETIME = getdate(),
FLD_CHARACTER = @sChrName,
FLD_MAPNAME = @MapName,
FLD_CX = @Cx,
FLD_CY = @Cy,
FLD_DIR = @Dir,
FLD_HAIR = @Hair,
FLD_HAIRCOLOR = @HairColor,
FLD_SEX = @Sex,
FLD_JOB = @Job,
FLD_LEVEL = @nLevel,
FLD_HP = @Hp,
FLD_MP = @Mp,
FLD_EXP = @Exp,
FLD_GOLD = @Gold,
FLD_HOMEMAP = @sHomeMap,
FLD_HOMEX = @Hx,
FLD_HOMEY	= @Hy,
FLD_PKPOINT = @PkPoint,
FLD_ALLOWGROUP = @AllowGroup,
FLD_BTF9 = @btF9,
FLD_ATTACKMODE = @AttackMode,
FLD_FIGHTZONEDIE = @FightZoneDie,
FLD_BODYLUCK = @BodyLuck,
FLD_INCHEALTH = @InChealth,
FLD_INCSPELL = @IncSpell,
FLD_INCHEALING = @IncHealing,
FLD_BONUSPOINT = @BonusPoint,
FLD_HUNGRYSTATE	= @HungerStatus,
FLD_StatusTimeArr = @StatusTimeAr,
FLD_RELEVEL = @Relevel,
FLD_GAMEGOLD = @GameGold,
FLD_CREDITPOINT = @CreditPoint,
FLD_MASTERNAME = @MasterName,
FLD_MASTER = @Master,
FLD_DEARNAME = @DearName,
FLD_STORAGEPWD = @StoragePwd,
FLD_GAMEPOINT	= @GamePoint,
FLD_PAYMENTPOINT = @PayMentPoint,
FLD_LOCKLOGON = @LockLogon,
FLD_CONTRIBUTION = @Contribution,
FLD_ALLOWGUILDRECALL = @AllowGroupRecall,
FLD_GROUPRECALLTIME = @GroupRecallTime,
FLD_ALLOWGROUPRECALL = @AllowGroupRecall,
FLD_QUESTUNITOPEN = @QuestUnitOpen,
FLD_QUESTUNIT = @QuestUnit,
FLD_QUESTFLAG = @QuestFlag,
FLD_MONEY = @Money,
FLD_MARRYCOUNT = @MarryCount,
FLD_BONUS_DC = @Bonus_Dc,
FLD_BONUS_MC = @Bonus_Mc,
FLD_BONUS_SC = @Bonus_Sc,
FLD_BONUS_AC = @Bonus_Ac,
FLD_BONUS_MAC = @Bonus_Mac,
FLD_BONUS_HP = @Bonus_Hp,
FLD_BONUS_MP = @Bonus_Mp,
FLD_BONUS_HIT = @Bonus_Hit,
FLD_BONUS_SPEED = @Bonus_Speed,
FLD_BONUS_X2 = @Bonus_X2,
FLD_EE = @Ee,
FLD_SYSVAR = @Sysvar,
FLD_UVAR = @uvar,
FLD_OFFLINE_TIME = @offlinetime,
FLD_FEATURE = @Feathure,
FLD_SUCKDAMAGECOUNT = @SuckDamageCount,
FLD_SUCKDAMAGERATE = @SuckDamageRate,
FLD_SUCKDAMAGEBILI = @SuckDamageBiLi,
FLD_SNDAITEMBoxOPENED = @SndaItemBoxOpened,
FLD_DC = @Dc,
FLD_HERONAME = @sHeroName,
FLD_HEROUSERID = @sHeroUid,
fld_appendstring = @appendstring,
FLD_APPENDSTRINGJSON=IIF(ISNULL(@appendstringjson,'')='',FLD_APPENDSTRINGJSON,@appendstringjson)
WHERE FLD_USERID=@sUserID
Return(0)
END
ELSE
RETURN(1)
GO

IF NOT EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_BOX_SELLITEM]') AND type IN ('U'))
  BEGIN
	CREATE TABLE [dbo].[TBL_BOX_SELLITEM](
	  [FLD_ID] [int] IDENTITY(1,1) NOT NULL,
	  [FLD_USERID] [varchar](50) NOT NULL,
	  [FLD_BUYUSERID] [varchar](50) NOT NULL,
	  [FLD_ORDER] [varchar](50) NULL,
	  [FLD_CREATEDATE] [datetime] NULL,
	  [FLD_UPDATEEDATE] [datetime] NULL,
	  [FLD_STATE] [smallint] NULL,
	  [FLD_ITEMINFO] [varchar](4096) NOT NULL,
	)

	ALTER TABLE [dbo].[TBL_BOX_SELLITEM] SET (LOCK_ESCALATION = TABLE)

	CREATE UNIQUE NONCLUSTERED INDEX [TBL_BOX_SELLITEM_FLD_ID]
	ON [dbo].[TBL_BOX_SELLITEM] (
	  [FLD_ID] ASC
	)
	ALTER TABLE [dbo].[TBL_BOX_SELLITEM] ADD CONSTRAINT [PK__TBL_BOX_SELLITEM] PRIMARY KEY CLUSTERED ([FLD_ID])
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
 END
GO


IF NOT EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_PET]') AND type IN ('U'))
BEGIN
	CREATE TABLE [dbo].[TBL_PET] (
	[FLD_IDX] int NOT NULL IDENTITY(1,1) PRIMARY KEY ,
	[FLD_PETIDX] int NULL ,
	[FLD_OWNERUSERID] varchar(50) NULL ,
	[FLD_PETGUID] varchar(50) NULL ,
	[FLD_STATE] int NULL ,
	[FLD_MONID] int NULL ,
	[FLD_NAME] varchar(50) NULL ,
	[FLD_DELETED] tinyint NULL ,
	[FLD_SEX] tinyint NULL ,
	[FLD_JOB] tinyint NULL ,
	[FLD_RELEVEL] tinyint NULL ,
	[FLD_LEVEL] int NULL ,
	[FLD_HP] bigint NULL ,
	[FLD_MP] bigint NULL ,
	[FLD_EXP] bigint NULL ,
	[FLD_MAKEDATE] datetime NULL ,
	[FLD_UPDATEDATETIME] datetime NULL ,
	[fld_appendstring] varchar(MAX) NULL
	)
END
GO



