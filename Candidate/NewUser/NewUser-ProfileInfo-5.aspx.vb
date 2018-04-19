Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Web.Script.Services
Imports StayinFront.Engine
Imports System.Net
Imports System.Globalization
Imports System.Object
Imports System.Web.UI
Imports System.Data.SqlClient
Imports System.Data
Imports System.IO

Partial Public Class ProfileInfo5
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        Dim objFolders As IAeFolders = CType(Master.Master, Portal).SIFSystem.Folders
        'If Not Page.IsPostBack Then

        'Set the logged in User

        Dim objUserName As String = Session("Username")
            Dim objCandidate As IAeClassInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Candidate", False, "Username='" + Session("Username") & "'")
            Dim Referees As IAeFolder = objCandidate.Folders("Referees")
            Dim intReferees As Integer = Referees.Count()
            Dim strHTML As String = ""
            Dim Companies As IAeFolder = objCandidate.Folders("CandidateApproachedCompanies")
            Dim intCompanies As Integer = Companies.Count()
            Dim stHTML As String = ""

            Dim Qualifications As IAeFolder = objCandidate.Folders("CandidateQualifications")
            Dim strHTMLq As String = ""

            Session("objCandidate") = GetInstance(CType(Master.Master, Portal).SIFSystem, "Candidate", False, "Username='" + Session("Username") & "'").Key
            'Scan and fetch Skill Groups
            If Not objCandidate Is Nothing Then
                Dim count As Integer = 0
                For Each referee In Referees
                    count = count + 1
                Dim refereesControl

                Dim key = referee.key
                    Dim first_name As String = GetValue(referee, "Name.FirstName")
                    Dim last_name As String = GetValue(referee, "Name.LastName")
                    Dim land_area As String = GetValue(referee, "PhoneNumber.AreaCode")
                    Dim land_num As String = GetValue(referee, "PhoneNumber.Number")
                    Dim mobile_area As String = GetValue(referee, "mobileNumber.AreaCode")
                    Dim mobile_num As String = GetValue(referee, "mobileNumber.Number")
                    Dim emailval As String = GetValue(referee, "Emailaddress.Emailaddress")
                    Dim refereeCompany As String = GetValue(referee, "RefereeCompany")
                    Dim refereePosition As String = GetValue(referee, "RefereePosition")
                    Dim reportingRelationship As String = GetValue(referee, "RefereeRelationship")
                    Dim refereeContactTime As String = GetValue(referee, "RefereeContactTime")
                    refereesControl = LoadControl("~/NewUser/Controls/RefereesControls.ascx")
                    refereesControl.corner = count
                    refereesControl.textNumber = count
                    refereesControl.keyVal = referee.Key
                    refereesControl.FirstNames = first_name
                    refereesControl.LastNames = last_name
                    refereesControl.EmailVals = emailval
                    refereesControl.PhoneLandlines = land_area & " " & land_num
                    If refereesControl.PhoneLandlines = " " Then
                        refereesControl.PhoneLandlines = Nothing
                    End If
                    refereesControl.PhoneMobiles = mobile_area & " " & mobile_num
                    If refereesControl.PhoneMobiles = " " Then
                        refereesControl.PhoneMobiles = Nothing
                    End If
                    refereesControl.RefereeCompanys = refereeCompany
                    refereesControl.RefereePositions = refereePosition
                    refereesControl.ReportingRelationships = reportingRelationship
                    refereesControl.TimesToContacts = refereeContactTime
                    RefereeForms.Controls.Add(refereesControl)

                Next

                Dim countCompany As Integer = 0
                For Each company In Companies
                    countCompany = countCompany + 1
                Dim agenciesControl

                Dim keyComp = company.key
                    Dim company_name As String = GetValue(company, "CompanyName")
                    Dim contact_name As String = GetValue(company, "ContactName")
                    Dim contact_position As String = GetValue(company, "ContactPosition")
                    Dim start_date As String = GetValue(company, "WhenAppoached")
                    Dim applied_for As String = GetValue(company, "Role")

                    agenciesControl = LoadControl("~/NewUser/Controls/AgenciesControls.ascx")
                    agenciesControl.corner = countCompany
                    agenciesControl.textNumber = countCompany
                    agenciesControl.keyVal = keyComp
                    agenciesControl.Contact = contact_name
                    agenciesControl.Position = contact_position
                    agenciesControl.Company = company_name
                    agenciesControl.StartDate = start_date
                    agenciesControl.RoleApplied = applied_for
                    companys_fileds.Controls.Add(agenciesControl)
                Next

                Dim countQualification As Integer = 0
                For Each qualification In Qualifications
                    countQualification = countQualification + 1
                Dim qualificationsControl
                Dim keyQ = qualification.key
                    Dim degree As String = GetValue(qualification, "Degree")
                    Dim description As String = GetValue(qualification, "Description")
                    Dim field As String = GetValue(qualification, "Field")
                    Dim school As String = GetValue(qualification, "SchoolName")
                    Dim fromYear As String = GetValue(qualification, "FromYear")
                    Dim toYear As String = GetValue(qualification, "ToYear")
                    qualificationsControl = LoadControl("~/NewUser/Controls/QualificationsControls.ascx")
                    qualificationsControl.corner = countQualification
                    qualificationsControl.textNumber = countQualification
                    qualificationsControl.keyVal = keyQ
                    qualificationsControl.Degree = degree
                    qualificationsControl.Description = description
                    qualificationsControl.Field = field
                    qualificationsControl.School = school

                    qualification_fileds.Controls.Add(qualificationsControl)

                    qualificationsControl.FromYear = fromYear
                    qualificationsControl.ToYear = toYear
                Next
            UserCounter.Value = GetValue(objCandidate, "OnlineRegCounter")

        End If
        'End If
    End Sub

    <WebMethod()> Public Shared Function RemoveReferee_Click(ByVal key As String) As String
        Try
            'becasue we can't access the SIF connection object,
            'so we need to maually create a new connection using the 
            'webservice account.
            Dim cn As New SqlConnection()
            Dim da As SqlDataAdapter
            Dim dr As DataRow
            Dim cmd As SqlCommand

            Dim Connection As New SqlClient.SqlConnectionStringBuilder
            Connection.DataSource = "Omega Live"
            Connection.UserID = "sa"
            Connection.Password = "F0UREYES"
            Dim objSQlConnection = New SqlClient.SqlConnection(Connection.ConnectionString)
            Dim sqlStr As String = "DELETE FROM [Omega Live].[dbo].[Referee] WHERE [Referee] = '" + key + "'"

            cn.ConnectionString = "Server=alpha-svr07;Database=Omega Live;User Id=sa;Password=F0UREYES"
            cn.Open()
            cmd = New SqlCommand(sqlStr, cn)
            Dim result As SqlDataReader = cmd.ExecuteReader()
            cn.Close()
            Return result.RecordsAffected
        Catch ex As Exception
            Return ex.Message
        End Try
    End Function

    <WebMethod()> Public Shared Function RemoveCompany_Click(ByVal key As String) As String
        Try
            Dim cn As New SqlConnection()
            Dim da As SqlDataAdapter
            Dim dr As DataRow
            Dim cmd As SqlCommand
            Dim Connection As New SqlClient.SqlConnectionStringBuilder
            Connection.DataSource = "Omega Live"
            Connection.UserID = "sa"
            Connection.Password = "F0UREYES"
            Dim objSQlConnection = New SqlClient.SqlConnection(Connection.ConnectionString)
            Dim sqlStr As String = "DELETE FROM [Omega Live].[dbo].[CandidateApproachedCompany] WHERE [CandidateApproachedCompany] = '" + key + "'"
            Dim objSystem As New AeSystem
            cn.ConnectionString = "Server=alpha-svr07;Database=Omega Live;User Id=sa;Password=F0UREYES"
            cn.Open()
            cmd = New SqlCommand(sqlStr, cn)
            Dim result As SqlDataReader = cmd.ExecuteReader()
            cn.Close()
            Return result.RecordsAffected

        Catch ex As Exception
            Return ex.Message
        End Try
    End Function
    <WebMethod()> Public Shared Function RemoveQualification_Click(ByVal key As String) As String
        Try
            Dim cn As New SqlConnection()
            Dim da As SqlDataAdapter
            Dim dr As DataRow
            Dim cmd As SqlCommand
            Dim Connection As New SqlClient.SqlConnectionStringBuilder
            Connection.DataSource = "Omega Live"
            Connection.UserID = "sa"
            Connection.Password = "F0UREYES"
            Dim objSQlConnection = New SqlClient.SqlConnection(Connection.ConnectionString)
            Dim sqlStr As String = "DELETE FROM [Omega Live].[dbo].[CandidateQualification] WHERE [CandidateQualification] = '" + key + "'"
            Dim objSystem As New AeSystem
            cn.ConnectionString = "Server=alpha-svr07;Database=Omega Live;User Id=sa;Password=F0UREYES"
            cn.Open()
            cmd = New SqlCommand(sqlStr, cn)
            Dim result As SqlDataReader = cmd.ExecuteReader()
            cn.Close()
            Return result.RecordsAffected

        Catch ex As Exception
            Return ex.Message
        End Try
    End Function


    Protected Sub saveCompany_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles saveCompany.Click
        Dim objUserName As String = Session("Username")
        Dim objCandidate As IAeClassInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Candidate", False, "Username='" + Session("Username") & "'")
        saved = False
        Dim objValidate As IAeValidate = Nothing
        Dim objTransaction As IAeTransaction = CType(Master.Master, Portal).SIFSystem.BeginTransaction
        Dim objFolders As IAeFolders = CType(Master.Master, Portal).SIFSystem.Folders
        Dim candidateCompany = objCandidate.Folders("CandidateApproachedCompanies")
        If Not objCandidate Is Nothing Then
            Dim newCandCompany As IAeClassInst = candidateCompany.CreateNewInstance
            SetValue(newCandCompany, "CompanyName", CompanyControlID.Company)
            SetValue(newCandCompany, "ContactName", CompanyControlID.Contact)
            SetValue(newCandCompany, "ContactPosition", CompanyControlID.Position)
            SetValue(newCandCompany, "WhenAppoached", CompanyControlID.StartDate)
            SetValue(newCandCompany, "Role", CompanyControlID.RoleApplied)
            SetJoinValue(objCandidate.Key.ToString(), newCandCompany, "Candidate")
            newCandCompany.Save(objTransaction)
            newCandCompany = Nothing
            objCandidate.Save(objTransaction)
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

    Protected Sub saveQualification_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles saveQualification.Click
        Dim objUserName As String = Session("Username")
        Dim objCandidate As IAeClassInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Candidate", False, "Username='" + Session("Username") & "'")
        saved = False
        Dim objValidate As IAeValidate = Nothing
        Dim objTransaction As IAeTransaction = CType(Master.Master, Portal).SIFSystem.BeginTransaction
        Dim objFolders As IAeFolders = CType(Master.Master, Portal).SIFSystem.Folders
        Dim objFolder As IAeFolder = objFolders("CandidateQualifications")
        Dim candidateQualification = objCandidate.Folders("CandidateQualifications")
        If Not objCandidate Is Nothing Then
            Dim newCandQualification As IAeClassInst = candidateQualification.CreateNewInstance
            SetValue(newCandQualification, "Degree", QualificationControlID.Degree)
            SetValue(newCandQualification, "Field", QualificationControlID.Field)
            SetValue(newCandQualification, "SchoolName", QualificationControlID.School)
            SetValue(newCandQualification, "Description", QualificationControlID.Description)
            SetValue(newCandQualification, "FromYear", QualificationControlID.FromYear)
            SetValue(newCandQualification, "ToYear", QualificationControlID.ToYear)
            SetJoinValue(objCandidate.Key.ToString(), newCandQualification, "Candidate")
            newCandQualification.Save(objTransaction)
            newCandQualification = Nothing
            objCandidate.Save(objTransaction)
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

    Protected Sub next_btn_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim objUserName As String = Session("Username")
        Dim objCandidate As IAeClassInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Candidate", False, "Username='" + Session("Username") & "'")
        saved = False

        Dim objValidate As IAeValidate = Nothing
        Dim objTransaction As IAeTransaction = CType(Master.Master, Portal).SIFSystem.BeginTransaction
        If Not objCandidate Is Nothing Then
            Dim counter = GetValue(objCandidate, "OnlineRegCounter")
            If counter Is Nothing Then
                counter = 6
            Else

                counter = 6

            End If
            SetValue(objCandidate, "OnlineRegCounter", counter)

            Dim medicalVal As Integer = 0
            If med_cond_list.SelectedValue = "Yes" Then
                medicalVal = 1
            End If
            SetValue(objCandidate, "CandidateMedicalConditionsBit", medicalVal)
            SetValue(objCandidate, "CandidateMedicalConditions", comment_med.Text)

            Dim criminalVal As Integer = 0
            If criminal_cond_list.SelectedValue = "Yes" Then
                criminalVal = 1
            End If
            SetValue(objCandidate, "CandidateCriminalConvictionsBit", criminalVal)
            SetValue(objCandidate, "CandidateCriminalConvictions", comment_criminal.Text)

            objCandidate.Save(objTransaction)
            objValidate = objTransaction.Validate
            If objValidate.Status <> 3 Then
                objTransaction.Commit()
                saved = True
                objCandidate.Save()
                Response.Redirect("~/NewUser/NewUser-ProfileInfo-6.aspx")
            Else
                objTransaction = Nothing
                saved = False
            End If
            objTransaction = Nothing
            objValidate = Nothing

        End If
    End Sub


End Class