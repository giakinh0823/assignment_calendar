USE [clife]
GO


DECLARE @INDEX INT = 1;
WHILE(@INDEX <= 1000)
BEGIN
	INSERT INTO [user_permission]
           ([licensed]
           ,[userId]
           ,[permissionId]) VALUES(1, @INDEX, 3);
	SET @INDEX = @INDEX + 1;
END



