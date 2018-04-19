Imports StayinFront.Engine
Partial Class ProfileAvailabilityControl
    Inherits System.Web.UI.UserControl
    Public Property keyVal() As String
        Get
            Return key.Value
        End Get
        Set(ByVal value As String)
            key.Value = value
        End Set
    End Property
    Public Property UnTimeKey() As String
        Get
            Return UnTimeKeyBox.Value
        End Get
        Set(ByVal value As String)
            UnTimeKeyBox.Value = value
        End Set
    End Property
    Public Property StartDate() As String
        Get
            Return StartDateBox.Text
        End Get
        Set(ByVal value As String)
            StartDateBox.Text = value
        End Set
    End Property
    Public Property EndDate() As String
        Get
            Return EndDateBox.Text
        End Get
        Set(ByVal value As String)
            EndDateBox.Text = value
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

    Protected Sub addAvailability_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles addAvailabileTime.Click
        Dim objUserName As String = Session("Username")
        Dim key As String = UnTimeKey
        Dim objCandidate As IAeClassInst = GetInstance(SIFConn.TheSystem.This, "Candidate", False, "Username='" & Session("Username") & "'")
        saved = False
        Dim objValidate As IAeValidate = Nothing
        Dim existingUnavTime As IAeClassInst

        If Not key = "" Then

            existingUnavTime = GetInstance(SIFConn.TheSystem.This, "UnavailableTime", key)
        End If
        Dim objTransaction As IAeTransaction = SIFConn.TheSystem.This.BeginTransaction
        Dim objFolders As IAeFolders = SIFConn.TheSystem.This.Folders

        Dim unavTime = objCandidate.Folders("Assignments")
        If Not objCandidate Is Nothing Then
            Dim oUnTimeInst As IAeClassInst
            If existingUnavTime Is Nothing Then
                oUnTimeInst = unavTime.CreateNewInstance(SIFConn.TheSystem.This.classes("UnavailableTime"))

            Else
                oUnTimeInst = existingUnavTime
            End If
            SetValue(oUnTimeInst, "AssignmentStartDate", StartDate)
            SetValue(oUnTimeInst, "AssignmentEndDate", EndDate)
            SetValue(oUnTimeInst, "Reason", Comment)
            SetJoinValue(objCandidate.Key.ToString(), oUnTimeInst, "Candidate")
            oUnTimeInst.Save()
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
