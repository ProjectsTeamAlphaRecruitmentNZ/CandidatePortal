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
        'Response.Redirect("http://www.alphaonline.co.nz/JobsOnline/candidatelogin/login.aspx?domain=JobOnline-Candidate&OriginalURL=%2Fjobsonline%2Fcandidate&Retry=0&Timeout=0&Lockout=0")
        'End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        
        Dim strTSKey1 = Request.QueryString("strTSKey")
        Dim oTSInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Timesheets", False, "key='" + strTSKey1 & "'")

        Dim body As HtmlGenericControl = CType(Master.Master.FindControl("mainBody"), HtmlGenericControl)
        body.Attributes.Add("class", "profile")
        body.Attributes.Add("ng-app", "formController")

        WeekEnding.Text = GetValue(oTSInst, "WeekEndingDate")
        Job.Text = GetValue(oTSInst, "Job.JobTitle")
        StartDate.Text = GetValue(oTSInst, "Job.JobStartDate")
        EndDate.Text = GetValue(oTSInst, "Job.JobEndDate")
        Organisation.Text = GetValue(oTSInst, "Job.Department.Organisation.Name")
        Department.Text = GetValue(oTSInst, "Job.Department.Name")
        ReportTo1.Text = GetValue(oTSInst, "Job.ReportsTo.Person.Name.FirstName")
        ReportTo2.Text = GetValue(oTSInst, "Job.ReportsTo.Person.Name.LastName")
        Dim null = "0.0000"
        WeekTotal.Text = GetValue(oTSInst, "WeekTotal")
        If WeekTotal.Text = null Then
            WeekTotal.Text = "0"
        End If

        'MONDAY
        MondayDate.Text = GetValue(oTSInst, "MondayDate")
        MondayStart.Text = GetValue(oTSInst, "MondayStartTime")
        MondayBreakStart.Text = GetValue(oTSInst, "MondayBreakStart")
        MondayBreakFinish.Text = GetValue(oTSInst, "MondayBreakFinish")
        MondayFinish.Text = GetValue(oTSInst, "MondayFinishTime")
        MondayTotal.Text = GetValue(oTSInst, "MondayTotal")
        MondayLeave.Text = GetValue(oTSInst, "MondayLeave")
        If MondayTotal.Text = null Then
            MondayTotal.Text = "0"
        End If
        'TUESDAY
        TuesdayDate.Text = GetValue(oTSInst, "TuesdayDate")
        TuesdayStart.Text = GetValue(oTSInst, "TuesdayStartTime")
        TuesdayBreakStart.Text = GetValue(oTSInst, "TuesdayBreakStart")
        TuesdayBreakFinish.Text = GetValue(oTSInst, "TuesdayBreakFinish")
        TuesdayFinish.Text = GetValue(oTSInst, "TuesdayFinishTime")
        TuesdayTotal.Text = GetValue(oTSInst, "TuesdayTotal")
        TuesdayLeave.Text = GetValue(oTSInst, "TuesdayLeave")
        If TuesdayTotal.Text = null Then
            TuesdayTotal.Text = "0"
        End If
        'WEDNESDAY
        WednesdayDate.Text = GetValue(oTSInst, "WednesdayDate")
        WednesdayStart.Text = GetValue(oTSInst, "WednesdayStartTime")
        WednesdayBreakStart.Text = GetValue(oTSInst, "WednesdayBreakStart")
        WednesdayBreakFinish.Text = GetValue(oTSInst, "WednesdayBreakFinish")
        WednesdayFinish.Text = GetValue(oTSInst, "WednesdayFinishTime")
        WednesdayTotal.Text = GetValue(oTSInst, "WednesdayTotal")
        WednesdayLeave.Text = GetValue(oTSInst, "WednesdayLeave")
        If WednesdayTotal.Text = null Then
            WednesdayTotal.Text = "0"
        End If
        'THURSDaY
        ThursdayDate.Text = GetValue(oTSInst, "ThursdayDate")
        ThursdayStart.Text = GetValue(oTSInst, "ThursdayStartTime")
        ThursdayBreakStart.Text = GetValue(oTSInst, "ThursdayBreakStart")
        ThursdayBreakFinish.Text = GetValue(oTSInst, "ThursdayBreakFinish")
        ThursdayFinish.Text = GetValue(oTSInst, "ThursdayFinishTime")
        ThursdayTotal.Text = GetValue(oTSInst, "ThursdayTotal")
        ThursdayLeave.Text = GetValue(oTSInst, "ThursdayLeave")
        If ThursdayTotal.Text = null Then
            ThursdayTotal.Text = "0"
        End If
        'FRIDAY
        FridayDate.Text = GetValue(oTSInst, "FridayDate")
        FridayStart.Text = GetValue(oTSInst, "FridayStartTime")
        FridayBreakStart.Text = GetValue(oTSInst, "FridayBreakStart")
        FridayBreakFinish.Text = GetValue(oTSInst, "FridayBreakFinish")
        FridayFinish.Text = GetValue(oTSInst, "FridayFinishTime")
        FridayTotal.Text = GetValue(oTSInst, "FridayTotal")
        FridayLeave.Text = GetValue(oTSInst, "FridayLeave")
        If FridayTotal.Text = null Then
            FridayTotal.Text = "0"
        End If
        'SATURDAY
        SaturdayDate.Text = GetValue(oTSInst, "SaturdayDate")
        SaturdayStart.Text = GetValue(oTSInst, "SaturdayStartTime")
        SaturdayBreakStart.Text = GetValue(oTSInst, "SaturdayBreakStart")
        SaturdayBreakFinish.Text = GetValue(oTSInst, "SaturdayBreakFinish")
        SaturdayFinish.Text = GetValue(oTSInst, "SaturdayFinishTime")
        SaturdayTotal.Text = GetValue(oTSInst, "SaturdayTotal")
        SaturdayLeave.Text = GetValue(oTSInst, "SaturdayLeave")
        If SaturdayTotal.Text = null Then
            SaturdayTotal.Text = "0"
        End If
        'SUNDAY
        SundayDate.Text = GetValue(oTSInst, "SundayDate")
        SundayStart.Text = GetValue(oTSInst, "SundayStartTime")
        SundayBreakStart.Text = GetValue(oTSInst, "SundayBreakStart")
        SundayBreakFinish.Text = GetValue(oTSInst, "SundayBreakFinish")
        SundayFinish.Text = GetValue(oTSInst, "SundayFinishTime")
        SundayTotal.Text = GetValue(oTSInst, "SundayTotal")
        SundayLeave.Text = GetValue(oTSInst, "SundayLeave")

        If SundayTotal.Text = null Then
            SundayTotal.Text = "0"
        End If




    End Sub
End Class