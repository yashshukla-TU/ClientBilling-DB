CREATE DATABASE [TubaDB_23May]
GO
USE [TubaDB_23May]
GO
/****** Object:  Table [dbo].[BillingRevenue_Detail]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillingRevenue_Detail](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[Employee_ID] [int] NULL,
	[Project_ID] [int] NULL,
	[LOB_ID] [int] NULL,
	[Site_ID] [int] NULL,
	[PST_Date] [date] NULL,
	[Position_ID] [int] NULL,
	[Initial_BillingCategory_ID] [int] NULL,
	[Final_BillingCategory_ID] [int] NULL,
	[Role] [nvarchar](255) NULL,
	[Full_Part_Time] [nvarchar](255) NULL,
	[Team_Leader] [nvarchar](255) NULL,
	[Team_Leader_Employee_ID] [nvarchar](50) NULL,
	[Delivery_Country] [varchar](100) NULL,
	[Time_Zone] [nvarchar](255) NULL,
	[Biometric_Time_In] [datetime] NULL,
	[Biometric_Time_Out] [datetime] NULL,
	[Biometric_Time_Duration] [decimal](10, 2) NULL,
	[Break_Duration] [decimal](10, 2) NULL,
	[Absence_Hours] [decimal](10, 2) NULL,
	[Overtime_Hours] [decimal](10, 2) NULL,
	[Productive_Hours] [decimal](10, 2) NULL,
	[Lunch_Duration] [decimal](10, 2) NULL,
	[Team_Meeting_Duration] [decimal](10, 2) NULL,
	[TaskUs_Training_Duration] [decimal](10, 2) NULL,
	[Internal_System_Downtime_Duration] [decimal](10, 2) NULL,
	[Coaching_and_Development_Duration] [decimal](10, 2) NULL,
	[Administrative_Duration] [decimal](10, 2) NULL,
	[Client_Training_Duration] [decimal](10, 2) NULL,
	[Client_Upskill_Training_Duration] [decimal](10, 2) NULL,
	[To_Client_Training] [decimal](10, 2) NULL,
	[To_Daily_StandUp] [decimal](10, 2) NULL,
	[To_Wellness] [decimal](10, 2) NULL,
	[To_Team_Meetings] [decimal](10, 2) NULL,
	[Daily_Standup_Duration] [decimal](10, 2) NULL,
	[Wellness_Counseling] [decimal](10, 2) NULL,
	[Campaign_Tools_Downtime_Duration] [decimal](10, 2) NULL,
	[Clinic_Time_Duration] [decimal](10, 2) NULL,
	[Lactation_Time_Duration] [decimal](10, 2) NULL,
	[Teleopti_Schedule_Start_Time] [datetime] NULL,
	[Teleopti_Schedule_End] [datetime] NULL,
	[Teleopti_Scheduled_Overtime] [decimal](10, 2) NULL,
	[Timewarp_Login] [datetime] NULL,
	[Timewarp_Logout] [datetime] NULL,
	[Timewarp_Time_Duration] [decimal](10, 2) NULL,
	[Adjusted_Timewarp_Time_Duration] [numeric](5, 2) NULL,
	[Max_Hours] [float] NULL,
	[Non_Billable_Hours] [numeric](17, 6) NULL,
	[OT_Hours] [numeric](5, 2) NULL,
	[Regular_Hours] [numeric](5, 2) NULL,
	[Holiday_Billable_Hours] [numeric](5, 2) NULL,
	[Regular_Price_Hour] [float] NULL,
	[Regular_Billing_Amount] [float] NULL,
	[Rest_Day_Flag] [nvarchar](255) NULL,
	[Holiday_Flag] [bit] NULL,
	[Total_Time_Less_NonBillable_Time] [numeric](5, 2) NULL,
	[Total_Billing_Hours] [numeric](5, 2) NULL,
	[Total_Billing_Amount] [numeric](6, 2) NULL,
	[Remarks] [varchar](500) NULL,
	[Employee] [varchar](50) NULL,
	[Project] [varchar](25) NULL,
	[LOB] [varchar](255) NULL,
	[Site] [varchar](255) NULL,
	[Position] [varchar](255) NULL,
	[Initial_BillingCategory] [varchar](100) NULL,
	[Final_BillingCategory] [varchar](100) NULL,
	[AccountHierarchy_ID] [int] NULL,
	[AccountHierarchyCode] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimProject]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProject](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Project_Code] [varchar](25) NOT NULL,
	[Name] [varchar](2000) NOT NULL,
	[Display_Name] [varchar](2000) NOT NULL,
	[Client_ID] [int] NULL,
	[Start_Date] [date] NOT NULL,
	[End_Date] [date] NOT NULL,
	[Inserted_Date] [datetime] NOT NULL,
	[Inserted_By] [varchar](25) NOT NULL,
	[Updated_Date] [datetime] NULL,
	[Updated_By] [varchar](25) NULL,
	[IsActive] [bit] NOT NULL,
	[Comments] [varchar](2000) NULL,
	[IsCurrent] [bit] NULL,
	[Project_Descr] [varchar](1000) NULL,
	[Currency] [varchar](10) NULL,
	[CSM] [varchar](255) NULL,
	[SM_Ops] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNQ_Project] UNIQUE NONCLUSTERED 
(
	[Project_Code] ASC,
	[Start_Date] ASC,
	[End_Date] ASC,
	[IsActive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimSite]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimSite](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OldName] [varchar](255) NOT NULL,
	[Country] [varchar](100) NULL,
	[Start_Date] [date] NOT NULL,
	[End_Date] [date] NOT NULL,
	[Inserted_Date] [datetime] NOT NULL,
	[Inserted_By] [varchar](25) NOT NULL,
	[Updated_Date] [datetime] NULL,
	[Updated_By] [varchar](25) NULL,
	[IsActive] [bit] NOT NULL,
	[Comments] [varchar](2000) NULL,
	[Name] [varchar](255) NULL,
	[LocationCode] [varchar](10) NULL,
	[IsCurrent] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNQ_Site] UNIQUE NONCLUSTERED 
(
	[LocationCode] ASC,
	[Start_Date] ASC,
	[End_Date] ASC,
	[IsActive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_CampaignInfoMatrix]    Script Date: 5/30/2023 4:47:17 PM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE VIEW [dbo].[vw_CampaignInfoMatrix]
--AS
--SELECT B.Client, B.Project_Id, B.Display_Name [Project], LOB, A.[Site], Position, [Country]
--FROM
--(
--	SELECT DISTINCT Project_Id, LOB, [Site], Position
--	FROM BillingRevenue_Detail
--	UNION
--	SELECT DISTINCT ProjID, LOB, [Site], Position
--	FROM ClientBillingRules
--) A
--JOIN DimProject B ON A.Project_Id = B.Project_Id AND B.IsActive = 1
--LEFT JOIN DimSite C ON A.[Site] = C.Site_OldName
--GO
--/****** Object:  View [dbo].[vw_SourceData_ClientRules_Mismatch_Detail]    Script Date: 5/30/2023 4:47:17 PM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE VIEW [dbo].[vw_SourceData_ClientRules_Mismatch_Detail] AS 
--(
--	SELECT 
--		FORMAT(a.[Date], 'yyyy-MMM') [Year Month Name], FORMAT(a.[Date], 'yyyyMM') [Year Month Id],
--		b.Client AS [Client], a.Project_Id AS [Project Id], a.[Date], a.Employee_ID, a.lob, a.[Site], 
--		a.Position, a.Final_Billable_Status AS [Billability Category], Timewarp_Login,Timewarp_Logout, Max_Hours,
--		Non_Billable_Hours, Regular_Hours, OT_Hours, Holiday_Billable_Hours,
--		Total_Billing_Hours [Total Billable Hours]
--	FROM 
--		BillingRevenue_Detail AS a 
--		JOIN DimProject AS b ON a.Project_Id = b.Project_Id AND b.IsActive = 1
--		LEFT JOIN ClientBillingRules AS c ON a.Project_Id = c.projid AND a.LOB = c.lob AND a.Position = c.position AND a.[Site] = c.[site]
--		AND a.Final_Billable_Status = c.billability_category AND a.[Date] BETWEEN ISNULL(NULL, a.[Date]) AND ISNULL(NULL, a.[Date])  
--		AND c.[start_date] = ISNULL(NULL, CAST(DATEADD(M, DATEDIFF(M, 0, a.[Date]), 0) AS DATE)) AND c.end_date = ISNULL(NULL, EOMONTH(a.[Date]))
--		AND b.Client = ISNULL(NULL, b.Client)
--	WHERE 
--	 c.projid IS NULL  
--     AND a.[Date] BETWEEN ISNULL(NULL, a.[Date]) AND ISNULL(NULL, a.[Date])  
--	AND b.Client = ISNULL(NULL, b.Client)
--);

--GO
--/****** Object:  View [dbo].[vw_SourceData_ClientRules_Mismatch_Summary]    Script Date: 5/30/2023 4:47:17 PM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE VIEW [dbo].[vw_SourceData_ClientRules_Mismatch_Summary] AS 
--(	
--	SELECT 
--		FORMAT(a.[Date], 'yyyy-MMM') [Year Month Name], FORMAT(a.[Date], 'yyyyMM') [Year Month Id],
--		b.Client AS [Client], b.Display_Name AS [Project], a.lob, a.[Site], 
--		a.Position, a.Final_Billable_Status AS [Billability Category], COUNT(*) [Record Counts], SUM(Total_Billing_Hours) [Total Billable Hours]
--	FROM 
--		BillingRevenue_Detail AS a 
--		JOIN DimProject AS b ON a.Project_Id = b.Project_Id AND b.IsActive = 1
--		LEFT JOIN ClientBillingRules AS c ON a.Project_Id = c.projid AND a.LOB = c.lob AND a.Position = c.position AND a.[Site] = c.[site]
--		AND a.Final_Billable_Status = c.billability_category
--		AND MONTH(c.[start_date]) = MONTH(a.[Date]) AND c.end_date = EOMONTH(a.[Date])
--	WHERE 
--	c.projid IS NULL 
--	AND b.Client = b.Client
--	GROUP BY 
--	FORMAT(a.[Date], 'yyyy-MMM'), FORMAT(a.[Date], 'yyyyMM'),b.Client,b.Display_Name,
--	a.Project_Id,a.LOB, a.[Site], a.Position, a.Final_Billable_Status
--);

--GO
/****** Object:  Table [dbo].[DimClient]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimClient](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](225) NOT NULL,
	[Start_Date] [date] NOT NULL,
	[End_Date] [date] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsLive] [bit] NULL,
	[Inserted_Date] [datetime] NULL,
	[Inserted_By] [varchar](225) NULL,
	[Updated_Date] [datetime] NULL,
	[Updated_By] [varchar](225) NULL,
	[IsCurrent] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNQ_Client] UNIQUE NONCLUSTERED 
(
	[Name] ASC,
	[Start_Date] ASC,
	[End_Date] ASC,
	[IsActive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_DimClient]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_DimClient]
AS
SELECT ID, [Name], IsActive FROM DimClient WHERE IsCurrent = 1
GO
/****** Object:  Table [dbo].[DimPosition]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimPosition](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](225) NOT NULL,
	[Start_Date] [date] NOT NULL,
	[End_Date] [date] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsCurrent] [bit] NOT NULL,
	[Inserted_Date] [datetime] NULL,
	[Inserted_By] [varchar](225) NULL,
	[Updated_Date] [datetime] NULL,
	[Updated_By] [varchar](225) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNQ_Position] UNIQUE NONCLUSTERED 
(
	[Name] ASC,
	[Start_Date] ASC,
	[End_Date] ASC,
	[IsActive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_DimPosition]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_DimPosition]
AS
SELECT ID, [Name], IsActive FROM DimPosition WHERE IsCurrent = 1
GO
/****** Object:  Table [dbo].[DimBillingCategory]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimBillingCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](225) NOT NULL,
	[Start_Date] [date] NOT NULL,
	[End_Date] [date] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsCurrent] [bit] NOT NULL,
	[Inserted_Date] [datetime] NULL,
	[Inserted_By] [varchar](225) NULL,
	[Updated_Date] [datetime] NULL,
	[Updated_By] [varchar](225) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNQ_BillingCategory] UNIQUE NONCLUSTERED 
(
	[Name] ASC,
	[Start_Date] ASC,
	[End_Date] ASC,
	[IsActive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_DimBillingCategory]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_DimBillingCategory]
AS
SELECT ID, [Name], IsActive FROM DimBillingCategory WHERE IsCurrent = 1
GO
/****** Object:  Table [dbo].[BillingRevenue_Summary]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillingRevenue_Summary](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Year_Mon_Id] [int] NULL,
	[Year_Mon_Name] [varchar](25) NULL,
	[ClientRules_Applied_Start] [date] NULL,
	[ClientRules_Applied_End] [date] NULL,
	[Project_ID] [int] NULL,
	[BillingCategory_ID] [int] NULL,
	[LOB_ID] [int] NULL,
	[Site_ID] [int] NULL,
	[Position_ID] [int] NULL,
	[Max_Billable_Headcount] [float] NULL,
	[Max_Contract_Bill_Hours] [float] NULL,
	[Serviced_Holiday_Hours] [float] NULL,
	[Serviced_Overtime_Hours] [float] NULL,
	[Serviced_Regular_Hours] [float] NULL,
	[Serviced_Additional_Hours] [float] NULL,
	[Billable_Holiday_Hours] [float] NULL,
	[Billable_Premium_Overtime_Hours] [float] NULL,
	[Billable_Regular_Hours] [float] NULL,
	[Total_Billing_Hours_Invoiced] [float] NULL,
	[Holiday_Price_Hour] [float] NULL,
	[Overtime_Price_Hour] [float] NULL,
	[Regular_Price_Hour] [float] NULL,
	[Holiday_Hours_Billing_Amount] [float] NULL,
	[Premium_Overtime_Hours_Billing_Amount] [float] NULL,
	[Regular_Hours_Billing_Amount] [float] NULL,
	[Total_Billing_Amount] [float] NULL,
	[Regular_Overtime_Hours_Billing_Amount] [float] NULL,
	[Billable_Regular_Overtime_Hours] [float] NULL,
	[Project] [varchar](25) NULL,
	[LOB] [varchar](255) NULL,
	[Site] [varchar](255) NULL,
	[Position] [varchar](255) NULL,
	[BillingCategory] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_BillingSummary]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--CREATE VIEW [dbo].[vw_BillingSummary]
--AS
--SELECT 
--Year_Mon_Id
--, Year_Mon_Name [Month]
--, ClientRules_Applied_Start
--, ClientRules_Applied_End
--, Project_Id [Project ID]
--, Billability_Category [Billing Category]
--, LOB
--, [Site]
--, Position
--, Max_Billable_Headcount [Billable Headcount]
--, Max_Contract_Bill_Hours [Client Approved Hours] 
--, Billable_Holiday_Hours [Holiday Billable Hours]
--, Billable_Overtime_Hours [Overtime Billable Hours]
--, Billable_Regular_Hours [Regular Billable Hours]
--, Serviced_Additional_Hours [Additional Hours]
--, Total_Billing_Hours_Invoiced [Total Billing Hours]
--, Holiday_Price_Hour [Holiday Billing Rate]
--, Overtime_Price_Hour [Overtime Billing Rate]
--, Regular_Price_Hour [Regular Billing Rate]
--, Holiday_Hours_Billing_Amount [Holiday Hours Billing Amount]
--, Overtime_Hours_Billing_Amount [Overtime Hours Billing Amount]
--, Regular_Hours_Billing_Amount [Regular Hours Billing Amount]
--, Total_Billing_Amount [Total Billing Amount]
--FROM 
--BillingRevenue_Summary
--GO
/****** Object:  View [dbo].[vw_ClientBillingRules]    Script Date: 5/30/2023 4:47:17 PM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE VIEW [dbo].[vw_ClientBillingRules]  
--AS  
--SELECT
--	A.Row_ID,
--	A.[start_date] [Start Date],   
--	CASE WHEN A.end_date = '2999-12-31' THEN NULL ELSE A.end_date END [End Date],   
--	FORMAT(DATEADD(DAY, 1, EOMONTH(A.[start_date], -1)), 'yyyyMM') Year_Mon_Id, --Getting MonthId from an expression that yields FIRST DAY of the month  
--	FORMAT(DATEADD(DAY, 1, EOMONTH(A.[start_date], -1)), 'yyyy-MMM') [Month],    
--	projid [Project ID],   
--	CONCAT(P.Project_Id, ' (', P.Project_Name, ')') AS [Project],  
--	lob LOB,   
--	site [Site],   
--	position [Position],   
--	billability_category [Billability Category],   
--	lower_max [Lower Max],   
--	upper_max [Upper Max],   
--	billable_headcount [Billable Headcount],   
--	round_per_minutes [Round per Minutes],   
--	grace_period_minutes [Grace Time in Mins],   
--	spillover_mins [Spillover Time in Mins],   
--	working_days [Working Days in a Month],   
--	regular_price_hr [Regular Price per Hour],   
--	holiday_price_hr [Holiday Price per Hour],   
--	overtime_price_hr [Overtime Price per Hour],  
--	P.Client ,
--	A.Comments,
--	A.IsActive
--FROM ClientBillingRules A  
--JOIN DimProject P ON A.projid = P.Project_Id    
--WHERE P.IsActive = 1
--GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[DateKey] [int] NOT NULL,
	[Date] [date] NULL,
	[DateDescr] [varchar](15) NULL,
	[DayOfMonth] [varchar](2) NULL,
	[DaySuffix] [varchar](4) NULL,
	[DayName] [varchar](9) NULL,
	[DayOfWeek] [char](1) NULL,
	[DayOfWeekInMonth] [varchar](2) NULL,
	[DayOfWeekInYear] [varchar](2) NULL,
	[DayOfQuarter] [varchar](3) NULL,
	[DayOfYear] [varchar](3) NULL,
	[WeekOfMonth] [varchar](1) NULL,
	[WeekOfQuarter] [varchar](2) NULL,
	[WeekOfYear] [varchar](2) NULL,
	[Month] [varchar](2) NULL,
	[MonthName] [varchar](9) NULL,
	[MonthOfQuarter] [varchar](2) NULL,
	[Quarter] [char](1) NULL,
	[QuarterName] [varchar](9) NULL,
	[Year] [char](4) NULL,
	[YearName] [char](7) NULL,
	[MonthYear] [char](10) NULL,
	[MMYYYY] [char](6) NULL,
	[FirstDayOfMonth] [date] NULL,
	[LastDayOfMonth] [date] NULL,
	[FirstDayOfQuarter] [date] NULL,
	[LastDayOfQuarter] [date] NULL,
	[FirstDayOfYear] [date] NULL,
	[LastDayOfYear] [date] NULL,
	[IsWeekday] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_DimDate]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_DimDate]
AS
SELECT * FROM dbo.DimDate
GO
/****** Object:  Table [dbo].[DimEmployee]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimEmployee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EID] [varchar](50) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Display_Name] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Inserted_Date] [datetime] NOT NULL,
	[Inserted_By] [varchar](25) NOT NULL,
	[Updated_Date] [datetime] NULL,
	[Updated_By] [varchar](25) NULL,
	[IsActive] [bit] NOT NULL,
	[Comments] [varchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNQ_Employee] UNIQUE NONCLUSTERED 
(
	[EID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_DimEmployee]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_DimEmployee]
AS
SELECT ID, EID, [Name], Display_Name, Email, IsActive FROM DimEmployee
GO
/****** Object:  Table [dbo].[DimLOB]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimLOB](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Start_Date] [date] NOT NULL,
	[End_Date] [date] NOT NULL,
	[Inserted_Date] [datetime] NOT NULL,
	[Inserted_By] [varchar](25) NOT NULL,
	[Updated_Date] [datetime] NULL,
	[Updated_By] [varchar](25) NULL,
	[IsActive] [bit] NOT NULL,
	[Comments] [varchar](2000) NULL,
	[IsCurrent] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNQ_LOB] UNIQUE NONCLUSTERED 
(
	[Name] ASC,
	[Start_Date] ASC,
	[End_Date] ASC,
	[IsActive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_DimLOB]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_DimLOB]
AS
SELECT ID, [Name], IsActive FROM DimLOB WHERE IsCurrent = 1
GO
/****** Object:  View [dbo].[vw_DimProject]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_DimProject]
AS
SELECT ID, Project_Code, [Name], Display_Name, Client_ID, IsActive 
FROM dbo.DimProject WHERE IsCurrent = 1
GO
/****** Object:  View [dbo].[vw_DimSite]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_DimSite]
AS
SELECT ID, [Name], OldName, LocationCode, Country, IsActive FROM DimSite WHERE IsCurrent = 1
GO
/****** Object:  View [dbo].[vw_BillingRevenue]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_BillingRevenue]
AS
SELECT
	[Date] AS [Date], Employee_ID AS [Employee ID], Project_ID AS [Project Id], LOB_ID AS [LOB ID], AccountHierarchy_ID AS [AccountHierarchy ID], [Site_ID] AS [Site ID], PST_Date AS [PST Date], 
	Position_ID AS [Position ID], Initial_BillingCategory_ID AS [Initial Billing Category ID], Final_BillingCategory_ID AS [Final Billing Category ID], 
	Project, LOB, [Site], Position, Initial_BillingCategory AS [Initial BillingCategory], Final_BillingCategory AS [Final BillingCategory], AccountHierarchyCode,
	[Role] AS [Role], Full_Part_Time AS [Full Part Time], Team_Leader AS [Team Leader], Team_Leader_Employee_ID AS [Team Leader Employee ID], 
	Delivery_Country AS [Delivery Country], Time_Zone AS [Time Zone], Biometric_Time_In AS [Biometric Time In], 
	Biometric_Time_Out AS [Biometric Time Out], Biometric_Time_Duration AS [Biometric Time Duration], Break_Duration AS [Break Duration], 
	Absence_Hours AS [Absence Hours], Overtime_Hours AS [Overtime Hours], Productive_Hours AS [Productive Hours], Lunch_Duration AS [Lunch Duration], 
	Team_Meeting_Duration AS [Team Meeting Duration], TaskUs_Training_Duration AS [TaskUs Training Duration], 
	Internal_System_Downtime_Duration AS [Internal System Downtime Duration], Coaching_and_Development_Duration AS [Coaching and Development Duration], 
	Administrative_Duration AS [Administrative Duration], Client_Training_Duration AS [Client Training Duration], 
	Client_Upskill_Training_Duration AS [Client Upskill Training Duration], To_Client_Training AS [To Client Training], 
	To_Daily_StandUp AS [To Daily StandUp], To_Wellness AS [To Wellness], To_Team_Meetings AS [To Team Meetings], 
	Daily_Standup_Duration AS [Daily Standup Duration], Wellness_Counseling AS [Wellness Counseling], 
	Campaign_Tools_Downtime_Duration AS [Campaign Tools Downtime Duration], Clinic_Time_Duration AS [Clinic Time Duration], 
	Lactation_Time_Duration AS [Lactation Time Duration], Teleopti_Schedule_Start_Time AS [Schedule Start Time], 
	Teleopti_Schedule_End AS [Schedule End], Teleopti_Scheduled_Overtime AS [Scheduled Overtime], 
	Timewarp_Login AS [Timewarp Login], Timewarp_Logout AS [Timewarp Logout], Timewarp_Time_Duration AS [Timewarp Time Duration], 
	Max_Hours AS [Max Hours], Non_Billable_Hours AS [Non Billable Hours], OT_Hours AS [OT Hours], Regular_Hours AS [Regular Hours], 
	Holiday_Billable_Hours AS [Holiday Billable Hours], Regular_Price_Hour AS [Regular Price Hour], Regular_Billing_Amount AS [Regular Billing Amount], 
	Rest_Day_Flag AS [Rest Day Flag], Total_Time_Less_NonBillable_Time AS [Total Time Less NonBillable Time], Total_Billing_Hours AS [Total Billing Hours], 
	Total_Billing_Amount AS [Total Billing Amount], Remarks
FROM
dbo.BillingRevenue_Detail
GO
/****** Object:  Table [dbo].[RPT_BILLING]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RPT_BILLING](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[EID] [nvarchar](50) NULL,
	[TL] [nvarchar](255) NULL,
	[Site] [nvarchar](100) NULL,
	[Campaign] [nvarchar](255) NULL,
	[LOB] [nvarchar](255) NULL,
	[Date] [date] NULL,
	[PST Date] [date] NULL,
	[Biometric Time In] [datetime] NULL,
	[Biometric Time Out] [datetime] NULL,
	[TeleOpti Schedule start] [datetime] NULL,
	[TeleOpti Schedule End] [datetime] NULL,
	[Time Warp Log In] [datetime] NULL,
	[Time Warp Log Out] [datetime] NULL,
	[TeleOpti Scheduled Overtime] [decimal](10, 2) NULL,
	[Biometric Time Duration] [decimal](10, 2) NULL,
	[Teleopti Time Duration] [decimal](10, 2) NULL,
	[TimeWarp Time Duration] [decimal](10, 2) NULL,
	[Scheduled Time] [decimal](10, 2) NULL,
	[Scheduled Ready Time] [decimal](10, 2) NULL,
	[Scheduled_Work_Time] [decimal](10, 2) NULL,
	[Scheduled_Contract_Time] [decimal](10, 2) NULL,
	[Scheduled_Time_Activity] [decimal](10, 2) NULL,
	[Absence Hour] [decimal](10, 2) NULL,
	[Overtime Hour] [decimal](10, 2) NULL,
	[Client Billable Time] [decimal](10, 2) NULL,
	[Productive Hour] [decimal](10, 2) NULL,
	[Break Duration] [decimal](10, 2) NULL,
	[Lunch Duration] [decimal](10, 2) NULL,
	[Team Meetings Duration] [decimal](10, 2) NULL,
	[Bio Break Duration] [decimal](10, 2) NULL,
	[TaskUs Training Duration] [decimal](10, 2) NULL,
	[Internal System Downtime Duration] [decimal](10, 2) NULL,
	[Coaching & Development Duration] [decimal](10, 2) NULL,
	[Administrative Duration] [decimal](10, 2) NULL,
	[Client Training Duration] [decimal](10, 2) NULL,
	[Campaign Tools Downtime Duration] [decimal](10, 2) NULL,
	[Date Created] [datetime] NULL,
	[Role] [nvarchar](255) NULL,
	[IS_NTLogin] [nvarchar](50) NULL,
	[Client Upskill Training] [decimal](10, 2) NULL,
	[Daily Stand Up] [decimal](10, 2) NULL,
	[Wellness / Counseling] [decimal](10, 2) NULL,
	[Position] [nvarchar](255) NULL,
	[ProjectID] [nvarchar](255) NULL,
	[ProjectName] [nvarchar](255) NULL,
	[TO_daily_stand_up] [decimal](10, 2) NULL,
	[TO_coaching_and_development] [decimal](10, 2) NULL,
	[TO_welness] [decimal](10, 2) NULL,
	[TO_team_meetings] [decimal](10, 2) NULL,
	[TO_client_training] [decimal](10, 2) NULL,
	[authorized_absence] [nvarchar](max) NULL,
	[unauthorized_absence] [nvarchar](max) NULL,
	[rest_day_flag] [nvarchar](255) NULL,
	[Status] [nvarchar](250) NULL,
	[TO_campaign_tools_downtime] [decimal](10, 2) NULL,
	[Timezone] [nvarchar](255) NULL,
	[Unauthorized_Absence_Hrs] [decimal](10, 2) NULL,
	[TL_ID] [nvarchar](50) NULL,
	[OM_ID] [nvarchar](50) NULL,
	[OM_Name] [nvarchar](255) NULL,
	[SOM_ID] [nvarchar](50) NULL,
	[SOM_Name] [nvarchar](255) NULL,
	[OD_ID] [nvarchar](50) NULL,
	[OD_Name] [nvarchar](255) NULL,
	[Lactation Time] [decimal](10, 2) NULL,
	[Clinic Time] [decimal](10, 2) NULL,
	[Full/PartTime] [nvarchar](255) NULL,
	[Authorized_Absence_Hrs] [decimal](10, 2) NULL,
	[JobManagementLevel] [nvarchar](300) NULL,
	[JobManagementLevelName] [nvarchar](300) NULL,
	[billable_aux_min] [int] NULL,
	[nonbillable_aux_min] [int] NULL,
	[WorkerType] [nvarchar](250) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_utl_teleopti_billing_last_3_months]    Script Date: 5/30/2023 4:47:17 PM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE VIEW [dbo].[v_utl_teleopti_billing_last_3_months]
--AS
--/*
--(
--  SELECT
--    *
--  FROM
--    public.teleopti_billing
--  WHERE
--    "date" BETWEEN DATE_TRUNC ( 'month' , DATEADD(months, -3, GETDATE()) )
--    AND TRUNC ( CONVERT_TIMEZONE ( 'Universal', 'Asia/Singapore', GETDATE() ) )
--)
--WITH NO SCHEMA BINDING;
--*/
--(
--	SELECT
--		[ID] AS [id], 
--		[Name] AS [name], 
--		[EID] AS [eid], 
--		[TL] AS [tl], 
--		[Site] AS [site], 
--		[Campaign] AS [campaign], 
--		[LOB] AS [lob], 
--		[Date] AS [date], 
--		[PST Date] AS [pst_date], 
--		[Biometric Time In] AS [biometric_time_in], 
--		[Biometric Time Out] AS [biometrics_time_out], 
--		[TeleOpti Schedule start] AS [teleopti_schedule_start], 
--		[TeleOpti Schedule End] AS [teleopti_schedule_end], 
--		[Time Warp Log In] AS [timewarp_login], 
--		[Time Warp Log Out] AS [timewarp_logout], 
--		[TeleOpti Scheduled Overtime] AS [teleopti_scheduled_overtime], 
--		[Biometric Time Duration] AS [biometric_time_duration], 
--		[Teleopti Time Duration] AS [teleopti_time_duration], 
--		[TimeWarp Time Duration] AS [timewarp_time_duration], 
--		[Scheduled Time] AS [scheduled_time], 
--		[Scheduled Ready Time] AS [scheduled_ready_time], 
--		[Scheduled_Work_Time] AS [schedule_work_time], 
--		[Scheduled_Contract_Time] AS [scheduled_contract_time], 
--		[Scheduled_Time_Activity] AS [scheduled_time_activity], 
--		[Absence Hour] AS [absence_hour], 
--		[Overtime Hour] AS [overtime_hour], 
--		[Client Billable Time] AS [client_billable_time], 
--		[Productive Hour] AS [productive_hour], 
--		[Break Duration] AS [break_duration], 
--		[Lunch Duration] AS [lunch_duration], 
--		[Team Meetings Duration] AS [team_meetings_duration], 
--		[Bio Break Duration] AS [bio_break_duration], 
--		[TaskUs Training Duration] AS [taskus_training_duration], 
--		[Internal System Downtime Duration] AS [internal_system_downtime_duration], 
--		[Coaching & Development Duration] AS [coaching_and_development_duration], 
--		[Administrative Duration] AS [administrative_duration], 
--		[Client Training Duration] AS [client_training_duration], 
--		[Campaign Tools Downtime Duration] AS [campaign_tools_downtime_duration], 
--		[Date Created] AS [date_created], 
--		[Role] AS [role], 
--		[IS_NTLogin] AS [is_ntlogin], 
--		[Client Upskill Training] AS [client_upskill_training], 
--		[Daily Stand Up] AS [daily_stand_up], 
--		[Wellness / Counseling] AS [wellness_counseling], 
--		[Position] AS [position], 
--		[ProjectID] AS [project_id], 
--		[ProjectName] AS [project_name], 
--		[TO_daily_stand_up] AS [to_daily_stand_up], 
--		[TO_coaching_and_development] AS [to_coaching_and_development], 
--		[TO_welness] AS [to_wellness], 
--		[TO_team_meetings] AS [to_team_meetings], 
--		[TO_client_training] AS [to_client_training], 
--		[authorized_absence] AS [authorized_absence], 
--		[unauthorized_absence] AS [unauthorized_absence], 
--		[rest_day_flag] AS [rest_day_flag], 
--		[Status] AS [status], 
--		[TO_campaign_tools_downtime] AS [to_campaign_tools_downtime], 
--		[Timezone] AS [timezone], 
--		[Unauthorized_Absence_Hrs] AS [unauthorized_absence_hrs], 
--		[TL_ID] AS [tl_id], 
--		[OM_ID] AS [om_id], 
--		[OM_Name] AS [om_name], 
--		[SOM_ID] AS [som_id], 
--		[SOM_Name] AS [som_name], 
--		[OD_ID] AS [od_id], 
--		[OD_Name] AS [od_name], 
--		[Lactation Time] AS [lactation_time], 
--		[Clinic Time] AS [clinic_time], 
--		[Full/PartTime] AS [full_part_time],
--		Authorized_Absence_Hrs AS [authorized_absence_hrs],
--		JobManagementLevel AS [job_management_level],
--		JobManagementLevelName AS [job_management_levelname],
--		billable_aux_min,
--		nonbillable_aux_min
--	FROM
--	dbo.RPT_BILLING A
--	JOIN dbo.vw_DimProject B ON LEFT(TRIM(A.[ProjectID]), 11) = B.Project_Id AND B.IsActive = 1
--	WHERE [date] BETWEEN CAST(DATEADD(M, -3, GETDATE()) AS DATE) AND CAST(GETDATE() AS DATE)
--)

