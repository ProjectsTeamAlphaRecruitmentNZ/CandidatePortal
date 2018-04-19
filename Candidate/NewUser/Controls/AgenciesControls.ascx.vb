Imports StayinFront.Engine

Partial Public Class AgenciesControls
    Inherits System.Web.UI.UserControl
    Public Property keyVal() As String
        Get
            Return Key.Value
        End Get
        Set(ByVal value As String)
            Key.Value = value
        End Set
    End Property
    Public Property corner() As String
        Get
            Return CornerNum.InnerHtml
        End Get
        Set(ByVal value As String)
            CornerNum.InnerHtml = value
        End Set
    End Property
    Public Property textNumber() As String
        Get
            Return TextNum.InnerHtml
        End Get
        Set(ByVal value As String)
            TextNum.InnerText = value
        End Set
    End Property
    Public Property Contact() As String
        Get
            Return name_of_contact.Text
        End Get
        Set(ByVal value As String)
            name_of_contact.Text = value
        End Set
    End Property
    Public Property Position() As String
        Get
            Return contacts_position.Text
        End Get
        Set(ByVal value As String)
            contacts_position.Text = value
        End Set
    End Property
    Public Property Company() As String
        Get
            Return company_name.Text
        End Get
        Set(ByVal value As String)
            company_name.Text = value
        End Set
    End Property
    Public Property StartDate() As String
        Get
            Return start_date.Text
        End Get
        Set(ByVal value As String)
            start_date.Text = value
        End Set
    End Property
    Public Property RoleApplied() As String
        Get
            Return role_applied.Text
        End Get
        Set(ByVal value As String)
            role_applied.Text = value
        End Set
    End Property

    Public Sub updateCompanies_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles updateCompany.Click
        Dim objUserName As String = Session("Username")
        Dim key As String = keyVal
        Dim objCandidate As IAeClassInst = GetInstance(SIFConn.TheSystem.This, "Candidate", False, "Username='" & Session("Username") & "'")
        saved = False
        Dim objValidate As IAeValidate = Nothing
        Dim existingRef As IAeClassInst

        existingRef = SIFConn.TheSystem.This.Classes("CandidateApproachedCompany").GetInstance(key)

        'existingRef = GetInstance(SIFConn.TheSystem.This, "CandidateApproachedCompany", False, "CandidateApproachedCompany='" & key & "'")

        Dim objTransaction As IAeTransaction = SIFConn.TheSystem.This.BeginTransaction
        Dim objFolders As IAeFolders = SIFConn.TheSystem.This.Folders

        Dim unavTime = objCandidate.Folders("CandidateApproachedCompanies")
        If Not objCandidate Is Nothing Then
            Dim oUnRefInst As IAeClassInst
            oUnRefInst = existingRef
            SetValue(oUnRefInst, "CompanyName", Company)
            SetValue(oUnRefInst, "ContactName", Contact)
            SetValue(oUnRefInst, "ContactPosition", Position)
            SetValue(oUnRefInst, "WhenAppoached", StartDate)
            SetValue(oUnRefInst, "Role", RoleApplied)

            SetJoinValue(objCandidate.Key.ToString(), oUnRefInst, "Candidate")
            oUnRefInst.Save()
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