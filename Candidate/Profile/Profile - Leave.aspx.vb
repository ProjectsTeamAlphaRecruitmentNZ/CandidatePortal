Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Web.Script.Services
Imports StayinFront.Engine
Imports System.Net
Imports System.Globalization
Imports System.Object
Imports System.Web.UI

Partial Public Class Profile1
    Inherits System.Web.UI.Page

    Protected Sub ProfileInfo1_PreInit(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreInit

    End Sub

    Protected Sub ProfileInfo1_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        'If Session("Username") Is Nothing Then
        'Response.Redirect("http://localhost/candidateportal_1.0/portal1.3/portal_1.3/login.aspx?domain=portal_1.3&OriginalURL=%2Fportal_1.3%2F&Retry=0&Timeout=0&Lockout=0")
        'End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim objCandidate As IAeClassInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Candidate", False, "Username='" + Session("Username") & "'")

        Dim body As HtmlGenericControl = CType(Master.Master.FindControl("mainBody"), HtmlGenericControl)
        body.Attributes.Add("class", "profile")
        body.Attributes.Add("ng-app", "formController")

        '---------------------Leave--------------
        Dim assignmentLeave = objCandidate.Folders("Assignments").Scan("IsKindOf('Leave')")

        Dim i = 1
        For Each assignment In assignmentLeave

            Dim LeaveTypeName = GetValue(assignment, "LeaveType")
            Dim AddedOn = GetValue(assignment, "stdRecordStamp.WhenAdd")
            Dim AssignmentStartDate = GetValue(assignment, "AssignmentStartDate")
            Dim AssignmentEndDate = GetValue(assignment, "AssignmentEndDate")
            Dim PayLeave
            Dim Hours = GetValue(assignment, "Quantity")
            'Dim hCheck = Convert.ToInt32(Convert.ToDecimal(Hours))
            If Hours IsNot Nothing Then
                PayLeave = "Yes"
            Else
                PayLeave = "No"
            End If

            Dim Reason = GetValue(assignment, "Reason")


            Dim LeaveRow As New TableRow()
            Dim cellAddedOn As New TableCell()
            Dim cellStartDate As New TableCell()
            Dim cellEndDate As New TableCell()
            Dim cellPayed As New TableCell()
            Dim cellHours As New TableCell()
            Dim cellReason As New TableCell()

            cellAddedOn.Text = AddedOn
            cellStartDate.Text = AssignmentStartDate
            cellEndDate.Text = AssignmentEndDate
            cellPayed.Text = PayLeave
            cellHours.Text = Hours
            cellReason.Text = Reason

            LeaveRow.Cells.Add(cellAddedOn)
            LeaveRow.Cells.Add(cellStartDate)
            LeaveRow.Cells.Add(cellEndDate)
            LeaveRow.Cells.Add(cellPayed)
            LeaveRow.Cells.Add(cellHours)
            LeaveRow.Cells.Add(cellReason)
            LeaveRow.Attributes("type") = "button"
            LeaveRow.Attributes("data-toggle") = "modal"
            LeaveRow.Attributes("data-target") = "#addLeave" & i

            '---------------------- Add Leave control ---------------
            Dim leaveControl
            leaveControl = LoadControl("~/Profile/Controls/LeaveControl.ascx")
            leaveControl.keyVal = i
            leaveControl.LeaveKey = assignment.Key
            'leaveControl.LeaveType = LeaveTypeName
            ''assignment
            leaveControl.StartDate = AssignmentStartDate
            leaveControl.EndDate = AssignmentEndDate
            leaveControl.Reason = GetValue(assignment, "Reason")
            leaveControl.PayLeave = PayLeave
            leaveControl.PaidHours = GetValue(assignment, "Quantity")

            If LeaveTypeName = "Annual Leave" Then
                TableAnnualLeave.Rows.Add(LeaveRow)
                AnnualLeaveModals.Controls.Add(leaveControl)
            ElseIf LeaveTypeName = "Sick Leave" Then
                TableSickLeave.Rows.Add(LeaveRow)
                SickLeaveModals.Controls.Add(leaveControl)
            ElseIf LeaveTypeName = "ACC Leave" Then
                TableACCLeave.Rows.Add(LeaveRow)
                ACCLeaveModals.Controls.Add(leaveControl)
            ElseIf LeaveTypeName = "Bereavement Leave" Then
                TableBereavementLeave.Rows.Add(LeaveRow)
                BereavementLeaveModals.Controls.Add(leaveControl)
            End If
            i = i + 1
        Next

        Dim assignmentMissedShift = objCandidate.Folders("Assignments").Scan("IsKindOf('MissedShift')")

        Dim a = 1
        For Each assignment In assignmentMissedShift

            Dim LeaveTypeName = GetValue(assignment, "LeaveType")
            Dim AddedOn = GetValue(assignment, "stdRecordStamp.WhenAdd")
            Dim AssignmentStartDate = GetValue(assignment, "AssignmentStartDate")
            Dim AssignmentEndDate = GetValue(assignment, "AssignmentEndDate")
            Dim Reason = GetValue(assignment, "Reason")


            Dim MissedShiftRow As New TableRow()
            Dim cellAddedOn As New TableCell()
            Dim cellStartDate As New TableCell()
            Dim cellEndDate As New TableCell()
            Dim cellReason As New TableCell()

            cellAddedOn.Text = AddedOn
            cellStartDate.Text = AssignmentStartDate
            cellEndDate.Text = AssignmentEndDate
            cellReason.Text = Reason

            MissedShiftRow.Cells.Add(cellAddedOn)
            MissedShiftRow.Cells.Add(cellStartDate)
            MissedShiftRow.Cells.Add(cellEndDate)
            MissedShiftRow.Cells.Add(cellReason)
            MissedShiftRow.Attributes("type") = "button"
            MissedShiftRow.Attributes("data-toggle") = "modal"
            MissedShiftRow.Attributes("data-target") = "#addMissedShift" & a

            '---------------------- Add Leave control ---------------
            Dim missedShiftControl
            missedShiftControl = LoadControl("~/Profile/Controls/MissedShiftControl.ascx")
            missedShiftControl.keyVal = a
            missedShiftControl.MissedShiftKey = assignment.Key
            missedShiftControl.StartDate = AssignmentStartDate
            missedShiftControl.EndDate = AssignmentEndDate
            missedShiftControl.Reason = Reason

            TableMissedShift.Rows.Add(MissedShiftRow)
            MissedShiftModals.Controls.Add(missedShiftControl)
            a = a + 1
        Next
    End Sub
End Class