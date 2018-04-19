Imports System.Runtime.InteropServices
Imports Microsoft.VisualBasic
Imports StayinFront.Engine 
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Collections.Generic

Public Module StayinFrontHelper
    Public saved As Boolean = False
    'flag used to check if the page can be saved when using 'Back', 'Save' and 'Next' - to prevent duplicate instance from being created
    Public Sub SetJoinValue(ByVal Key As String, ByRef ObjInst As IAeClassInst, ByVal MemberName As String)
        'assign as join member  value to a class instnace
        Dim objMembers As IAeMembers = Nothing
        Dim objMember As IAeMember = Nothing
        Dim objFolders As IAeFolders = Nothing
        Dim objFolder As IAeFolder = Nothing
        Dim objFolderScan As IAeFolderScan = Nothing
        Dim objClass As IAeClassDef = Nothing
        Dim objClasses As IAeClassDefs = Nothing
        Dim objDefinition As IAeJoinMemberDef = Nothing
        Dim objTarget As IAeClassDef = Nothing

        Try
            objMembers = ObjInst.Members
            objMember = objMembers(MemberName)
            objClass = ObjInst.Class
            objClasses = objClass.System.Classes
            objDefinition = objMember.Definition
            objTarget = objDefinition.Target
            objMember.value = objClasses(objTarget.Name).GetInstance(Key)
        Finally
            objMembers = Nothing
            objMember = Nothing
            objFolders = Nothing
            objFolder = Nothing
            objFolderScan = Nothing
            objClass = Nothing
            objDefinition = Nothing
            objTarget = Nothing
        End Try
    End Sub

    Public Sub SetValue(ByRef ObjInst As IAeClassInst, ByVal MemberName As String, ByVal Value As Object)
        'Assign a string value to a datamember
        Dim objMembers As IAeMembers = Nothing
        Dim objMember As IAeMember = Nothing
        Dim objFolders As IAeFolders = Nothing
        Dim objFolder As IAeFolder = Nothing
        Dim objFolderScan As IAeFolderScan = Nothing
        Dim objClass As IAeClassDef = Nothing
        Dim objClasses As IAeClassDefs = Nothing
        Dim objDefinition As IAeJoinMemberDef = Nothing
        Dim objTarget As IAeClassDef = Nothing
        Dim objJoinMember As IAeJoinMember = Nothing
        Dim objMemberDef As IAeMemberDef = Nothing
        Try
            objMembers = ObjInst.Members
            objMember = objMembers(MemberName)
            objMemberDef = objMember.Definition
            Select Case objmemberdef.MemberType
                Case aeMemberType.aeDataMember, aeMemberType.aeEnumMember
                    objMember.value = Value
                Case aeMemberType.aeJoinMember
                    SetJoinValue(Value, ObjInst, MemberName)
            End Select
        Finally
            objMembers = Nothing
            objMember = Nothing
            objFolders = Nothing
            objFolder = Nothing
            objFolderScan = Nothing
            objClass = Nothing
            objDefinition = Nothing
            objMemberDef = Nothing
            objTarget = Nothing
        End Try
    End Sub

    Public Function GetValue(ByVal objClassInst As IAeClassInst, ByVal MemberName As String, Optional ByVal GetPrompt As Boolean = False, Optional ByVal DefaultValue As Object = Nothing) As Object
        'return a value from a data member, enum membr or classisntnace
        Dim objMembers As IAeMembers = Nothing
        Dim objMember As IAeMember = Nothing
        Dim objJoinMember As IAeJoinMember = Nothing
        Dim objEnumMember As IAeEnumMember = Nothing
        Dim objClassMember As IAeClassMember = Nothing
        Dim objPromptInstance As IAeClassInst = Nothing
        Try
            objMembers = objClassInst.Members
            objMember = objMembers(MemberName)
            If IsDBNull(objMember.Value) Then
                If Not DefaultValue Is Nothing Then
                    Return DefaultValue
                Else
                    GetValue = GetNothing(objMember)
                End If
            Else
                If GetPrompt Then
                    objJoinMember = TryCast(objMember, IAeJoinMember)
                    If Not objJoinMember Is Nothing Then
                        objPromptInstance = objJoinMember.Value
                    Else
                        objClassMember = objMember
                        objPromptInstance = objClassMember.Value
                    End If
                    GetValue = objPromptInstance.Prompt
                Else
                    objEnumMember = TryCast(objMember, IAeEnumMember)
                    If Not objEnumMember Is Nothing Then
                        GetValue = objEnumMember.Value.Display
                    Else
                        GetValue = objMember.value
                    End If
                End If
            End If
        Catch
            GetValue = Nothing
        Finally
            objMembers = Nothing
            objMember = Nothing
            objJoinMember = Nothing
            objClassMember = Nothing
            objPromptInstance = Nothing
        End Try
    End Function

    Public Function GetNothing(ByVal objMember As IAeMember) As Object
        Dim objDefinition As IAeMemberDef = Nothing
        Dim objDataMemberDefinition As IAeDataMemberDef = Nothing

        Try
            GetNothing = Nothing

            objDefinition = objMember.Definition
            If objDefinition.MemberType = aeMemberType.aeDataMember Then
                objDataMemberDefinition = CType(objDefinition, IAeDataMemberDef)
                Select Case objDataMemberDefinition.Type
                    Case aeDataType.aeVarChar, aeDataType.aeLongVarChar
                        GetNothing = ""
                    Case Else
                        GetNothing = Nothing
                End Select
            End If
        Catch ex As Exception
            Return Nothing
        Finally
            objDefinition = Nothing
            objDataMemberDefinition = Nothing
        End Try
    End Function

    Public Sub PopulatePickList(ByVal DDL As DropDownList, ByVal TopLevelFolder As String, ByVal MySystem As IAeSystem, Optional ByVal AddEmpty As Boolean = False, Optional ByVal filter As String = "", Optional ByVal SortOrder As String = "", Optional ByVal Prompt As String = "Description")
        'When value of Prompt is "DefaultPrompt", populate the prompts to the PickList
        DDL.Items.Clear()
        Dim cacheKey As String = TopLevelFolder & AddEmpty & filter & SortOrder & Prompt
        Dim cachedItem As Object = DDL.Page.Cache.Get(cacheKey)
        Dim dic As Dictionary(Of String, String)
        If Not cachedItem Is Nothing Then
            dic = cachedItem

            Dim key As String
            For Each key In dic.Keys
                DDL.Items.Add(New ListItem(dic.Item(key), key))
            Next
            Return
        End If

        If AddEmpty Then
            DDL.Items.Add(New ListItem("", ""))
        End If

        Dim objFolders As IAeFolders = MySystem.Folders
        Dim objFolder As IAeFolder = objFolders(TopLevelFolder)
        Dim objScan As IAeFolderScan = objFolder.Scan(filter, , , SortOrder)
        Try
            For Each objItem As IAeClassInst In objScan
                Try
                    If Prompt.ToUpper = "DefaultPrompt".ToUpper Then
                        'When value of Prompt is "DefaultPrompt", populate the prompts to the PickList
                        DDL.Items.Add(New ListItem(objItem.Prompt, objItem.Key.ToString))
                    Else
                        DDL.Items.Add(New ListItem(GetValue(objItem, Prompt), objItem.Key.ToString))
                    End If
                Finally
                    objItem = Nothing
                End Try
            Next
        Finally
            objFolders = Nothing
            objFolder = Nothing
            objScan = Nothing
        End Try

        Dim listItem As ListItem
        dic = New Dictionary(Of String, String)
        For Each listItem In DDL.Items
            dic.Add(listItem.Value, listItem.Text)
        Next

        DDL.Page.Cache.Insert(cacheKey, dic)

    End Sub

    Public Sub PopulateEnumPickList(ByVal DDL As DropDownList, ByVal EnumName As String, ByVal MySystem As IAeSystem, Optional ByVal AddEmpty As Boolean = False)
        DDL.Items.Clear()
        If AddEmpty Then
            DDL.Items.Add(New ListItem("", ""))
        End If
        Dim objEnums As IAeEnumerations = MySystem.Enumerations
        Dim objEnumeration As IAeEnumeration = objEnums(EnumName)
        Try
            For Each objEnum As IAeEnumerationValue In objEnumeration.Values
                DDL.Items.Add(New ListItem(objEnum.Display, objEnum.Value))
            Next
        Finally
            objEnums = Nothing
            objEnumeration = Nothing
        End Try
    End Sub

    Public Function GetDate(ByVal objInst As IAeClassInst, ByVal MemberName As String, ByVal isNullValue As Date) As Date
        Dim objMembers As IAeMembers = Nothing
        Dim objMember As IAeMember = Nothing
        Try
            objMembers = objInst.Members
            objMember = objMembers(MemberName)

            If Not IsDBNull(objMember) Then
                Return CDate(objMember.value)
            Else
                Return isNullValue
            End If
        Catch ex As Exception
            Return isNullValue
        Finally
            objMember = Nothing
            objMembers = Nothing
        End Try
    End Function

    Public Function GetBitValue(ByVal objInst As IAeClassInst, ByVal MemberName As String) As Boolean
        Dim objMembers As IAeMembers = Nothing
        Dim objMember As IAeMember = Nothing
        Try
            objMembers = objInst.Members
            objMember = objMembers(MemberName)
            If Not IsDBNull(objMember) Then
                Return objMember.value
            Else
                Return False
            End If
        Catch ex As Exception
            Return False
        Finally
            objMember = Nothing
            objMembers = Nothing
        End Try
    End Function
    Public Function GetJoinMemberKey(ByVal objJoinMember As IAeJoinMember) As String
        Try
            If Not IsDBNull(objJoinMember) Then
                Return objJoinMember.key.ToString()
            Else
                Return ""
            End If
        Catch ex As Exception
            Return ""
        Finally

        End Try
    End Function
    Public Function GetJoinMemberKey(ByVal objInst As IAeClassInst, ByVal MemberName As String) As String
        Dim objMembers As IAeMembers = Nothing
        Dim objMember As IAeMember = Nothing
        Try
            objMembers = objInst.Members
            objMember = objMembers(MemberName)
            If Not IsDBNull(objMember) Then
                Return objMember.key.ToString()
            Else
                Return ""
            End If
        Catch ex As Exception
            Return ""
        Finally
            objMember = Nothing
            objMembers = Nothing
        End Try
    End Function

    Public Function GetEnumValue(ByVal objClassInst As IAeClassInst, ByVal MemberName As String, Optional ByVal GetDisplay As Boolean = False) As Object
        Dim objMembers As IAeMembers = Nothing
        Dim objMember As IAeMember = Nothing
        Try
            objMembers = objClassInst.Members
            objMember = objMembers(MemberName)
            If IsDBNull(objMember.value.value) Then
                Return ""
            Else
                If GetDisplay Then
                    Return objMember.value.display
                Else
                    Return objMember.value.value
                End If

            End If
        Catch ex As Exception
            Return ""
        Finally
            objMember = Nothing
            objMembers = Nothing
        End Try
    End Function

    Public Function GetNewInstance(ByVal SystemOrInstance As Object, ByVal foldername As String) As IAeClassInst
        Dim objFolders As IAeFolders = SystemOrInstance.folders
        Dim objFolder As IAeFolder = objFolders(foldername)
        Try
            GetNewInstance = objFolder.CreateNewInstance
        Catch ex As Exception
            Return Nothing
        Finally
            objFolders = Nothing
            objFolder = Nothing
        End Try
    End Function

    Public Function GetGhostInstance(ByVal SystemOrInstance As Object, ByVal foldername As String) As IAeClassInst
        Dim objFolders As IAeFolders = SystemOrInstance.folders
        Dim objFolder As IAeFolder = objFolders(foldername)
        Try
            GetGhostInstance = objFolder.CreateGhostInstance
        Catch ex As Exception
            Return Nothing
        Finally
            objFolders = Nothing
            objFolder = Nothing
        End Try
    End Function

    Public Function GetInstance(ByVal objSystem As IAeSystem, ByVal ClassName As String, ByVal Key As String) As IAeClassInst
        Dim objClasses As IAeClassDefs = objSystem.Classes
        Dim objClass As IAeClassDef = objClasses(ClassName)
        GetInstance = objClass.GetInstance(Key)
    End Function

    Public Function GetInstance(ByVal SystemOrInstance As Object, ByVal foldername As String, ByVal CreateNew As Boolean, ByVal filter As String, Optional ByVal ScanFields As String = "", Optional ByVal SortOrder As String = "") As IAeClassInst
        GetInstance = Nothing
        Dim objFolders As IAeFolders = SystemOrInstance.folders
        Dim objFolder As IAeFolder = objFolders(foldername)
        Dim objScan As IAeFolderScan = objFolder.Scan(filter, ScanFields, 1, SortOrder)
        Try
            If objScan.EndOfScan Then
                If CreateNew Then
                    GetInstance = objFolder.CreateNewInstance()
                End If
            Else
                GetInstance = objScan.Fetch
            End If
        Finally
            objFolders = Nothing
            objFolder = Nothing
            objScan = Nothing
        End Try
    End Function

    Public Function TryDelete(ByVal AEObjectArray() As IAeClassInst) As String
        Dim objTran As IAeTransaction = Nothing
        Dim objClass As IAeClassDef = Nothing
        Dim objSystem As IAeSystem = Nothing
        Dim objValid As IAeValidate = Nothing
        Dim objResult As IAeValidation = Nothing
        Try
            TryDelete = ""

            For Each obj As IAeClassInst In AEObjectArray
                If objTran Is Nothing Then
                    objClass = obj.Class
                    objSystem = objClass.System
                    objTran = objSystem.BeginTransaction
                End If
                obj.Delete(objTran)
            Next
            objValid = objTran.Validate
            If objValid.Status <> aeValidation.ae_validError Then
                objTran.Commit()
            Else
                objResult = objValid.Result
                TryDelete = objResult.Message
                Try
                    objTran.Commit()
                Catch ex As Exception
                End Try
            End If
        Catch ex As Exception
            TryDelete = ex.ToString
        Finally
            If Not objTran Is Nothing Then
                Marshal.FinalReleaseComObject(objTran)
            End If
            objValid = Nothing
            objResult = Nothing
            objClass = Nothing
            objSystem = Nothing
        End Try
    End Function

    Public Function FindMyControl(ByVal ParentControl As Control, ByVal ControlName As String) As Control
        Dim foundControl As Control = ParentControl.FindControl(ControlName)
        If foundControl Is Nothing Then
            For Each control As Control In ParentControl.Controls
                foundControl = FindMyControl(control, ControlName)
                If foundControl IsNot Nothing Then
                    Return foundControl
                End If
            Next
        Else
            Return foundControl
        End If
        Return Nothing
    End Function

    Public Function CvtColorVB2Web(ByVal colorcode As String) As String
        Dim vcolor As Object
        vcolor = Hex(Val(colorcode))
        If Len(vcolor) < 6 Then
            vcolor = vcolor.Padleft(6, "0")
        End If
        CvtColorVB2Web = Mid(vcolor, 5, 2) & Mid(vcolor, 3, 2) & Mid(vcolor, 1, 2)
    End Function

    Public Sub SetCandidatePhotoGraph(ByVal objInst As IAeClassInst, ByVal img As Image)
        img.ImageUrl = "~/na.gif"
        Try
            If GetValue(objInst, "Photograph").length > 0 Then
                'dd the key against the filename just to make it unique,  
                img.ImageUrl = ConfigurationManager.AppSettings("IndividualPathURL") & objInst.Key & GetValue(objInst, "Photographname")
                If Not My.Computer.FileSystem.DirectoryExists(img.Page.Server.MapPath(ConfigurationManager.AppSettings("IndividualPathURL"))) Then
                    My.Computer.FileSystem.CreateDirectory(img.Page.Server.MapPath(ConfigurationManager.AppSettings("IndividualPathURL")))
                End If
                Dim strPhysicalFile As String = img.Page.Server.MapPath(ConfigurationManager.AppSettings("IndividualPathURL")) & objInst.Key & GetValue(objInst, "Photographname")
                If Not My.Computer.FileSystem.FileExists(strPhysicalFile) OrElse My.Computer.FileSystem.GetFileInfo(strPhysicalFile).CreationTime <= CDate(IIf(IsNothing(GetValue(objInst, "RecordStamp.WhenUpdate")) OrElse IsDBNull(GetValue(objInst, "RecordStamp.WhenUpdate")), Now, GetValue(objInst, "RecordStamp.WhenUpdate"))) Then
                    'Dim objMimeDocument As New Elk9Utils.MimeDocument
                    ''Write it out to the browser with headings that ensure this is a downloadable file
                    'objMimeDocument.Content = GetValue(objInst, "Photograph")
                    'objMimeDocument.Compressed = True
                    'objMimeDocument.SaveToFile(strPhysicalFile, False)
                End If
            Else
            End If
        Catch ex As Exception
            WriteLog(ex)
        End Try
    End Sub

    Public Sub PopulateTextBox(ByVal txt As TextBox, ByVal objInst As IAeClassInst, ByVal DataMemberName As String)
        'add a helper function to add the datamember length automatically 
        Dim objDMem As IAeDataMember
        Dim objDMemDef As IAeDataMemberDef
        Try
            objDMem = objInst.Members(DataMemberName)
            objDMemDef = objDMem.Definition
            txt.Text = GetValue(objInst, DataMemberName)
            Select Case objDMemDef.Type
                Case aeDataType.aeVarChar
                    If txt.TextMode = TextBoxMode.MultiLine Then
                        'for multiline we need to use javascript to handle the length
                        'use this for textarea
                        txt.Attributes.Add("mylength", objDMemDef.Length)
                    Else
                        'this will work for normal text box
                        txt.MaxLength = objDMemDef.Length
                    End If
                Case aeDataType.aeDate
                    txt.Text = Format(GetValue(objInst, DataMemberName), "dd/MM/yyyy")
            End Select
        Catch ex As Exception
            txt.Text = ""
        End Try
    End Sub

    Public Sub PopulateJoinPickList(ByVal DDL As DropDownList, ByVal objJoinMember As IAeJoinMember, Optional ByVal DoDisplay As Boolean = True, Optional ByVal Prompt As String = "Description", Optional ByVal SortOrder As String = "", Optional ByVal AddEmpty As Boolean = False, Optional ByVal intMaxChar As Integer = 0)
        Dim obj As IAeClassInst = objJoinMember.Object
        Dim objClass As IAeClassDef = obj.Class
        Dim objDef As IAeMemberDef = objJoinMember.Definition
        Dim objIAEFolder As IAeFolder = Nothing
        Dim objIAETitle As IAeTitle = Nothing
        Dim objScan As IAeFolderScan = Nothing
        Dim strPrompt As String = ""
        Try
            DDL.Items.Clear()
            objIAEFolder = objJoinMember.TargetFolder

            If AddEmpty Then
                DDL.Items.Add(New ListItem("", ""))
            End If

            objIAEFolder = objJoinMember.TargetFolder
            objScan = objIAEFolder.Scan(, , , SortOrder)
            For Each objItem As IAeClassInst In objScan
                strPrompt = GetValue(objItem, Prompt)
                If intMaxChar <> 0 And intMaxChar < strPrompt.Length Then
                    strPrompt = strPrompt.Substring(0, intMaxChar)
                End If
                DDL.Items.Add(New ListItem(strPrompt, objItem.Key.ToString))
            Next
            If DoDisplay Then
                If Not DDL.Items.FindByValue(GetJoinMemberKey(objJoinMember)) Is Nothing Then
                    DDL.SelectedValue = GetJoinMemberKey(objJoinMember)
                End If
            End If
        Finally
            objIAEFolder = Nothing
            objScan = Nothing
            objClass = Nothing
            objDef = Nothing
        End Try

    End Sub


    Public Function GetStdConDocumentPath(ByVal page As Page, ByVal MemberName As String) As String
        GetStdConDocumentPath = ""
        Dim SIFSystem As AeSystem = CType(page.Master, Object).sifsystem
        Dim Server As HttpServerUtility = page.Server
        Dim ClassMember As String = "WebDetail." & MemberName & "."
        Try
            Dim objMod As IAeClassInst = GetInstance(SIFSystem, "stdconfiguration", False, "")
            If HasBannerContent(objMod, ClassMember) Then
                GetStdConDocumentPath = ConfigurationManager.AppSettings(MemberName & "PathURL") & GetValue(objMod, ClassMember & "name")
                If Not My.Computer.FileSystem.DirectoryExists(Server.MapPath(ConfigurationManager.AppSettings(MemberName & "PathURL"))) Then
                    My.Computer.FileSystem.CreateDirectory(Server.MapPath(ConfigurationManager.AppSettings(MemberName & "PathURL")))
                End If
                Dim strPhysicalFile As String = Server.MapPath(ConfigurationManager.AppSettings(MemberName & "PathURL")) & GetValue(objMod, ClassMember & "name")
                If Not My.Computer.FileSystem.FileExists(strPhysicalFile) OrElse My.Computer.FileSystem.GetFileInfo(strPhysicalFile).CreationTime <= CDate(IIf(IsNothing(GetValue(objMod, ClassMember & "TimeStamp")) OrElse IsDBNull(GetValue(objMod, ClassMember & "TimeStamp")), Now, GetValue(objMod, ClassMember & "TimeStamp"))) Then
                    'Dim objMimeDocument As New Elk9Utils.MimeDocument
                    ''Write it out to the browser with headings that ensure this is a downloadable file
                    'objMimeDocument.Content = GetValue(objMod, ClassMember & "Content")
                    'objMimeDocument.Compressed = True
                    'objMimeDocument.SaveToFile(strPhysicalFile, False)
                End If
            Else
                'use default banner already set in markup
            End If
        Catch ex As Exception
            WriteLog(ex)
        End Try
    End Function

    Public Function HasBannerContent(ByVal objMod As IAeClassInst, ByVal ClassMember As String) As Boolean
        Return GetValue(objMod, ClassMember & "name") <> "" AndAlso GetValue(objMod, ClassMember & "Content").length > 0
    End Function

    Public Sub WriteLog(ByVal ex As Exception)
        'Helper function to write exception to file.
        Try
            If Not ex Is Nothing Then
                Dim logFileName As String = ConfigurationManager.AppSettings("LogFile")
                'just create a new file if the file size > 1M 
                Dim fi As IO.FileInfo = My.Computer.FileSystem.GetFileInfo(logFileName)
                If fi.Exists Then
                    If fi.Length > 102400 Then
                        fi.MoveTo(logFileName & Guid.NewGuid.ToString & ".txt")
                    End If
                End If
                My.Computer.FileSystem.WriteAllText(logFileName, Now.ToString & vbNewLine & ex.ToString & vbNewLine, True)
            End If
        Catch
        End Try
    End Sub

    Public Function GetPicklistKeyByCode(ByVal objJoinMember As IAeJoinMember, ByVal strFilter As String) As String
        'DESCRIPTION:Function to return a key  from an item in a folder JoinMember where filter = strFilter
        'PARAMETERS:	objJoinMember - join which we will use to get target folder
        '				strFilter - filiter to be applied to this folder
        'RETURNS:		string of a guid
        Dim strKey As String = ""
        Dim objIAEFolder As IAeFolder = Nothing
        Dim objScan As IAeFolderScan = Nothing
        Try
            objIAEFolder = objJoinMember.TargetFolder
            objScan = objIAEFolder.Scan(strFilter, , , )
            For Each objItem As IAeClassInst In objScan
                strKey = objItem.Key
            Next
        Finally
            GetPicklistKeyByCode = strKey
            objIAEFolder = Nothing
            objScan = Nothing
        End Try

    End Function

    Public Sub PopulateNumValue(ByVal ddl As DropDownList, ByVal intFrom As Integer, ByVal intTo As Integer, Optional ByVal intInterval As Integer = 1)
        'DESCRIPTION: just populate some numbers into a dropdown
        'PARAMETERS: ddl - the dropdown to populate
        '           intFrom - the value to start from
        '           intTo - the value to go to
        '           intInterval - the value to increment by
        ddl.Items.Clear()
        For x = intFrom To intTo Step intInterval
            ddl.Items.Add(New ListItem(CStr(x).PadLeft(2, "0"), x))
        Next
    End Sub
    Public Sub RedirectToRequestPage(ByVal Page As Web.UI.Page)
        Dim pageFileName As String = System.IO.Path.GetFileName(Page.Request.UrlReferrer.LocalPath).ToLower
        If pageFileName.EndsWith("login.aspx") Then
            Page.Response.Redirect("http://www.alphaonline.co.nz/JobsOnline/candidatelogin/login.aspx", False)
        Else
            Page.Response.Redirect(pageFileName, True)
        End If

    End Sub
End Module