--GO
/****** Object:  Table [dbo].[BillingRevenue_Invoicing]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillingRevenue_Invoicing](
	[sourceref] [int] IDENTITY(1,1) NOT NULL,
	[Year_Mon_Id] [int] NULL,
	[Month] [varchar](25) NULL,
	[source_name] [varchar](80) NULL,
	[organization_name] [varchar](240) NULL,
	[contract_type] [varchar](240) NULL,
	[contract_number] [varchar](256) NULL,
	[contract_line_number] [varchar](100) NULL,
	[event_type] [varchar](240) NULL,
	[event_description] [varchar](256) NULL,
	[event_completion_date] [date] NULL,
	[currency] [varchar](15) NULL,
	[bill_amount] [numeric](14, 2) NULL,
	[project_number] [varchar](25) NULL,
	[task_number] [varchar](100) NULL,
	[bill_hold_flag] [varchar](25) NULL,
	[revenue_hold_flag] [varchar](25) NULL,
	[attribute_category] [varchar](25) NULL,
	[attrbute1] [varchar](150) NULL,
	[attrbute2] [numeric](14, 2) NULL,
	[attrbute3] [numeric](14, 2) NULL,
	[attrbute4] [varchar](150) NULL,
	[attrbute5] [varchar](150) NULL,
	[attrbute6] [varchar](150) NULL,
	[attrbute7] [varchar](150) NULL,
	[attrbute8] [varchar](150) NULL,
	[attrbute9] [varchar](150) NULL,
	[attrbute10] [varchar](150) NULL,
	[bu_name] [varchar](240) NULL,
	[status] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_BillingInvoicing]    Script Date: 5/30/2023 4:47:17 PM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE VIEW [dbo].[vw_BillingInvoicing]
--AS
--SELECT
--	Year_Mon_Id,
--	[Month],
--	B.Client,
--	project_number [Project Number],
--	revenue_hold_flag [Revenue Hold Flag],
--	source_name [Source Name],
--	[status] [Status],
--	sourceref [Source Ref],
--	task_number [Task Number],
--	event_type [Event Type],
--	organization_name [Organization Name],
--	event_description [Event Description],
--	event_completion_date [Event Completion Date],
--	currency [Currency],
--	contract_type [Contract Type],
--	contract_number [Contract Number],
--	contract_line_number [Contract Line Number],
--	bu_name [BU Name],
--	bill_hold_flag [Bill Hold Flag],
--	bill_amount [Bill Amount],
--	attribute_category [Attribute Category],
--	attrbute1 [Attrbute1], 
--	attrbute2 [Attrbute2], 
--	attrbute3 [Attrbute3], 
--	attrbute4 [Attrbute4], 
--	attrbute5 [Attrbute5], 
--	attrbute6 [Attrbute6], 
--	attrbute7 [Attrbute7], 
--	attrbute8 [Attrbute8], 
--	attrbute9 [Attrbute9], 
--	attrbute10 [Attrbute10]
--FROM BillingRevenue_Invoicing A 
--JOIN DimProject B ON LEFT(TRIM(A.project_number), 11) = B.Project_Id
--GO
/****** Object:  Table [dbo].[Employee_Adjustments]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Adjustments](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Employee_ID] [int] NULL,
	[Date] [date] NOT NULL,
	[pst_date] [date] NULL,
	[Project_ID] [int] NULL,
	[LOB_ID] [int] NULL,
	[Position_ID] [int] NULL,
	[BillingCategory_ID] [int] NULL,
	[Inserted_Date] [datetime] NOT NULL,
	[Inserted_By] [varchar](255) NULL,
	[Updated_Date] [datetime] NULL,
	[Updated_By] [varchar](255) NULL,
	[AccountHierarchy_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Emp_Adjustments]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_Emp_Adjustments]
AS
SELECT 
	ID
	, Employee_ID
	, [Date]
	, Project_ID
	, LOB_ID
	, Position_ID
	, BillingCategory_ID
	, AccountHierarchy_ID
	, CAST(FORMAT([Date], 'yyyyMMdd') AS INT) AS TimeSheetDate   
FROM Employee_Adjustments
GO
/****** Object:  View [dbo].[VW_Emp_DisplayName]    Script Date: 5/30/2023 4:47:17 PM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE VIEW [dbo].[VW_Emp_DisplayName] 
--AS
--SELECT DISTINCT Display_Name, Client, Project_Name FROM dbo.Employee_Adjustments
--GO
/****** Object:  View [dbo].[vw_BillingEventTypes]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_BillingEventTypes]
AS
SELECT DISTINCT [BillingEventType] FROM
(
	SELECT 'TM -' AS [DescriptionPrefix], 'Production Hours Billed' AS [BillingEventType] UNION 
	SELECT 'TR -', 'Training Hours Billed' UNION 
	SELECT 'DIS -', 'Penalties Billed' UNION 
	SELECT 'PEN -', 'Penalties Billed' UNION 
	SELECT 'BON -', 'Bonuses/ Incentives Billed' UNION 
	SELECT 'MISC -', 'Misc Client Billings' UNION 
	SELECT '', 'Billing Corrections' UNION 
	SELECT 'CON -', 'Consulting Revenue Billed' UNION 
	SELECT 'TRB -', 'Technology Resale Billed' UNION 
	SELECT 'TL -', 'Support Hours Billed' UNION 
	SELECT 'SU -', 'Support Hours Billed' UNION 
	SELECT 'RF -', 'Referral Fees Billed' UNION 
	SELECT 'DEF -', 'Deferred Revenue Billed' UNION 
	SELECT 'Credit -', 'Production Hours Billed' UNION 
	SELECT 'KPI -', 'Penalties Billed' UNION 
	SELECT '', 'Sponsorship Revenue Billed' UNION 
	SELECT 'QA -', 'Support Hours Billed' UNION 
	SELECT 'CA -', 'Customer Advances Billed' 
) A
GO
/****** Object:  View [dbo].[vw_PositionBillCategory]    Script Date: 5/30/2023 4:47:17 PM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO

--CREATE VIEW [dbo].[vw_PositionBillCategory]
--AS
--SELECT * FROM PositionBillCategory
--GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuxBillability]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuxBillability](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Project_ID] [int] NULL,
	[Aux] [varchar](255) NOT NULL,
	[Billability] [char](1) NOT NULL,
	[Max_Billable_Mins] [smallint] NULL,
	[Start_Date] [date] NOT NULL,
	[End_Date] [date] NOT NULL,
	[Inserted_Date] [datetime] NOT NULL,
	[Inserted_By] [varchar](25) NOT NULL,
	[Updated_Date] [datetime] NULL,
	[Updated_By] [varchar](25) NULL,
	[IsActive] [bit] NOT NULL,
	[Comments] [varchar](2000) NULL,
	[IsCurrent] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNQ_AuxBillability] UNIQUE NONCLUSTERED 
(
	[Project_ID] ASC,
	[Aux] ASC,
	[Start_Date] ASC,
	[End_Date] ASC,
	[IsActive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[billing_revenue_event_type_report]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[billing_revenue_event_type_report](
	[_file] [nvarchar](256) NOT NULL,
	[_line] [bigint] NOT NULL,
	[_modified] [datetimeoffset](7) NULL,
	[event_type] [varchar](256) NULL,
	[description] [varchar](256) NULL,
	[last_update_date] [datetimeoffset](7) NULL,
	[_fivetran_synced] [datetimeoffset](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[_file] ASC,
	[_line] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[billing_revenue_event_types]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[billing_revenue_event_types](
	[_file] [nvarchar](256) NOT NULL,
	[_line] [bigint] NOT NULL,
	[_modified] [datetimeoffset](7) NULL,
	[event_type] [nvarchar](256) NULL,
	[description] [nvarchar](256) NULL,
	[last_update_date] [datetimeoffset](7) NULL,
	[_fivetran_synced] [datetimeoffset](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[_file] ASC,
	[_line] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[billing_revenue_project_task_numbers]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[billing_revenue_project_task_numbers](
	[_file] [nvarchar](256) NOT NULL,
	[_line] [bigint] NOT NULL,
	[_modified] [datetimeoffset](7) NULL,
	[location] [nvarchar](256) NULL,
	[task_number] [nvarchar](256) NULL,
	[last_update_date] [nvarchar](256) NULL,
	[_fivetran_synced] [datetimeoffset](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[_file] ASC,
	[_line] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[billing_revenue_project_task_report]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[billing_revenue_project_task_report](
	[_file] [nvarchar](256) NOT NULL,
	[_line] [bigint] NOT NULL,
	[_modified] [datetimeoffset](7) NULL,
	[location] [varchar](256) NULL,
	[task_number] [varchar](256) NULL,
	[last_update_date] [varchar](256) NULL,
	[_fivetran_synced] [datetimeoffset](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[_file] ASC,
	[_line] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[billing_revenue_project_to_contract_details]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[billing_revenue_project_to_contract_details](
	[_file] [nvarchar](256) NOT NULL,
	[_line] [bigint] NOT NULL,
	[_modified] [datetimeoffset](7) NULL,
	[project_number] [varchar](256) NULL,
	[organization] [varchar](256) NULL,
	[contract_number] [varchar](256) NULL,
	[contract_line_number] [varchar](256) NULL,
	[project_last_update_date] [varchar](256) NULL,
	[contract_last_update_date] [varchar](256) NULL,
	[bu_name] [varchar](256) NULL,
	[oracle_project_id] [bigint] NULL,
	[_fivetran_synced] [datetimeoffset](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[_file] ASC,
	[_line] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillingMaster]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillingMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Start_Date] [date] NOT NULL,
	[End_Date] [date] NOT NULL,
	[Project_ID] [int] NOT NULL,
	[AccountHierarchy_ID] [int] NOT NULL,
	[Site_ID] [int] NOT NULL,
	[Position_ID] [int] NOT NULL,
	[BillingCategory_ID] [int] NOT NULL,
	[Scheduled_Hrs] [float] NOT NULL,
	[Billable_Hrs_Lower_Max] [float] NULL,
	[Billable_Hrs_Upper_Max] [float] NULL,
	[Round_Per_Minutes] [float] NULL,
	[Grace_Period_Minutes] [float] NULL,
	[Spillover_Mins] [float] NULL,
	[Regular_Price_Hr] [float] NULL,
	[Holiday_Price_Hr] [float] NULL,
	[Overtime_Price_Hr] [float] NULL,
	[Inserted_Date] [datetime] NOT NULL,
	[Inserted_By] [varchar](100) NULL,
	[Updated_Date] [datetime] NULL,
	[Updated_By] [varchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[Comments] [varchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNQ_BillingMaster] UNIQUE NONCLUSTERED 
(
	[Project_ID] ASC,
	[Start_Date] ASC,
	[End_Date] ASC,
	[AccountHierarchy_ID] ASC,
	[Site_ID] ASC,
	[Position_ID] ASC,
	[BillingCategory_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientBillingStatus]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientBillingStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Client_ID] [int] NULL,
	[Year_Mon_Id] [int] NOT NULL,
	[BillingStatus] [varchar](50) NOT NULL,
	[WorkflowStatus] [varchar](50) NOT NULL,
	[Inserted_Date] [datetime] NULL,
	[Inserted_By] [varchar](225) NULL,
	[Updated_Date] [datetime] NULL,
	[Updated_By] [varchar](225) NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNQ_ClientBillingStatus] UNIQUE NONCLUSTERED 
(
	[Client_ID] ASC,
	[Year_Mon_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_AccountHierarchy]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_AccountHierarchy](
	[ID] [int] NULL,
	[HierarchyCode] [nvarchar](255) NULL,
	[Line Of Business] [nvarchar](255) NULL,
	[Sub Line of Business] [nvarchar](255) NULL,
	[Process] [nvarchar](255) NULL,
	[Sub Process] [nvarchar](255) NULL,
	[Channel] [nvarchar](255) NULL,
	[Language] [nvarchar](255) NULL,
	[LastUpdateDatetime] [datetime] NULL,
	[DateCreated] [datetime] NULL,
	[Active] [bit] NULL,
	[ProjectCode] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Employee]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Employee](
	[ID] [int] NOT NULL,
	[EmployeeNo] [nvarchar](50) NULL,
	[NamePrefix] [nvarchar](10) NULL,
	[LastName] [nvarchar](100) NULL,
	[FirstName] [nvarchar](100) NULL,
	[MiddleName] [nvarchar](100) NULL,
	[HireDate] [datetime2](7) NULL,
	[Gender] [varchar](10) NULL,
	[NameSuffix] [nvarchar](10) NULL,
	[DisplayName] [nvarchar](250) NULL,
	[Email] [nvarchar](250) NULL,
	[MobilePhone] [nvarchar](50) NULL,
	[CreatedBy] [int] NULL,
	[DateCreated] [datetime2](7) NULL,
	[ModifiedBy] [int] NULL,
	[DateModified] [datetime2](7) NULL,
	[Active] [bit] NULL,
	[ADPFileID] [nvarchar](10) NULL,
	[OriginalHireDate] [datetime2](7) NULL,
	[CandidateID] [nvarchar](50) NULL,
	[TerminationDate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimAccountHierarchy]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimAccountHierarchy](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HierarchyCode] [varchar](255) NULL,
	[Line Of Business] [varchar](255) NULL,
	[Sub Line of Business] [varchar](255) NULL,
	[Process] [varchar](255) NULL,
	[Sub Process] [varchar](255) NULL,
	[Channel] [varchar](255) NULL,
	[Language] [varchar](255) NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNQ_AccountHierarchy] UNIQUE NONCLUSTERED 
(
	[HierarchyCode] ASC,
	[IsActive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fivetran_audit]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fivetran_audit](
	[id] [nvarchar](256) NOT NULL,
	[message] [nvarchar](256) NULL,
	[update_started] [datetimeoffset](7) NULL,
	[update_id] [nvarchar](256) NULL,
	[schema] [nvarchar](256) NULL,
	[table] [nvarchar](256) NULL,
	[start] [datetimeoffset](7) NULL,
	[done] [datetimeoffset](7) NULL,
	[rows_updated_or_inserted] [bigint] NULL,
	[status] [nvarchar](256) NULL,
	[progress] [datetimeoffset](7) NULL,
	[_fivetran_synced] [datetimeoffset](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Holidays]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Holidays](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TheDate] [date] NOT NULL,
	[Holiday_Descr] [varchar](250) NULL,
	[Project_ID] [int] NULL,
	[LOB_ID] [int] NULL,
	[Site_ID] [int] NULL,
	[Inserted_Date] [datetime] NOT NULL,
	[Inserted_By] [varchar](100) NULL,
	[Updated_Date] [datetime] NULL,
	[Updated_By] [varchar](100) NULL,
	[AccountHierarchy_ID] [int] NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNQ_Holidays] UNIQUE NONCLUSTERED 
(
	[TheDate] ASC,
	[Project_ID] ASC,
	[AccountHierarchy_ID] ASC,
	[Site_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonthlyVariables]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonthlyVariables](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Year_Month_Id] [int] NOT NULL,
	[Year_Month] [varchar](25) NOT NULL,
	[Project_ID] [int] NOT NULL,
	[AccountHierarchy_ID] [int] NOT NULL,
	[Site_ID] [int] NOT NULL,
	[Position_ID] [int] NOT NULL,
	[BillingCategory_ID] [int] NOT NULL,
	[Billable_Headcount] [float] NULL,
	[Working_Days] [float] NULL,
	[Inserted_Date] [datetime] NOT NULL,
	[Inserted_By] [varchar](100) NULL,
	[Updated_Date] [datetime] NULL,
	[Updated_By] [varchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[Comments] [varchar](2000) NULL,
 CONSTRAINT [UNQ_MonthlyVariables] UNIQUE NONCLUSTERED 
(
	[Project_ID] ASC,
	[Year_Month_Id] ASC,
	[Year_Month] ASC,
	[AccountHierarchy_ID] ASC,
	[Site_ID] ASC,
	[Position_ID] ASC,
	[BillingCategory_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Other_Adjustments]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Other_Adjustments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Year_Month_ID] [int] NOT NULL,
	[Year_Month] [varchar](25) NOT NULL,
	[Client_ID] [int] NULL,
	[Project_ID] [int] NULL,
	[Site_ID] [int] NULL,
	[EventType] [varchar](250) NOT NULL,
	[Description] [varchar](1000) NULL,
	[Value] [numeric](8, 2) NULL,
	[IsActive] [bit] NOT NULL,
	[Inserted_Date] [datetime] NOT NULL,
	[Inserted_By] [varchar](255) NULL,
	[Updated_Date] [datetime] NULL,
	[Updated_By] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNQ_OtherAdj] UNIQUE NONCLUSTERED 
(
	[Year_Month_ID] ASC,
	[Year_Month] ASC,
	[Client_ID] ASC,
	[Project_ID] ASC,
	[Site_ID] ASC,
	[EventType] ASC,
	[IsActive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Overtime_Adjustments]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Overtime_Adjustments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Year_Month_Id] [int] NOT NULL,
	[Year_Month] [varchar](25) NOT NULL,
	[AccountHierarchy_ID] [int] NULL,
	[Project_ID] [int] NULL,
	[LOB_ID] [int] NULL,
	[Site_ID] [int] NULL,
	[Position_ID] [int] NULL,
	[BillingCategory_ID] [int] NULL,
	[OT_Hours_Timewarp] [numeric](5, 2) NULL,
	[OT_Hours_ClientApproved_Premium] [numeric](5, 2) NULL,
	[Comments] [varchar](250) NULL,
	[Inserted_Date] [datetime] NOT NULL,
	[Inserted_By] [varchar](255) NULL,
	[Updated_Date] [datetime] NULL,
	[Updated_By] [varchar](255) NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNQ_OTAdj] UNIQUE NONCLUSTERED 
(
	[Year_Month] ASC,
	[Project_ID] ASC,
	[AccountHierarchy_ID] ASC,
	[Site_ID] ASC,
	[Position_ID] ASC,
	[BillingCategory_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project_HierarchyCode]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project_HierarchyCode](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Project_ID] [int] NOT NULL,
	[AccountHierarchy_ID] [int] NOT NULL,
	[IsActive] [bit] NULL,
	[Inserted_Date] [datetime] NULL,
	[Inserted_By] [varchar](25) NULL,
	[Updated_Date] [datetime] NULL,
	[Updated_By] [varchar](25) NULL,
	[Comments] [varchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNQ_Project_HierarchyCode] UNIQUE NONCLUSTERED 
(
	[Project_ID] ASC,
	[AccountHierarchy_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project_LOB]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project_LOB](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Project_ID] [int] NOT NULL,
	[LOB_ID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Inserted_Date] [datetime] NULL,
	[Inserted_By] [varchar](25) NULL,
	[Updated_Date] [datetime] NULL,
	[Updated_By] [varchar](25) NULL,
	[Comments] [varchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNQ_Project_LOB] UNIQUE NONCLUSTERED 
(
	[Project_ID] ASC,
	[LOB_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_RPT_BILLING]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_RPT_BILLING](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[EID] [nvarchar](50) NULL,
	[TL] [nvarchar](255) NULL,
	[Site] [nvarchar](100) NULL,
	[Campaign] [nvarchar](255) NULL,
	[LOB] [nvarchar](255) NULL,
	[Date] [date] NULL,
	[PST Date] [date] NULL,
	[Biometric Time In] [datetime] NULL,
	[Biometric Time Out] [datetime] NULL,
	[TeleOpti Schedule start] [datetime] NULL,
	[TeleOpti Schedule End] [datetime] NULL,
	[Time Warp Log In] [datetime] NULL,
	[Time Warp Log Out] [datetime] NULL,
	[TeleOpti Scheduled Overtime] [decimal](10, 2) NULL,
	[Biometric Time Duration] [decimal](10, 2) NULL,
	[Teleopti Time Duration] [decimal](10, 2) NULL,
	[TimeWarp Time Duration] [decimal](10, 2) NULL,
	[Scheduled Time] [decimal](10, 2) NULL,
	[Scheduled Ready Time] [decimal](10, 2) NULL,
	[Scheduled_Work_Time] [decimal](10, 2) NULL,
	[Scheduled_Contract_Time] [decimal](10, 2) NULL,
	[Scheduled_Time_Activity] [decimal](10, 2) NULL,
	[Absence Hour] [decimal](10, 2) NULL,
	[Overtime Hour] [decimal](10, 2) NULL,
	[Client Billable Time] [decimal](10, 2) NULL,
	[Productive Hour] [decimal](10, 2) NULL,
	[Break Duration] [decimal](10, 2) NULL,
	[Lunch Duration] [decimal](10, 2) NULL,
	[Team Meetings Duration] [decimal](10, 2) NULL,
	[Bio Break Duration] [decimal](10, 2) NULL,
	[TaskUs Training Duration] [decimal](10, 2) NULL,
	[Internal System Downtime Duration] [decimal](10, 2) NULL,
	[Coaching & Development Duration] [decimal](10, 2) NULL,
	[Administrative Duration] [decimal](10, 2) NULL,
	[Client Training Duration] [decimal](10, 2) NULL,
	[Campaign Tools Downtime Duration] [decimal](10, 2) NULL,
	[Date Created] [datetime] NULL,
	[Role] [nvarchar](255) NULL,
	[IS_NTLogin] [nvarchar](50) NULL,
	[Client Upskill Training] [decimal](10, 2) NULL,
	[Daily Stand Up] [decimal](10, 2) NULL,
	[Wellness / Counseling] [decimal](10, 2) NULL,
	[Position] [nvarchar](255) NULL,
	[ProjectID] [nvarchar](255) NULL,
	[ProjectName] [nvarchar](255) NULL,
	[TO_daily_stand_up] [decimal](10, 2) NULL,
	[TO_coaching_and_development] [decimal](10, 2) NULL,
	[TO_welness] [decimal](10, 2) NULL,
	[TO_team_meetings] [decimal](10, 2) NULL,
	[TO_client_training] [decimal](10, 2) NULL,
	[authorized_absence] [nvarchar](max) NULL,
	[unauthorized_absence] [nvarchar](max) NULL,
	[rest_day_flag] [nvarchar](255) NULL,
	[Status] [nvarchar](250) NULL,
	[TO_campaign_tools_downtime] [decimal](10, 2) NULL,
	[Timezone] [nvarchar](255) NULL,
	[Unauthorized_Absence_Hrs] [decimal](10, 2) NULL,
	[TL_ID] [nvarchar](50) NULL,
	[OM_ID] [nvarchar](50) NULL,
	[OM_Name] [nvarchar](255) NULL,
	[SOM_ID] [nvarchar](50) NULL,
	[SOM_Name] [nvarchar](255) NULL,
	[OD_ID] [nvarchar](50) NULL,
	[OD_Name] [nvarchar](255) NULL,
	[Lactation Time] [decimal](10, 2) NULL,
	[Clinic Time] [decimal](10, 2) NULL,
	[Full/PartTime] [nvarchar](255) NULL,
	[Authorized_Absence_Hrs] [decimal](10, 2) NULL,
	[JobManagementLevel] [nvarchar](300) NULL,
	[JobManagementLevelName] [nvarchar](300) NULL,
	[billable_aux_min] [int] NULL,
	[nonbillable_aux_min] [int] NULL,
	[WorkerType] [nvarchar](250) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TubaAppUserClientMapping]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TubaAppUserClientMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeNo] [nvarchar](max) NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [nvarchar](max) NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[ClientId] [int] NULL,
 CONSTRAINT [PK_TubaAppUserClientMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TubaAppUserRole]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TubaAppUserRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [nvarchar](max) NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_TubaAppUserRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TubaAppUserRoleMapping]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TubaAppUserRoleMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TargetProperty] [nvarchar](max) NULL,
	[TargetValue] [nvarchar](max) NULL,
	[RoleId] [int] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [nvarchar](max) NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_TubaAppUserRoleMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TubaOtpSession]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TubaOtpSession](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SessionId] [nvarchar](max) NULL,
	[EmployeeId] [int] NOT NULL,
	[IssuedAt] [datetime2](7) NOT NULL,
	[ExpiresAt] [datetime2](7) NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [nvarchar](max) NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_TubaOtpSession] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[AuxBillability] ADD  DEFAULT (getdate()) FOR [Inserted_Date]
GO
ALTER TABLE [dbo].[AuxBillability] ADD  CONSTRAINT [DF_AuxBillability_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[BillingMaster] ADD  DEFAULT ((0)) FOR [Round_Per_Minutes]
GO
ALTER TABLE [dbo].[BillingMaster] ADD  DEFAULT ((0)) FOR [Grace_Period_Minutes]
GO
ALTER TABLE [dbo].[BillingMaster] ADD  DEFAULT ((0)) FOR [Spillover_Mins]
GO
ALTER TABLE [dbo].[BillingMaster] ADD  DEFAULT (getdate()) FOR [Inserted_Date]
GO
ALTER TABLE [dbo].[BillingMaster] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[DimAccountHierarchy] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[DimBillingCategory] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[DimBillingCategory] ADD  DEFAULT (getdate()) FOR [Inserted_Date]
GO
ALTER TABLE [dbo].[DimClient] ADD  DEFAULT (NULL) FOR [End_Date]
GO
ALTER TABLE [dbo].[DimClient] ADD  CONSTRAINT [DF_DimClient_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[DimClient] ADD  DEFAULT (NULL) FOR [Updated_Date]
GO
ALTER TABLE [dbo].[DimClient] ADD  DEFAULT (NULL) FOR [Updated_By]
GO
ALTER TABLE [dbo].[DimEmployee] ADD  DEFAULT (getdate()) FOR [Inserted_Date]
GO
ALTER TABLE [dbo].[DimEmployee] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[DimLOB] ADD  DEFAULT (getdate()) FOR [Inserted_Date]
GO
ALTER TABLE [dbo].[DimLOB] ADD  CONSTRAINT [DF_DimLOB_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[DimPosition] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[DimPosition] ADD  DEFAULT (getdate()) FOR [Inserted_Date]
GO
ALTER TABLE [dbo].[DimProject] ADD  DEFAULT ('') FOR [Display_Name]
GO
ALTER TABLE [dbo].[DimProject] ADD  DEFAULT (getdate()) FOR [Inserted_Date]
GO
ALTER TABLE [dbo].[DimProject] ADD  CONSTRAINT [DF_DimProject_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[DimSite] ADD  DEFAULT (getdate()) FOR [Inserted_Date]
GO
ALTER TABLE [dbo].[DimSite] ADD  CONSTRAINT [DF_DimSite_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Employee_Adjustments] ADD  DEFAULT (getdate()) FOR [Inserted_Date]
GO
ALTER TABLE [dbo].[Holidays] ADD  DEFAULT (getdate()) FOR [Inserted_Date]
GO
ALTER TABLE [dbo].[Holidays] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsActive]
GO
ALTER TABLE [dbo].[MonthlyVariables] ADD  DEFAULT (getdate()) FOR [Inserted_Date]
GO
ALTER TABLE [dbo].[MonthlyVariables] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Other_Adjustments] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Other_Adjustments] ADD  DEFAULT (getdate()) FOR [Inserted_Date]
GO
ALTER TABLE [dbo].[Overtime_Adjustments] ADD  DEFAULT (getdate()) FOR [Inserted_Date]
GO
ALTER TABLE [dbo].[Overtime_Adjustments] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Project_HierarchyCode] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Project_HierarchyCode] ADD  DEFAULT (getdate()) FOR [Inserted_Date]
GO
ALTER TABLE [dbo].[Project_LOB] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Project_LOB] ADD  DEFAULT (getdate()) FOR [Inserted_Date]
GO
ALTER TABLE [dbo].[RPT_BILLING] ADD  DEFAULT (getdate()) FOR [Date Created]
GO
ALTER TABLE [dbo].[STG_RPT_BILLING] ADD  DEFAULT (getdate()) FOR [Date Created]
GO
ALTER TABLE [dbo].[TubaAppUserRole] ADD  DEFAULT (getutcdate()) FOR [InsertedDate]
GO
ALTER TABLE [dbo].[TubaAppUserRole] ADD  DEFAULT (N'-1') FOR [InsertedBy]
GO
ALTER TABLE [dbo].[TubaAppUserRole] ADD  DEFAULT (getutcdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[TubaAppUserRole] ADD  DEFAULT (N'-1') FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[TubaAppUserRole] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[TubaAppUserRoleMapping] ADD  DEFAULT (getutcdate()) FOR [InsertedDate]
GO
ALTER TABLE [dbo].[TubaAppUserRoleMapping] ADD  DEFAULT (N'-1') FOR [InsertedBy]
GO
ALTER TABLE [dbo].[TubaAppUserRoleMapping] ADD  DEFAULT (getutcdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[TubaAppUserRoleMapping] ADD  DEFAULT (N'-1') FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[TubaAppUserRoleMapping] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[TubaOtpSession] ADD  DEFAULT (getutcdate()) FOR [InsertedDate]
GO
ALTER TABLE [dbo].[TubaOtpSession] ADD  DEFAULT (N'-1') FOR [InsertedBy]
GO
ALTER TABLE [dbo].[TubaOtpSession] ADD  DEFAULT (getutcdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[TubaOtpSession] ADD  DEFAULT (N'-1') FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[TubaOtpSession] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[AuxBillability]  WITH CHECK ADD FOREIGN KEY([Project_ID])
REFERENCES [dbo].[DimProject] ([ID])
GO
ALTER TABLE [dbo].[BillingMaster]  WITH CHECK ADD FOREIGN KEY([AccountHierarchy_ID])
REFERENCES [dbo].[DimAccountHierarchy] ([ID])
GO
ALTER TABLE [dbo].[BillingMaster]  WITH CHECK ADD FOREIGN KEY([BillingCategory_ID])
REFERENCES [dbo].[DimBillingCategory] ([ID])
GO
ALTER TABLE [dbo].[BillingMaster]  WITH CHECK ADD FOREIGN KEY([Position_ID])
REFERENCES [dbo].[DimPosition] ([ID])
GO
ALTER TABLE [dbo].[BillingMaster]  WITH CHECK ADD FOREIGN KEY([Project_ID])
REFERENCES [dbo].[DimProject] ([ID])
GO
ALTER TABLE [dbo].[BillingMaster]  WITH CHECK ADD FOREIGN KEY([Site_ID])
REFERENCES [dbo].[DimSite] ([ID])
GO
ALTER TABLE [dbo].[BillingRevenue_Detail]  WITH CHECK ADD FOREIGN KEY([AccountHierarchy_ID])
REFERENCES [dbo].[DimAccountHierarchy] ([ID])
GO
ALTER TABLE [dbo].[BillingRevenue_Detail]  WITH CHECK ADD FOREIGN KEY([Employee_ID])
REFERENCES [dbo].[DimEmployee] ([ID])
GO
ALTER TABLE [dbo].[BillingRevenue_Detail]  WITH CHECK ADD FOREIGN KEY([Final_BillingCategory_ID])
REFERENCES [dbo].[DimBillingCategory] ([ID])
GO
ALTER TABLE [dbo].[BillingRevenue_Detail]  WITH CHECK ADD FOREIGN KEY([Initial_BillingCategory_ID])
REFERENCES [dbo].[DimBillingCategory] ([ID])
GO
ALTER TABLE [dbo].[BillingRevenue_Detail]  WITH CHECK ADD FOREIGN KEY([LOB_ID])
REFERENCES [dbo].[DimLOB] ([ID])
GO
ALTER TABLE [dbo].[BillingRevenue_Detail]  WITH CHECK ADD FOREIGN KEY([Position_ID])
REFERENCES [dbo].[DimPosition] ([ID])
GO
ALTER TABLE [dbo].[BillingRevenue_Detail]  WITH CHECK ADD FOREIGN KEY([Project_ID])
REFERENCES [dbo].[DimProject] ([ID])
GO
ALTER TABLE [dbo].[BillingRevenue_Detail]  WITH CHECK ADD FOREIGN KEY([Site_ID])
REFERENCES [dbo].[DimSite] ([ID])
GO
ALTER TABLE [dbo].[BillingRevenue_Summary]  WITH CHECK ADD FOREIGN KEY([BillingCategory_ID])
REFERENCES [dbo].[DimBillingCategory] ([ID])
GO
ALTER TABLE [dbo].[BillingRevenue_Summary]  WITH CHECK ADD FOREIGN KEY([LOB_ID])
REFERENCES [dbo].[DimLOB] ([ID])
GO
ALTER TABLE [dbo].[BillingRevenue_Summary]  WITH CHECK ADD FOREIGN KEY([Position_ID])
REFERENCES [dbo].[DimPosition] ([ID])
GO
ALTER TABLE [dbo].[BillingRevenue_Summary]  WITH CHECK ADD FOREIGN KEY([Project_ID])
REFERENCES [dbo].[DimProject] ([ID])
GO
ALTER TABLE [dbo].[BillingRevenue_Summary]  WITH CHECK ADD FOREIGN KEY([Site_ID])
REFERENCES [dbo].[DimSite] ([ID])
GO
ALTER TABLE [dbo].[ClientBillingStatus]  WITH CHECK ADD FOREIGN KEY([Client_ID])
REFERENCES [dbo].[DimClient] ([ID])
GO
ALTER TABLE [dbo].[DimProject]  WITH CHECK ADD FOREIGN KEY([Client_ID])
REFERENCES [dbo].[DimClient] ([ID])
GO
ALTER TABLE [dbo].[Employee_Adjustments]  WITH CHECK ADD FOREIGN KEY([AccountHierarchy_ID])
REFERENCES [dbo].[DimAccountHierarchy] ([ID])
GO
ALTER TABLE [dbo].[Employee_Adjustments]  WITH CHECK ADD FOREIGN KEY([BillingCategory_ID])
REFERENCES [dbo].[DimBillingCategory] ([ID])
GO
ALTER TABLE [dbo].[Employee_Adjustments]  WITH CHECK ADD FOREIGN KEY([LOB_ID])
REFERENCES [dbo].[DimLOB] ([ID])
GO
ALTER TABLE [dbo].[Employee_Adjustments]  WITH CHECK ADD FOREIGN KEY([Position_ID])
REFERENCES [dbo].[DimPosition] ([ID])
GO
ALTER TABLE [dbo].[Employee_Adjustments]  WITH CHECK ADD FOREIGN KEY([Project_ID])
REFERENCES [dbo].[DimProject] ([ID])
GO
ALTER TABLE [dbo].[Holidays]  WITH CHECK ADD FOREIGN KEY([AccountHierarchy_ID])
REFERENCES [dbo].[DimAccountHierarchy] ([ID])
GO
ALTER TABLE [dbo].[Holidays]  WITH CHECK ADD FOREIGN KEY([LOB_ID])
REFERENCES [dbo].[DimLOB] ([ID])
GO
ALTER TABLE [dbo].[Holidays]  WITH CHECK ADD FOREIGN KEY([Project_ID])
REFERENCES [dbo].[DimProject] ([ID])
GO
ALTER TABLE [dbo].[Holidays]  WITH CHECK ADD FOREIGN KEY([Site_ID])
REFERENCES [dbo].[DimSite] ([ID])
GO
ALTER TABLE [dbo].[MonthlyVariables]  WITH CHECK ADD FOREIGN KEY([AccountHierarchy_ID])
REFERENCES [dbo].[DimAccountHierarchy] ([ID])
GO
ALTER TABLE [dbo].[MonthlyVariables]  WITH CHECK ADD FOREIGN KEY([BillingCategory_ID])
REFERENCES [dbo].[DimBillingCategory] ([ID])
GO
ALTER TABLE [dbo].[MonthlyVariables]  WITH CHECK ADD FOREIGN KEY([Position_ID])
REFERENCES [dbo].[DimPosition] ([ID])
GO
ALTER TABLE [dbo].[MonthlyVariables]  WITH CHECK ADD FOREIGN KEY([Project_ID])
REFERENCES [dbo].[DimProject] ([ID])
GO
ALTER TABLE [dbo].[MonthlyVariables]  WITH CHECK ADD FOREIGN KEY([Site_ID])
REFERENCES [dbo].[DimSite] ([ID])
GO
ALTER TABLE [dbo].[Other_Adjustments]  WITH CHECK ADD FOREIGN KEY([Client_ID])
REFERENCES [dbo].[DimClient] ([ID])
GO
ALTER TABLE [dbo].[Other_Adjustments]  WITH CHECK ADD FOREIGN KEY([Project_ID])
REFERENCES [dbo].[DimProject] ([ID])
GO
ALTER TABLE [dbo].[Other_Adjustments]  WITH CHECK ADD FOREIGN KEY([Site_ID])
REFERENCES [dbo].[DimSite] ([ID])
GO
ALTER TABLE [dbo].[Overtime_Adjustments]  WITH CHECK ADD FOREIGN KEY([AccountHierarchy_ID])
REFERENCES [dbo].[DimAccountHierarchy] ([ID])
GO
ALTER TABLE [dbo].[Overtime_Adjustments]  WITH CHECK ADD FOREIGN KEY([BillingCategory_ID])
REFERENCES [dbo].[DimBillingCategory] ([ID])
GO
ALTER TABLE [dbo].[Overtime_Adjustments]  WITH CHECK ADD FOREIGN KEY([LOB_ID])
REFERENCES [dbo].[DimLOB] ([ID])
GO
ALTER TABLE [dbo].[Overtime_Adjustments]  WITH CHECK ADD FOREIGN KEY([Position_ID])
REFERENCES [dbo].[DimPosition] ([ID])
GO
ALTER TABLE [dbo].[Overtime_Adjustments]  WITH CHECK ADD FOREIGN KEY([Project_ID])
REFERENCES [dbo].[DimProject] ([ID])
GO
ALTER TABLE [dbo].[Overtime_Adjustments]  WITH CHECK ADD FOREIGN KEY([Site_ID])
REFERENCES [dbo].[DimSite] ([ID])
GO
ALTER TABLE [dbo].[Project_HierarchyCode]  WITH CHECK ADD FOREIGN KEY([AccountHierarchy_ID])
REFERENCES [dbo].[DimAccountHierarchy] ([ID])
GO
ALTER TABLE [dbo].[Project_HierarchyCode]  WITH CHECK ADD FOREIGN KEY([Project_ID])
REFERENCES [dbo].[DimProject] ([ID])
GO
ALTER TABLE [dbo].[Project_LOB]  WITH CHECK ADD FOREIGN KEY([LOB_ID])
REFERENCES [dbo].[DimLOB] ([ID])
GO
ALTER TABLE [dbo].[Project_LOB]  WITH CHECK ADD FOREIGN KEY([Project_ID])
REFERENCES [dbo].[DimProject] ([ID])
GO
ALTER TABLE [dbo].[TubaAppUserClientMapping]  WITH CHECK ADD  CONSTRAINT [FK_TubaAppUserClientMapping_DimClient_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[DimClient] ([ID])
GO
ALTER TABLE [dbo].[TubaAppUserClientMapping] CHECK CONSTRAINT [FK_TubaAppUserClientMapping_DimClient_ClientId]
GO
ALTER TABLE [dbo].[TubaAppUserRoleMapping]  WITH CHECK ADD  CONSTRAINT [FK_TubaAppUserRoleMapping_TubaAppUserRole_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[TubaAppUserRole] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TubaAppUserRoleMapping] CHECK CONSTRAINT [FK_TubaAppUserRoleMapping_TubaAppUserRole_RoleId]
GO
/****** Object:  StoredProcedure [dbo].[sp_ComputeBillingRevenue_Detail]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC dbo.sp_ComputeBillingRevenue_Detail '2022-09-01', '2022-09-30'
--CREATE PROC [dbo].[sp_ComputeBillingRevenue_Detail]
--@StDate DATE = NULL, @EdDate DATE = NULL, @Client VARCHAR(225) = NULL
--AS
--BEGIN
--	SET NOCOUNT ON

--	DECLARE @StartDate DATE, @EndDate DATE

--	IF @StDate IS NULL AND @EdDate IS NULL
--		SELECT @StartDate = DATEADD(DAY, 1, EOMONTH(GETDATE(), -2)), @EndDate = EOMONTH(GETDATE(), -1)
--	ELSE
--		SELECT @StartDate = @StDate, @EndDate = @EdDate

--	/*
--	When using the input Params of the proc directly in the queries was causing the proc to run terribly slow.
--	The solution is to copy the parameters to local variables in the procedure, which I think makes SQL re-evaluate the execution plan for the query anytime it's run, 
--	so it picks the best execution plan for the parameters given instead of using an inappropriate cached plan for the query (Parameter Sniffing).
--	*/

