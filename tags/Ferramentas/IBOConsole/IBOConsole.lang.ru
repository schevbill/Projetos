;{************************************************************************
;  This File was written by Lorenzo Mengoni - (Ancona, Italy)
;  and it'part of IBOConsole
;  for suggestion and contributions email to lorenzo@mengoni.com
;  This software is distributed under the License GPL and is distributed on
;  an "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either
;  express or implied. if you live in a country where this is not applicable
;  do not use it at all.
;
;  This file is a starting point for localization of IBOConsole
;  This are predefined language constant for now:
;
;  Brazilian Portuguese=pt-br
;  Catalan=ca
;  Croatian=hr
;  Czech=cz
;  Danish=da
;  Dutch=nl
;  English=en
;  Estonian=et
;  French=fr
;  German=de
;  Greek-Modern=el
;  Italiano=it
;  Japanese=ja
;  Korean=ko
;  Luxembourgeois=ltz
;  Norwegian=no
;  Norwegian Nynorsk=nn
;  Polish=pl
;  Portugese=pt
  Russian=ru
;  Spanish=es
;  Swedish=sv
;
;
;  IBOConsole look in the same folder of exe for the file
;  IBOConsole.lang.pt-br for Brazilian Portuguese,
;  IBOConsole.lang.ca for Catalan and so on...
;  I made the Italian file so, if You make a language file I'll give You
;  the credit on my site and in the About Form of program.
;  If the language is not in the list above, I'll add it on the program
;  Thanks in advance to anyone will help me.
;  Send the file at lorenzo@mengoni.com
;
;Warning:
;localize only the right side
;do not localize and leave case as is on the left side
; example:
;--obj-path----- --Italian--
;Column0.Caption=Nome
;Column1.Caption=Valore
;
;the section is the path of component in the form, so don't change od localize it
;use ^M to insert a line break, useful in label caption
;
[frmMain.FrameGenerators1.DBGrid1]
Class=TDBGrid
Hint=
Columns.Count=2
Column0.Caption=���
Column1.Caption=��������
[frmMain.FrameGenerators1.NewGenerator1]
Class=TMenuItem
Caption=������� ���������
Hint=������� ����� ���������
[frmMain.FrameGenerators1.EditGenerator1]
Class=TMenuItem
Caption=�������� ���������
Hint=�������� ������� ���������
[frmMain.FrameGenerators1.DropGenerator1]
Class=TMenuItem
Caption=������� ���������
Hint=������� ������� ���������
[frmMain.Console1]
Class=TMenuItem
Caption=�������
Hint=
[frmMain.View1]
Class=TMenuItem
Caption=��������
Hint=
[frmMain.Server1]
Class=TMenuItem
Caption=������
Hint=
[frmMain.Database1]
Class=TMenuItem
Caption=���� ������
Hint=
[frmMain.Maintenance2]
Class=TMenuItem
Caption=������������
Hint=
[frmMain.BackupRestore1]
Class=TMenuItem
Caption=��������� �����������/��������������
Hint=
[frmMain.ConnectAs3]
Class=TMenuItem
Caption=����� ����������...
Hint=������������� SQL
[frmMain.Help1]
Class=TMenuItem
Caption=������
Hint=
[frmMain.Maintenance1]
Class=TMenuItem
Caption=������������
Hint=
[frmMain.BackupRestore2]
Class=TMenuItem
Caption=��������� �����������/��������������
Hint=
[frmMain.ConsoleExit]
Class=TAction
Caption=�����
Hint=��������� ������ IBOConsole
[frmMain.ViewList]
Class=TAction
Caption=������
Hint=
[frmMain.ViewReport]
Class=TAction
Caption=�������
Hint=
[frmMain.ViewIcon]
Class=TAction
Caption=�������
Hint=
[frmMain.ViewSmallIcon]
Class=TAction
Caption=������
Hint=
[frmMain.ViewProperties]
Class=TAction
Caption=�������� ...
Hint=�������� ������� �������
[frmMain.ViewSystem]
Class=TAction
Caption=��������� ������
Hint=
[frmMain.HelpContents]
Class=THelpContents
Caption=����������
Hint=
[frmMain.HelpOnHelp]
Class=THelpOnHelp
Caption=� ������� �������
Hint=
[frmMain.HelpTopicSearch]
Class=THelpTopicSearch
Caption=����� ����
Hint=
[frmMain.HelpAbout]
Class=TAction
Caption=� ��������� ...
Hint=
[frmMain.EditCopy]
Class=TEditCopy
Caption=����������
Hint=���������� � ����� ������
[frmMain.EditCut]
Class=TEditCut
Caption=��������
Hint=������� � ����� ������
[frmMain.EditPaste]
Class=TEditPaste
Caption=��������
Hint=�������� �� ������ ������
[frmMain.EditSelectAll]
Class=TEditSelectAll
Caption=�������� ���
Hint=�������� ���
[frmMain.EditUndo]
Class=TEditUndo
Caption=������
Hint=�������� ��������� ��������
[frmMain.EditFont]
Class=TAction
Caption=&����� ...
Hint=�������� �����
[frmMain.WindowList]
Class=TAction
Caption=&����
Hint=������ ����
[frmMain.UserAdd]
Class=TAction
Caption=�������� ������������ ...
Hint=���� ������ ������������
[frmMain.UserModify]
Class=TAction
Caption=�������� ������������ ...
Hint=��������� ���������� � ������������
[frmMain.UserDelete]
Class=TAction
Caption=������� ������������
Hint=�������� �������� ������������
[frmMain.ServerLogout]
Class=TAction
Caption=�����������
Hint=����������� �� �������� �������
[frmMain.ServerSecurity]
Class=TAction
Caption=����� ������������� ...
Hint=���������� ��������������
[frmMain.ServerProperties]
Class=TAction
Caption=�������� ...
Hint=�������� ������� �������
[frmMain.DatabaseDisconnect]
Class=TAction
Caption=����������� �� ��
Hint=����������� �� ������� ���� ������
[frmMain.DatabaseProperties]
Class=TAction
Caption=�������� ...
Hint=�������� ������� ���� ������
[frmMain.DatabaseStatistics]
Class=TAction
Caption=���������� ���� ������ ...
Hint=�������� ���������� ���� ������
[frmMain.DatabaseShutdown]
Class=TAction
Caption=Shutdown ...
Hint=Shutdown the database
[frmMain.DatabaseSweep]
Class=TAction
Caption=������ "������"
Hint=������� ������ ������ ������� �� ���� ������
[frmMain.DatabaseRecoverTrans]
Class=TAction
Caption=�������������� ���������� ...
Hint=�������������� limbo-����������
[frmMain.DatabaseMetadata]
Class=TAction
Caption=�������� ���������� ...
Hint=�������� ���������� ������� ��
[frmMain.DatabaseRestart]
Class=TAction
Caption=Database &Restart
Hint=Restart a database
[frmMain.DatabaseDrop]
Class=TAction
Caption=������� ���� ������
Hint=������� ������� ���� ������
[frmMain.DBCBackup]
Class=TAction
Caption=��������� ����������� ���� ������
Hint=��������� ��������� ����������� ���� ������
[frmMain.DatabaseUsers]
Class=TAction
Caption=�������� &������������ ...
Hint=�������� ������ �������������, ������������ � �������
[frmMain.DBCRestore]
Class=TAction
Caption=������������ ���� ������
Hint=������������ ���� ������ �� ��������� �����
[frmMain.ServerLogin]
Class=TAction
Caption=������������ ...
Hint=������������ � �������
[frmMain.ServerRegister]
Class=TAction
Caption=����������� ...
Hint=���������������� ����� ������
[frmMain.ServerUnregister]
Class=TAction
Caption=������� ���������� � �������
Hint=������� ��������������� ���������� � �������
[frmMain.ServerConnection]
Class=TAction
Caption=���� ���������� ...
Hint=�������� ����������� � �������
[frmMain.ServerActionProps]
Class=TAction
Caption=�������� ...
Hint=�������� ������� �������
[frmMain.DatabaseRegister]
Class=TAction
Caption=����������� �� ...
Hint=���������������� ���� ������
[frmMain.DatabaseUnregister]
Class=TAction
Caption=������� ���������� � ��
Hint=������� ��������������� ���������� � ���� ������
[frmMain.DatabaseConnect]
Class=TAction
Caption=������������
Hint=������������ � ���� ������
[frmMain.DatabaseConnectAs]
Class=TAction
Caption=������������ ��� ...
Hint=������������ � ���� ������ ��� ������������ ������ ������������
[frmMain.DatabaseCreate]
Class=TAction
Caption=������� �� ...
Hint=������� ����� ���� ������
[frmMain.DatabaseValidate]
Class=TAction
Caption=�������� ��...
Hint=��������� ��������� ��
[frmMain.DatabaseActionsProperties]
Class=TAction
Caption=�������� ...
Hint=�������� �������� ���� ������
[frmMain.ExtToolsLaunchISQL]
Class=TAction
Caption=������������� S&QL ...
Hint=������������� SQL
[frmMain.ExtToolsConfigure]
Class=TAction
Caption=��������� ������������ ...
Hint=��������� ������������
[frmMain.ExtToolDropDown]
Class=TAction
Caption=�����������
Hint=�����������
[frmMain.DatabaseBackup]
Class=TAction
Caption=��������� ����������� ...
Hint=��������� ��������� ����������� ���� ������
[frmMain.DatabaseRestore]
Class=TAction
Caption=�������������� ...
Hint=������������ ���� ������ �� ��������� �����
[frmMain.BackupRestoreModifyAlias]
Class=TAction
Caption=�������� ��� ������� ...
Hint=�������� ��� ������� �� ��������� �����������
[frmMain.BackupRestoreRemoveAlias]
Class=TAction
Caption=������� �������
Hint=������� ������� ������� �� ��������� �����������
[frmMain.ViewServerLog]
Class=TAction
Caption=������ ...
Hint=�������� ������� �������
[frmMain.ObjectDescription]
Class=TAction
Caption=�������� �������� ...
Hint=�������� �������� �������
[frmMain.ObjectCreate]
Class=TAction
Caption=&������� ...
Hint=������� ����� ������ ���������� ����
[frmMain.ObjectModify]
Class=TAction
Caption=�������� ...
Hint=�������� ������� ������
[frmMain.ObjectDelete]
Class=TAction
Caption=������� ...
Hint=������� ������� ������
[frmMain.ObjectExtract]
Class=TAction
Caption=������� ...
Hint=������� ���������� ��� �������� �������
[frmMain.ObjectProperties]
Class=TAction
Caption=�������� ...
Hint=
[frmMain.ObjectRefresh]
Class=TAction
Caption=��������
Hint=
[frmMain.HighlightOptions]
Class=TAction
Caption=��������� ������
Hint=��������� ������
[frmMain.DatabaseWindows]
Class=TAction
Caption=���� ��� ������
Hint=
[frmMain.ActionOptions]
Class=TAction
Caption=���������...
Hint=
[frmMain.actHighlightOptions]
Class=TAction
Caption=��������� ������...
Hint=
[frmMain.Test1]
Class=TMenuItem
Caption=����
Hint=
[frmOptions]
Class=TfrmOptions
Caption=���������
Hint=
[frmOptions.btnApply]
Class=TButton
Caption=���������
Hint=
[frmOptions.btnOK]
Class=TButton
Caption=&OK
Hint=
[frmOptions.pgControl]
Class=TPageControl
Hint=
PageCount=1
[frmOptions.pgControl.TabSheet2]
Class=TTabSheet
Caption=IBOConsole
Hint=
[frmOptions.TabSheet2]
Class=TTabSheet
Caption=IBOConsole
Hint=
[frmOptions.Label2]
Class=TLabel
Caption=.........
Hint=
[frmOptions.LabelLanguage]
Class=TLabel
Caption=����
Hint=����� �����
[frmOptions.DDLRadioGroup]
Class=TGroupButton
Caption=���������� DDL
Hint=
Items.Count=2
Item0=������������ �������������
Item1=������������ �������
[frmOptions.CheckBox1]
Class=TCheckBox
Caption=Force Uppercase Identifier
Hint=
[frmOptions.ButtonChangeFont]
Class=TButton
Caption=�������� �����
Hint=
[frmOptions.btnCancel]
Class=TButton
Caption=������
Hint=
[frmEditorOptions]
Class=TfrmEditorOptions
Caption=��������� ���������� � ���������
Hint=
[frmEditorOptions.Label1]
Class=TLabel
Caption=����
Hint=
[frmEditorOptions.Label2]
Class=TLabel
Caption=�������
Hint=
[frmEditorOptions.GroupBox1]
Class=TGroupBox
Caption=����� ������
Hint=
[frmEditorOptions.chkBold]
Class=TCheckBox
Caption=����������
Hint=
[frmEditorOptions.chkItalic]
Class=TCheckBox
Caption=������
Hint=
[frmEditorOptions.chkUnderline]
Class=TCheckBox
Caption=������������
Hint=
[frmEditorOptions.Button1]
Class=TButton
Caption=&OK
Hint=
[frmEditorOptions.Button2]
Class=TButton
Caption=������
Hint=
[frmEditorOptions.GroupBox2]
Class=TGroupBox
Caption=������������ ��������� ���
Hint=
[frmEditorOptions.chkDefaultFG]
Class=TCheckBox
Caption=Default Foreground
Hint=
[frmEditorOptions.chkDefaultBG]
Class=TCheckBox
Caption=Default Background
Hint=
[frmEditorOptions.Label3]
Class=TLabel
Caption=Courier New
Hint=
[frmEditorOptions.ButtonChangeFont]
Class=TButton
Caption=�������� �����
Hint=
[frmServerLogin]
Class=TfrmServerLogin
Caption=����������� �� �������
Hint=
[frmServerLogin.lblServerName]
Class=TLabel
Caption=������:
Hint=
[frmServerLogin.lblUsername]
Class=TLabel
Caption=������������:
Hint=
[frmServerLogin.lblPassword]
Class=TLabel
Caption=������:
Hint=
[frmServerLogin.lblServer]
Class=TLabel
Caption=��������� ������
Hint=
[frmServerLogin.btnLogin]
Class=TButton
Caption=������������
Hint=
[frmServerLogin.btnCancel]
Class=TButton
Caption=������
Hint=
[frmUserInfo]
Class=TfrmUserInfo
Caption=���������� � ������������
Hint=
[frmUserInfo.btnNew]
Class=TButton
Caption=�����
Hint=
[frmUserInfo.btnApply]
Class=TButton
Caption=���������
Hint=
[frmUserInfo.btnDelete]
Class=TButton
Caption=�������
Hint=
[frmUserInfo.btnClose]
Class=TButton
Caption=�������
Hint=
[frmUserInfo.btnCancel]
Class=TButton
Caption=������
Hint=
[frmUserInfo.gbOptionalInfo]
Class=TGroupBox
Caption=�������������� ����������
Hint=
[frmUserInfo.lblFName]
Class=TLabel
Caption=���:
Hint=
[frmUserInfo.lblMName]
Class=TLabel
Caption=��������:
Hint=
[frmUserInfo.lblLName]
Class=TLabel
Caption=�������:
Hint=
[frmUserInfo.gbRequiredInfo]
Class=TGroupBox
Caption= ����������� ����������
Hint=
[frmUserInfo.lblPassword]
Class=TLabel
Caption=������:
Hint=
[frmUserInfo.lblConfirmPassword]
Class=TLabel
Caption=������������� ������:
Hint=
[frmUserInfo.lblUserName]
Class=TLabel
Caption=������������:
Hint=
[frmUserInfo.NewUser]
Class=TAction
Caption=NewUser
Hint=
[frmUserInfo.ModifyUser]
Class=TAction
Caption=ModifyUser
Hint=
[frmUserInfo.DeleteUser]
Class=TAction
Caption=DeleteUser
Hint=
[frmServerProperties]
Class=TfrmServerProperties
Caption=�������� �������
Hint=
[frmServerProperties.pgcMain]
Class=TPageControl
Hint=
PageCount=2
[frmServerProperties.pgcMain.TabAlias]
Class=TTabSheet
Caption=���������
Hint=
[frmServerProperties.pgcMain.TabGeneral]
Class=TTabSheet
Caption=General
Hint=
[frmServerProperties.TabAlias]
Class=TTabSheet
Caption=���������
Hint=
[frmServerProperties.lblAliasName]
Class=TLabel
Caption=���������:
Hint=
[frmServerProperties.lblHostName]
Class=TLabel
Caption=&Host Name:
Hint=
[frmServerProperties.lblProtocol]
Class=TLabel
Caption=������� ��������:
Hint=
[frmServerProperties.Label1]
Class=TLabel
Caption=��������:
Hint=
[frmServerProperties.TabGeneral]
Class=TTabSheet
Caption=General
Hint=
[frmServerProperties.lblVersionCaption]
Class=TLabel
Caption=������:
Hint=
[frmServerProperties.lblCapabilities]
Class=TLabel
Caption=Capabilities:
Hint=
[frmServerProperties.lblAttachmentNoCaption]
Class=TLabel
Caption=Number of attachments:
Hint=
[frmServerProperties.lblDatabaseNocaption]
Class=TLabel
Caption=����� ��� ������:
Hint=
[frmServerProperties.lblDatabaseNo]
Class=TLabel
Caption=?
Hint=
[frmServerProperties.lblAttachmentNo]
Class=TLabel
Caption=?
Hint=
[frmServerProperties.lblVersion]
Class=TLabel
Caption=Unknown
Hint=
[frmServerProperties.lvDatabases]
Class=TListView
Hint=
Columns.Count=1
Column0.Caption=Attached Databases
[frmServerProperties.btnRefresh]
Class=TButton
Caption=��������
Hint=
[frmServerProperties.btnApply]
Class=TButton
Caption=���������
Hint=
[frmServerProperties.btnCancel]
Class=TButton
Caption=&OK
Hint=
[frmServerProperties.Button1]
Class=TButton
Caption=������
Hint=
[frmDBProperties]
Class=TfrmDBProperties
Caption=�������� ���� ������
Hint=
[frmDBProperties.lblServerName]
Class=TLabel
Caption=������:
Hint=
[frmDBProperties.lblServer]
Class=TLabel
Caption=��������� ������
Hint=
[frmDBProperties.pgcMain]
Class=TPageControl
Hint=
PageCount=2
[frmDBProperties.pgcMain.TabAlias]
Class=TTabSheet
Caption=���������
Hint=
[frmDBProperties.pgcMain.TabGeneral]
Class=TTabSheet
Caption=General
Hint=
[frmDBProperties.TabAlias]
Class=TTabSheet
Caption=���������
Hint=
[frmDBProperties.lblAliasName]
Class=TLabel
Caption=���������:
Hint=
[frmDBProperties.lblFilename]
Class=TLabel
Caption=����:
Hint=
[frmDBProperties.btnSelFilename]
Class=TButton
Caption=...
Hint=����� ��
[frmDBProperties.TabGeneral]
Class=TTabSheet
Caption=General
Hint=
[frmDBProperties.lblOptions]
Class=TLabel
Caption=O&ptions:
Hint=
[frmDBProperties.gbSummaryInfo]
Class=TGroupBox
Caption= �������� ����������
Hint=
[frmDBProperties.lblDBOwner]
Class=TLabel
Caption=��������:
Hint=
[frmDBProperties.lblDBPages]
Class=TLabel
Caption=Allocated DB Pages:
Hint=
[frmDBProperties.lblPageSize]
Class=TLabel
Caption=������ ��������:
Hint=
[frmDBProperties.lblOwner]
Class=TLabel
Caption=SYSDBA
Hint=
[frmDBProperties.lblPages]
Class=TLabel
Caption=20750
Hint=
[frmDBProperties.lblPgSize]
Class=TLabel
Caption=4096
Hint=
[frmDBProperties.lvSecondaryFiles]
Class=TListView
Hint=
Columns.Count=2
Column0.Caption=Secondary Files
Column1.Caption=Start Page
[frmDBProperties.btnApply]
Class=TButton
Caption=���������
Hint=
[frmDBProperties.btnCancel]
Class=TButton
Caption=&OK
Hint=
[frmDBProperties.Button1]
Class=TButton
Caption=������
Hint=
[frmDBStatistics]
Class=TfrmDBStatistics
Caption=���������� ���� ������
Hint=
[frmDBStatistics.lblOptions]
Class=TLabel
Caption=O&ption:
Hint=
[frmDBStatistics.lblDatabaseName]
Class=TLabel
Caption=���� ������:
Hint=
[frmDBStatistics.lblDatabase]
Class=TLabel
Caption=AEKOOLMS002.FDB
Hint=AEKOOLMS002.FDB
[frmDBStatistics.btnOK]
Class=TButton
Caption=&OK
Hint=
[frmDBStatistics.btnCancel]
Class=TButton
Caption=������
Hint=
[frmTextViewer]
Class=TfrmTextViewer
Caption=����������
Hint=
[frmTextViewer.mnuFile]
Class=TMenuItem
Caption=����
Hint=
[frmTextViewer.mnuFiSaveAs]
Class=TMenuItem
Caption=��������� ...
Hint=��������� ������� ���� � ����� ������
[frmTextViewer.mnuFiPrint]
Class=TMenuItem
Caption=������
Hint=
[frmTextViewer.mnuFiExit]
Class=TMenuItem
Caption=�����
Hint=Exit this application
[frmTextViewer.mnuEdit]
Class=TMenuItem
Caption=������
Hint=
[frmTextViewer.mnuEdFind]
Class=TMenuItem
Caption=�����
Hint=������ ������
[frmTextViewer.EditCopy1]
Class=TEditCopy
Caption=����������
Hint=���������� � ����� ������
[frmTextViewer.EditCut1]
Class=TEditCut
Caption=��������
Hint=�������� � ����� ������
[frmTextViewer.EditPaste1]
Class=TEditPaste
Caption=��������
Hint=�������� �� ������ ������
[frmTextViewer.EditSelectAll1]
Class=TEditSelectAll
Caption=�������� ���
Hint=
[frmTextViewer.EditUndo1]
Class=TEditUndo
Caption=&Undo
Hint=
[frmTextViewer.EditFont]
Class=TAction
Caption=����� ...
Hint=�������� �����
[frmDBShutdown]
Class=TfrmDBShutdown
Caption=Database Shutdown
Hint=
[frmDBShutdown.lblDatabaseName]
Class=TLabel
Caption=���� ������:
Hint=
[frmDBShutdown.lblOptions]
Class=TLabel
Caption=O&ptions:
Hint=
[frmDBShutdown.stxDatabaseName]
Class=TLabel
Caption=AEKOOLMS002.FDB
Hint=AEKOOLMS002.FDB
[frmDBShutdown.btnOK]
Class=TButton
Caption=&OK
Hint=
[frmDBShutdown.btnCancel]
Class=TButton
Caption=������
Hint=
[frmMessage]
Class=TfrmMessage
Caption=����������
Hint=
[frmMessage.lblDetailMsg]
Class=TLabel
Caption=���������:
Hint=
[frmMessage.lblSummaryMsg]
Class=TLabel
Caption=������������� ���������� �� ����������.
Hint=
[frmMessage.btnOK]
Class=TButton
Caption=&OK
Hint=
[frmDBBackup]
Class=TfrmDBBackup
Caption=��������� �����������
Hint=
[frmDBBackup.lblOptions]
Class=TLabel
Caption=O&ptions:
Hint=
[frmDBBackup.gbDatabaseFile]
Class=TGroupBox
Caption= ���� ������
Hint=
[frmDBBackup.lblDatabaseServer]
Class=TLabel
Caption=������:
Hint=
[frmDBBackup.lblDatabaseAlias]
Class=TLabel
Caption=���������:
Hint=
[frmDBBackup.lblDatabaseserverName]
Class=TLabel
Caption=��������� ������
Hint=
[frmDBBackup.gbBackupFiles]
Class=TGroupBox
Caption= Backup File(s)
Hint=
[frmDBBackup.lblBackupServer]
Class=TLabel
Caption=&������:
Hint=
[frmDBBackup.lblBackupAlias]
Class=TLabel
Caption=���������:
Hint=
[frmDBBackup.btnOK]
Class=TButton
Caption=&OK
Hint=
[frmDBBackup.btnCancel]
Class=TButton
Caption=������
Hint=
[frmMain.actDatabaseBackup]
Class=TAction
Caption=��������� �����������
Hint=��������� ��������� ����������� ���� ������
[frmDBRestore]
Class=TfrmDBRestore
Caption=�������������� ��
Hint=
[frmDBRestore.lblOptions]
Class=TLabel
Caption=O&ptions:
Hint=
[frmDBRestore.gbDatabaseFiles]
Class=TGroupBox
Caption= ���� ������
Hint=
[frmDBRestore.lblDestinationServer]
Class=TLabel
Caption=������:
Hint=
[frmDBRestore.lblDBAlias]
Class=TLabel
Caption=���������:
Hint=
[frmDBRestore.gbBackupFiles]
Class=TGroupBox
Caption= Backup File(s)
Hint=
[frmDBRestore.lblBackupServer]
Class=TLabel
Caption=������:
Hint=
[frmDBRestore.lblBackupAlias]
Class=TLabel
Caption=���������:
Hint=
[frmDBRestore.lblBackupServerName]
Class=TLabel
Caption=��������� ������
Hint=
[frmDBRestore.btnOK]
Class=TButton
Caption=&OK
Hint=
[frmDBRestore.btnCancel]
Class=TButton
Caption=������
Hint=
[frmDomains]
Class=TfrmDomains
Caption=Domain - BLOB_TEXT
[frmDomains.pgObjectEditor]
Class=TPageControl
Hint=
PageCount=5
[frmDomains.pgObjectEditor.tsMain]
Class=TTabSheet
Caption=�����
[frmDomains.pgObjectEditor.tsDefault]
Class=TTabSheet
Caption=���������
[frmDomains.pgObjectEditor.tsConstraint]
Class=TTabSheet
Caption=�����������
[frmDomains.pgObjectEditor.tsDescription]
Class=TTabSheet
Caption=��������
[frmDomains.pgObjectEditor.tsDDL]
Class=TTabSheet
Caption=����������
[frmDomains.tsMain]
Class=TTabSheet
Caption=�����
[frmDomains.Label1]
Class=TLabel
Caption=�����:
[frmDomains.Label3]
Class=TLabel
Caption=���:
[frmDomains.Label4]
Class=TLabel
Caption=������:
[frmDomains.Label9]
Class=TLabel
Caption=����� ��������:
[frmDomains.Label2]
Class=TLabel
Caption=Co&llate:
[frmDomains.Label14]
Class=TLabel
Caption=��������:
[frmDomains.Label15]
Class=TLabel
Caption=&Scale:
[frmDomains.Label18]
Class=TLabel
Caption=&Sub Type:
[frmDomains.Label6]
Class=TLabel
Caption=����� ��������:
[frmDomains.Label11]
Class=TLabel
Caption=������ ��������:
[frmDomains.Label5]
Class=TLabel
Caption=Co&llate:
[frmDomains.chkColNotNull]
Class=TCheckBox
Caption=Not &Null
[frmDomains.Label10]
Class=TLabel
Caption=������:
[frmDomains.lvArray]
Class=TListView
Hint=
Columns.Count=2
Column0.Caption=������ �������
Column1.Caption=������� �������
[frmDomains.btnAddDimension]
Class=TButton
Caption=�������� ������
[frmDomains.btnDeleteDimension]
Class=TButton
Caption=������� ������
[frmDomains.btnEditDimension]
Class=TButton
Caption=�������� ������
[frmDomains.tsDefault]
Class=TTabSheet
Caption=���������
[frmDomains.tsConstraint]
Class=TTabSheet
Caption=�����������
[frmDomains.tsDescription]
Class=TTabSheet
Caption=��������
[frmDomains.tsDDL]
Class=TTabSheet
Caption=����������
[frmServerRegister]
Class=TfrmServerRegister
Caption=���������������� ������ � ������������
[frmServerRegister.gbServerInfo]
Class=TGroupBox
Caption= ���������� � �������
[frmServerRegister.lblServerName]
Class=TLabel
Caption=��� �������:
[frmServerRegister.lblProtocol]
Class=TLabel
Caption=������� ��������:
[frmServerRegister.lblServerAlias]
Class=TLabel
Caption=���������:
[frmServerRegister.Label1]
Class=TLabel
Caption=��������:
[frmServerRegister.rbLocalServer]
Class=TRadioButton
Caption=��������� ������
[frmServerRegister.rbRemoteServer]
Class=TRadioButton
Caption=��������� ������
[frmServerRegister.chkSaveAlias]
Class=TCheckBox
Caption=���������� � ����������
[frmServerRegister.gbLoginInfo]
Class=TGroupBox
Caption= Login Information
[frmServerRegister.lblUsername]
Class=TLabel
Caption=������������:
[frmServerRegister.lblPassword]
Class=TLabel
Caption=������:
[frmServerRegister.btnOK]
Class=TButton
Caption=&OK
[frmServerRegister.btnCancel]
Class=TButton
Caption=������
[frmCommDiag]
Class=TfrmCommDiag
Caption=���� ����������
[frmCommDiag.pgcDiagnostics]
Class=TPageControl
Hint=
PageCount=4
[frmCommDiag.pgcDiagnostics.tabDBConnection]
Class=TTabSheet
Caption=���������� � ����� ������
[frmCommDiag.pgcDiagnostics.tabTCPIP]
Class=TTabSheet
Caption=TCP/IP
[frmCommDiag.pgcDiagnostics.tabNetBEUI]
Class=TTabSheet
Caption=NetBEUI
[frmCommDiag.pgcDiagnostics.tabSPX]
Class=TTabSheet
Caption=SPX
[frmCommDiag.tabDBConnection]
Class=TTabSheet
Caption=DB Connection
[frmCommDiag.lblDBResults]
Class=TLabel
Caption=����������:
[frmCommDiag.gbDatabaseInfo]
Class=TGroupBox
Caption= �������� � ���� ������
[frmCommDiag.lblDatabase]
Class=TLabel
Caption=���� ������:
[frmCommDiag.lblUsername]
Class=TLabel
Caption=������������:
[frmCommDiag.lblPassword]
Class=TLabel
Caption=������:
[frmCommDiag.btnSelDB]
Class=TButton
Caption=...
Hint=����� ���� ������
[frmCommDiag.gbDBServerInfo]
Class=TGroupBox
Caption= ���������� � �������
[frmCommDiag.lblServerName]
Class=TLabel
Caption=������:
[frmCommDiag.lblProtocol]
Class=TLabel
Caption=������� ��������:
[frmCommDiag.rbLocalServer]
Class=TRadioButton
Caption=��������� ������
[frmCommDiag.rbRemoteServer]
Class=TRadioButton
Caption=��������� ������
[frmCommDiag.tabTCPIP]
Class=TTabSheet
Caption=TCP/IP
[frmCommDiag.lblWinSockResults]
Class=TLabel
Caption=����������:
[frmCommDiag.gbTCPIPServerInfo]
Class=TGroupBox
Caption= ���������� � �������
[frmCommDiag.lblWinsockServer]
Class=TLabel
Caption=����:
[frmCommDiag.lblService]
Class=TLabel
Caption=������:
[frmCommDiag.tabNetBEUI]
Class=TTabSheet
Caption=NetBEUI
[frmCommDiag.lblNetBeuiResults]
Class=TLabel
Caption=����������:
[frmCommDiag.gbNetBEUIServerInfo]
Class=TGroupBox
Caption= ���������� � �������
[frmCommDiag.lblNetBEUIServer]
Class=TLabel
Caption=��� �������:
[frmCommDiag.tabSPX]
Class=TTabSheet
Caption=SPX
[frmCommDiag.lblSPXResults]
Class=TLabel
Caption=����������:
[frmCommDiag.gbNovellServerInfo]
Class=TGroupBox
Caption= ���������� � �������
[frmCommDiag.lblSPXServer]
Class=TLabel
Caption=��� �������:
[frmCommDiag.btnTest]
Class=TButton
Caption=����
[frmCommDiag.btnCancel]
Class=TButton
Caption=������
[frmBackupAliasProperties]
Class=TfrmBackupAliasProperties
Caption=�������� Backup-����������
[frmBackupAliasProperties.lblServerName]
Class=TLabel
Caption=������:
[frmBackupAliasProperties.lblAliasName]
Class=TLabel
Caption=���������:
[frmBackupAliasProperties.lblDBServer]
Class=TLabel
Caption=������� ������ ��:
[frmBackupAliasProperties.lblDBAlias]
Class=TLabel
Caption=������� ��������� ��:
[frmBackupAliasProperties.lblServer]
Class=TLabel
Caption=��������� ������
[frmBackupAliasProperties.btnApply]
Class=TButton
Caption=���������
[frmBackupAliasProperties.btnOK]
Class=TButton
Caption=&OK
[frmBackupAliasProperties.Button1]
Class=TButton
Caption=������
[frmDBConnections]
Class=TfrmDBConnections
Caption=���������� � ��
[frmDBConnections.lvConnections]
Class=TListView
Hint=
Columns.Count=1
Column0.Caption=������������
[frmDBConnections.btnOK]
Class=TButton
Caption=&OK
[dlgWindowList]
Class=TdlgWindowList
Caption=�������� ����
[dlgWindowList.ListView1]
Class=TListView
Hint=
Columns.Count=1
Column0.Caption=����
[dlgWindowList.SwitchTo]
Class=TAction
Caption=������������� ...
[dlgWindowList.Closewindow]
Class=TAction
Caption=������� ����
[dlgWindowList.ActionCloseAll]
Class=TAction
Caption=������� ���
[frmDomains.ActionCompile]
Class=TAction
Caption=����������
[frmEditorTable]
Class=TfrmEditorTable
Caption=Table - CATEGORIE
[frmEditorTable.pgcProperties]
Class=TPageControl
Hint=
PageCount=6
[frmEditorTable.pgcProperties.tabProperties]
Class=TTabSheet
Caption=Properties
[frmEditorTable.pgcProperties.tabData]
Class=TTabSheet
Caption=������
[frmEditorTable.pgcProperties.tabMetadata]
Class=TTabSheet
Caption=����������
[frmEditorTable.pgcProperties.tabPermissions]
Class=TTabSheet
Caption=Permissions
[frmEditorTable.pgcProperties.tabDependencies]
Class=TTabSheet
Caption=�����������
[frmEditorTable.pgcProperties.tabDescription]
Class=TTabSheet
Caption=��������
[frmEditorTable.tabProperties]
Class=TTabSheet
Caption=��������
[frmEditorTable.lvTableObjects]
Class=TListView
Hint=
Columns.Count=6
Column0.Caption=���
Column1.Caption=���
Column2.Caption=���������
Column3.Caption=����������
Column4.Caption=���������
Column5.Caption=�� �����
[frmEditorTable.tabData]
Class=TTabSheet
Caption=������
[frmEditorTable.dbgData]
Class=TDBGrid
Hint=
Columns.Count=1
Column0.Caption=
[frmEditorTable.DBNavigator1]
Class=TNavButton
Hint=�������� ������
[frmEditorTable.IB_TransactionBar1]
Class=TIB_TransactionBar_Button
Hint=������� ������� ����������
[frmEditorTable.tabMetadata]
Class=TTabSheet
Caption=����������
[frmEditorTable.cbExtractData]
Class=TCheckBox
Caption=������� ������ �������
[frmEditorTable.tabPermissions]
Class=TTabSheet
Caption=�����
[frmEditorTable.lvPermissions]
Class=TListView
Hint=
Columns.Count=8
Column0.Caption=������
Column1.Caption=��������
Column2.Caption=��������
Column3.Caption=�������
Column4.Caption=���������
Column5.Caption=Reference
Column6.Caption=����������
Column7.Caption=����
[frmEditorTable.Label1]
Class=TLabel
Caption=This permission includes GRANT OPTION
[frmEditorTable.tabDependencies]
Class=TTabSheet
Caption=�����������
[frmEditorTable.rbDependent]
Class=TRadioButton
Caption=�������, ��������� �� ��������
Hint=�������� �������, ��������� �� �������� �������
[frmEditorTable.rbDependedOn]
Class=TRadioButton
Caption=�������, �� ������� ������� ������� ������
Hint=�������� �������, �� ������� ������� ������� ������
[frmEditorTable.tabDescription]
Class=TTabSheet
Caption=��������
[frmEditorTable.ShowColumns]
Class=TAction
Caption=����
Hint=�������� ���� �������
[frmEditorTable.ShowTriggers]
Class=TAction
Caption=��������
Hint=�������� �������� �������
[frmEditorTable.ShowCheckConstraints]
Class=TAction
Caption=����������� ��������
Hint=�������� ����������� ��������
[frmEditorTable.ShowIndexes]
Class=TAction
Caption=�������
Hint=�������� �������
[frmEditorTable.ShowUniqueConstraints]
Class=TAction
Caption=����������� ������������
Hint=�������� ����������� ������������ ��� ������� �������
[frmEditorTable.ShowReferentialConstraints]
Class=TAction
Caption=����������� ��������� �����������
Hint=�������� ����������� ��������� ����������� ��� ������� �������
[frmEditorTable.EditCopy1]
Class=TEditCopy
Caption=����������
Hint=���������� � ����� ������
[frmEditorTable.EditCut1]
Class=TEditCut
Caption=��������
Hint=�������� � ����� ������
[frmEditorTable.EditPaste1]
Class=TEditPaste
Caption=��������
Hint=�������� �� ������ ������
[frmEditorTable.EditSelectAll1]
Class=TEditSelectAll
Caption=�������� ���
[frmEditorTable.EditUndo1]
Class=TEditUndo
Caption=��������
[frmEditorTable.ActionNewObject]
Class=TAction
Caption=�������...
[frmEditorTable.ActionEditObject]
Class=TAction
Caption=������...
[frmEditorTable.ActionDropObject]
Class=TAction
Caption=�������
[frmEditorTable.ActionGrantSelect]
Class=TAction
Caption=Select
[frmEditorTable.ActionGrantDelete]
Class=TAction
Caption=Delete
[frmEditorTable.ActionGrantInsert]
Class=TAction
Caption=Insert
[frmEditorTable.ActionGrantUpdate]
Class=TAction
Caption=Update
[frmEditorTable.ActionGrantReference]
Class=TAction
Caption=Reference
[frmEditorTable.ActionGrantExecute]
Class=TAction
Caption=Execute
[frmEditorTable.ActionGrantAll]
Class=TAction
Caption=Grant All
[frmEditorTable.ActionRevokeAll]
Class=TAction
Caption=Revoke All
[frmEditorTable.ActionOpenTable]
Class=TAction
Caption=�������
[frmEditorTable.ActionTableFilter]
Class=TAction
Caption=������
[frmEditorTable.ActionTableFormView]
Class=TAction
Caption=�����
[frmEditorTable.ActionEmptyTable]
Class=TAction
Caption=�������� �������
[frmEditorTable.ActionTableClearFilter]
Class=TAction
Caption=�������� ������
[frmEditorTable.ActionCopyRecord]
Class=TAction
Caption=���������� ������
[frmEditorTable.NewPrimaryKey1]
Class=TMenuItem
Caption=����� ��������� ����
[frmEditorTable.Savetofile1]
Class=TMenuItem
Caption=��������� � ����...
[frmEditorTable.Loadfromfile1]
Class=TMenuItem
Caption=��������� �� �����...
[frmEditorTable.Copy2]
Class=TMenuItem
Caption=����������
[frmEditorTable.Paste2]
Class=TMenuItem
Caption=��������
[frmEditorTable.Cut2]
Class=TMenuItem
Caption=��������
[frmEditorTable.SavePictureDialog1.PreviewButton]
Class=TSpeedButton
Hint=��������
[frmEditorTable.OpenPictureDialog1.PreviewButton]
Class=TSpeedButton
Hint=��������
[frmViewEditor]
Class=TfrmViewEditor
Caption=View - NEW_VIEW
[frmViewEditor.pgObjectEditor]
Class=TPageControl
Hint=
PageCount=7
[frmViewEditor.pgObjectEditor.tsSQL]
Class=TTabSheet
Caption=View
[frmViewEditor.pgObjectEditor.tsTableView]
Class=TTabSheet
Caption=���������
[frmViewEditor.pgObjectEditor.tsDependenciesView]
Class=TTabSheet
Caption=�����������
[frmViewEditor.pgObjectEditor.tsTriggerView]
Class=TTabSheet
Caption=��������
[frmViewEditor.pgObjectEditor.tsData]
Class=TTabSheet
Caption=������
[frmViewEditor.pgObjectEditor.tsDoco]
Class=TTabSheet
Caption=��������
[frmViewEditor.pgObjectEditor.tsGrants]
Class=TTabSheet
Caption=Grants
[frmViewEditor.tsSQL]
Class=TTabSheet
Caption=View
[frmViewEditor.tsTableView]
Class=TTabSheet
Caption=���������
[frmViewEditor.lvFieldList]
Class=TListView
Hint=
Columns.Count=8
Column0.Caption=����
Column1.Caption=���
Column2.Caption=Sub Type
Column3.Caption=�����
Column4.Caption=Not Null
Column5.Caption=��������
Column6.Caption=Default Source
Column7.Caption=Computed Source
[frmViewEditor.tsDependenciesView]
Class=TTabSheet
Caption=�����������
[frmViewEditor.rbDependent]
Class=TRadioButton
Caption=�������� ��������� �������
Hint=�������� �������, ��������� �� ��������
[frmViewEditor.rbDependedOn]
Class=TRadioButton
Caption=�������� �������, �� ������� ������� �������
Hint=�������� �������, �� ������� ������� ������� ������
[frmViewEditor.tsTriggerView]
Class=TTabSheet
Caption=��������
[frmViewEditor.Label1]
Class=TLabel
Caption=Display:
[frmViewEditor.tsData]
Class=TTabSheet
Caption=������
[frmViewEditor.navDataView]
Class=TNavButton
Hint=�������� ������
[frmViewEditor.IB_TransactionBar1]
Class=TIB_TransactionBar_Button
Hint=������� ������� ����������
[frmViewEditor.btnRefresh]
Class=TSpeedButton
Caption=��������
[frmViewEditor.grdDataView]
Class=TDBGrid
Hint=
Columns.Count=1
Column0.Caption=
[frmViewEditor.tsDoco]
Class=TTabSheet
Caption=��������
[frmViewEditor.tsGrants]
Class=TTabSheet
Caption=�����
[frmViewEditor.lvPermissions]
Class=TListView
Hint=
Columns.Count=8
Column0.Caption=������
Column1.Caption=Select
Column2.Caption=Delete
Column3.Caption=Insert
Column4.Caption=Update
Column5.Caption=Reference
Column6.Caption=Execute
Column7.Caption=Member Of
[frmViewEditor.Label2]
Class=TLabel
Caption=���������� �������� GRANT OPTION
[frmViewEditor.ActionCompile]
Class=TAction
Caption=����������
[frmStoredProcedure]
Class=TfrmStoredProcedure
Caption=�������� ���������
[frmStoredProcedure.pgObjectEditor]
Class=TPageControl
Hint=
PageCount=7
[frmStoredProcedure.pgObjectEditor.tsStoredProc]
Class=TTabSheet
Caption=������
[frmStoredProcedure.pgObjectEditor.tsExecution]
Class=TTabSheet
Caption=����������
[frmStoredProcedure.pgObjectEditor.tsDocoView]
Class=TTabSheet
Caption=��������
[frmStoredProcedure.pgObjectEditor.tsDependencies]
Class=TTabSheet
Caption=�����������
[frmStoredProcedure.pgObjectEditor.tsGrants]
Class=TTabSheet
Caption=�����
[frmStoredProcedure.pgObjectEditor.tsDebuggerOutput]
Class=TTabSheet
Caption=Debugger Output
[frmStoredProcedure.pgObjectEditor.tsMetadata]
Class=TTabSheet
Caption=����������
[frmStoredProcedure.tsStoredProc]
Class=TTabSheet
Caption=�������������
[frmStoredProcedure.Label2]
Class=TLabel
Caption=���:
[frmStoredProcedure.dbgParameters]
Class=TDBGrid
Hint=
Columns.Count=3
Column0.Caption=���
Column1.Caption=��������
Column2.Caption=��� ������
[frmStoredProcedure.tsExecution]
Class=TTabSheet
Caption=����������
[frmStoredProcedure.grdResults]
Class=TDBGrid
Hint=
Columns.Count=1
Column0.Caption=
[frmStoredProcedure.dbgValues]
Class=TDBGrid
Hint=
Columns.Count=3
Column0.Caption=��������
Column1.Caption=���
Column2.Caption=��������
[frmStoredProcedure.tsDocoView]
Class=TTabSheet
Caption=��������
[frmStoredProcedure.tsDependencies]
Class=TTabSheet
Caption=�����������
[frmStoredProcedure.rbDependent]
Class=TRadioButton
Caption=�������� ��������� �������
Hint=�������� �������, ��������� �� ��������
[frmStoredProcedure.rbDependedOn]
Class=TRadioButton
Caption=�������� �������, �� ������� ������� �������
Hint=�������� �������, �� ������� ������� ������� ������
[frmStoredProcedure.tsGrants]
Class=TTabSheet
Caption=�����
[frmStoredProcedure.lvPermissions]
Class=TListView
Hint=
Columns.Count=8
Column0.Caption=������
Column1.Caption=��������
Column2.Caption=��������
Column3.Caption=�������
Column4.Caption=���������
Column5.Caption=Reference
Column6.Caption=����������
Column7.Caption=����
[frmStoredProcedure.Label1]
Class=TLabel
Caption=���������� �������� GRANT OPTION
[frmStoredProcedure.tsDebuggerOutput]
Class=TTabSheet
Caption=Debugger Output
[frmStoredProcedure.tsMetadata]
Class=TTabSheet
Caption=����������
[frmStoredProcedure.ActionExecute]
Class=TAction
Caption=���������
[frmStoredProcedure.ActionCompile]
Class=TAction
Caption=����������
[frmStoredProcedure.ActionCheckParams]
Class=TAction
Caption=Check Params
[frmStoredProcedure.ActionAddInputParam]
Class=TAction
Caption=�������� ������� ��������
[frmStoredProcedure.ActionEditParam]
Class=TAction
Caption=�������� ��������
[frmStoredProcedure.ActionDeleteParam]
Class=TAction
Caption=������� ��������
[frmStoredProcedure.ActionMoveUp]
Class=TAction
Caption=����������� �����
[frmStoredProcedure.ActionMoveDown]
Class=TAction
Caption=����������� ����
[frmStoredProcedure.ActionAddOutputParam]
Class=TAction
Caption=�������� �������� ��������
[frmUDFEditor]
Class=TfrmUDFEditor
Caption=������� ������� - new_udf
[frmUDFEditor.pgObjectEditor]
Class=TPageControl
Hint=
PageCount=3
[frmUDFEditor.pgObjectEditor.tsObject]
Class=TTabSheet
Caption=��������
[frmUDFEditor.pgObjectEditor.tsDocoView]
Class=TTabSheet
Caption=��������
[frmUDFEditor.pgObjectEditor.tsDDL]
Class=TTabSheet
Caption=����������
[frmUDFEditor.tsObject]
Class=TTabSheet
Caption=��������
[frmUDFEditor.lvUDFParams]
Class=TListView
Hint=
Columns.Count=2
Column0.Caption=��������
Column1.Caption=������ ��������
[frmUDFEditor.Label5]
Class=TLabel
Caption=��:
[frmUDFEditor.Label4]
Class=TLabel
Caption=����������:
[frmUDFEditor.Label3]
Class=TLabel
Caption=����������:
[frmUDFEditor.Label2]
Class=TLabel
Caption=����� �����:
[frmUDFEditor.Label1]
Class=TLabel
Caption=���:
[frmUDFEditor.Label6]
Class=TLabel
Caption=������� ���������:
[frmUDFEditor.tsDocoView]
Class=TTabSheet
Caption=��������
[frmUDFEditor.tsDDL]
Class=TTabSheet
Caption=����������
[frmUDFEditor.ActionCompile]
Class=TAction
Caption=����������
[frmExceptions]
Class=TfrmExceptions
Caption=���������� - USERNAME_DUPLICATE
[frmExceptions.pgObjectEditor]
Class=TPageControl
Hint=
PageCount=3
[frmExceptions.pgObjectEditor.tsObject]
Class=TTabSheet
Caption=����������
[frmExceptions.pgObjectEditor.tsDocoView]
Class=TTabSheet
Caption=��������
[frmExceptions.pgObjectEditor.tsDDL]
Class=TTabSheet
Caption=����������
[frmExceptions.tsObject]
Class=TTabSheet
Caption=����������
[frmExceptions.Label1]
Class=TLabel
Caption=��� ����������:
[frmExceptions.Label2]
Class=TLabel
Caption=����� ����������:
[frmExceptions.tsDocoView]
Class=TTabSheet
Caption=��������
[frmExceptions.tsDDL]
Class=TTabSheet
Caption=����������
[frmExceptions.ActionCompile]
Class=TAction
Caption=����������
[FrmEditorFilter]
Class=TFrmEditorFilter
Caption=Blob ������ - ����� ������
[FrmEditorFilter.objControl]
Class=TPageControl
Hint=
PageCount=3
[FrmEditorFilter.objControl.tabFilters]
Class=TTabSheet
Caption=��������
[FrmEditorFilter.objControl.tsMetadata]
Class=TTabSheet
Caption=����������
[FrmEditorFilter.objControl.tsDescription]
Class=TTabSheet
Caption=��������
[FrmEditorFilter.tabFilters]
Class=TTabSheet
Caption=��������
[FrmEditorFilter.Label11]
Class=TLabel
Caption=������:
[FrmEditorFilter.Label12]
Class=TLabel
Caption=����� �����:
[FrmEditorFilter.Label13]
Class=TLabel
Caption=&Input SubType:
[FrmEditorFilter.Label14]
Class=TLabel
Caption=&Output SubType:
[FrmEditorFilter.tsMetadata]
Class=TTabSheet
Caption=����������
[FrmEditorFilter.tsDescription]
Class=TTabSheet
Caption=��������
[FrmEditorFilter.actReset]
Class=TAction
Caption=&Reset Value
[FrmEditorFilter.ActionCompile]
Class=TAction
Caption=����������
[frmRole]
Class=TfrmRole
Caption=���� - NEW_ROLE
[frmRole.pgObjectEditor]
Class=TPageControl
Hint=
PageCount=2
[frmRole.pgObjectEditor.tsRole]
Class=TTabSheet
Caption=����
[frmRole.pgObjectEditor.tsDDLView]
Class=TTabSheet
Caption=����������
[frmRole.tsRole]
Class=TTabSheet
Caption=����
[frmRole.Label1]
Class=TLabel
Caption=����:
[frmRole.tsDDLView]
Class=TTabSheet
Caption=����������
[frmRole.ActionCompile]
Class=TAction
Caption=����������
[dlgWisql]
Class=TdlgWisql
Caption=������������� SQL
[dlgWisql.lblFileName]
Class=TLabel
[dlgWisql.pgcOutput]
Class=TPageControl
Hint=
PageCount=4
[dlgWisql.pgcOutput.tsParameters]
Class=TTabSheet
Caption=���������
[dlgWisql.pgcOutput.TabData]
Class=TTabSheet
Caption=������
[dlgWisql.pgcOutput.TabResults]
Class=TTabSheet
Caption=����
[dlgWisql.pgcOutput.TabStats]
Class=TTabSheet
Caption=����������
[dlgWisql.tsParameters]
Class=TTabSheet
Caption=���������
[dlgWisql.TabData]
Class=TTabSheet
Caption=������
[dlgWisql.dbgSQLResults]
Class=TDBGrid
Hint=
Columns.Count=1
Column0.Caption=
[dlgWisql.TabResults]
Class=TTabSheet
Caption=����
[dlgWisql.TabStats]
Class=TTabSheet
Caption=����������
[dlgWisql.lvStats]
Class=TListView
Hint=
Columns.Count=2
Column0.Caption=����������
Column1.Caption=��������
[dlgWisql.IB_TransactionBarDefault]
Class=TIB_TransactionBar_Button
Hint=������� ������� ����������
[dlgWisql.IB_TransactionBarDDL]
Class=TIB_TransactionBar_Button
Hint=������� ������� ����������
[dlgWisql.File1]
Class=TMenuItem
Caption=����
[dlgWisql.mnuEdit1]
Class=TMenuItem
Caption=������
[dlgWisql.Edit1]
Class=TMenuItem
Caption=������
[dlgWisql.Database1]
Class=TMenuItem
Caption=���� ������
[dlgWisql.Help1]
Class=TMenuItem
Caption=������
[dlgWisql.SQLReference1]
Class=TMenuItem
Caption=���������� �� SQL
[dlgWisql.DialectAction1]
Class=TAction
Caption=������� &1
[dlgWisql.DialectAction2]
Class=TAction
Caption=������� &2
[dlgWisql.DialectAction3]
Class=TAction
Caption=������� &3
[dlgWisql.QueryPrevious]
Class=TAction
Caption=�����
Hint=���������� ������
[dlgWisql.QueryNext]
Class=TAction
Caption=������
Hint=��������� ������
[dlgWisql.QueryExecute]
Class=TAction
Caption=���������
Hint=��������� ������
[dlgWisql.QueryLoadScript]
Class=TAction
Caption=��������� ������
Hint=��������� SQL ������
[dlgWisql.QuerySaveScript]
Class=TAction
Caption=��������� ������
Hint=��������� ������
[dlgWisql.QueryOptions]
Class=TAction
Caption=��������� ...
Hint=��������� �������
[dlgWisql.QuerySaveOutput]
Class=TAction
Caption=��������� ���������
Hint=��������� ��������� �������
[dlgWisql.QueryPrepare]
Class=TAction
Caption=�����������
Hint=���������� �������� ������� � ����������
[dlgWisql.EditOptions]
Class=TAction
Caption=����� ...
Hint=����� ISQL
[dlgWisql.FileClose]
Class=TAction
Caption=�������
Hint=������� ���� ISQL
[dlgWisql.EditFind]
Class=TAction
Caption=����� ...
[dlgWisql.EditFont]
Class=TAction
Caption=����� ...
[dlgWisql.EditCopy1]
Class=TEditCopy
Caption=����������
Hint=����������
[dlgWisql.EditCut1]
Class=TEditCut
Caption=��������
Hint=��������
[dlgWisql.EditPaste1]
Class=TEditPaste
Caption=��������
Hint=��������
[dlgWisql.EditSelectAll1]
Class=TEditSelectAll
Caption=�������� ���
[dlgWisql.EditUndo1]
Class=TEditUndo
Caption=������
[dlgWisql.DatabaseConnectAs]
Class=TAction
Caption=������������ ��� ...
[dlgWisql.DatabaseDisconnect]
Class=TAction
Caption=�����������
[dlgWisql.DatabaseCreate]
Class=TAction
Caption=������� �� ...
[dlgWisql.DatabaseDrop]
Class=TAction
Caption=������� �� ...
[dlgWisql.Print]
Class=TAction
Caption=������
[dlgWisql.SaveSQLHistory]
Class=TAction
Caption=��������� ������� SQL
Hint=��������� ������� SQL ��������
[dlgWisql.LoadSQLHistory]
Class=TAction
Caption=��������� ������� SQL
Hint=��������� ������� SQL ��������
[dlgWisql.QueryFetchAll]
Class=TAction
Caption=QueryFetchAll
Hint=Fetch All
[dlgWisql.NewConnection]
Class=TAction
Caption=����� ����������...
[dlgWisql.EditRedo]
Class=TAction
Caption=Redo
[frmDBConnect]
Class=TfrmDBConnect
Caption=Database Connect
[frmDBConnect.lblDatabaseName]
Class=TLabel
Caption=���� ������:
[frmDBConnect.lblUsername]
Class=TLabel
Caption=������������:
[frmDBConnect.lblPassword]
Class=TLabel
Caption=������:
[frmDBConnect.lblRole]
Class=TLabel
Caption=����:
[frmDBConnect.Label1]
Class=TLabel
Caption=������� �������:
[frmDBConnect.Label2]
Class=TLabel
Caption=����� ��������
[frmDBConnect.lblDatabase]
Class=TLabel
Caption=AEKOOLMS002.FDB
[frmDBConnect.btnConnect]
Class=TButton
Caption=����������
[frmDBConnect.btnCancel]
Class=TButton
Caption=&������
[frmDBConnect.cbCaseSensitive]
Class=TCheckBox
Caption=����������������� ��� ����
[frmMain]
Class=TfrmMain
Caption=IBOConsole
[frmOptions.Label1]
Class=TLabel
Caption=������ ������.^MThe quick brown fox jumped over the lazy dog back.
[frmSQLOptions]
Class=TfrmSQLOptions
Caption=����� SQL
[frmSQLOptions.btnApply]
Class=TButton
Caption=���������
[frmSQLOptions.btnOK]
Class=TButton
Caption=&OK
[frmSQLOptions.pgControl]
Class=TPageControl
Hint=
PageCount=2
[frmSQLOptions.pgControl.TabSheet1]
Class=TTabSheet
Caption=�����
[frmSQLOptions.pgControl.TabSheet2]
Class=TTabSheet
Caption=�������������
[frmSQLOptions.TabSheet1]
Class=TTabSheet
Caption=�����
[frmSQLOptions.cbClearInput]
Class=TCheckBox
Caption=&Clear input window on success
[frmSQLOptions.TabSheet2]
Class=TTabSheet
Caption=�������������
[frmSQLOptions.GroupBox1]
Class=TGroupBox
Caption=������� SQL
[frmSQLOptions.Label1]
Class=TLabel
Caption=NOTE:
[frmSQLOptions.cbUpdateConnect]
Class=TCheckBox
Caption=Update IBOConsole on C&onnect
[frmSQLOptions.cbUpdateCreate]
Class=TCheckBox
Caption=Update IBOConsole on C&reate
[frmSQLOptions.rgTransactions]
Class=TGroupButton
Caption=����������
Items.Count=2
Item0=����������� ��� ������
Item1=�������� ��� ������
[frmSQLOptions.btnCancel]
Class=TButton
Caption=������
;
;
;
;
[prompts]
;
;to insert a line break use ^M
;be careful to leave the same number of %s and %d in text!!
;
; Prompt used in confirm and warning dialog box defined in unit LMMessageDialog.pas
; and called in substitution of MessageDlg
;
prompt0=������������ %s
prompt1=�� ������� ������� ���� "%s".
prompt2=Not yet in Kylix
prompt3=�� ������������� ������ ������� ������� ���� ������?
prompt4=���� �������� ���������� ��� ������� ��.^M����������� ��?^M^M����� ��� ������� �������� ����������.
prompt5=������ ��������� � ����: %s
prompt6=������ �� ������
prompt7=��������� ������ �������
prompt8=%s new %s must have a name.
prompt9=%s %s name is still the default. Are you sure you wish to use the default name?
prompt10=%s %s %s ���(�) �������(�). ��������� ���������?
prompt11=�� ������������� ������ ������� ��������������� ���������� ��� ���� ���� ������?
prompt12=�� ������������� ������ ������������� �� ���� ���� ������?
prompt13=������ "������" ��� ������� ���� ������ ����� ������^M��������������� ����� � �������� ������������������ �������.^M����������?
prompt14=�� ������������� ������ ������� ��� ���� ������?
prompt15=�� ������������� ������ ������������� �� ����� �������?
prompt16=�������� �������� ���������
prompt17=�������������� Limbo-���������� ���������.
prompt18=������ ������� ������� ������ ���� ������, ��� ������ �������.
prompt19=����������� �������� ����� ������ ����� ���
prompt20=����������� ������������ ������ ����� ���
prompt21=�������� ���� ��� �������� �����
prompt22=�������� ���� ��� ����������� �����
prompt23=����������� �������� ����� ������ ����� ���
prompt24=�������� ���� ��� �������� �����
prompt25=�������� ���� ��� ������ �� ������� �����
prompt26=����������� �������� ������ ����� ���
prompt27=����������� �������� ������ ��������� ���������
prompt28=�� ������������� ������ ������� this dimension?
prompt29=������ �������� �������� �� ��� ���, ���� ������ �� ����� ��������������.
prompt30=��������� ���������� ��������?
prompt31=���������� ������ ����� ���������.
prompt32=����� ������� ������ ����� ���.
prompt33=Setting Not Null require to set a value into existing null data or subsequent backup will be invalid^M^MDo you want to continue and specify a value to fill Nulls?
prompt34=Resetting Not Null is not safe if the field is used in a unique index, subsequent backup will be invalid^M^MDo you want to continue?
prompt35=�������� ��� %s %s ���� ��������. ���������?
prompt36=�������� ���� ��� ������������� � �������
prompt37=������ ����������� ���������� �� ��� ���, ���� ������ �� ����� ��������������.
prompt38=You cannot change from Edit View until the object has been compiled.
prompt39=���������� ������� - ����������� ��� �������� �� ����� ���������� ���������.
prompt40=�������� ��������� ���� ��������. �����������������?
prompt41=����������� �������� ���������...
prompt42=�������� ��������� - %s - �����������
prompt43=�� ������������� ������ ������� %s %s ?
prompt44=������� ��� ������� ������ �� ������� %s ?
prompt45=�� ��������� ������� ��������.
prompt46=�� ������� ��� ��������.
prompt47=�� ������� ����� ����� ��� UDF.
prompt48=�� ������� ��� ���������� ��� UDF.
prompt49=�� ������ �������� �������� ��� UDF.
prompt50=�� ������������� ������ ������� ���� ��������?
prompt51=Are you sure you wish to delete this dimension?
prompt52=���� ������ ����� ���.
prompt53=����������� ��� ������.
prompt54=There is no computed by expression.
prompt55=�� ������ ������ ��������.
prompt56=�� ������� �������� ����
prompt57=Unable to parse script
prompt58=��� ��������� ����������
prompt59=������ ������� ��������� CONNECT.
prompt60=����������� ��� �������� ������� ����������
prompt61=������ ������� ��������� CREATE.
prompt62=�������� �������
prompt63=�� ������� ������� ����
prompt64=������� ���� ������ (%d) �� ������������� �������� ������� (%d).
prompt65=�� ������� ���������� ������� ������� � %d
prompt66=�� ������� ������� ���������� �������
prompt67=������ ������ '%s' �� �������
prompt68=�� ������� �������� ������ �������
prompt69=Are you sure that you want to un-register %s?
prompt70=�� ������������� ������ ������� "%s" �� ������ �����������?
prompt71=�� ������������� ������ ������� ������������: %s?
prompt72=������ �������� �������� %s. �������� ��������.
prompt73=������� %s �� ����������. ������� ���?
prompt74=������ ��� ������� ���������� � '%s'. ^M�������� ��� ������ ����� ������ ������. ^M��� ���������, ������ ������� �� ����� ��������.
prompt75=������� ����������� � %s ��������� NetBEUI.%s%s
prompt76=�������� ���������� � %s ����� %s, ����������� �����: %s %s.%S%S ���� ���������� NetBEUI �������� �������!
prompt77=������ ��� ������� ���������� � %s %s ����� ����������� �����:%s%s%s%s ���� ���������� NetBEUI �������� ��������!
prompt78=�� ������� ���������������� ���������� ���������� Netware.%s%s ���� ���������� SPX �������� ��������!
prompt79=������� ����������� � %s ��������� SPX.%s%s
prompt80=������ ��� ������� ���������� � %s %s ����� �������� SPX.%s%s ���� ���������� SPX �������� ��������!
prompt81=�������� ���������� � %s%s ����� �������� SPX. ���� ���������� SPX �������� �������!
prompt82=������ ��� ������� ���������� � %s%s ����� �������� SPX.%s%s�������� ����������� ��� ����������� ���������� ������ NetWare. %s%s���� ���������� SPX �������� ��������!
prompt83=�� ��������� ������� ������������, ��� ������ �������� �� ������������������ �� �������. %s �� ������������� ������ ������� ������������ %s?
prompt84=������� ���������� �:
prompt85=Attaching    ... Passed!
prompt86=Detaching    ... Passed!
prompt87=An Server error has occurred while detaching.
prompt88=An Server error has occurred while attaching.
prompt89=�������� ���������� � �������� ����������� ������!
prompt90=�������� ���������� � �������� ����������� ���������!
prompt91=������� ���������� � %s.
prompt92=Socket for connection obtained.
prompt93=Socket Request Failed
prompt94=Remote Socket Request Failed
prompt95=Remote Socket did not respond
prompt96=�� ������� ����������� � ������ '%s',
prompt97=����� ���� %s. ��� ������:
prompt98=����������� ���������� � ������ '%s',
prompt99=����� ���� %s
prompt100=���� ���������� ����� TCP/IP �������� �������!
prompt101=���� ���������� ����� TCP/IP �������� ��������!
prompt102=Pinging %s [%s] with %d bytes of data:
prompt103=%d bytes from %s: icmp_seq=%d ttl=%d time%s%d ms
prompt104=Critical connection error
prompt105=�� ������ �������� ���������� � ������ ����� %s
prompt106=  Host Site: %s
prompt107=� ��������� limbo
prompt108=������������
prompt109=��������
prompt110=� ����������� ���������
prompt111=  ���������� %d %s.
prompt112=  Remote Site: %s
prompt113=  ���� � ��: %s
prompt114=��������������� ��������: %s
prompt115=Please select an item from the Transactions tab.
prompt116=����������� ���������� %s
prompt117=Select a transaction for information about that transaction.
prompt118=Secondary files unavailable.
prompt119=�������� ���� ������ ����������.
prompt120=�������� ��� ������� ������ (Sweep Interval) ������ ���� � �������� �� %d �� %d.
prompt121=������ �������� �������� ���� ������ read-only.
prompt122=Null must be "NULL" or empty
prompt123=������ ������������� NULL
prompt124=����� �������� ������� %s �� ����� ����������!^M����������?
prompt125=������� �������� ��������
prompt126=������ ������������ ��� ����������������� InterBase ������ ����, ��� 6.0
;
;
[error_messages]
; Heading un message box used to show errors, unit frmuMessage.pas
;
;Warning:
;localize only the right side
;do not localize and leave case as is on the left side
;
;
ERR_SYSTEM_INIT=������ �������������.
ERR_USERNAME=�������� ��� ������������.
ERR_PASSWORD=�������� ������.
ERR_PASSWORD_MISSMATCH=������ �� ������������� ������, ���������� ��� �������������.
ERR_ADD_USER=�� ������� �������� ������������.
ERR_MODIFY_USER=�� ������� �������� ���� ������������.
ERR_DELETE_USER=�� ������� ������� ������������.
ERR_GET_USERS=�� ������� �������� ������ �������������.
ERR_GET_USER_INFO=�� ������� �������� ���������� � ������������.
ERR_SOURCE_DB=�������� ��� �������� ���� ������.
ERR_DESTINATION_DB=Invalid destination database name. Please enter a valid database name.
ERR_SAME_SOURCE_DESTINATION=The source and destination must be different.
ERR_DB_FILE=�������� ��� ����� ���� ������ ��� ���� �� ����������.
ERR_SERVER_NAME=�������� ��� �������.
ERR_PROTOCOL=�������� ������� ��������. �������� �������� �� ������.
ERR_BACKUP_DB=��������� ����������� ��������� ��������.
ERR_RESTORE_DB=�������������� �� ��������� ����� ��������� ��������.
ERR_GET_TABLES=�� ������� �������� ������ ������.
ERR_GET_VIEWS=�� ������� �������� ������ �������������.
ERR_SERVICE=�������� ������. �������� ������ �� ������.
ERR_NUMERIC_VALUE=�������� ������������� ��������.
ERR_GET_TABLE_DATA=�� ������� �������� ������.
ERR_DB_ALIAS=�������� ��������� ���� ������.
ERR_GET_ROLES=�� ������� �������� ������ �����.
ERR_SERVER_LOGIN=������ ����������� �� �������.
ERR_DB_CONNECT=������ ���������� � ����� ������.
ERR_DB_DISCONNECT=������ ���������� �� ���� ������.
ERR_GET_PROCEDURES=�� ������� �������� ������ ��������.
ERR_GET_FUNCTIONS=�� ������� �������� ������ �������.
ERR_GET_GENERATORS=�� ������� �������� ������ �����������.
ERR_GET_EXCEPTIONS=�� ������� �������� ������ ����������.
ERR_GET_BLOB_FILTERS=�� ������� �������� ������ BLOB-��������.
ERR_GET_COLUMNS=�� ������� �������� ������ ��������.
ERR_GET_INDICES=�� ������� �������� ������ ������ ��������.
ERR_GET_REFERENTIAL_CONST=�� ������� �������� ������ ����������� ��������� �����������.
ERR_GET_UNIQUE_CONST=�� ������� �������� ������ ����������� ������������.
ERR_GET_CHECK_CONST=�� ������� �������� ������ ����������� �������� (CHECK).
ERR_GET_TRIGGERS=�� ������� �������� ������ ���������.
ERR_GET_DDL=������ ���������� ����������.
ERR_INVALID_PROPERTY_VALUE=�������� �������� ��������.
ERR_GET_DEPENDENCIES=�� ������� �������� ���������� � ������������.
ERR_GET_DB_PROPERTIES=�� ������� �������� ���������� � ��������� ���� ������.
ERR_DB_SIZE=�������� ������ ����� ���� ������.
ERR_ISQL_ERROR=������ SQL
ERR_SERVER_SERVICE=������ ������
ERR_EXTERNAL_EDITOR=������ �������� ���������
ERR_SERVER_ALIAS=�������� ��������� �������.
ERR_BACKUP_ALIAS=�������� ��������� ������� �� ��������� �����������.
ERR_DB_SHUTDOWN=Database shutdown unsuccessful.
ERR_MODIFY_DB_PROPERTIES=�� ������� �������� �������� ���� ������.
ERR_DROP_DATABASE=������ �������� ���� ������.
ERR_FILE_OPEN=������ �������� �����.
ERR_INV_EDITOR=������� ������ ��������.
ERR_EDITOR_MISSING=������� �������� �� ������.
ERR_BAD_FORMAT=�� ������� ������� BLOB (�� ����������� ������).
ERR_INV_DIALECT=�� ������� �������� ������� �������.
ERR_FOPEN=������ �������� �����.
ERR_TEXT_NOT_FOUND=������ �� �������.
ERR_PRINT=�� ������� ����������� ������. ��������� � ���������� ��������.
ERR_NO_PATH=�� ������ ���� ��� ����� ��������� ����� ��� ���� ������.
ERR_NO_FILES=�� ������� ����� ��� �����������/��������������.
ERR_GET_DOMAINS=�� ������� �������� ������ �������.
ERR_EXT_TOOL_ERROR=�� ������� ��������� ������� ���������
ERR_PROPERTIES=�� ������� �������� �������� �������
ERR_ALIAS_EXISTS=�������� ���������.  ���� ��������� ��� ����������.
ERR_CANNOT_START_LOCALIB=�� ������� ��������� ��������� Interbase.
ERR_SERVER_REGISTER=������ ��� ������� ����������� �������.
ERR_SERVER_UNREGISTER=������ ��� ������� �������� ��������������� ���������� � �������.
ERR_DATABASE_REGISTER=������ ��� ������� ����������� ���� ������.
ERR_DATABASE_UNREGISTER=������ ��� ������� �������� ��������������� ���������� � ���� ������.
ERR_DDL_EXECUTION=������ ��� ���������� ��������� DDL.
;****** Warnings ******
WAR_NO_PERMISSION=������������ ���� ��� ���� ��������.
WAR_SERVER_REGISTERED=���� ������ ��� ���������������.
WAR_DUPLICATE_DB_ALIAS=��������� ���� ������ ��� ����������.
WAR_BACKUP_FILE_REGISTERED=���� ��������� ����� ��� ���������������.
WAR_DIALECT_MISMATCH=������� ������� �� ������������� �������� ���� ������.
WAR_REMOTE_FILENAME=��������� ��� ����� �������� �������� ��� �������.'+#13#10+'��������� �������� ����� �������� �����������.
WAR_PERSISTENT_UPDATE=������ ������������� ���������� ����������.
;****** Information ******}
INF_ADD_USER_SUCCESS=������������ ������� ��������.
INF_BACKUP_DB_SUCCESS=��������� ����������� ���������.
INF_RESTORE_DB_SUCCESS=�������������� ������ ���������.
INF_NO_PENDING_TRANSACTIONS=������������� ���������� �� ����������.
INF_RESTART_SERVER=����� ��������� �������� � ����, ���������� ������������� ������.
INF_DATABASE_SHUTDOWN=Database shutdown completed successfully.
INF_DATABASE_RESTARTED=Database restart completed successfully.
INF_SQL_SCRIPT=SQL ������ ��������.
INF_DATABASE_SWEEP=������ "������" ���������.
;****** InterBase Errors ******}
isc_gbak_db_exists=����� ������������ ������������ ��, ���������� ����� Overwrite � TRUE
isc_gfix_invalid_sw=������������ �������� ��� ��������.
isc_gfix_incmp_sw=�������� ���������� ��������.
isc_gfix_retry=�� ������� ��������.
isc_gfix_retry_db=�� ������� ���� ������ ��� ��������
isc_gbak_page_size_missing=�� ������ ������ ��������.
isc_gsec_cant_open_db=�� ������� ������� ���� ������ � ����������� � ������ ������������� (security database).
isc_gsec_no_usr_name=����������� ��� ������������.^M������������ ������ ���� ������ ��� ���������� ����� ��������.
isc_gsec_err_add=����������� ������ ��� ������� ���������� ������ � ������������.
isc_gsec_err_modify=����������� ������ ��� ������� ��������� ������ � ������������.
isc_gsec_err_find_mod=����������� ������ ��� ������� ������/��������� ������ � ������������
isc_gsec_err_rec_not_found=���������� � ������������ �� �������.
isc_gsec_err_delete=����������� ������ ��� ������� �������� ������ � ������������.
isc_gsec_err_find_del=����������� ������ ��� ������� ������/�������� ������ � ������������.
isc_gsec_err_find_disp=����������� ������ ��� ������� ������/������ ������ � ������������.
isc_sys_request=����������� ������ ��� ������� ������� ���� �� �������.
;
;Warning:
;localize only the right side
;do not localize and leave case as is on the left side
;
;
[global]
;
; this are short expressions that are used in gui controls, if not supplied,
; they will display in English
;
Action=��������
Name=���
Active=�������
Allow Nulls=
Can Defer=
Character Set=���������
Collation=����������
Connections=����������
Current Value=������� ��������
Case Insensitive=�������������������
Database=���� ������
Default Value=���������
Delete Rule=
Descending=�� ��������
Description=��������
Entry=
Error=������
Fields=����
Index=Indice
Initially Deferred=
Input=����
Input/Output=����/�����
Last Accessed=
Match Option=
Member=����
Message=���������
Modified=�������
Module=������
Metadata for=���������� ���
New=�����
Output=�����
Owner=��������
objects listed=������(��)
Parameter=��������
Position=�������
Path=����
Reference Table=
Read-Only=������ ��� ������
Type=���
Unique=����������
Update Rule=
Y=Y
N=N
Yes=��
No=���
Open=�������
Form View=�����
Grid View=�������
Server=������
User=������������
Warning=��������������
Information=����������
Confirmation=�������������
Abort=��������
All=���
Cancel=������
Close=�������
Help=������
OK=OK
Retry=���������
Yes To All=�� ��� ����
No To All=��� ��� ����
Active Windows on=
File=����
Interactive SQL=������������� SQL
Rows Affected=
Not Available=�� ��������
Execution Time=����� ����������
Prepare Time=����� ����������
Starting Memory=
Current Memory=
Delta Memory=
Number of Buffers=���������� �������
Reads=�������� ������
Writes=�������� ������
Plan=����
Statement=
is unknown= �����������
Not Connected=
Client dialect=������� �������
Version=������
All Options=
Data Pages=�������� ������
Database Log=������ ��
Header Page=�������� ���������
Index Pages=�������� ��������
System Relations=
Show data for:=�������� ������ ���:
By Value=�� ��������
By Reference=�� ������
No Connection=��� ����������
Transaction=����������
Commit=����������
Rollback=��������
Unknown=�����������
In Limbo=
Multi-Database Transaction=
Fixed=
Transportable=�����������
Non-Transportable=�������������
True=��
False=���
Process=�������
Ignore=������������
None=
To Screen=�� �����
To File=� ����
Select Verbose File=
Select Database=������� ���� ������
Enabled=��������
Disabled=����������
Forced Writes=
Sweep Interval=
Database Dialect=������� ���� ������
Read Only=������ ��� ������
No input=
Metadata Only=������ ����������
Garbage Collection=���� ������
Checksums=����������� �����
Convert to Tables=�������������� � �������
Transactions in Limbo=
Verbose Output=��������� �����
Filename(s)=���(�����) �����(��)
Size(Bytes)=������ (����)
Text File=��������� ����
All files=��� �����
Format=������
Value for=�������� ���
Replace NULL with=�������� NULL
Validate Record Fragments=���������� ��������� �������
Read Only Validation=�������� � ������ Read Only
Ignore Checksum Errors=������������ ������ ����������� ����
Service started at=������� ����������
Service ended at=������� ���������
Running=�����������
Restore=������������
Ignore=������������
Database Restore=������������ ���� ������
Commit After Each Table=��������� Commit ����� ������ �������
Create Shadow Files=
Deactivate Indices=��������� �������
Validity Conditions=
Use All Space=������������ ��� ������������
Pages=��������
;
;
;
[node_articles]
; As Italians knows (like I am), there are some language that don't have
; undefined gender, in Italian everything is male or female, whe don't have "it".
; In English can be said "the server" and "the servers", in Italian whe say
; "Il Server" and "I Servers" italian articles also have gender,
; so in Italian whe can have four forms of the same article
; single male, plural male, single female and plural female
; but the articles are more than one "il" "lo"
;
Servers=
Server=
Databases=
Database=
Backup=
Users=
User=
Certificates=
Certificate=
Domains=
Domain=
Tables=
Table=
Views=
View=
Stored Procedures=
Stored Procedure=
External Functions=
External Function=
Generators=
Generator=
Exceptions=
Exception=
Blob Filters=
Blob Filter=
Roles=
Role=
Columns=
Column=
Indexes=
Index=
Referential Constraints=
Referential Constraint=
Unique Constraints=
Unique Constraint=
Check Constraints=
Check Constraint=
Triggers=
Trigger=
Server Log=
Unknown=
;
;
;
[node_types]
;
; Localize here the name of the object in main form left treeview and editor forms
; example:
;---English-- --Italian--
;Certificates=Certificati
;Certificate=Certificato
;
;
Servers=�������
Server=������
Databases=���� ������
Database=���� ������
Backup=��������� �����������
Users=������������
User=������������
Certificates=�����������
Certificate=����������
Domains=������
Domain=�����
Tables=�������
Table=�������
Views=�������������
View=�������������
Stored Procedures=�������� ���������
Stored Procedure=�������� ���������
External Functions=������� �������
External Function=������� �������
Generators=����������
Generator=���������
Exceptions=����������
Exception=����������
Blob Filters=BLOB-�������
Blob Filter=BLOB-������
Roles=����
Role=����
Columns=�������
Column=�������
Indexes=�������
Index=������
Referential Constraints=����������� ��������� �����������
Referential Constraint=����������� ��������� �����������
Unique Constraints=����������� ������������
Unique Constraint=����������� ������������
Check Constraints=����������� �������� (CHECK)
Check Constraint=����������� �������� (CHECK)
Triggers=��������
Trigger=�������
Server Log=������
Unknown=�����������


