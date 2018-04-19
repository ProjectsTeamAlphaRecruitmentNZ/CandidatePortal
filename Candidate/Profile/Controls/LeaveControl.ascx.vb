Imports StayinFront.Engine
Partial Class LeaveControl
    Inherits System.Web.UI.UserControl
    Public Property keyVal() As String
        Get
            Return key.Value
        End Get
        Set(ByVal value As String)
            key.Value = value
        End Set
    End Property
    Public Property LeaveKey() As String
        Get
            Return LeaveKeyBox.Value
        End Get
        Set(ByVal value As String)
            LeaveKeyBox.Value = value
        End Set
    End Property
    Public Property LeaveType() As String
        Get
            Return LeaveTypeBox.SelectedValue
        End Get
        Set(ByVal value As String)
            LeaveTypeBox.SelectedValue = value
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
    Public Property Reason() As String
        Get
            Return ReasonBox.Text
        End Get
        Set(ByVal value As String)
            ReasonBox.Text = value
        End Set
    End Property
    Public Property PayLeave() As String
        Get
            Return payed_list.SelectedValue
        End Get
        Set(ByVal value As String)
            payed_list.SelectedValue = value
        End Set
    End Property
    Public Property PaidHours() As String
        Get
            Return PaidHoursBox.Text
        End Get
        Set(ByVal value As String)
            PaidHoursBox.Text = value
        End Set
    End Property

    Protected Sub saveLeave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles saveLeave.Click
        Dim objUserName As String = Session("Username")
        Dim key As String = LeaveKey

        Dim existingLeave = GetInstance(SIFConn.TheSystem.This, "Leave", False, "key='" & key & "'")
        Dim objCandidate As IAeClassInst = GetInstance(SIFConn.TheSystem.This, "Candidate", False, "Username='" & Session("Username") & "'")
        saved = False

        Dim objValidate As IAeValidate = Nothing

        Dim objTransaction As IAeTransaction = SIFConn.TheSystem.This.BeginTransaction

        Dim leave = objCandidate.Folders("Assignments")
        If Not objCandidate Is Nothing Then
            Dim oLeaveInst As IAeClassInst
            If existingLeave Is Nothing Then
                oLeaveInst = leave.CreateNewInstance(SIFConn.TheSystem.This.classes("Leave"))
            Else
                oLeaveInst = existingLeave
            End If
            'SetValue(oLeaveInst, "LeaveType", LeaveType)
            Dim StartA() As String = StartDate.Split("/")
            SetValue(oLeaveInst, "AssignmentStartDate", StartA(1) & "/" & StartA(0) & "/" & StartA(2))
            Dim EndA() As String = EndDate.Split("/")
            SetValue(oLeaveInst, "AssignmentEndDate", EndA(1) & "/" & EndA(0) & "/" & EndA(2))
            SetValue(oLeaveInst, "Reason", Reason)
            If PayLeave = "Yes" Then
                PaidHours = PaidHours
            Else
                PaidHours = Nothing
            End If
            SetValue(oLeaveInst, "Quantity", PaidHours)

            SetJoinValue(objCandidate.Key.ToString(), oLeaveInst, "Candidate")

            oLeaveInst.Save()
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