--	SELECT
--		vtel.[date], vtel.pst_date, LEFT(TRIM(vtel.project_id), 11) projid, vtel.eid, EAdj.Position, -- The Ops users might change Position value thru PowerApps screen. Hence that would be the latest value. 
--		vtel.[role], vtel.full_part_time, 
--		vtel.tl, vtel.tl_id, 
--		ISNULL(TRIM(EAdj.lob), '') lob, 
--		--ISNULL(NULLIF(TRIM(EAdj.lob), ''), 'Universal') lob, 
--		COALESCE(SM.Site_OldName, vtel.[site]) [Site], vtel.biometric_time_in, vtel.biometrics_time_out, vtel.biometric_time_duration, 
--		vtel.break_duration, vtel.absence_hour, vtel.overtime_hour, vtel.productive_hour, vtel.lunch_duration, vtel.team_meetings_duration, 
--		vtel.taskus_training_duration, vtel.internal_system_downtime_duration, vtel.coaching_and_development_duration, vtel.administrative_duration, 
--		vtel.client_training_duration, vtel.client_upskill_training, vtel.to_client_training, vtel.to_daily_stand_up, vtel.to_wellness, 
--		vtel.to_team_meetings, vtel.daily_stand_up, vtel.wellness_counseling, vtel.campaign_tools_downtime_duration, vtel.clinic_time, 
--		vtel.lactation_time, vtel.teleopti_schedule_start, vtel.teleopti_schedule_end, vtel.teleopti_scheduled_overtime, vtel.timewarp_login, 
--		vtel.timewarp_logout, vtel.timewarp_time_duration, vtel.nonbillable_aux_min, vtel.timezone, vtel.rest_day_flag, CAST(0 AS BIT) is_holiday,

