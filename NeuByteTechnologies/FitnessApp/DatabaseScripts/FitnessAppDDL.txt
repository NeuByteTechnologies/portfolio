USE [FitApp]
GO
/****** Object:  Table [dbo].[app_event]    Script Date: 5/18/2026 8:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[app_event](
	[app_event_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[event_type_id] [tinyint] NOT NULL,
	[event_timestamp] [datetime2](7) NOT NULL,
	[event_payload] [nvarchar](max) NULL,
 CONSTRAINT [PK_app_event_id] PRIMARY KEY CLUSTERED 
(
	[app_event_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[email_type]    Script Date: 5/18/2026 8:48:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[email_type](
	[email_type_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[email_type_description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_email_type_id] PRIMARY KEY CLUSTERED 
(
	[email_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[error_log]    Script Date: 5/18/2026 8:48:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[error_log](
	[error_log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[error_timestamp] [datetime2](7) NOT NULL,
	[error_message] [nvarchar](2000) NOT NULL,
	[stack_trace] [nvarchar](max) NULL,
	[user_id] [int] NULL,
	[request_path] [varchar](500) NULL,
	[http_status_code] [int] NULL,
	[error_severity_id] [tinyint] NOT NULL,
 CONSTRAINT [PK_error_log_id] PRIMARY KEY CLUSTERED 
(
	[error_log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[error_severity]    Script Date: 5/18/2026 8:48:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[error_severity](
	[error_severity_id] [tinyint] NOT NULL,
	[severity_name] [varchar](20) NOT NULL,
	[severity_level] [tinyint] NOT NULL,
 CONSTRAINT [PK_error_severity_id] PRIMARY KEY CLUSTERED 
(
	[error_severity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[event_type]    Script Date: 5/18/2026 8:48:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[event_type](
	[event_type_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[event_description] [varchar](100) NULL,
 CONSTRAINT [PK_event_type_id] PRIMARY KEY CLUSTERED 
(
	[event_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exercise]    Script Date: 5/18/2026 8:48:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exercise](
	[exercise_id] [int] IDENTITY(1,1) NOT NULL,
	[exercise_name] [varchar](50) NOT NULL,
	[exersise_description] [varchar](1000) NOT NULL,
	[workout_type_id] [tinyint] NOT NULL,
 CONSTRAINT [PK_exercise_id] PRIMARY KEY CLUSTERED 
(
	[exercise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exercise_program]    Script Date: 5/18/2026 8:48:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exercise_program](
	[exercise_program_id] [int] IDENTITY(1,1) NOT NULL,
	[exercise_program_name] [varchar](50) NOT NULL,
	[weeks_in_program] [tinyint] NOT NULL,
	[workout_days] [tinyint] NOT NULL,
	[rest_day_interval] [tinyint] NOT NULL,
 CONSTRAINT [PK_exercise_program_id] PRIMARY KEY CLUSTERED 
(
	[exercise_program_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exercise_program_item]    Script Date: 5/18/2026 8:48:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exercise_program_item](
	[exercise_program_item_id] [int] IDENTITY(1,1) NOT NULL,
	[exercise_program_id] [int] NOT NULL,
	[program_week] [tinyint] NOT NULL,
	[program_day] [tinyint] NOT NULL,
	[rest_day_flag] [bit] NOT NULL,
	[superset_group_id] [tinyint] NULL,
	[superset_order] [tinyint] NULL,
	[superset_rounds] [tinyint] NULL,
	[superset_rest_duration] [time](7) NULL,
	[target_sets] [tinyint] NULL,
	[target_reps] [int] NULL,
	[target_weight] [int] NULL,
	[target_distance_value] [decimal](10, 2) NULL,
	[target_distance_unit] [tinyint] NULL,
	[target_duration] [time](7) NULL,
	[interval_work_duration] [time](7) NULL,
	[interval_rest_duration] [time](7) NULL,
	[interval_rounds] [tinyint] NULL,
	[target_machine_calories] [int] NULL,
	[exercise_id] [int] NULL,
	[exercise_order] [tinyint] NULL,
 CONSTRAINT [PK_exercise_program_item_id] PRIMARY KEY CLUSTERED 
(
	[exercise_program_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[help_category_type]    Script Date: 5/18/2026 8:48:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[help_category_type](
	[help_category_type_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[help_category_type_description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_help_category_type_id] PRIMARY KEY CLUSTERED 
(
	[help_category_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[help_frequently_asked_question]    Script Date: 5/18/2026 8:48:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[help_frequently_asked_question](
	[help_frequently_asked_question_id] [int] IDENTITY(1,1) NOT NULL,
	[help_category_type_id] [tinyint] NOT NULL,
	[question] [varchar](255) NOT NULL,
	[answer] [varchar](1000) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notification]    Script Date: 5/18/2026 8:48:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notification](
	[notification_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[notification_type_id] [tinyint] NOT NULL,
	[notification_delivery_type_id] [tinyint] NOT NULL,
	[notification_title] [varchar](200) NOT NULL,
	[notification_message] [varchar](2000) NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[delivered_at] [datetime2](7) NULL,
	[read_at] [datetime2](7) NULL,
	[is_read] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
 CONSTRAINT [PK_notification_id] PRIMARY KEY CLUSTERED 
(
	[notification_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notification_delivery_type]    Script Date: 5/18/2026 8:48:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notification_delivery_type](
	[notification_delivery_type_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[delivery_type_description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_notification_delivery_type] PRIMARY KEY CLUSTERED 
(
	[notification_delivery_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notification_event]    Script Date: 5/18/2026 8:48:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notification_event](
	[notification_event_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[notification_type_id] [tinyint] NOT NULL,
	[event_name] [varchar](50) NOT NULL,
	[event_description] [varchar](255) NULL,
 CONSTRAINT [PK_notification_event] PRIMARY KEY CLUSTERED 
(
	[notification_event_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notification_type]    Script Date: 5/18/2026 8:48:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notification_type](
	[notification_type_id] [tinyint] NOT NULL,
	[notification_type_description] [varchar](50) NOT NULL,
	[default_delivery_type_id] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[notification_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phone_type]    Script Date: 5/18/2026 8:48:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phone_type](
	[phone_type_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[phone_type_description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_phone_type_id] PRIMARY KEY CLUSTERED 
(
	[phone_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[preference]    Script Date: 5/18/2026 8:48:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[preference](
	[preference_id] [tinyint] NOT NULL,
	[preference_name] [varchar](50) NOT NULL,
	[default_unit_type_id] [tinyint] NULL,
	[default_value] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[preference_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[unit_type]    Script Date: 5/18/2026 8:48:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[unit_type](
	[unit_type_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[unit_category] [varchar](20) NOT NULL,
	[unit_name] [varchar](50) NOT NULL,
	[unit_abbreviation] [varchar](10) NOT NULL,
	[conversion_factor] [decimal](18, 8) NOT NULL,
 CONSTRAINT [PK_unit_type] PRIMARY KEY CLUSTERED 
(
	[unit_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 5/18/2026 8:48:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_type_id] [tinyint] NOT NULL,
	[first_name] [varchar](100) NOT NULL,
	[last_name] [varchar](100) NOT NULL,
	[hash_pass] [binary](256) NOT NULL,
	[last_update] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_user_id] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_contact]    Script Date: 5/18/2026 8:48:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_contact](
	[user_contact_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[email_address] [varchar](256) NOT NULL,
	[email_type_id] [tinyint] NOT NULL,
	[phone_number] [varchar](10) NOT NULL,
	[phone_type_id] [tinyint] NOT NULL,
 CONSTRAINT [PK_user_contact_id] PRIMARY KEY CLUSTERED 
(
	[user_contact_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_mfa]    Script Date: 5/18/2026 8:48:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_mfa](
	[user_id] [int] NOT NULL,
	[mfa_secret] [varbinary](max) NOT NULL,
	[mfa_enabled] [bit] NOT NULL,
	[enrolled_at] [datetime2](7) NOT NULL,
	[last_verified_at] [datetime2](7) NULL,
	[failed_attempts] [tinyint] NULL,
	[locked_until] [datetime2](7) NULL,
 CONSTRAINT [PK_user_mfa_id] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_notification_preference]    Script Date: 5/18/2026 8:48:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_notification_preference](
	[user_notification_preference_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[notification_type_id] [tinyint] NOT NULL,
	[notification_delivery_type_id] [tinyint] NOT NULL,
	[is_enabled] [bit] NOT NULL,
 CONSTRAINT [PK_user_notification_preference] PRIMARY KEY CLUSTERED 
(
	[user_notification_preference_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_user_notif_pref_unique] UNIQUE NONCLUSTERED 
(
	[user_id] ASC,
	[notification_type_id] ASC,
	[notification_delivery_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_preference]    Script Date: 5/18/2026 8:48:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_preference](
	[user_preference_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[preference_id] [tinyint] NOT NULL,
	[preference_value] [varchar](50) NULL,
	[unit_type_id] [tinyint] NULL,
 CONSTRAINT [PK_user_preference] PRIMARY KEY CLUSTERED 
(
	[user_preference_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_type]    Script Date: 5/18/2026 8:48:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_type](
	[user_type_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[user_type_description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_user_type_id] PRIMARY KEY CLUSTERED 
(
	[user_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_weight]    Script Date: 5/18/2026 8:48:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_weight](
	[user_weight_id] [bigint] NOT NULL,
	[user_id] [int] NOT NULL,
	[weight] [decimal](10, 2) NOT NULL,
	[unit_type_id] [tinyint] NOT NULL,
	[last_update_date_time] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_user_weight] PRIMARY KEY CLUSTERED 
(
	[user_weight_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[workout_log]    Script Date: 5/18/2026 8:48:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[workout_log](
	[workout_log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[exercise_program_id] [int] NULL,
	[workout_start_time] [datetime2](7) NOT NULL,
	[workout_end_time] [datetime2](7) NULL,
	[workout_status_id] [tinyint] NOT NULL,
	[workout_note] [varchar](2000) NULL,
 CONSTRAINT [PK_workout_log] PRIMARY KEY CLUSTERED 
(
	[workout_log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[workout_log_interval]    Script Date: 5/18/2026 8:48:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[workout_log_interval](
	[workout_log_interval_id] [bigint] IDENTITY(1,1) NOT NULL,
	[workout_log_id] [bigint] NOT NULL,
	[interval_number] [tinyint] NOT NULL,
	[interval_type_id] [tinyint] NOT NULL,
	[actual_work_duration] [time](7) NULL,
	[actual_rest_duration] [time](7) NULL,
	[actual_distance_value] [decimal](10, 2) NULL,
	[actual_distance_unit_type_id] [tinyint] NULL,
	[actual_calories] [int] NULL,
 CONSTRAINT [PK_workout_log_interval] PRIMARY KEY CLUSTERED 
(
	[workout_log_interval_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[workout_log_set]    Script Date: 5/18/2026 8:48:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[workout_log_set](
	[workout_log_set_id] [bigint] IDENTITY(1,1) NOT NULL,
	[workout_log_id] [bigint] NOT NULL,
	[exercise_program_item_id] [int] NOT NULL,
	[set_number] [tinyint] NOT NULL,
	[reps] [int] NULL,
	[weight] [int] NULL,
	[weight_unit_type_id] [tinyint] NULL,
	[duration] [time](7) NULL,
	[distance_value] [decimal](10, 2) NULL,
	[distance_unit_type_id] [tinyint] NULL,
	[machine_calories] [int] NULL,
 CONSTRAINT [PK_workout_log_set] PRIMARY KEY CLUSTERED 
(
	[workout_log_set_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[workout_status]    Script Date: 5/18/2026 8:48:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[workout_status](
	[workout_status_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[workout_status_description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_workout_status_log] PRIMARY KEY CLUSTERED 
(
	[workout_status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[workout_type]    Script Date: 5/18/2026 8:48:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[workout_type](
	[workout_type_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[workout_type_description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_workout_type] PRIMARY KEY CLUSTERED 
(
	[workout_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[app_event] ADD  DEFAULT (sysutcdatetime()) FOR [event_timestamp]
GO
ALTER TABLE [dbo].[error_log] ADD  DEFAULT (sysutcdatetime()) FOR [error_timestamp]
GO
ALTER TABLE [dbo].[notification] ADD  DEFAULT (sysutcdatetime()) FOR [created_at]
GO
ALTER TABLE [dbo].[notification] ADD  DEFAULT ((0)) FOR [is_read]
GO
ALTER TABLE [dbo].[notification] ADD  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[user_mfa] ADD  DEFAULT ((1)) FOR [mfa_enabled]
GO
ALTER TABLE [dbo].[user_notification_preference] ADD  DEFAULT ((1)) FOR [is_enabled]
GO
ALTER TABLE [dbo].[app_event]  WITH CHECK ADD  CONSTRAINT [FK_app_event_event_type] FOREIGN KEY([event_type_id])
REFERENCES [dbo].[event_type] ([event_type_id])
GO
ALTER TABLE [dbo].[app_event] CHECK CONSTRAINT [FK_app_event_event_type]
GO
ALTER TABLE [dbo].[error_log]  WITH CHECK ADD  CONSTRAINT [FK_error_severity_id_error_severity] FOREIGN KEY([error_severity_id])
REFERENCES [dbo].[error_severity] ([error_severity_id])
GO
ALTER TABLE [dbo].[error_log] CHECK CONSTRAINT [FK_error_severity_id_error_severity]
GO
ALTER TABLE [dbo].[error_log]  WITH CHECK ADD  CONSTRAINT [FK_user_id_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[error_log] CHECK CONSTRAINT [FK_user_id_user]
GO
ALTER TABLE [dbo].[exercise]  WITH CHECK ADD  CONSTRAINT [FK_exercise_workout_type] FOREIGN KEY([workout_type_id])
REFERENCES [dbo].[workout_type] ([workout_type_id])
GO
ALTER TABLE [dbo].[exercise] CHECK CONSTRAINT [FK_exercise_workout_type]
GO
ALTER TABLE [dbo].[exercise_program_item]  WITH CHECK ADD  CONSTRAINT [FK_exercise_program_item_exercise] FOREIGN KEY([exercise_id])
REFERENCES [dbo].[exercise] ([exercise_id])
GO
ALTER TABLE [dbo].[exercise_program_item] CHECK CONSTRAINT [FK_exercise_program_item_exercise]
GO
ALTER TABLE [dbo].[exercise_program_item]  WITH CHECK ADD  CONSTRAINT [FK_exercise_program_item_exercise_program] FOREIGN KEY([exercise_program_id])
REFERENCES [dbo].[exercise_program] ([exercise_program_id])
GO
ALTER TABLE [dbo].[exercise_program_item] CHECK CONSTRAINT [FK_exercise_program_item_exercise_program]
GO
ALTER TABLE [dbo].[help_frequently_asked_question]  WITH CHECK ADD  CONSTRAINT [FK_help_frequently_asked_question_help_category_type] FOREIGN KEY([help_category_type_id])
REFERENCES [dbo].[help_category_type] ([help_category_type_id])
GO
ALTER TABLE [dbo].[help_frequently_asked_question] CHECK CONSTRAINT [FK_help_frequently_asked_question_help_category_type]
GO
ALTER TABLE [dbo].[notification]  WITH CHECK ADD  CONSTRAINT [FK_notification_delivery_type] FOREIGN KEY([notification_delivery_type_id])
REFERENCES [dbo].[notification_delivery_type] ([notification_delivery_type_id])
GO
ALTER TABLE [dbo].[notification] CHECK CONSTRAINT [FK_notification_delivery_type]
GO
ALTER TABLE [dbo].[notification]  WITH CHECK ADD  CONSTRAINT [FK_notification_notification_delivery_type] FOREIGN KEY([notification_delivery_type_id])
REFERENCES [dbo].[notification_delivery_type] ([notification_delivery_type_id])
GO
ALTER TABLE [dbo].[notification] CHECK CONSTRAINT [FK_notification_notification_delivery_type]
GO
ALTER TABLE [dbo].[notification]  WITH CHECK ADD  CONSTRAINT [FK_notification_type_id] FOREIGN KEY([notification_type_id])
REFERENCES [dbo].[notification_type] ([notification_type_id])
GO
ALTER TABLE [dbo].[notification] CHECK CONSTRAINT [FK_notification_type_id]
GO
ALTER TABLE [dbo].[notification]  WITH CHECK ADD  CONSTRAINT [FK_notification_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[notification] CHECK CONSTRAINT [FK_notification_user]
GO
ALTER TABLE [dbo].[notification]  WITH CHECK ADD  CONSTRAINT [FK_notification_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[notification] CHECK CONSTRAINT [FK_notification_user_id]
GO
ALTER TABLE [dbo].[notification_event]  WITH CHECK ADD  CONSTRAINT [FK_notification_event_type] FOREIGN KEY([notification_type_id])
REFERENCES [dbo].[notification_type] ([notification_type_id])
GO
ALTER TABLE [dbo].[notification_event] CHECK CONSTRAINT [FK_notification_event_type]
GO
ALTER TABLE [dbo].[preference]  WITH CHECK ADD  CONSTRAINT [FK_preference_unit_type] FOREIGN KEY([default_unit_type_id])
REFERENCES [dbo].[unit_type] ([unit_type_id])
GO
ALTER TABLE [dbo].[preference] CHECK CONSTRAINT [FK_preference_unit_type]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user_user_type] FOREIGN KEY([user_type_id])
REFERENCES [dbo].[user_type] ([user_type_id])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user_user_type]
GO
ALTER TABLE [dbo].[user_contact]  WITH CHECK ADD  CONSTRAINT [FK_email_type_id_email_type] FOREIGN KEY([email_type_id])
REFERENCES [dbo].[email_type] ([email_type_id])
GO
ALTER TABLE [dbo].[user_contact] CHECK CONSTRAINT [FK_email_type_id_email_type]
GO
ALTER TABLE [dbo].[user_contact]  WITH CHECK ADD  CONSTRAINT [FK_phone_type_id_phone_type] FOREIGN KEY([phone_type_id])
REFERENCES [dbo].[phone_type] ([phone_type_id])
GO
ALTER TABLE [dbo].[user_contact] CHECK CONSTRAINT [FK_phone_type_id_phone_type]
GO
ALTER TABLE [dbo].[user_contact]  WITH CHECK ADD  CONSTRAINT [FK_user_contact_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[user_contact] CHECK CONSTRAINT [FK_user_contact_user]
GO
ALTER TABLE [dbo].[user_mfa]  WITH CHECK ADD  CONSTRAINT [FK_user_mfa_id_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[user_mfa] CHECK CONSTRAINT [FK_user_mfa_id_user]
GO
ALTER TABLE [dbo].[user_notification_preference]  WITH CHECK ADD  CONSTRAINT [FK_user_notif_pref_delivery] FOREIGN KEY([notification_delivery_type_id])
REFERENCES [dbo].[notification_delivery_type] ([notification_delivery_type_id])
GO
ALTER TABLE [dbo].[user_notification_preference] CHECK CONSTRAINT [FK_user_notif_pref_delivery]
GO
ALTER TABLE [dbo].[user_notification_preference]  WITH CHECK ADD  CONSTRAINT [FK_user_notif_pref_type] FOREIGN KEY([notification_type_id])
REFERENCES [dbo].[notification_type] ([notification_type_id])
GO
ALTER TABLE [dbo].[user_notification_preference] CHECK CONSTRAINT [FK_user_notif_pref_type]
GO
ALTER TABLE [dbo].[user_notification_preference]  WITH CHECK ADD  CONSTRAINT [FK_user_notif_pref_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[user_notification_preference] CHECK CONSTRAINT [FK_user_notif_pref_user]
GO
ALTER TABLE [dbo].[user_preference]  WITH CHECK ADD  CONSTRAINT [FK_user_preference_preference] FOREIGN KEY([preference_id])
REFERENCES [dbo].[preference] ([preference_id])
GO
ALTER TABLE [dbo].[user_preference] CHECK CONSTRAINT [FK_user_preference_preference]
GO
ALTER TABLE [dbo].[user_preference]  WITH CHECK ADD  CONSTRAINT [FK_user_preference_unit_type] FOREIGN KEY([unit_type_id])
REFERENCES [dbo].[unit_type] ([unit_type_id])
GO
ALTER TABLE [dbo].[user_preference] CHECK CONSTRAINT [FK_user_preference_unit_type]
GO
ALTER TABLE [dbo].[user_preference]  WITH CHECK ADD  CONSTRAINT [FK_user_preference_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[user_preference] CHECK CONSTRAINT [FK_user_preference_user]
GO
ALTER TABLE [dbo].[user_weight]  WITH CHECK ADD  CONSTRAINT [FK_user_weight_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[user_weight] CHECK CONSTRAINT [FK_user_weight_user]
GO
ALTER TABLE [dbo].[workout_log]  WITH CHECK ADD  CONSTRAINT [FK_exercise_program] FOREIGN KEY([exercise_program_id])
REFERENCES [dbo].[exercise_program] ([exercise_program_id])
GO
ALTER TABLE [dbo].[workout_log] CHECK CONSTRAINT [FK_exercise_program]
GO
ALTER TABLE [dbo].[workout_log]  WITH CHECK ADD  CONSTRAINT [FK_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[workout_log] CHECK CONSTRAINT [FK_user]
GO
ALTER TABLE [dbo].[workout_log]  WITH CHECK ADD  CONSTRAINT [FK_workout_log_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[workout_log] CHECK CONSTRAINT [FK_workout_log_user]
GO
ALTER TABLE [dbo].[workout_log]  WITH CHECK ADD  CONSTRAINT [FK_workout_status] FOREIGN KEY([workout_status_id])
REFERENCES [dbo].[workout_status] ([workout_status_id])
GO
ALTER TABLE [dbo].[workout_log] CHECK CONSTRAINT [FK_workout_status]
GO
ALTER TABLE [dbo].[workout_log_interval]  WITH CHECK ADD  CONSTRAINT [FK_actual_distance_unit_type_id] FOREIGN KEY([actual_distance_unit_type_id])
REFERENCES [dbo].[unit_type] ([unit_type_id])
GO
ALTER TABLE [dbo].[workout_log_interval] CHECK CONSTRAINT [FK_actual_distance_unit_type_id]
GO
ALTER TABLE [dbo].[workout_log_interval]  WITH CHECK ADD  CONSTRAINT [FK_workout_log_interval_workout_log] FOREIGN KEY([workout_log_id])
REFERENCES [dbo].[workout_log] ([workout_log_id])
GO
ALTER TABLE [dbo].[workout_log_interval] CHECK CONSTRAINT [FK_workout_log_interval_workout_log]
GO
ALTER TABLE [dbo].[workout_log_set]  WITH CHECK ADD  CONSTRAINT [FK_distance_unit_type_id] FOREIGN KEY([distance_unit_type_id])
REFERENCES [dbo].[unit_type] ([unit_type_id])
GO
ALTER TABLE [dbo].[workout_log_set] CHECK CONSTRAINT [FK_distance_unit_type_id]
GO
ALTER TABLE [dbo].[workout_log_set]  WITH CHECK ADD  CONSTRAINT [FK_weight_unit_type_id] FOREIGN KEY([weight_unit_type_id])
REFERENCES [dbo].[unit_type] ([unit_type_id])
GO
ALTER TABLE [dbo].[workout_log_set] CHECK CONSTRAINT [FK_weight_unit_type_id]
GO
