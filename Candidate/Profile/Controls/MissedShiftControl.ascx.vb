Imports StayinFront.Engine
Partial Class MissedShiftControl
    Inherits System.Web.UI.UserControl
    Public Property keyVal() As String
        Get
            Return key1.Value
        End Get
        Set(ByVal value As String)
            key1.Value = value
        End Set
    End Property
    Public Property MissedShiftKey() As String
        Get
            Return MissedShiftKeyBox.Value
        End Get
        Set(ByVal value As String)
            MissedShiftKeyBox.Value = value
        End Set
    End Property
    Public Property StartDate() As String
        Get
            Return StartDateBox1.Text
        End Get
        Set(ByVal value As String)
            StartDateBox1.Text = value
        End Set
    End Property
    Public Property EndDate() As String
        Get
            Return EndDateBox1.Text
        End Get
        Set(ByVal value As String)
            EndDateBox1.Text = value
        End Set
    End Property
    Public Property Reason() As String
        Get
            Return ReasonBox1.Text
        End Get
        Set(ByVal value As String)
            ReasonBox1.Text = value
        End Set
    End Property
    Protected Sub saveLeave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles saveMissedShift.Click
        Dim objUserName As String = Session("Username")
        Dim key As String = MissedShiftKey
        Dim existingMS As IAeClassInst


        Dim objCandidate As IAeClassInst = GetInstance(SIFConn.TheSystem.This, "Candidate", False, "Username='" & Session("Username") & "'")
        saved = False

        Dim objValidate As IAeValidate = Nothing

        Dim objTransaction As IAeTransaction = SIFConn.TheSystem.This.BeginTransaction

        Dim missedShift = objCandidate.Folders("Assignments")
        If Not objCandidate Is Nothing Then
            Dim oMSInst As IAeClassInst
            If key Is Nothing Or key = "" Then
                oMSInst = missedShift.CreateNewInstance(SIFConn.TheSystem.This.Classes("MissedShift"))
            Else
                oMSInst = GetInstance(SIFConn.TheSystem.This, "Assignment", False, "key='" & key & "'")
            End If

            Dim StartA() As String = StartDate.Split("/")
            SetValue(oMSInst, "AssignmentStartDate", StartA(0) & "/" & StartA(1) & "/" & StartA(2))
            Dim EndA() As String = EndDate.Split("/")
            SetValue(oMSInst, "AssignmentEndDate", EndA(0) & "/" & EndA(1) & "/" & EndA(2))
            SetValue(oMSInst, "Reason", Reason)

            SetJoinValue(objCandidate.Key.ToString(), oMSInst, "Candidate")

            oMSInst.Save()
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