--		Rates.grace_period_minutes, NULLIF(CAST(Rates.round_per_minutes AS FLOAT), 0) round_per_minutes,--The NULLIF is to avoid DIVIDE BY ZERO error when it is used below
--		CAST(overtime_price_hr AS NUMERIC(5, 2)) overtime_price_hr, CAST(holiday_price_hr AS NUMERIC(5, 2)) holiday_price_hr, regular_price_hr,
--		Rates.lower_max [max_hours], ISNULL(Rates.spillover_mins, 0)/60.0 [spillover_hours],

--		ISNULL(EAdj.Billable_Category, 'NonBillable') Billable_Category, CAST(NULL AS VARCHAR(500)) AS remarks,
		
--		--Additional fields
--		CAST(NULL AS NUMERIC(5, 2)) ot_hours, CAST(NULL AS INT) late_login, CAST(NULL AS INT) early_logout, CAST(NULL AS DATETIME) adjusted_tw_start_time, 
--		CAST(NULL AS DATETIME) adjusted_tw_end_time, CAST(NULL AS NUMERIC(5, 2)) adjusted_log_hours, CAST(NULL AS NUMERIC(5, 2)) loggedhrs_less_nonbill, 
--		CAST(NULL AS NUMERIC(5, 2)) loggedhrs_less_nonbill_less_ot, CAST(NULL AS NUMERIC(5, 2)) loggedhrs_less_nonbill_less_ot_capped, 
--		CAST(NULL AS NUMERIC(5, 2)) holiday_hours, CAST(NULL AS NUMERIC(5, 2)) regular_hours, 
--		CAST(NULL AS NUMERIC(5, 2)) total_billing_hours, CAST(NULL AS NUMERIC(6, 2)) total_billing_amount
--	INTO #BaseData 
--	FROM v_utl_teleopti_billing_last_3_months vtel
--	--JOIN DimProject P ON LEFT(TRIM(vtel.project_id), 11) = P.Project_Id AND P.IsActive = 1
--	JOIN DimProject P ON LEFT(TRIM(vtel.project_id), 11) = P.Project_Id AND P.Client = ISNULL(@Client, P.Client) AND P.IsActive = 1 
--	JOIN dbo.Employee_Adjustments EAdj ON vtel.eid = EAdj.EID AND vtel.[Date] = EAdj.[Date]
--	LEFT JOIN dbo.DimSite SM ON SM.Site_NewName = vtel.[site] AND vtel.[Date] BETWEEN SM.[Start_Date] AND SM.End_Date 
--	--This above JOIN is added because some records (not all) come with the new naming for sites. And our look up tables use the Old names for Sites.
--	LEFT JOIN dbo.ClientBillingRules Rates ON 
--		Rates.projid = LEFT(TRIM(vtel.project_id), 11)
--		AND vtel.[Date] BETWEEN Rates.[start_date] AND Rates.[end_date]
--		AND COALESCE(SM.Site_OldName, vtel.[site]) = Rates.[Site] AND EAdj.[position] = Rates.[position]
--		--AND ISNULL(NULLIF(TRIM(EAdj.lob), ''), 'Universal') = Rates.LOB
--		AND ISNULL(TRIM(EAdj.lob), '') = Rates.LOB
--		AND Rates.billability_category = EAdj.Billable_Category
--	WHERE vtel.[Date] BETWEEN @StartDate AND @EndDate

