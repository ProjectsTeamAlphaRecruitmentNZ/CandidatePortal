Imports StayinFront.Engine

Partial Public Class QualificationsControls
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
    Public Property Degree() As String
        Get
            Return DegreeField.Text
        End Get
        Set(ByVal value As String)
            DegreeField.Text = value
        End Set
    End Property
    Public Property Description() As String
        Get
            Return DescriptionField.Text
        End Get
        Set(ByVal value As String)
            DescriptionField.Text = value
        End Set
    End Property
    Public Property Field() As String
        Get
            Return FieldField.Text
        End Get
        Set(ByVal value As String)
            FieldField.Text = value
        End Set
    End Property
    Public Property School() As String
        Get
            Return SchoolField.Text
        End Get
        Set(ByVal value As String)
            SchoolField.Text = value
        End Set
    End Property
    Public Property FromYear() As String
        Get
            Return FromYearField.Value
        End Get
        Set(ByVal value As String)
            FromYearField.Value = value
        End Set
    End Property
    Public Property ToYear() As String
        Get
            Return ToYearField.Value
        End Get
        Set(ByVal value As String)
            ToYearField.Value = value
            'ToYearField.SelectedValue = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        Dim i As Integer
        ToYearField.Items.Add(" ")
        FromYearField.Items.Add(" ")
        For i = DateTime.Now.Year - 50 To DateTime.Now.Year + 10
            FromYearField.Items.Add(i.ToString())
            ToYearField.Items.Add(i.ToString())
        Next i
    End Sub


    Public Sub updateQualifications_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles updateQualification.Click

        Dim objUserName As String = Session("Username")
        Dim key As String = keyVal
        Dim objCandidate As IAeClassInst = GetInstance(SIFConn.TheSystem.This, "Candidate", False, "Username='" & Session("Username") & "'")
        saved = False
        Dim objValidate As IAeValidate = Nothing
        Dim existingRef As IAeClassInst

        existingRef = GetInstance(SIFConn.TheSystem.This, "CandidateQualification", False, "key='" & key & "'")

        Dim objTransaction As IAeTransaction = SIFConn.TheSystem.This.BeginTransaction
        Dim objFolders As IAeFolders = SIFConn.TheSystem.This.Folders

        Dim unavTime = objCandidate.Folders("CandidateQualifications")
        If Not objCandidate Is Nothing Then
            Dim oUnRefInst As IAeClassInst
            oUnRefInst = existingRef
            SetValue(oUnRefInst, "Degree", Degree)
            SetValue(oUnRefInst, "Field", Field)
            SetValue(oUnRefInst, "SchoolName", School)
            SetValue(oUnRefInst, "Description", Description)
            SetValue(oUnRefInst, "FromYear", FromYear)
            SetValue(oUnRefInst, "ToYear", ToYear)

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