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
        Dim objCandidate As IAeClassInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Candidate", False, "Username='" + Session("Username") & "'")

        Dim body As HtmlGenericControl = CType(Master.Master.FindControl("mainBody"), HtmlGenericControl)
        body.Attributes.Add("class", "profile")
        body.Attributes.Add("ng-app", "formController")

        '---------------------Timesheet--------------
        Dim timesheets = objCandidate.Folders("Timesheets")
        Dim strHTML As String = ""
        Dim strHTML2 As String = ""
        For Each timesheet In timesheets
            Dim strTSKey = timesheet.key().ToString
            Dim TimesheetStage = GetValue(timesheet, "Stage")
            Dim DepartmantOrganisation = GetValue(timesheet, "Job.Department.Organisation.Name")
            Dim JobDepartmantName = GetValue(timesheet, "Job.Department.Name")
            Dim JobTitle = GetValue(timesheet, "Job.JobTitle")
            Dim WeekEndingDate = GetValue(timesheet, "WeekEndingDate")
            Dim TodaysDate = DateTime.Now
            Dim answer = TodaysDate.AddMonths(-12)
            Dim answer2 = answer.ToString("dd/MM/yyyy")

            Dim URL = "timesheet/TimesheetDetails.aspx?strTSKey=" & strTSKey
            Dim URL2 = "timesheet/TimesheetPrint.aspx?strTSKey=" & strTSKey

            If answer2 < WeekEndingDate Then
                If TimesheetStage = "In Progress" Or TimesheetStage = "Submitted by Temp" Then
                    strHTML &= "<tr class='click-to-show'>"
                    strHTML &= "<td class='col1 center'>"
                    strHTML &= "checkbox"
                    strHTML &= "</td>"
                    strHTML &= "<td class='col2'>"
                    strHTML &= "<a href= " & URL & ">" & TimesheetStage & "</a>"
                    strHTML &= "</td>"
                    strHTML &= "<td class='col3'>"
                    strHTML &= "<span>" & DepartmantOrganisation & "</span>"
                    strHTML &= "</td>"
                    strHTML &= "<td class='col4'>"
                    strHTML &= "<span>" & JobDepartmantName & "</span>"
                    strHTML &= "</td>"
                    strHTML &= "<td class='col5'>"
                    strHTML &= "<span>" & JobTitle & "</span>"
                    strHTML &= "</td>"
                    strHTML &= "<td class='col6 rel'>"
                    strHTML &= "<span>" & WeekEndingDate & "</span>"
                    strHTML &= "<span class='img-show-more--mobile'>" & "<img src='../img/arrow-down-flat.png' width='10' class='id3a'>" & "<img src='../img/arrow-up-flat.png' width='10' class='id4a'>" & "</span>"
                    strHTML &= "</td>"
                    strHTML &= "</tr>"
                Else
                    strHTML2 &= "<tr class='click-to-show'>"
                    strHTML2 &= "<td class='col1'>"
                    strHTML2 &= "<a href=" & URL2 & ">" & TimesheetStage & "</a>"
                    strHTML2 &= "</td>"
                    strHTML2 &= "<td class='col2'>"
                    strHTML2 &= "<span>" & DepartmantOrganisation & "</span>"
                    strHTML2 &= "</td>"
                    strHTML2 &= "<td class='col3'>"
                    strHTML2 &= "<span>" & JobDepartmantName & "</span>"
                    strHTML2 &= "</td>"
                    strHTML2 &= "<td class='col4'>"
                    strHTML2 &= "<span>" & JobTitle & "</span>"
                    strHTML2 &= "</td>"
                    strHTML2 &= "<td class='col6 rel'>"
                    strHTML2 &= "<span>" & WeekEndingDate & "</span>"
                    strHTML2 &= "<span class='img-show-more--mobile'>" & "<img src='../img/arrow-down-flat.png' width='10' class='id3a'>" & "<img src='../img/arrow-up-flat.png' width='10' class='id4a'>" & "</span>"
                    strHTML2 &= "</td>"
                    strHTML2 &= "</tr>"
                End If
            End If
        Next
        CandidateTimesheets.Text = strHTML
        CandidateComfirmedTimesheets.Text = strHTML2

    End Sub

End Class