--	--Update holiday flag
--	UPDATE A SET is_holiday = 1 FROM #BaseData A JOIN dbo.Holidays B 
--	ON A.projid = B.project_id AND A.[Date] = B.TheDate AND TRIM(A.lob) = ISNULL(TRIM(B.lob), '') AND A.[site] = B.[site]

--	UPDATE #BaseData 
--	SET 
--	ot_hours = CASE WHEN overtime_hour < teleopti_scheduled_overtime THEN ISNULL(overtime_hour, 0) ELSE ISNULL(teleopti_scheduled_overtime, 0) END,
--	late_login = CASE WHEN DATEDIFF(N, teleopti_schedule_start, timewarp_login) > 0 THEN DATEDIFF(N, teleopti_schedule_start, timewarp_login) END,	-- Employee logged in later than the scheduled in time
--	early_logout = CASE WHEN DATEDIFF(N, timewarp_logout, teleopti_schedule_end) > 0 THEN DATEDIFF(N, timewarp_logout, teleopti_schedule_end) END	-- Employee logged out before the scheduled out time

--	--Calculate Adjusted Start Time (from TimeWarp Login)
--	UPDATE #BaseData 
--	SET adjusted_tw_start_time = 
--	CASE 
--		WHEN late_login > 0 THEN	-- Employee logged in late
--			CASE 
--				WHEN late_login <= grace_period_minutes THEN 
--					DATEADD(N, FLOOR(DATEDIFF(N, 0, timewarp_login) / round_per_minutes)*round_per_minutes, 0)
--				ELSE DATEADD(N, CEILING(DATEDIFF(N, 0, timewarp_login) / round_per_minutes)*round_per_minutes, 0)
--			END
--		/*
--		ELSE	-- Employee logged in early
--			DATEADD(N, ROUND(DATEDIFF(N, 0, timewarp_login) / round_per_minutes, 0)*round_per_minutes, 0)
--		*/
--		ELSE timewarp_login	--Grace time is to be checked for late comers only. For early birds & on-time employees, the concept of 'Grace Time' does not apply.
--	END

