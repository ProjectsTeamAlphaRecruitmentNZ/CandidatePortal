Imports StayinFront.Engine
Partial Class AgencyControl
    Inherits System.Web.UI.UserControl
    Public Property AgencyKey() As String
        Get
            Return AgencyKeyBox.Value
        End Get
        Set(ByVal value As String)
            AgencyKeyBox.Value = value
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
    Public Property NameOfContact() As String
        Get
            Return NoCField.Text
        End Get
        Set(ByVal value As String)
            NoCField.Text = value
        End Set
    End Property
    Public Property Position() As String
        Get
            Return PoCField.Text
        End Get
        Set(ByVal value As String)
            PoCField.Text = value
        End Set
    End Property
    Public Property Agency() As String
        Get
            Return AgencyField.Text
        End Get
        Set(ByVal value As String)
            AgencyField.Text = value
        End Set
    End Property
    Public Property DateApplied() As String
        Get
            Return DateField.Text

        End Get
        Set(ByVal value As String)
            DateField.Text = value
        End Set
    End Property
    Public Property Role() As String
        Get
            Return RoleField.Text
        End Get
        Set(ByVal value As String)
            RoleField.Text = value
        End Set
    End Property

    Public Sub updateAgencies_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles updateAgency.Click

        Dim objUserName As String = Session("Username")
        Dim key As String = AgencyKey
        Dim objCandidate As IAeClassInst = GetInstance(SIFConn.TheSystem.This, "Candidate", False, "Username='" & Session("Username") & "'")
        saved = False
        Dim objValidate As IAeValidate = Nothing
        Dim oUnAgInst As IAeClassInst
        Dim agencyFolder = objCandidate.Folders("CandidateApproachedCompanies")


        Dim objTransaction As IAeTransaction = SIFConn.TheSystem.This.BeginTransaction
        Dim objFolders As IAeFolders = SIFConn.TheSystem.This.Folders


        If Not objCandidate Is Nothing Then
            If key Is Nothing Or key = "" Then
                oUnAgInst = agencyFolder.CreateNewInstance
            Else
                oUnAgInst = SIFConn.TheSystem.This.Classes("CandidateApproachedCompany").GetInstance(key)
            End If

            SetValue(oUnAgInst, "CompanyName", Agency)
            SetValue(oUnAgInst, "ContactName", NameOfContact)
            SetValue(oUnAgInst, "ContactPosition", Position)
            Dim DateApp() As String = DateApplied.Split("/")
            SetValue(oUnAgInst, "WhenAppoached", DateApp(1) & "/" & DateApp(0) & "/" & DateApp(2))
            SetValue(oUnAgInst, "Role", Role)
            SetJoinValue(objCandidate.Key.ToString(), oUnAgInst, "Candidate")
            oUnAgInst.Save()
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
