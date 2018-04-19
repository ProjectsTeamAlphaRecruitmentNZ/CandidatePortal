Imports StayinFront.Engine
Partial Class ExpensesControl
    Inherits System.Web.UI.UserControl
    Public Property ExpKey() As String
        Get
            Return ExpKeyBox.Value
        End Get
        Set(ByVal value As String)
            ExpKeyBox.Value = value
        End Set
    End Property
    Public Property keyVal() As String
        Get
            Return key.Value
        End Get
        Set(ByVal value As String)
            key.Value = value
        End Set
    End Property
    Public Property ExpDate() As String
        Get
            Return ExpDateBox.Text
        End Get
        Set(ByVal value As String)
            ExpDateBox.Text = value
        End Set
    End Property
    Public Property Vendor() As String
        Get
            Return VendorBox.Text
        End Get
        Set(ByVal value As String)
            VendorBox.Text = value
        End Set
    End Property
    Public Property Assignment() As String
        Get
            Return JobBox.SelectedValue
        End Get
        Set(ByVal value As String)
            JobBox.SelectedValue = value
        End Set
    End Property
    Public Property Amount() As String
        Get
            Return AmountBox.Text
        End Get
        Set(ByVal value As String)
            AmountBox.Text = value
        End Set
    End Property
    Public Property Comment() As String
        Get
            Return CommentBox.Text
        End Get
        Set(ByVal value As String)
            CommentBox.Text = value
        End Set
    End Property
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        JobAssignDS.DataBind()


    End Sub

    Protected Sub saveExp_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles saveExp.Click
        Dim objUserName As String = Session("Username")
        Dim key As String = ExpKey

        Dim objCandidate As IAeClassInst = GetInstance(SIFConn.TheSystem.This, "Candidate", False, "Username='" & Session("Username") & "'")
        saved = False

        Dim objValidate As IAeValidate = Nothing

        Dim objTransaction As IAeTransaction = SIFConn.TheSystem.This.BeginTransaction

        Dim expenses = objCandidate.Folders("CandidateExpenses")
        If Not objCandidate Is Nothing Then
            Dim oExpInst As IAeClassInst
            Dim JobInst As IAeClassInst
            Dim dateStr() As String
            If key Is Nothing Or key = "" Then
                oExpInst = expenses.CreateNewInstance(SIFConn.TheSystem.This.Classes("CandidateExpense"))
            Else
                oExpInst = GetInstance(SIFConn.TheSystem.This, "CandidateExpense", False, "key='" & key & "'")

            End If
            dateStr = ExpDate.Split("/")
            SetValue(oExpInst, "ClaimedDate", dateStr(0) & "/" & dateStr(1) & "/" & dateStr(2))

            SetValue(oExpInst, "SupplierName", Vendor)
            JobInst = GetInstance(SIFConn.TheSystem.This, "JobAssignments", False, "key='" & Assignment & "'")

            SetValue(oExpInst, "ExpenseAmount", Amount)
            SetValue(oExpInst, "Description", Comment)
            ''----Upload Photo
            'If photoUpload.PostedFile Is Nothing OrElse String.IsNullOrEmpty(photoUpload.PostedFile.FileName) OrElse photoUpload.PostedFile.InputStream Is Nothing Then
            'Else
            '    Dim extension1 As String = System.IO.Path.GetExtension(photoUpload.PostedFile.FileName).ToLower()
            '    Dim mimeType1 As String = Nothing
            '    Select Case extension1
            '        Case ".jpeg"
            '            mimeType1 = "image/jpeg"
            '        Case ".jpg"
            '            mimeType1 = "image/jpg"
            '        Case ".bmp"
            '            mimeType1 = "image/bmp"
            '        Case ".png"
            '            mimeType1 = "image/png"
            '        Case ".tiff"
            '            mimeType1 = "image/tiff"
            '        Case Else
            '            'Invalid file type upload
            '            lblPhotoUpload.Text = "Not a valid file format. File extensions allowed: .jpg, .jpeg, .png, .bmp, .tiff"
            '            Exit Sub
            '    End Select
            '    Dim savePath As String = "C:\inetpub\wwwroot\savefiles\"
            '    If photoUpload.HasFile Then

            '        savePath += photoUpload.FileName
            '        photoUpload.SaveAs(savePath)
            '        lblPhotoUpload.Text = "Your file was uploaded successfully."

            '        Dim objMimeDocument As New Elk9Utils.MimeDocument
            '        objMimeDocument.LoadFromFile(savePath, False)

            '        Dim objDoc As IAeClassInst
            '        objDoc = objCandidate.Folders("Documents").CreateNewInstance
            '        SetValue(objDoc, "MimeType", photoUpload.PostedFile.ContentType)
            '        SetValue(objDoc, "Name", photoUpload.PostedFile.FileName)
            '        SetValue(objDoc, "FileSize", My.Computer.FileSystem.GetFileInfo(savePath).Length / 1024)
            '        SetValue(objDoc, "DocumentDescription", photoUpload.PostedFile.FileName)
            '        SetValue(objDoc, "CandidatePhoto", True)
            '        SetValue(objDoc, "Compressed", True)
            '        SetValue(objDoc, "Content", objMimeDocument.GetContent(True))
            '        SetValue(objDoc, "VisibleOnWeb", True)
            '        objDoc.Save()
            '        objCandidate.Save()
            '    Else
            '        lblPhotoUpload.Text = "You did not specify a file to upload."
            '    End If

            '    Dim file1 As FileInfo = New FileInfo(savePath)
            '    If file1.Exists Then
            '        file1.Delete()
            '    End If
            'End If
            ''If photoUpload.PostedFile Is Nothing OrElse String.IsNullOrEmpty(photoUpload.PostedFile.FileName) OrElse photoUpload.PostedFile.InputStream Is Nothing Then
            ''    lblPhotoUpload.Text = "Please Upload Valid file"
            ''    Exit Sub
            ''End If
            '''Make sure we are dealing with image files

            SetJoinValue(JobInst.Key.ToString(), oExpInst, "JobAssignment")
            SetJoinValue(objCandidate.Key.ToString(), oExpInst, "Candidate")

            oExpInst.Save()
            objValidate = objTransaction.Validate
            If objValidate.Status <> 3 Then
                objTransaction.Commit()
                saved = True
                Response.Redirect(HttpContext.Current.Request.Url.ToString(), True)
            Else
                objTransaction = Nothing
                saved = False
            End If
            objTransaction = Nothing
            objValidate = Nothing
        End If
    End Sub

End Class