--	/*
--	--Calculate Adjusted End Time (from TimeWarp Logout)
--	UPDATE #BaseData	-- This is to be changed
--	SET adjusted_tw_end_time = 
--	CASE WHEN early_logout > 0 THEN
--		DATEADD(N, FLOOR(DATEDIFF(N, 0, timewarp_logout) / round_per_minutes)*round_per_minutes, 0)
--	ELSE
--		CASE 
--			WHEN DATEDIFF(N, teleopti_schedule_end, timewarp_logout) <= round_per_minutes THEN	-- Ex. TeleOpti is 16:30:00 & TW is 16:42:00; and round_mins is 12
--				DATEADD(N, FLOOR(DATEDIFF(N, 0, timewarp_logout) / round_per_minutes)*round_per_minutes, 0)
--			ELSE	-- Ex. TeleOpti is 16:30:00 & TW is 16:13:00; and round_mins is 12
--				DATEADD(N, CEILING(DATEDIFF(N, 0, timewarp_logout) / round_per_minutes)*round_per_minutes, 0)
--		END
--	END

--	-- Adjusted log hours
--	UPDATE #BaseData SET adjusted_log_hours = ISNULL(DATEDIFF(N, adjusted_tw_start_time, adjusted_tw_end_time)/60.0, 0)
--	*/

--	--Adjusted log hours
--	UPDATE #BaseData SET adjusted_log_hours = ISNULL(DATEDIFF(N, adjusted_tw_start_time, timewarp_logout)/60.0, 0)

--	/*
--	If Adjusted hours is NULL^^, TimeWarpDuration is considered.
--	^^ This can happen because the calculation uses grace_period_minutes, round_per_minutes, etc. which have to come from 
--	ClientBillingRules table. If there is no match those values will be NULL and hence the final Adjusted Hours also be NULL
--	*/
--	UPDATE #BaseData SET adjusted_log_hours = timewarp_time_duration WHERE ISNULL(adjusted_log_hours, 0) = 0 AND ISNULL(timewarp_time_duration, 0) <> 0

--	-- Hours to be logeed hours less non-billable, logged hours less non-billable and less OT
--	UPDATE #BaseData SET 
--	loggedhrs_less_nonbill = 
--	CASE 
--		WHEN adjusted_log_hours > ISNULL(nonbillable_aux_min/60.0, 0) THEN (adjusted_log_hours - ISNULL(nonbillable_aux_min/60.0, 0)) 
--		ELSE 0 
--	END, 
--	loggedhrs_less_nonbill_less_ot = 
--	CASE 
--		WHEN adjusted_log_hours > (ISNULL(nonbillable_aux_min/60.0, 0) + ot_hours) THEN (adjusted_log_hours - ISNULL(nonbillable_aux_min/60.0, 0) - ot_hours) 
--		ELSE 0 
--	END

--	-- Applying the max hours (from the Client Billing Rules) cap
--	UPDATE #BaseData SET 
--	loggedhrs_less_nonbill_less_ot_capped = 
--	CASE
--		WHEN loggedhrs_less_nonbill_less_ot > (max_hours + spillover_hours) THEN (max_hours + spillover_hours)
--		ELSE loggedhrs_less_nonbill_less_ot
--	END

--	-- Holiday hours
--	UPDATE #BaseData SET holiday_hours = CASE WHEN is_holiday = 1 THEN loggedhrs_less_nonbill_less_ot_capped ELSE 0 END
--	-- Regular hours
--	UPDATE #BaseData SET regular_hours = CASE WHEN is_holiday = 0 THEN loggedhrs_less_nonbill_less_ot_capped ELSE 0 END
--	/*
--	If employee worked on his/her Rest Day, the entire [TW Duration less NonBillable Time] is taken as Overtime. Max Hours cap from Client Rules is still applied.
--	However, if a day is a Holiday and yet the day is tagged as a Rest Day as well, the hours worked that day are taken as Holiday Hours. 
--	In other words, the Holiday flag is given preference over the Rest Day flag. Hence we check is_holiday = 0 in addition to checking the rest day flag.
--	*/
--	UPDATE #BaseData SET ot_hours =  
--	CASE
--		WHEN loggedhrs_less_nonbill > (max_hours + spillover_hours) THEN (max_hours + spillover_hours)
--		ELSE loggedhrs_less_nonbill
--	END,
--	regular_hours = 0, holiday_hours = 0
--	WHERE (rest_day_flag = 'Rest Day' AND is_holiday = 0)

--	-- Total Billing Hours
--	UPDATE #BaseData SET total_billing_hours = regular_hours + ot_hours + holiday_hours
--	UPDATE #BaseData SET total_billing_amount = (regular_hours*regular_price_hr) + (ot_hours*overtime_price_hr)	+ (holiday_hours*holiday_price_hr)

--	-- Client should not be billed if any of the below conditions are true (even if there is logged hours > 0)
--	UPDATE #BaseData SET total_billing_hours = 0, total_billing_amount = 0, remarks = 'Missing Timewarp Punch' WHERE (timewarp_login IS NULL OR timewarp_logout IS NULL)
--	UPDATE #BaseData SET total_billing_hours = 0, total_billing_amount = 0, remarks = 'NonBillable Position or Ops-set NonBillable' WHERE Billable_Category = 'NonBillable'

--	-- Use the Alias name for LOB. Ex.- GoodRx has an LOB "4*11" created for Operational purposes but those transactions should be billed/clubbed along with its original LOB "English"
--	UPDATE BD SET BD.LOB = CBR.LOB_Alias
--	FROM #BaseData BD JOIN ClientBillingRules CBR ON BD.LOB = CBR.LOB 
--	WHERE CBR.LOB_Alias IS NOT NULL AND CBR.LOB <> CBR.LOB_Alias

--	--DELETE FROM dbo.BillingRevenue_Detail WHERE [Date] BETWEEN @StartDate AND @EndDate
--	DELETE BRD FROM dbo.BillingRevenue_Detail BRD
--	JOIN DimProject DP ON DP.Project_Id = BRD.Project_Id AND DP.Client = ISNULL(@Client, DP.Client)
--	WHERE BRD.[Date] BETWEEN @StartDate AND @EndDate

