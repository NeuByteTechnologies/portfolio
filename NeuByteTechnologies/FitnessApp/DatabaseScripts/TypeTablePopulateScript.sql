/*
Populate Type Tables
*/

USE [FitApp]
GO

INSERT INTO [dbo].[email_type]
           ([email_type_description])
     VALUES
           ('Buisiness')
           ,('Personal')
           ,('Other')
GO

INSERT INTO [dbo].[event_type]
           ([event_description])
     VALUES
           ('User Created') --Triggered when a new user completes onboarding.
          ,('User Logged In') --Triggered when the user successfully authenticates.
          ,('User Logged Out') --Triggered when the user logs out or session expires.
          ,('Profile Updated') --Triggered when the user updates profile fields (name, email, phone, units, etc.).
          ,('Weight Logged') --Triggered when the user records a new weight entry.
          ,('Weight Goal Proximity') --Triggered when the user is within the configured threshold of their weight goal.
          ,('Workout Logged') --Triggered when the user completes a workout and submits the log.
          ,('Program Started') --Triggered when the user begins a new exercise program.
          ,('Program Completed') --Triggered when the user finishes all workouts in a program.
          ,('Reminder Triggered') --Triggered by scheduled reminders (weigh‑in due, workout due, etc.).
          ,('Help Article Viewed') --Triggered when the user opens a Help/FAQ item.
          ,('Notification Viewed') --Triggered when the user opens a notification from the list.
          ,('Error Encountered') --Triggered when the UI displays an error banner (validation, network, system).
          ,('Report Viewed') --Triggered when the user opens a report (progress, weight trend, workout summary).
          ,('Settings Changed') -- Triggered when the user updates preferences (units, notifications, theme).
GO

INSERT INTO [dbo].[help_category_type]
           ([help_category_type_description])
     VALUES
           ('Account')
           ,('Workouts')
           ,('Programs')
           ,('Tracking')
           ,('Notifications')
           ,('Billing')
           ,('Technical')
GO

INSERT INTO [dbo].[notification_delivery_type]
           ([delivery_type_description])
     VALUES
           ('In Application')
           ,('Email')
GO

INSERT INTO [dbo].[phone_type]
           ([phone_type_description])
     VALUES
            ('Emergency')
           ,('Home')
           ,('Mobile')
           ,('Work')
GO

INSERT INTO [dbo].[unit_type]
           ([unit_category]
           ,[unit_name]
           ,[unit_abbreviation]
           ,[conversion_factor])
     VALUES
           ('distance','Miles','mi',1609.34)
          ,('distance','Kilometers','km', 1000.00)
          ,('distance','Meters','m',1.00)
          ,('distance','Yards','yd',0.9144)
          ,('weight', 'Pounds', 'lb',0.45359237)
          ,('weight','Kilograms','kg',1.00)
GO

INSERT INTO [dbo].[user_type]
           ([user_type_description])
     VALUES
           ('Application')
           ,('Administrator')
           ,('Coach')
           ,('System')
GO


INSERT INTO [dbo].[workout_type]
           ([workout_type_description])
     VALUES
           ('At Home Body Weight')
           ,('Traditional Body Building')
           ,('Cross Training')
           ,('Strength')
           ,('Push Pull Legs')
           ,('At Home Minimal Equipment')
           ,('Cardio')
           ,('Mobility')
GO

