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


Partial Public Class ProfileHS
    Inherits System.Web.UI.Page

    Protected Sub ProfileInfo1_PreInit(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreInit

    End Sub

    Protected Sub ProfileInfo1_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        'If Session("Username") Is Nothing Then
        'Response.Redirect("http://localhost/candidateportal_1.0/portal1.3/portal_1.3/login.aspx?domain=portal_1.3&OriginalURL=%2Fportal_1.3%2F&Retry=0&Timeout=0&Lockout=0")
        'End If
    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
        End If
        Dim objCandidate As IAeClassInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Candidate", False, "Username='" + Session("Username") & "'")
        Dim incidents = objCandidate.Folders("IncidentHistories")
        Dim body As HtmlGenericControl = CType(Master.Master.FindControl("mainBody"), HtmlGenericControl)
        body.Attributes.Add("class", "profile")
        body.Attributes.Add("ng-app", "formController")

        '---------------------Health and Safety--------------
        '---------------------Set New Modal Candidate Values--------------
        Incident.DecFN = GetValue(objCandidate, "Name.FirstName")
        Incident.DecLN = GetValue(objCandidate, "Name.LastName")
        Incident.DecAddr = GetValue(objCandidate, "Address.Address")
        Incident.DecCity = GetValue(objCandidate, "Address.City")
        Incident.DecPostCode = GetValue(objCandidate, "Address.PostCode")
        Incident.DecEmail = GetValue(objCandidate, "eMailAddress.eMailAddress")
        Incident.DecPhone = GetValue(objCandidate, "Mobile.AreaCode") & " " & GetValue(objCandidate, "Mobile.Number")

        DII.DecFN = GetValue(objCandidate, "Name.FirstName")
        DII.DecLN = GetValue(objCandidate, "Name.LastName")
        DII.DecAddr = GetValue(objCandidate, "Address.Address")
        DII.DecCity = GetValue(objCandidate, "Address.City")
        DII.DecPostCode = GetValue(objCandidate, "Address.PostCode")
        DII.DecEmail = GetValue(objCandidate, "eMailAddress.eMailAddress")
        DII.DecPhone = GetValue(objCandidate, "Mobile.AreaCode") & " " & GetValue(objCandidate, "Mobile.Number")

        Dim i = 1
        '---------------------Add Table Rows--------------
        For Each inc In incidents
            Dim myRow As New TableRow()
            Dim AddedOn = GetValue(inc, "stdRecordStamp.WhenAdd")
            Dim IncType As String = inc.Class.name
            Dim cell1 As New TableCell()
            Dim cell2 As New TableCell()
            Dim cell3 As New TableCell()

            cell2.Text = AddedOn

            cell2.Attributes("type") = "button"
            cell2.Attributes("data-toggle") = "modal"
            If IncType = "HS_Incident" Then
                cell2.Attributes("data-target") = "#addIncident" & i
            Else
                cell2.Attributes("data-target") = "#addEvent" & i
            End If
            cell1.Text = IncType
            myRow.Cells.Add(cell1)
            myRow.Cells.Add(cell2)
            myRow.Cells.Add(cell3)
            TableHS.Rows.Add(myRow)
            '---------------------Set Edit Modal Values--------------
            Dim incidentControl
            Dim JobKey, JobResult, IncKey, IncResult, HSKey, HSRes As String
            '---------------------- CHECK Incident Or Event ---------------
            If IncType = "HS_Incident" Then
                incidentControl = LoadControl("~/Profile/Controls/IncidentControl.ascx")
            Else
                incidentControl = LoadControl("~/Profile/Controls/DIIControl.ascx")
            End If
            If incidentControl IsNot Nothing Then
                '---------------------- SET Notifier Details ---------------
                incidentControl.keyVal = i
                incidentControl.IncKey = inc.Key
                JobKey = GetJoinMemberKey(inc, "JobAssignment")
                JobResult = JobKey.Remove(JobKey.Length - 1).ToLower
                incidentControl.Assignment = JobResult.Remove(0, 1)

                incidentControl.NotifierType = GetEnumValue(inc, "notifier_type")
                incidentControl.NotifierFN = GetValue(inc, "notifier_Name.FirstName")
                incidentControl.NotifierLN = GetValue(inc, "notifier_Name.LastName")
                incidentControl.NotifierAreaP = GetValue(inc, "notifier_phone.AreaCode")
                incidentControl.NotifierNumP = GetValue(inc, "notifier_phone.Number")
                incidentControl.NotifierAreaM = GetValue(inc, "notifier_mobile.AreaCode")
                incidentControl.NotifierNumM = GetValue(inc, "notifier_mobile.Number")
                incidentControl.NotifierEmail = GetValue(inc, "notifier_email.eMailAddress")
                incidentControl.NotifierAddress = GetValue(inc, "notifier_address.Address")
                incidentControl.NotifierCity = GetValue(inc, "notifier_address.City")
                incidentControl.NotifierPostCode = GetValue(inc, "notifier_address.PostCode")
                '---------------------- SET Incident Details ---------------
                incidentControl.DateOfIncidet = GetValue(inc, "Incident_date")
                incidentControl.TimeOfIncident = GetValue(inc, "Incident_time")
                incidentControl.IncidentAddr = GetValue(inc, "incident_address.Address")
                incidentControl.IncidentCity = GetValue(inc, "incident_address.City")
                incidentControl.IncidentPostCode = GetValue(inc, "incident_address.PostCode")
                incidentControl.IncidentDesc = GetValue(inc, "incident_details")
                If GetValue(inc, "SitePreserved") = "False" Then
                    incidentControl.SitePreserved = False
                ElseIf GetValue(inc, "SitePreserved") = "True" Then
                    incidentControl.SitePreserved = True
                End If
                incidentControl.Notified = GetEnumValue(inc, "notified")
                incidentControl.AgencyName = GetValue(inc, "notified_agency_name")
                incidentControl.AgencyArea = GetValue(inc, "notified_agency_phone.AreaCode")
                incidentControl.AgencyNum = GetValue(inc, "notified_agency_phone.Number")
                If IncType = "HS_Event" Then

                    incidentControl.Test = GetEnumValue(inc, "notifier_type")
                    '---------------------- SET Injury Details ---------------{AB1C1531-DA23-41E8-9577-12C944B6C8FD}
                    incidentControl.InjName = GetValue(inc, "Inj_name")
                    incidentControl.InjLastName = GetValue(inc, "Inj_surname")

                    Dim dob As String = System.Convert.ToString(GetValue(objCandidate, "inj_DOB.DateDay"))
                    dob = dob & "/" & System.Convert.ToString(GetValue(objCandidate, "inj_DOB.DateMonth"))
                    dob = dob & "/" & System.Convert.ToString(GetValue(objCandidate, "inj_DOB.DateYear"))
                    incidentControl.InjDOB = dob
                    incidentControl.InjGender = GetValue(inc, "inj_gender")
                    incidentControl.InjAddr = GetValue(inc, "inj_address.Address")
                    incidentControl.InjCity = GetValue(inc, "inj_address.City")
                    incidentControl.InjPostCode = GetValue(inc, "inj_address.PostCode")
                    incidentControl.InjPersonType = GetEnumValue(inc, "inj_affected_type")
                    incidentControl.InjPhoneA = GetValue(inc, "inj_phone.AreaCode")
                    incidentControl.InjPhoneN = GetValue(inc, "inj_phone.Number")
                    incidentControl.InjHours = GetValue(inc, "inj_hours")

                    Dim HSFolder = inc.Folders("Candidate_HSes")
                    For Each HSInst In HSFolder
                        Dim code As String = GetValue(HSInst, "HS.HSGroup.code")

                        Dim HSKeyVal As String = GetJoinMemberKey(HSInst, "HS")
                        If Not HSKeyVal.Length = 0 Then
                            HSKey = HSKeyVal.Remove(HSKeyVal.Length - 1).ToLower
                            HSRes = HSKey.Remove(0, 1)
                            If code = "NI" Then
                                incidentControl.Nature = HSRes
                            ElseIf code = "TA" Then
                                incidentControl.Treatment = HSRes
                            ElseIf code = "BP" Then
                                incidentControl.BodyParts = HSRes
                            End If
                        End If
                    Next
                ElseIf IncType = "HS_Incident" Then
                    'incidentControl.Test = GetEnumValue(inc, "incident_place")
                    incidentControl.Place = GetEnumValue(inc, "incident_place")
                    Dim HSFolder = inc.Folders("Candidate_HSes")
                    For Each HSInst In HSFolder
                        Dim code As String = GetValue(HSInst, "HS.HSGroup.code")

                        Dim HSKeyVal As String = GetJoinMemberKey(HSInst, "HS")
                        If Not HSKeyVal.Length = 0 Then
                            HSKey = HSKeyVal.Remove(HSKeyVal.Length - 1).ToLower
                            HSRes = HSKey.Remove(0, 1)
                            If code = "WH" Then
                                incidentControl.IncidentWH = HSRes
                            ElseIf code = "PC" Then
                                incidentControl.IncidentPC = HSRes
                            End If
                        End If
                    Next
                    incidentControl.IncidentPeople = GetValue(inc, "detail_involved")
                    incidentControl.Weather = GetValue(inc, "weather_condition")
                    incidentControl.Hazard = GetEnumValue(inc, "hazard_involved")
                End If
                If GetValue(inc, "hsr_working") = "False" Then
                    incidentControl.HSRWork = False
                ElseIf GetValue(inc, "hsr_working") = "True" Then
                    incidentControl.HSRWork = True
                End If
                If GetValue(inc, "hsr_nzqa") = "False" Then
                    incidentControl.HSRNZQA = False
                ElseIf GetValue(inc, "hsr_nzqa") = "True" Then
                    incidentControl.HSRNZQA = True
                End If
                '---------------------- SET CANDIDATE DATA ------------------------------------------
                incidentControl.DecFN = GetValue(objCandidate, "Name.FirstName")
                incidentControl.DecLN = GetValue(objCandidate, "Name.LastName")
                incidentControl.DecAddr = GetValue(objCandidate, "Address.Address")
                incidentControl.DecCity = GetValue(objCandidate, "Address.City")
                incidentControl.DecPostCode = GetValue(objCandidate, "Address.PostCode")
                incidentControl.DecEmail = GetValue(objCandidate, "eMailAddress.eMailAddress")
                incidentControl.DecPhone = GetValue(objCandidate, "Mobile.AreaCode") & " " & GetValue(objCandidate, "Mobile.Number")
                incidentControl.DecDate = GetValue(inc, "declaration_date")
                PlaceHolder1.Controls.Add(incidentControl)
            End If
            i = i + 1
        Next
    End Sub


End Class