--	INSERT INTO dbo.BillingRevenue_Detail
--	SELECT 
--		[Date], eid [Employee_ID], projid [Project_Id], LOB, [Site], 
--		pst_date AS [PST_Date], 
--		position AS [Position], 
--		CASE 
--			WHEN [Position] IN ('Teammate', 'Teammate (Subject Matter Expert)') THEN 'Billable-Production'
--			WHEN [Position] IN ('Learning Experience Leader', 'Quality Analyst', 'Team Leader') THEN 'Billable-Support'
--		END AS [Initial_Billable_Status],
--		Billable_Category AS [Final_Billable_Status], --This is from the Employee_Adjustment, which could have been updated by the Ops team.
--		role AS [Role], 
--		full_part_time AS [Full_Part_Time], 
--		tl AS [Team_Leader], 
--		tl_id AS [Team_Leader_Employee_ID], 
--		CAST(NULL AS VARCHAR(100)) AS [Delivery_Country], 
--		timezone AS [Time_Zone], 
--		biometric_time_in AS [Biometric_Time_In], 
--		biometrics_time_out AS [Biometric_Time_Out], 
--		biometric_time_duration AS [Biometric_Time_Duration], 
--		break_duration AS [Break_Duration], 
--		absence_hour AS [Absence_Hours], 
--		overtime_hour AS [Overtime_Hours], 
--		productive_hour AS [Productive_Hours], 
--		lunch_duration AS [Lunch_Duration], 
--		team_meetings_duration AS [Team_Meeting_Duration], 
--		taskus_training_duration AS [TaskUs_Training_Duration], 
--		internal_system_downtime_duration AS [Internal_System_Downtime_Duration], 
--		coaching_and_development_duration AS [Coaching_and_Development_Duration], 
--		administrative_duration AS [Administrative_Duration], 
--		client_training_duration AS [Client_Training_Duration], 
--		client_upskill_training AS [Client_Upskill_Training_Duration], 
--		to_client_training AS [To_Client_Training], 
--		to_daily_stand_up AS [To_Daily_StandUp], 
--		to_wellness AS [To_Wellness], 
--		to_team_meetings AS [To_Team_Meetings], 
--		daily_stand_up AS [Daily_Standup_Duration], 
--		wellness_counseling AS [Wellness_Counseling], 
--		campaign_tools_downtime_duration AS [Campaign_Tools_Downtime_Duration], 
--		clinic_time AS [Clinic_Time_Duration], 
--		lactation_time AS [Lactation_Time_Duration], 
--		teleopti_schedule_start AS [Teleopti_Schedule_Start_Time], 
--		teleopti_schedule_end AS [Teleopti_Schedule_End], 
--		teleopti_scheduled_overtime AS [Teleopti_Scheduled_Overtime], 
--		timewarp_login AS [Timewarp_Login], 
--		timewarp_logout AS [Timewarp_Logout], 
--		timewarp_time_duration AS [Timewarp_Time_Duration], 
--		adjusted_log_hours AS [Adjusted_Timewarp_Time_Duration],
--		[max_hours] AS [Max_Hours], 
--		nonbillable_aux_min/60.0 AS [Non_Billable_Hours], 
--		ot_hours AS [OT_Hours], 
--		regular_hours AS [Regular_Hours], 
--		holiday_hours AS [Holiday_Billable_Hours], 
--		regular_price_hr AS [Regular_Price_Hour], 
--		regular_hours*regular_price_hr AS [Regular_Billing_Amount], 
--		rest_day_flag AS [Rest_Day_Flag], 
--		is_holiday [Holiday_Flag],
--		loggedhrs_less_nonbill AS [Total_Time_Less_NonBillable_Time],	--This is just another data point
--		total_billing_hours AS [Total_Billing_Hours],
--		total_billing_amount AS [Total_Billing_Amount],
--		remarks AS [Remarks]
--	--INTO dbo.BillingRevenue_Detail
--	FROM #BaseData

--	DROP TABLE #BaseData
--END
--GO
/****** Object:  StoredProcedure [dbo].[sp_ComputeBillingRevenue_Invoicing]    Script Date: 5/30/2023 4:47:17 PM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
----EXEC sp_ComputeBillingRevenue_Invoicing '2022-08-01'
--CREATE PROC [dbo].[sp_ComputeBillingRevenue_Invoicing] @StartDate DATE = NULL, @Client VARCHAR(225) = NULL
--AS
--BEGIN
--	SET NOCOUNT ON

--	DECLARE @StDate DATE

--	IF @StartDate IS NULL  
--		SET @StDate = DATEADD(DAY, 1, EOMONTH(GETDATE(), -2))
--	ELSE
--		SET @StDate = @StartDate

--	/*
--	When using the input Params of the proc directly in the queries was causing the proc to run terribly slow.
--	The solution is to copy the parameters to local variables in the procedure, which I think makes SQL re-evaluate the execution plan for the query anytime it's run, 
--	so it picks the best execution plan for the parameters given instead of using an inappropriate cached plan for the query (Parameter Sniffing).
--	*/

--	DELETE BRI FROM BillingRevenue_Invoicing BRI
--	JOIN DimProject DP ON DP.Project_Id = LEFT(TRIM(BRI.project_number), 11) AND DP.IsActive = 1 AND DP.Client = ISNULL(@Client, DP.Client)
--	WHERE BRI.Year_Mon_Id = FORMAT(@StDate, 'yyyyMM')

--	INSERT INTO BillingRevenue_Invoicing
--	SELECT 
--		FORMAT(CAL.[Date], 'yyyyMM') Year_Mon_Id,
--		FORMAT(CAL.[Date], 'yyyy-MMM') [Month],
--		FORMAT(GETDATE(),'yyyyMMddhhmmss') [Source_Name],
--		P2C.organization organization_name,
--		'TaskUS External Contract Type' contract_type,
--		P2C.contract_number contract_number,
--		P2C.contract_line_number contract_line_number,
--		EVT.[description] event_type,
--		CONCAT(EVT.event_type, ' ', EVT.[description], ' - ', UPPER(LEFT(CAL.[MonthName], 3))) event_description,
--		GETDATE() event_completion_date,
--		'USD' currency,
--		SUM([Total Billing Amount]) billing_amount,
--		P2C.project_number project_number,
--		--NULL task_number,
--		PTSK.task_number task_number,
--		NULL bill_hold_flag,
--		NULL revenue_hold_flag,
--		NULL attribute_category,
--		'Yes' attribute1,
--		SUM(BS.[Total Billing Hours]) attribute2,
--		BS.[Regular Billing Rate] attribute3,
--		NULL attribute4, --BS.po_number
--		FORMAT(CAL.[Date], 'MMM yyyy') attribute5,
--		NULL attribute6,
--		NULL attribute7,
--		NULL attribute8,
--		NULL attribute9,
--		NULL attribute10,
--		ISNULL(P2C.bu_name, 'TUUS') bu_name,
--		'U' [status]
--	FROM 
--	dbo.vw_BillingSummary BS 
--	JOIN dbo.billing_revenue_project_to_contract_details P2C ON BS.[Project ID] = LEFT(TRIM(P2C.project_number), 11)
	
--	JOIN DimProject DP ON DP.Project_Id = BS.[Project ID] AND DP.IsActive = 1 AND DP.Client = ISNULL(@Client, DP.Client)
	
--	LEFT JOIN dbo.DimSite SM ON SM.Site_OldName = BS.[Site] AND CAST(CONCAT(BS.Year_Mon_Id, '01') AS DATE) BETWEEN SM.[Start_Date] AND SM.End_Date 
--	LEFT JOIN dbo.billing_revenue_project_task_report PTSK ON SM.Site_NewName = PTSK.[location]
--	JOIN dbo.billing_revenue_event_type_report EVT ON BS.[Position] = EVT.event_type
--	JOIN DimDate CAL ON CONCAT(BS.Year_Mon_Id, '01') = CAL.DateKey
--	WHERE 
--	ISNULL(BS.[Total Billing Amount], 0) <> 0 AND BS.[Month] = FORMAT(@StDate, 'yyyy-MMM')
--	GROUP BY
--	FORMAT(CAL.[Date], 'yyyyMM'), FORMAT(CAL.[Date], 'yyyy-MMM'), P2C.organization, P2C.contract_number, P2C.contract_line_number, EVT.[description], 
--	CONCAT(EVT.event_type, ' ', EVT.[description], ' - ', UPPER(LEFT(CAL.[MonthName], 3))), P2C.project_number, 
--	PTSK.task_number, 
--	BS.[Regular Billing Rate], FORMAT(CAL.[Date], 'MMM yyyy'), ISNULL(P2C.bu_name, 'TUUS')
--END

--GO
/****** Object:  StoredProcedure [dbo].[sp_ComputeBillingRevenue_Summary]    Script Date: 5/30/2023 4:47:17 PM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
---- EXEC dbo.sp_ComputeBillingRevenue_Summary '2022-09-01'
--CREATE PROC [dbo].[sp_ComputeBillingRevenue_Summary] @StartDate DATE = NULL, @Client VARCHAR(225) = NULL
--AS
--BEGIN
--	SET NOCOUNT ON

--	DECLARE @StDate DATE

--	IF @StartDate IS NULL
--		SET @StDate = DATEADD(DAY, 1, EOMONTH(GETDATE(), -2))
--	ELSE
--		SET @StDate = @StartDate

--	/*
--	When using the input Params of the proc directly in the queries was causing the proc to run terribly slow.
--	The solution is to copy the parameters to local variables in the procedure, which I think makes SQL re-evaluate the execution plan for the query anytime it's run, 
--	so it picks the best execution plan for the parameters given instead of using an inappropriate cached plan for the query (Parameter Sniffing).
--	*/

--	IF OBJECT_ID('tempdb..#ClientRules') IS NOT NULL
--		DROP TABLE #ClientRules

--	--Gather the client config params for the given month
--	SELECT
--		DP.Client [Client], [Project ID], LOB, [Site], [Position], [Billability Category], [Start Date], ISNULL([End Date], '2999-12-31') AS [End Date],
--		FORMAT(@StDate, 'yyyyMM') [Year Month Id], FORMAT(@StDate, 'yyyy-MMM') [Year Month Name], [Billable Headcount], [Working Days in a Month],
--		[Lower Max], ISNULL(([Billable Headcount]*[Working Days in a Month]*[Lower Max]), 0) AS [Max Contract Bill Hours], [Holiday Price per Hour],
--		[Overtime Price per Hour], [Regular Price per Hour]
--	INTO #ClientRules
--	FROM vw_ClientBillingRules CBR
--	JOIN DimProject DP ON DP.Project_Id = CBR.[Project ID] AND DP.Client = ISNULL(@Client, DP.Client) AND DP.IsActive = 1

--	--WHERE (@StDate >= [Start Date] OR EOMONTH(@StDate) <= ISNULL([End Date], '2999-12-31'))
--	--This WHERE construct works for a maximum of only one change (i.e., 2 rows) within a month. Need to find a way if there are more than 2 rows.
--	WHERE (@StDate >= [Start Date] AND EOMONTH(@StDate) <= ISNULL([End Date], '2999-12-31'))
--	/*
--	Hari changed the operator in the above construct to AND from OR, on 3-Nov. 
--	This works well in cases where the start date is 1st of month & end date is last date of the month.
--	Need to check further to see how to make it work in case where the rates change within a month.
--	*/

--	--Gather the serviced hours for the given month.
--	IF OBJECT_ID('tempdb..#BillRevenue') IS NOT NULL
--	DROP TABLE #BillRevenue

--	SELECT 
--		CR.[Start Date] AS ClientRules_Applied_Start, CR.[End Date] AS ClientRules_Applied_End, BR.[Project Id],
--		BR.[Final Billable Status] AS [Billing Category], ISNULL(BR.LOB, '') AS LOB, BR.Position, BR.[Site],
--		ISNULL(SUM(BR.[Holiday Billable Hours]), 0) AS [Holiday Billable Hours], ISNULL(SUM(BR.[OT Hours]), 0) AS [OT Billable Hours], 
--		ISNULL(SUM(BR.[Regular Hours]), 0) AS [Regular Hours]
--	INTO #BillRevenue
--	FROM vw_BillingRevenue BR
--	JOIN #ClientRules CR ON BR.[Date] BETWEEN @StDate AND EOMONTH(@StDate)
--	--The above JOIN is necessary for getting the ClientRules_Applied_Start & ClientRules_Applied_End, which is necessary for picking the right billing rate.
--	AND BR.[Project Id] = CR.[Project ID] AND BR.[Final Billable Status] = CR.[Billability Category] AND ISNULL(BR.LOB, '') = CR.lob AND BR.Position = CR.position AND BR.Site = CR.Site
--	GROUP BY 
--		CR.[Start Date], CR.[End Date], BR.[Project Id], BR.[Final Billable Status], ISNULL(BR.LOB, ''), BR.Position, BR.[Site]

--	/*
--	This logic was added to handle data from Overtime adjustments. However, it doesn't yield the expected result and the logic is also changing. So removing this for the time being.

--	-- Take the Client Approved OT Hrs instead of that captured in TW. If there is no matching entry in the OT_Adjustments table, the OT hours from TW will be retained.
--	UPDATE BR 
--	SET 
--		[OT Billable Hours] = ISNULL(OA.[OT_Hours_ClientApproved_Premium], 0),
--		[Regular Hours] = [Regular Hours] + ISNULL((OA.OT_Hours_Timewarp - OA.OT_Hours_ClientApproved_Premium), 0) --Add the unapproved OT hours as part of Regular Hours
--	FROM #BillRevenue BR
--	JOIN Overtime_Adjustments OA ON BR.[Project Id] = OA.[Project_ID] AND BR.[Billing Category] = OA.[Billable_Category] AND ISNULL(BR.LOB, '') = TRIM(OA.LOB) AND BR.Position = OA.Position AND BR.[Site] = OA.[Site]
--	WHERE Year_Month_Id = FORMAT(@StDate, 'yyyyMM')

--	*/

--	--SELECT * FROM #ClientRules
--	--SELECT * FROM #BillRevenue

