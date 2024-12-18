USE [master]
GO
/****** Object:  Database [MusicalJourney]    Script Date: 11/18/2024 8:10:46 PM ******/
CREATE DATABASE [MusicalJourney]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MusicalJourney', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MusicalJourney.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MusicalJourney_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MusicalJourney_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MusicalJourney] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MusicalJourney].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MusicalJourney] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MusicalJourney] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MusicalJourney] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MusicalJourney] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MusicalJourney] SET ARITHABORT OFF 
GO
ALTER DATABASE [MusicalJourney] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MusicalJourney] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MusicalJourney] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MusicalJourney] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MusicalJourney] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MusicalJourney] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MusicalJourney] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MusicalJourney] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MusicalJourney] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MusicalJourney] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MusicalJourney] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MusicalJourney] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MusicalJourney] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MusicalJourney] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MusicalJourney] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MusicalJourney] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MusicalJourney] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MusicalJourney] SET RECOVERY FULL 
GO
ALTER DATABASE [MusicalJourney] SET  MULTI_USER 
GO
ALTER DATABASE [MusicalJourney] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MusicalJourney] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MusicalJourney] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MusicalJourney] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MusicalJourney] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MusicalJourney] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MusicalJourney', N'ON'
GO
ALTER DATABASE [MusicalJourney] SET QUERY_STORE = ON
GO
ALTER DATABASE [MusicalJourney] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MusicalJourney]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 11/18/2024 8:10:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[SystemUserID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 11/18/2024 8:10:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[ContractID] [int] IDENTITY(1,1) NOT NULL,
	[FirstAccessDate] [date] NOT NULL,
	[LastAccessDate] [date] NOT NULL,
	[ContractFile] [nvarchar](max) NULL,
	[DateSigned] [date] NOT NULL,
	[SystemUserID] [int] NOT NULL,
	[RoomRentalID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dependent]    Script Date: 11/18/2024 8:10:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dependent](
	[DependentID] [int] IDENTITY(1,1) NOT NULL,
	[Fname] [nvarchar](50) NOT NULL,
	[Lname] [nvarchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[ParentUserID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DependentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupMemberAssociation]    Script Date: 11/18/2024 8:10:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupMemberAssociation](
	[GroupMemberAssociationID] [int] IDENTITY(1,1) NOT NULL,
	[SystemUserID] [int] NOT NULL,
	[MusicalGroupID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupMemberAssociationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instrument]    Script Date: 11/18/2024 8:10:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instrument](
	[InstrumentID] [int] IDENTITY(1,1) NOT NULL,
	[InstrumentName] [nvarchar](50) NOT NULL,
	[InstrumentDescription] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[InstrumentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interests]    Script Date: 11/18/2024 8:10:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interests](
	[InterestID] [int] IDENTITY(1,1) NOT NULL,
	[InterestName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InterestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InterviewRequest]    Script Date: 11/18/2024 8:10:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InterviewRequest](
	[InterviewRequestID] [int] IDENTITY(1,1) NOT NULL,
	[ScheduledTime] [time](7) NOT NULL,
	[ScheduledDate] [date] NOT NULL,
	[RequestPurpose] [nvarchar](255) NOT NULL,
	[RequestStatus] [nvarchar](50) NOT NULL,
	[SystemUserID] [int] NOT NULL,
	[GroupName] [nvarchar](100) NULL,
	[GroupDescription] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[InterviewRequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lesson]    Script Date: 11/18/2024 8:10:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson](
	[LessonID] [int] IDENTITY(1,1) NOT NULL,
	[CompletionStatus] [bit] NOT NULL,
	[ProgressNotes] [nvarchar](max) NULL,
	[InstrumentID] [int] NOT NULL,
	[AdminID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LessonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LessonAvailability]    Script Date: 11/18/2024 8:10:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonAvailability](
	[LessonDate] [date] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[IsAvailable] [bit] NOT NULL,
	[AdminID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LessonDate] ASC,
	[StartTime] ASC,
	[EndTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LessonReservation]    Script Date: 11/18/2024 8:10:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonReservation](
	[LessonReservationID] [int] IDENTITY(1,1) NOT NULL,
	[ScheduledTime] [time](7) NOT NULL,
	[ScheduledDate] [date] NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[PaymentStatus] [nvarchar](50) NOT NULL,
	[PreLessonNote] [nvarchar](max) NULL,
	[LessonID] [int] NOT NULL,
	[SystemUserID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LessonReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MusicalGroup]    Script Date: 11/18/2024 8:10:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MusicalGroup](
	[MusicalGroupID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](100) NOT NULL,
	[GroupDescription] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MusicalGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomRental]    Script Date: 11/18/2024 8:10:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomRental](
	[RoomRentalID] [int] IDENTITY(1,1) NOT NULL,
	[RentalDate] [date] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[PaymentStatus] [nvarchar](50) NOT NULL,
	[SystemUserID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomRentalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomRentalAvailability]    Script Date: 11/18/2024 8:10:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomRentalAvailability](
	[RentalDate] [date] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[IsAvailable] [bit] NOT NULL,
	[AdminID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RentalDate] ASC,
	[StartTime] ASC,
	[EndTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemUser]    Script Date: 11/18/2024 8:10:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemUser](
	[SystemUserID] [int] IDENTITY(1,1) NOT NULL,
	[Fname] [nvarchar](50) NOT NULL,
	[Lname] [nvarchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[PhoneNum] [nvarchar](15) NOT NULL,
	[VerificationStatus] [nvarchar](50) NOT NULL,
	[DateVerified] [date] NULL,
	[HashedCredentialID] [nvarchar](255) NULL,
	[IsApproved] [bit] NOT NULL,
	[UserName]  AS (concat([Fname],' ',[Lname])) PERSISTED NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SystemUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LessonAvailability] ADD  DEFAULT ((1)) FOR [IsAvailable]
GO
ALTER TABLE [dbo].[RoomRentalAvailability] ADD  DEFAULT ((1)) FOR [IsAvailable]
GO
ALTER TABLE [dbo].[SystemUser] ADD  DEFAULT ((0)) FOR [IsApproved]
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD FOREIGN KEY([SystemUserID])
REFERENCES [dbo].[SystemUser] ([SystemUserID])
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD FOREIGN KEY([RoomRentalID])
REFERENCES [dbo].[RoomRental] ([RoomRentalID])
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD FOREIGN KEY([SystemUserID])
REFERENCES [dbo].[SystemUser] ([SystemUserID])
GO
ALTER TABLE [dbo].[Dependent]  WITH CHECK ADD FOREIGN KEY([ParentUserID])
REFERENCES [dbo].[SystemUser] ([SystemUserID])
GO
ALTER TABLE [dbo].[GroupMemberAssociation]  WITH CHECK ADD FOREIGN KEY([MusicalGroupID])
REFERENCES [dbo].[MusicalGroup] ([MusicalGroupID])
GO
ALTER TABLE [dbo].[GroupMemberAssociation]  WITH CHECK ADD FOREIGN KEY([SystemUserID])
REFERENCES [dbo].[SystemUser] ([SystemUserID])
GO
ALTER TABLE [dbo].[GroupMemberAssociation]  WITH CHECK ADD  CONSTRAINT [FK_GroupMemberAssociation_MusicalGroup] FOREIGN KEY([MusicalGroupID])
REFERENCES [dbo].[MusicalGroup] ([MusicalGroupID])
GO
ALTER TABLE [dbo].[GroupMemberAssociation] CHECK CONSTRAINT [FK_GroupMemberAssociation_MusicalGroup]
GO
ALTER TABLE [dbo].[GroupMemberAssociation]  WITH CHECK ADD  CONSTRAINT [FK_GroupMemberAssociation_SystemUser] FOREIGN KEY([SystemUserID])
REFERENCES [dbo].[SystemUser] ([SystemUserID])
GO
ALTER TABLE [dbo].[GroupMemberAssociation] CHECK CONSTRAINT [FK_GroupMemberAssociation_SystemUser]
GO
ALTER TABLE [dbo].[InterviewRequest]  WITH CHECK ADD FOREIGN KEY([SystemUserID])
REFERENCES [dbo].[SystemUser] ([SystemUserID])
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD FOREIGN KEY([AdminID])
REFERENCES [dbo].[Admin] ([AdminID])
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD FOREIGN KEY([InstrumentID])
REFERENCES [dbo].[Instrument] ([InstrumentID])
GO
ALTER TABLE [dbo].[LessonAvailability]  WITH CHECK ADD FOREIGN KEY([AdminID])
REFERENCES [dbo].[Admin] ([AdminID])
GO
ALTER TABLE [dbo].[LessonReservation]  WITH CHECK ADD FOREIGN KEY([LessonID])
REFERENCES [dbo].[Lesson] ([LessonID])
GO
ALTER TABLE [dbo].[LessonReservation]  WITH CHECK ADD FOREIGN KEY([SystemUserID])
REFERENCES [dbo].[SystemUser] ([SystemUserID])
GO
ALTER TABLE [dbo].[RoomRental]  WITH CHECK ADD FOREIGN KEY([SystemUserID])
REFERENCES [dbo].[SystemUser] ([SystemUserID])
GO
ALTER TABLE [dbo].[RoomRental]  WITH CHECK ADD FOREIGN KEY([RentalDate], [StartTime], [EndTime])
REFERENCES [dbo].[RoomRentalAvailability] ([RentalDate], [StartTime], [EndTime])
GO
ALTER TABLE [dbo].[RoomRentalAvailability]  WITH CHECK ADD FOREIGN KEY([AdminID])
REFERENCES [dbo].[Admin] ([AdminID])
GO
ALTER TABLE [dbo].[LessonReservation]  WITH CHECK ADD  CONSTRAINT [CHK_PaymentStatus] CHECK  (([PaymentStatus]='Unpaid' OR [PaymentStatus]='Paid'))
GO
ALTER TABLE [dbo].[LessonReservation] CHECK CONSTRAINT [CHK_PaymentStatus]
GO
ALTER TABLE [dbo].[RoomRental]  WITH CHECK ADD  CONSTRAINT [CHK_ValidRentalTimes] CHECK  (([StartTime]<[EndTime]))
GO
ALTER TABLE [dbo].[RoomRental] CHECK CONSTRAINT [CHK_ValidRentalTimes]
GO
ALTER TABLE [dbo].[SystemUser]  WITH CHECK ADD  CONSTRAINT [CHK_VerStatus] CHECK  (([VerificationStatus]='unverified' OR [VerificationStatus]='verified'))
GO
ALTER TABLE [dbo].[SystemUser] CHECK CONSTRAINT [CHK_VerStatus]
GO
/****** Object:  StoredProcedure [dbo].[AutoPopulateLessonAvailability]    Script Date: 11/18/2024 8:10:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AutoPopulateLessonAvailability]
    @StartDate DATE,
    @EndDate DATE,
    @AdminID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @CurrentDate DATE = @StartDate;

    WHILE @CurrentDate <= @EndDate
    BEGIN
        IF DATEPART(WEEKDAY, @CurrentDate) IN (2, 3, 4, 5, 6) -- Monday to Friday
        BEGIN
            DECLARE @SlotStart TIME = '09:00:00';
            DECLARE @SlotEnd TIME = '16:30:00';

            WHILE (@SlotStart < @SlotEnd)
            BEGIN
                IF NOT EXISTS (
                    SELECT 1 
                    FROM LessonAvailability 
                    WHERE LessonDate = @CurrentDate 
                      AND StartTime = @SlotStart 
                      AND EndTime = DATEADD(MINUTE, 30, @SlotStart)
                )
                BEGIN
                    INSERT INTO LessonAvailability (LessonDate, StartTime, EndTime, IsAvailable, AdminID)
                    VALUES (
                        @CurrentDate,
                        @SlotStart,
                        DATEADD(MINUTE, 30, @SlotStart),
                        1, -- Default availability
                        @AdminID
                    );
                END

                SET @SlotStart = DATEADD(MINUTE, 30, @SlotStart);
            END
        END

        SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate);
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[AutoPopulateRoomRentalAvailability]    Script Date: 11/18/2024 8:10:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AutoPopulateRoomRentalAvailability]
    @StartDate DATE,
    @EndDate DATE,
    @AdminID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @CurrentDate DATE = @StartDate;

    WHILE @CurrentDate <= @EndDate
    BEGIN
        DECLARE @StartTime TIME;
        DECLARE @EndTime TIME;

        IF DATEPART(WEEKDAY, @CurrentDate) = 6 -- Friday
        BEGIN
            SET @StartTime = '17:00:00';
            SET @EndTime = '02:00:00'; -- Next day
        END
        ELSE IF DATEPART(WEEKDAY, @CurrentDate) = 7 -- Saturday
        BEGIN
            SET @StartTime = '08:00:00';
            SET @EndTime = '02:00:00'; -- Next day
        END
        ELSE IF DATEPART(WEEKDAY, @CurrentDate) = 1 -- Sunday
        BEGIN
            SET @StartTime = '08:00:00';
            SET @EndTime = '23:59:59';
        END
        ELSE
        BEGIN
            SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate);
            CONTINUE;
        END

        DECLARE @SlotStart TIME = @StartTime;

        WHILE (@SlotStart < @EndTime AND @SlotStart >= '00:00:00')
        BEGIN
            INSERT INTO RoomRentalAvailability (RentalDate, StartTime, EndTime, IsAvailable, AdminID)
            VALUES (
                @CurrentDate,
                @SlotStart,
                CASE 
                    WHEN DATEADD(HOUR, 1, @SlotStart) < '02:00:00' THEN DATEADD(HOUR, 1, @SlotStart) 
                    ELSE '23:59:59'
                END,
                1,
                @AdminID
            );

            SET @SlotStart = DATEADD(HOUR, 1, @SlotStart);
        END

        SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate);
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[MoveCompletedLessons]    Script Date: 11/18/2024 8:10:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MoveCompletedLessons]
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert lessons whose scheduled date/time has passed
    INSERT INTO Lesson (CompletionStatus, ProgressNotes, InstrumentID, AdminID)
    SELECT 
        0 AS CompletionStatus, -- Mark as not complete
        NULL AS ProgressNotes, -- No progress notes initially
        lr.LessonID, 
        a.AdminID
    FROM LessonReservation lr
    INNER JOIN Lesson l ON lr.LessonID = l.LessonID
    INNER JOIN Admin a ON l.AdminID = a.AdminID
    WHERE 
        lr.ScheduledDate < CAST(GETDATE() AS DATE) -- Date has passed
        OR (lr.ScheduledDate = CAST(GETDATE() AS DATE) AND lr.ScheduledTime < CAST(GETDATE() AS TIME));

    -- Remove moved lessons from LessonReservation
    DELETE FROM LessonReservation
    WHERE 
        ScheduledDate < CAST(GETDATE() AS DATE) -- Date has passed
        OR (ScheduledDate = CAST(GETDATE() AS DATE) AND ScheduledTime < CAST(GETDATE() AS TIME));
END;
GO
/****** Object:  StoredProcedure [dbo].[PopulateLessonAvailability]    Script Date: 11/18/2024 8:10:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PopulateLessonAvailability]
    @StartDate DATE,
    @EndDate DATE,
    @AdminID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Temporary variables for iteration
    DECLARE @CurrentDate DATE = @StartDate;
    DECLARE @StartTime TIME = '09:00:00';
    DECLARE @EndTime TIME = '16:30:00';
    DECLARE @SlotStartTime TIME;
    DECLARE @SlotEndTime TIME;

    -- Loop through all days between StartDate and EndDate
    WHILE @CurrentDate <= @EndDate
    BEGIN
        -- Only process weekdays (Monday to Friday)
        IF DATEPART(WEEKDAY, @CurrentDate) BETWEEN 2 AND 6
        BEGIN
            SET @SlotStartTime = @StartTime;

            -- Generate 30-minute slots for the day
            WHILE @SlotStartTime < @EndTime
            BEGIN
                SET @SlotEndTime = DATEADD(MINUTE, 30, @SlotStartTime);

                -- Check if the slot already exists; if not, insert it
                IF NOT EXISTS (
                    SELECT 1
                    FROM LessonAvailability
                    WHERE LessonDate = @CurrentDate
                      AND StartTime = @SlotStartTime
                      AND EndTime = @SlotEndTime
                      AND AdminID = @AdminID
                )
                BEGIN
                    INSERT INTO LessonAvailability (LessonDate, StartTime, EndTime, IsAvailable, AdminID)
                    VALUES (@CurrentDate, @SlotStartTime, @SlotEndTime, 1, @AdminID);
                END

                -- Move to the next 30-minute slot
                SET @SlotStartTime = @SlotEndTime;
            END
        END

        -- Move to the next day
        SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate);
    END
END;
GO
USE [master]
GO
ALTER DATABASE [MusicalJourney] SET  READ_WRITE 
GO
