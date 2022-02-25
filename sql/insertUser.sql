USE [clife]
GO


DECLARE @INDEX INT =1;
WHILE(@INDEX <= 1000)
BEGIN
	INSERT INTO [user]
           ([username]
           ,[password]
           ,[first_name]
           ,[last_name]
           ,[birthday]
           ,[email]
           ,[phone]
           ,[gender]
           ,[is_super]
           ,[is_active]
           ,[permission]
           ,[created_at]
           ,[updated_at]) VALUES('test'+CAST(@INDEX as VARCHAR(150)), '8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8',
								CAST(@INDEX as VARCHAR(150)),'Test', '2001-08-23', 'test'+CAST(@INDEX as VARCHAR(150))+'@gmail.com','0972141556', 1 , 0, 1, 
								'user', '2022-02-12 22:43:59.877','2022-02-23 23:37:59.753' );
	SET @INDEX = @INDEX + 1;
END