--	--DELETE FROM BillingRevenue_Summary WHERE Year_Mon_Id IN (SELECT [Year Month Id] FROM #ClientRules)
	
--	--Delete data from Summary table for the given Client or as a whole, depending upon the input parameter value.
--	DELETE BRS FROM BillingRevenue_Summary BRS
--	JOIN DimProject DP ON DP.Project_Id = BRS.Project_Id AND DP.IsActive = 1
--	WHERE Year_Mon_Id IN (SELECT [Year Month Id] FROM #ClientRules) AND DP.Client = ISNULL(@Client, DP.Client);

--	INSERT INTO BillingRevenue_Summary
--	(
--		Year_Mon_Id, Year_Mon_Name, ClientRules_Applied_Start, ClientRules_Applied_End, Project_Id, Billability_Category, LOB, 
--		[Site], Position, Max_Billable_Headcount, Max_Contract_Bill_Hours, Serviced_Holiday_Hours, Serviced_Overtime_Hours, Serviced_Regular_Hours, 
--		Holiday_Price_Hour, Overtime_Price_Hour, Regular_Price_Hour
--	)
--	SELECT
--		CR.[Year Month Id], CR.[Year Month Name], BR.ClientRules_Applied_Start, BR.ClientRules_Applied_End, CR.[Project ID], CR.[Billability Category], CR.LOB, 
--		CR.[Site], CR.Position, CR.[Billable Headcount], CR.[Max Contract Bill Hours], BR.[Holiday Billable Hours], BR.[OT Billable Hours], BR.[Regular Hours], 
--		CR.[Holiday Price per Hour], CR.[Overtime Price per Hour], CR.[Regular Price per Hour]
--	FROM #ClientRules CR JOIN #BillRevenue BR
--	ON BR.[Project Id] = CR.[Project ID] AND BR.[Billing Category] = CR.[Billability Category] AND BR.LOB = CR.lob AND BR.Position = CR.position AND BR.[Site] = CR.[Site]
--	AND CR.[Start Date] = BR.ClientRules_Applied_Start AND CR.[End Date] = BR.ClientRules_Applied_End

--	/*
--	Max_Contract_Bill_Hours is the client approved hours; we must not bill beyond that. 
--	The cap is applicable only for 'Hours' and not the 'Amount'. Hence, to maximze the billing potential, the below method & order is used.
--	First we bill the holiday hours, which is at a premium rate. Then overtime rate, which again might be a premium billing. 
--	Then finally whatever is left after billing at the above said bucket are billed at regular rate as regular hours.
--	*/
--	UPDATE BillingRevenue_Summary SET Billable_Holiday_Hours =  
--	CASE WHEN Serviced_Holiday_Hours < Max_Contract_Bill_Hours THEN Serviced_Holiday_Hours ELSE Max_Contract_Bill_Hours END
--	WHERE Year_Mon_Id = FORMAT(@StDate, 'yyyyMM')
	
--	--(Max_Contract_Bill_Hours - Billable_Holiday_Hours) is what would be the remainder, after billing the holiday hours.
--	UPDATE BillingRevenue_Summary SET Billable_Overtime_Hours = 
--	CASE WHEN Serviced_Overtime_Hours < (Max_Contract_Bill_Hours - Billable_Holiday_Hours) THEN Serviced_Overtime_Hours ELSE (Max_Contract_Bill_Hours - Billable_Holiday_Hours) END
--	WHERE Year_Mon_Id = FORMAT(@StDate, 'yyyyMM')

--	--(Max_Contract_Bill_Hours - Billable_Holiday_Hours - Billable_Overtime_Hours) is what would be the remainder, after billing the holiday & OT hours.
--	UPDATE BillingRevenue_Summary SET Billable_Regular_Hours = 
--	CASE WHEN Serviced_Regular_Hours < (Max_Contract_Bill_Hours - Billable_Holiday_Hours - Billable_Overtime_Hours) THEN Serviced_Regular_Hours ELSE (Max_Contract_Bill_Hours - Billable_Holiday_Hours - Billable_Overtime_Hours) END
--	WHERE Year_Mon_Id = FORMAT(@StDate, 'yyyyMM')

--	--Any remining serviced hours after billing at the above buckets, is shown as additional hours. We cannot bill these hours.
--	UPDATE BillingRevenue_Summary SET Serviced_Additional_Hours = 
--	CASE 
--		WHEN (Serviced_Holiday_Hours + Serviced_Overtime_Hours + Serviced_Regular_Hours) > Max_Contract_Bill_Hours THEN 
--			(Serviced_Holiday_Hours + Serviced_Overtime_Hours + Serviced_Regular_Hours) - Max_Contract_Bill_Hours
--		ELSE 0 
--	END
--	WHERE Year_Mon_Id = FORMAT(@StDate, 'yyyyMM')

--	UPDATE BillingRevenue_Summary 
--	SET 
--		Total_Billing_Hours_Invoiced = (Billable_Holiday_Hours + Billable_Overtime_Hours + Billable_Regular_Hours),
--		Holiday_Hours_Billing_Amount = ROUND((Billable_Holiday_Hours * Holiday_Price_Hour), 2),
--		Overtime_Hours_Billing_Amount = ROUND((Billable_Overtime_Hours * Overtime_Price_Hour), 2), 
--		Regular_Hours_Billing_Amount = ROUND((Billable_Regular_Hours * Regular_Price_Hour), 2)
--	WHERE Year_Mon_Id = FORMAT(@StDate, 'yyyyMM')

--	UPDATE BillingRevenue_Summary SET Total_Billing_Amount = ROUND((Holiday_Hours_Billing_Amount + Overtime_Hours_Billing_Amount + Regular_Hours_Billing_Amount), 2)
--	WHERE Year_Mon_Id = FORMAT(@StDate, 'yyyyMM')

--	--SELECT * FROM BillingRevenue_Summary
--END
--GO
/****** Object:  StoredProcedure [dbo].[sp_FetchMissingClientRules]    Script Date: 5/30/2023 4:47:17 PM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE PROC [dbo].[sp_FetchMissingClientRules] @Client VARCHAR(255) = NULL, @YearMon VARCHAR(12) = NULL
--AS
--BEGIN
--	SET NOCOUNT ON
--	DECLARE @StDate DATE = CAST(@YearMon AS DATE)
--	DECLARE @EdDate DATE = EOMONTH(@StDate)
	
--	SELECT 
--		FORMAT(a.[Date], 'yyyy-MMM') [Year-Month], FORMAT(a.[Date], 'yyyyMM') [Year Month Id],
--		b.Client as [Client], b.Display_Name as [Project], a.lob AS LOB, a.[Site], 
--		a.Position, a.Final_Billable_Status as [Billability Category],SUM(Total_Billing_Hours) [Total Billable Hours]
--	FROM 
--		BillingRevenue_Detail as a 
--		JOIN DimProject as b on a.Project_Id = b.Project_Id AND b.IsActive = 1
--		LEFT JOIN ClientBillingRules as c on a.Project_Id = c.projid and a.LOB = c.lob and a.Position = c.position and a.[Site] = c.[site]
--		and a.Final_Billable_Status = c.billability_category --AND month(a.Date)=MONTH(ISNULL(@stdate,a.date))
--		and c.start_date=ISNULL(@StDate,CAST(DATEADD(M,DATEDIFF(M,0,a.date),0) AS DATE)) and c.end_date=ISNULL(@EdDate,EOMONTH(a.date))
--		AND  b.Client = ISNULL(@client, b.Client) and Final_Billable_Status <>'NonBillable'
--	WHERE 
--	 c.projid IS NULL AND  
--	 a.Date BETWEEN ISNULL(@StDate, a.date) AND ISNULL(@EdDate, a.Date)  
--	and b.Client = ISNULL(@client, b.Client) and Final_Billable_Status <>'NonBillable'
--	GROUP BY FORMAT(a.[Date], 'yyyy-MMM') ,FORMAT(a.[Date], 'yyyyMM'),b.Client,b.Display_Name,a.Project_Id,a.LOB,a.Site,a.Position,a.Final_Billable_Status
--	ORDER BY 2,Client, Project
--END

--GO
/****** Object:  StoredProcedure [dbo].[sp_InsertEmployeeAdjustments]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_InsertEmployeeAdjustments] @StDate DATE = NULL, @EdDate DATE = NULL, @Client VARCHAR(225) = NULL
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @StartDate DATE, @EndDate DATE

	IF @StDate IS NULL AND @EdDate IS NULL
		SELECT @StartDate = DATEADD(DAY, 1, EOMONTH(GETDATE(), -2)), @EndDate = EOMONTH(GETDATE(), -1)
	ELSE  
		SELECT @StartDate = @StDate, @EndDate = @EdDate  

	/*
	When using the input Params of the proc directly in the queries was causing the proc to run terribly slow.
	The solution is to copy the parameters to local variables in the procedure, which I think makes SQL re-evaluate the execution plan for the query anytime it's run, 
	so it picks the best execution plan for the parameters given instead of using an inappropriate cached plan for the query (Parameter Sniffing).
	*/

	SELECT 
		DISTINCT
		eid,
		CONCAT([name], ' (', eid, ')') Employee, 
		[date],
		CAST(NULL AS DATE) pst_date,
		B.Project_Id,
		B.Display_Name,
		B.Client,
		ISNULL(TRIM(lob),'') [lob],
		[position],
		CASE 
		WHEN [position] IN ('Teammate', 'Teammate (Subject Matter Expert)') THEN 'Billable-Production'
		WHEN [position] IN ('Learning Experience Leader', 'Quality Analyst', 'Team Leader') THEN 'Billable-Support'
		ELSE 'NonBillable'
		END AS Billable_Category
	INTO #Tmp
	FROM dbo.v_utl_teleopti_billing_last_3_months A
	JOIN dbo.DimProject B ON 
	--The below construct is to remove the last part/suffix from the Project Id. Ex "12345-2022-100-311" becomes "12345-2022-100"
	TRIM(REVERSE(SUBSTRING(REVERSE(A.project_id), CHARINDEX('-', REVERSE(A.project_id))+1, LEN(A.project_id)))) = B.Project_Id
	WHERE A.[Date] BETWEEN @StartDate AND @EndDate AND B.Client = ISNULL(@Client, B.Client) AND B.IsActive = 1

	--SELECT * FROM #Tmp
	
	DECLARE @SummaryOfChanges TABLE(Change VARCHAR(255));

	MERGE INTO dbo.Employee_Adjustments AS TargetTbl
	USING #Tmp AS SourceTbl
	ON (TargetTbl.EID = SourceTbl.EID AND TargetTbl.[Date] = SourceTbl.[Date])
	--ON CONCAT(TargetTbl.EID, '|', TargetTbl.[Date]) = CONCAT(SourceTbl.EID, '|', SourceTbl.[Date])	--Another way to JOIN
	WHEN NOT MATCHED BY TARGET THEN 
	INSERT 
	(
		[EID], [Display_Name], [date], pst_date, [Project_Id], [Project_Name], 
		[Client], lob, position, 
		Billable_Category, 
		inserted_by, updated_date, updated_by
	)
	VALUES 
	(
		SourceTbl.eid, SourceTbl.Employee, SourceTbl.[date], SourceTbl.pst_date, SourceTbl.Project_Id, SourceTbl.Display_Name,
		SourceTbl.Client, ISNULL(TRIM(SourceTbl.lob), ''), SourceTbl.[position],
		CASE 
			WHEN SourceTbl.[position] IN ('Teammate', 'Teammate (Subject Matter Expert)') THEN 'Billable-Production'
			WHEN SourceTbl.[position] IN ('Learning Experience Leader', 'Quality Analyst', 'Team Leader') THEN 'Billable-Support'
			ELSE 'NonBillable'
		END,
		'admin', NULL, NULL
	)
	WHEN MATCHED AND (TargetTbl.lob <> SourceTbl.lob OR TargetTbl.position <> SourceTbl.position) 
	AND ISNULL(TargetTbl.updated_by, 'DataRefresh') = 'DataRefresh' /* This construct ensures that we don't overwrite any changes made by the users thru the PowerApps screen,
	as such records will have the user's email address in the update_by field. We have to update only fresh rows (update_by is null) or those rows
	where the values have changed in the source system but haven't been updated via PowerApps */
	THEN UPDATE SET
		TargetTbl.Project_Id = SourceTbl.Project_Id,
		TargetTbl.lob = SourceTbl.lob,
		TargetTbl.position = SourceTbl.position,
		TargetTbl.Billable_Category =
		CASE 
			WHEN SourceTbl.[position] IN ('Teammate', 'Teammate (Subject Matter Expert)') THEN 'Billable-Production'
			WHEN SourceTbl.[position] IN ('Learning Experience Leader', 'Quality Analyst', 'Team Leader') THEN 'Billable-Support'
			ELSE 'NonBillable'
		END,--Added-End
		TargetTbl.updated_by = 'DataRefresh'
	OUTPUT $action INTO @SummaryOfChanges;

	SELECT Change, COUNT(*) AS CountPerChange FROM @SummaryOfChanges GROUP BY Change; 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RefreshDimEmployee]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_RefreshDimEmployee]
AS
BEGIN
	SET NOCOUNT ON

	SELECT eid, CONCAT([name], ' (', eid, ')') [name]
	INTO #Tmp_Names
	FROM 
	(
		SELECT eid, name, row_number() over (partition by eid order by eid, [date] desc) Sort 
		FROM v_utl_teleopti_billing_last_3_months --WHERE eid IN ('1503674', '1703922', '1400001')
		WHERE eid IS NOT NULL
	) Z
	WHERE Sort = 1

	DECLARE @SummaryOfChanges TABLE(Change VARCHAR(255));

	MERGE INTO DimEmployee AS TargetTbl
	USING #Tmp_Names AS SourceTbl
	ON (TargetTbl.EID = SourceTbl.EID)
	WHEN NOT MATCHED BY TARGET THEN 
	INSERT ([EID], [Display_Name], Inserted_By, Inserted_Date, IsActive)
	VALUES
	(SourceTbl.eid, SourceTbl.[name], 'admin', GETDATE(), 1)
	WHEN MATCHED AND (TargetTbl.Display_Name <> SourceTbl.[name])
	THEN UPDATE SET
		TargetTbl.Display_Name = SourceTbl.[name],
		TargetTbl.updated_by = 'DataRefresh',
		TargetTbl.Updated_Date = GETDATE()
	OUTPUT $action INTO @SummaryOfChanges;

	SELECT Change, COUNT(*) AS CountPerChange FROM @SummaryOfChanges GROUP BY Change; 

	DROP TABLE #Tmp_Names
END
GO
/****** Object:  StoredProcedure [dbo].[spFindMissingNewSiteName]    Script Date: 5/30/2023 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spFindMissingNewSiteName]
AS
/*
The below query shows if there are any new site names in the raw data, that are not there in the DimSite table.
If this SP results any site names, those have to be inserted into the table DimSite

The logic/conditions used here are:
As per the new site nomenclature, the first 3 characters are the abbreviation for country which would be in UPPER CASE.
Then the 4th characters (after removing the spaces in between the string) is "-".
Then there will be another "-" after the city name.
*/
SELECT DISTINCT [Site] 
FROM v_utl_teleopti_billing_last_3_months 
WHERE 
	ASCII(SUBSTRING(TRIM([Site]), 1, 1)) BETWEEN 65 AND 90
	AND ASCII(SUBSTRING(TRIM([Site]), 2, 1)) BETWEEN 65 AND 90
	AND ASCII(SUBSTRING(TRIM([Site]), 3, 1)) BETWEEN 65 AND 90
	AND CHARINDEX('-', REPLACE([Site], ' ', '')) = 4	--To check for the "-" at the 4th position
	AND CHARINDEX('-', SUBSTRING(REPLACE([Site], ' ', ''), 5, 999)) > 0	--To check for the second "-"
EXCEPT
SELECT Site_NewName FROM DimSite
GO
