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

        '---------------------Availability--------------
        Dim assignments = objCandidate.Folders("Assignments").Scan("IsKindOf('UnavailableTime')")

        Dim i = 1
        For Each assignment In assignments
            '---------------------- Retrieve Data ---------------
            Dim Title = GetValue(assignment, "Job.JobTitle")
            Dim AssignmentStartDate = GetValue(assignment, "AssignmentStartDate")
            Dim AssignmentEndDate = GetValue(assignment, "AssignmentEndDate")
            Dim Reason = GetValue(assignment, "Reason")
            Dim AddedOn = GetValue(assignment, "stdRecordStamp.WhenAdd")
            '---------------------- Create Table ---------------
            Dim AvailRow As New TableRow()
            Dim cellAddedOn As New TableCell()
            Dim cellStartDate As New TableCell()
            Dim cellEndDate As New TableCell()
            'Dim cellStatus As New TableCell()
            Dim cellReason As New TableCell()

            cellAddedOn.Text = AddedOn
            cellStartDate.Text = AssignmentStartDate
            cellEndDate.Text = AssignmentEndDate
            cellReason.Text = Reason

            AvailRow.Cells.Add(cellAddedOn)
            AvailRow.Cells.Add(cellStartDate)
            AvailRow.Cells.Add(cellEndDate)
            AvailRow.Cells.Add(cellReason)
            AvailRow.Attributes("type") = "button"
            AvailRow.Attributes("data-toggle") = "modal"
            AvailRow.Attributes("data-target") = "#addAvailability" & i
            '---------------------- Add Availability control ---------------
            Dim availabilityControl
            availabilityControl = LoadControl("~/Profile/Controls/AvailabilityControl.ascx")
            availabilityControl.keyVal = i
            availabilityControl.UnTimeKey = assignment.Key
            availabilityControl.StartDate = AssignmentStartDate
            availabilityControl.EndDate = AssignmentEndDate
            availabilityControl.Comment = Reason

            TableAvailability.Rows.Add(AvailRow)
            AvailabilityModals.Controls.Add(availabilityControl)
            i = i + 1
        Next



    End Sub


End Class