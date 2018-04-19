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

        '---------------------Jobs--------------
        Dim assignments = objCandidate.Folders("Assignments").Scan(, , , "AssignmentStartDate ASC")
        Dim strHTML As String = ""
        For Each assignment In assignments
            Dim Title = GetValue(assignment, "Job.JobTitle")
            If Title IsNot Nothing Then
                Dim AssignmentStartDate = GetValue(assignment, "AssignmentStartDate")
                Dim AssignmentEndDate = GetValue(assignment, "AssignmentEndDate")
                Dim Consultant1 = GetValue(assignment, "Job.Consultant.Name.FirstName")
                Dim Consultant2 = GetValue(assignment, "Job.Consultant.Name.LastName")
                Dim JobDepartmantName = GetValue(assignment, "Job.Department.Name")
                Dim DepartmantOrganisation = GetValue(assignment, "Job.Department.Organisation.Name")
                Dim DepartmantContactNumber1 = GetValue(assignment, "Job.Department.Phone.AreaCode")
                Dim DepartmantContactNumber2 = GetValue(assignment, "Job.Department.Phone.Number")
                Dim DepartmantOrganisationAddress1 = GetValue(assignment, "Job.Department.Address.City")
                Dim DepartmantOrganisationAddress2 = GetValue(assignment, "Job.Department.Address.Country.Name")
                Dim JobRate = GetValue(assignment, "Job.JobRate2")

                'Convert date
                Dim dt As DateTime = DateTime.ParseExact(AssignmentStartDate, "d", Nothing)
                Dim day As String = dt.Day.ToString()
                Dim month As String = dt.Month.ToString()
                Dim year As String = dt.Year.ToString()
                Dim xMonth As String = MonthName(month, True)

                Dim dt2 As DateTime = DateTime.ParseExact(AssignmentEndDate, "d", Nothing)
                Dim day2 As String = dt2.Day.ToString()
                Dim month2 As String = dt2.Month.ToString()
                Dim year2 As String = dt2.Year.ToString()
                Dim xMonth2 As String = MonthName(month2, True)

                Dim i = 0
                strHTML &= "<div class='job-template'>"
                strHTML &= "<div class='my-jobs-col1'>"
                strHTML &= "<h3 class='my-job-title font-italic'>" & Title & "</h3>"
                strHTML &= "<h4 class='my-job-location'>" & DepartmantOrganisation & " - " & DepartmantOrganisationAddress1 & ", " & DepartmantOrganisationAddress2 & "</h4>"
                strHTML &= "<div class='toggle-icon'>"
                strHTML &= "<div class='infoToggler'>"
                strHTML &= "<span class='font-italic'>" & "Show details" & "</span>"
                strHTML &= "<img src='../img/arrow-down-flat.png' class='toggle-icon-img'>"
                strHTML &= "<span class='font-italic hidden'>" & "Hide details" & "</span>"
                strHTML &= "<img src='../img/arrow-up-flat.png' class='toggle-icon-img hidden'>"
                strHTML &= "</div>"
                strHTML &= "</div>"
                strHTML &= "<div class='toggle-p pad-l hidden'>"
                strHTML &= "<div class='datainfo'>"
                strHTML &= "<span>" & "Consultant Name: " & "</span>"
                strHTML &= "<span class='grey-color'>" & Consultant1 & " " & Consultant2 & "</span>"
                strHTML &= "</div>"
                strHTML &= "<div class='datainfo'>"
                strHTML &= "<span>" & "Department Name: " & "</span>"
                strHTML &= "<span class='grey-color'>" & DepartmantOrganisation & " - " & JobDepartmantName & "</span>"
                strHTML &= "</div>"
                strHTML &= "<div class='datainfo'>"
                strHTML &= "<span>" & "Department Contact Number: " & "</span>"
                strHTML &= "<span class='grey-color'>" & DepartmantContactNumber1 & " " & DepartmantContactNumber2 & "</span>"
                strHTML &= "</div>"
                strHTML &= "<div class='datainfo'>"
                strHTML &= "<span>" & "Rate: " & "</span>"
                strHTML &= "<span class='grey-color'>" & JobRate & " $" & "</span>"
                strHTML &= "</div>"
                strHTML &= "</div>"
                strHTML &= "</div>"
                strHTML &= "<div class='my-jobs-col2'>"
                strHTML &= "<span class='grey-color'>" & day & " " & xMonth & " " & year & " - " & day2 & " " & xMonth2 & " " & year2 & "</span>"
                strHTML &= "</div>"
                strHTML &= "</div>"
                i = i + 1
            End If
        Next
        CandidateJobs.Text = strHTML

    End Sub

End Class