Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Web.Script.Services
Imports StayinFront.Engine
Imports StayinFront.Web
Imports StayinFront
Imports System.Net
Imports System.Globalization
Imports System.Object
Imports System.Web.UI
Imports System.Data.SqlClient
Imports System.Data
Imports System.IO

Partial Public Class Profile1
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'If Not Page.IsPostBack Then

        Dim objCandidate As IAeClassInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Candidate", False, "Username='" + Session("Username") & "'")

            Dim body As HtmlGenericControl = CType(Master.Master.FindControl("mainBody"), HtmlGenericControl)
            body.Attributes.Add("class", "profile")
            body.Attributes.Add("ng-app", "formController")

        If Not objCandidate Is Nothing Then
            first_name.Text = GetValue(objCandidate, "Name.FirstName")
            last_name.Text = GetValue(objCandidate, "Name.LastName")
            Dim organisationName As String = GetValue(objCandidate, "EmploymentDetail.Organisation")
        End If

        '---------------------Work History--------------
        Dim assignments = objCandidate.Folders("Assignments").Scan(, , , "AssignmentStartDate ASC")
            Dim strHTML As String = ""
            For Each assignment In assignments
                Dim Title = GetValue(assignment, "Job.JobTitle")
                If Title IsNot Nothing Then
                    Dim AssignmentStartDate = GetValue(assignment, "AssignmentStartDate")
                    Dim AssignmentEndDate = GetValue(assignment, "AssignmentEndDate")
                    Dim ReportsToFirst = GetValue(assignment, "Job.ReportsTo.Person.Name.Firstname")
                    Dim ReportsToLast = GetValue(assignment, "Job.ReportsTo.Person.Name.Lastname")
                    Dim DepartmantOrganisation = GetValue(assignment, "Job.Department.Organisation.Name")
                    Dim DepartmantOrganisationAddress1 = GetValue(assignment, "Job.Department.Address.City")
                    Dim DepartmantOrganisationAddress2 = GetValue(assignment, "Job.Department.Address.Country.Name")

                    'Convert date
                    Dim dt As DateTime = DateTime.ParseExact(AssignmentStartDate, "d", Nothing)
                    Dim month As String = dt.Month.ToString()
                    Dim year As String = dt.Year.ToString()
                    Dim xMonth As String = MonthName(month)

                    Dim dt2 As DateTime = DateTime.ParseExact(AssignmentEndDate, "d", Nothing)
                    Dim month2 As String = dt2.Month.ToString()
                    Dim year2 As String = dt2.Year.ToString()
                    Dim xMonth2 As String = MonthName(month2)

                    Dim i = 0
                    strHTML &= "<div class='experience-field space'>"
                    strHTML &= "<h3>" & Title & "</h3>"
                    strHTML &= "<div class='d-info'>"
                    strHTML &= "<div>"
                    strHTML &= "<span class='font-weight-lighter'>" & DepartmantOrganisation & " | " & DepartmantOrganisationAddress1 & ", " & DepartmantOrganisationAddress2 & "</span>"
                    strHTML &= "</div>"
                    strHTML &= "<span>" & xMonth & " " & year & " - " & xMonth2 & " " & year2 & "</span>"
                    strHTML &= "<div class='mt b white-space-prewrap'>" & "RESPONSIBILITIES: "
                    strHTML &= "</div>"
                    strHTML &= "<span class='b'>" & "Reports to: " & ReportsToFirst & " " & ReportsToLast & "</span>"
                    strHTML &= "</div>"
                    strHTML &= "</div>"
                    i = i + 1
                End If
            Next
            CandWorkHistory.Text = strHTML

            '---------------------Skills---------------------

            Dim skills = objCandidate.Folders("CandidateSkills")
            Dim strHTML2 As String = ""
            For Each skill In skills
                Dim skill1 = GetValue(skill, "Skill.SkillName")
                Dim i = 0
                strHTML2 &= "<div class='skills-pill color-skills display-inline'>"
                strHTML2 &= "<span>" & skill1 & "</span>"
                strHTML2 &= "</div>"
                CandidateSkills.Text = strHTML2
                i = i + 1
            Next
            CandidateSkills.Text = strHTML2



            '---------------------Personal Information---------
            Phone.Text = GetValue(objCandidate, "Phone.AreaCode") & " " & GetValue(objCandidate, "Phone.Number")
            Mobile.Text = GetValue(objCandidate, "Mobile.AreaCode") & " " & GetValue(objCandidate, "Mobile.Number")
            Email.Text = GetValue(objCandidate, "Emailaddress.eMailAddress")
            AltEmail.Text = GetValue(objCandidate, "WorkeMailAddress.Emailaddress")
            candidateAddress.Text = GetValue(objCandidate, "Address.Address")
            Suburb.Text = GetValue(objCandidate, "Address.Suburb")
            candidateCity.Text = GetValue(objCandidate, "Address.City")
            candidatePostCode.Text = GetValue(objCandidate, "Address.PostCode")
            Country.Text = GetValue(objCandidate, "Address.Country.Name")
            candidateDOB1.Text = GetValue(objCandidate, "DOB.DateDay")
            candidateDOB2.Text = GetValue(objCandidate, "DOB.DateMonth")
            candidateDOB3.Text = GetValue(objCandidate, "DOB.DateYear")
            CandidatePlaceOfBirth.Text = GetValue(objCandidate, "CandidatePlaceOfBirth")
            candidateLinkedIn.Text = GetValue(objCandidate, "LinkedInPage.wwwAddress")
            candidateSkypeName.Text = GetValue(objCandidate, "Candidate.SkypeName")
            Gender.Text = GetValue(objCandidate, "CandidateGender")
            CandidateDriversLicense.Text = GetValue(objCandidate, "CandidateDriversLicense")
            CandidateOwnTransport.Text = GetValue(objCandidate, "CandidateOwnTransport")
            CandidateSmoker.Text = GetValue(objCandidate, "CandidateSmoker")
            Availability.Text = GetValue(objCandidate, "CandidateAvailability")

            CandidatesEmergencyContact2.Text = GetValue(objCandidate, "AlternateContact.Name.FirstName")
            CandidatesEmergencyContact3.Text = GetValue(objCandidate, "AlternateContact.Name.LastName")
            CandidatesEmergencyContactPhone1.Text = GetValue(objCandidate, "AlternateContact.PhoneNumber.AreaCode")
            CandidatesEmergencyContactPhone2.Text = GetValue(objCandidate, "AlternateContact.PhoneNumber.Number")
            EmEmail.Text = GetValue(objCandidate, "AlternateContact.Email.eMailAddress")
            CandidatesEmergencyContactRelationship.Text = GetValue(objCandidate, "AlternateContact.Relationship")

            '---------------------Personal Information Edit---------
            PersonalDetailsID.Phone = GetValue(objCandidate, "Phone.AreaCode") & " " & GetValue(objCandidate, "Phone.Number")
            PersonalDetailsID.Mobile = GetValue(objCandidate, "Mobile.AreaCode") & " " & GetValue(objCandidate, "Mobile.Number")
            PersonalDetailsID.Email = GetValue(objCandidate, "Emailaddress.eMailAddress")
            PersonalDetailsID.AltEmail = GetValue(objCandidate, "WorkeMailAddress.Emailaddress")
            PersonalDetailsID.Suburb = GetValue(objCandidate, "Address.Suburb")
            PersonalDetailsID.Address = GetValue(objCandidate, "Address.Address")
            PersonalDetailsID.City = GetValue(objCandidate, "Address.City")
            PersonalDetailsID.PostCode = GetValue(objCandidate, "Address.PostCode")
            PersonalDetailsID.Country = GetValue(objCandidate, "Address.Country.Name")
            Dim dob As String = System.Convert.ToString(GetValue(objCandidate, "DOB.DateDay"))
            dob = dob & "/" & System.Convert.ToString(GetValue(objCandidate, "DOB.DateMonth"))
            dob = dob & "/" & System.Convert.ToString(GetValue(objCandidate, "DOB.DateYear"))
            PersonalDetailsID.DOB = dob
            PersonalDetailsID.POB = GetValue(objCandidate, "CandidatePlaceOfBirth")
            PersonalDetailsID.Availability = GetValue(objCandidate, "CandidateAvailability")
            PersonalDetailsID.Linkedin = GetValue(objCandidate, "LinkedInPage.wwwAddress")
            PersonalDetailsID.Skype = GetValue(objCandidate, "Candidate.SkypeName")
            PersonalDetailsID.Gender = GetValue(objCandidate, "CandidateGender")
            PersonalDetailsID.DriversLicense = GetValue(objCandidate, "CandidateDriversLicense")
            PersonalDetailsID.OwnTransport = GetValue(objCandidate, "CandidateOwnTransport")
            PersonalDetailsID.Smoker = GetValue(objCandidate, "CandidateSmoker")

            PersonalDetailsID.EmContName = GetValue(objCandidate, "AlternateContact.Name.FirstName")
            PersonalDetailsID.EmContLastName = GetValue(objCandidate, "AlternateContact.Name.LastName")
            PersonalDetailsID.EmPhone = GetValue(objCandidate, "AlternateContact.PhoneNumber.AreaCode") & " " & GetValue(objCandidate, "AlternateContact.PhoneNumber.Number")
            PersonalDetailsID.EmEmail = GetValue(objCandidate, "AlternateContact.Email.eMailAddress")
            PersonalDetailsID.EmContRelationship = GetValue(objCandidate, "AlternateContact.Relationship")

            '---------------------Referees---------------------
            Dim referees = objCandidate.Folders("Referees")
            Dim strHTML3 As String = ""
            Dim iRef = 1
            For Each referee In referees
                Dim refKey = referee.Key
                Dim refereeFirstName = GetValue(referee, "Name.FirstName")
                Dim refereeLastName = GetValue(referee, "Name.LastName")
                Dim refereePosition = GetValue(referee, "RefereePosition")
                Dim refereeCompany = GetValue(referee, "refereeCompany")
                Dim refereeMobileNumber1 = GetValue(referee, "mobileNumber.AreaCode")
                Dim refereeMobileNumber2 = GetValue(referee, "mobileNumber.Number")
                Dim refereeEmail = GetValue(referee, "Emailaddress.Emailaddress")
                Dim refereeRepRel = GetValue(referee, "RefereeRelationship")
                Dim refereeTimesToContact = GetValue(referee, "RefereeContactTime")
                Dim refereeLandline1 = GetValue(referee, "PhoneNumber.AreaCode")
                Dim refereeLandline2 = GetValue(referee, "PhoneNumber.Number")

                strHTML3 &= "<div class='referee-template'><input type='button' class='remove removeRef btn' key='" & refKey & "' id='removeRef" & iRef & "' style='margin-right: 3rem; padding-bottom:2rem;'><div class='edit' style='margin-right: 3rem;' type='button' class='btn btn-primary' data-toggle='modal' data-target='#addReferee" & iRef & "'><i class='fa fa-pencil' aria-hidden='True'></i></div>"
                strHTML3 &= "<div class='referee-col1'>"
                strHTML3 &= "<h3 class='referee-title'>" & refereeFirstName & " " & refereeLastName & "</h3>"
                strHTML3 &= "<div>" & refereePosition & " (" & refereeCompany & ")"
                strHTML3 &= "<div class='toggle-icon'>"
                strHTML3 &= "<div class='infoToggler addthisdiv'>"
                strHTML3 &= "<span class='font-italic'>" & "Show details" & "</span>"
                strHTML3 &= "<img src='../img/arrow-down-flat.png' class='toggle-icon-img'>"
                strHTML3 &= "<span class='font-italic hidden'>" & "Hide details" & "</span>"
                strHTML3 &= "<img src='../img/arrow-up-flat.png' class='toggle-icon-img hidden'>"
                strHTML3 &= "</div>"
                strHTML3 &= "</div>"
                strHTML3 &= "<div class='toggle-p pad-l hidden'>"
                strHTML3 &= "<div>"
                strHTML3 &= "<label>" & "Mobile Phone:" & "</label>"
                strHTML3 &= "<span class='datainfo refereeDetails'>" & refereeMobileNumber1 & refereeMobileNumber2 & "</span>"
                strHTML3 &= "</div>"
                strHTML3 &= "<div>"
                strHTML3 &= "<label>" & "Personal Email:" & "</label>"
                strHTML3 &= "<span class='datainfo refereeDetails'>" & refereeEmail & "</span>"
                strHTML3 &= "</div>"
                strHTML3 &= "<div>"
                strHTML3 &= "<label>" & "Reporting Relationship:" & "</label>"
                strHTML3 &= "<span class='datainfo refereeDetails'>" & refereeRepRel & "</span>"
                strHTML3 &= "</div>"
                strHTML3 &= "<div>"
                strHTML3 &= "<label>" & "Times to Contact:" & "</label>"
                strHTML3 &= "<span class='datainfo refereeDetails'>" & refereeTimesToContact & "</span>"
                strHTML3 &= "</div>"
                '''''''strHTML3 &= "<div>"
                '''''''strHTML3 &= "<label>" & "Landline Phone:" & "</label>"
                '''''''strHTML3 &= "<span class='datainfo refereeDetails'>" & refereeLandline1 & refereeLandline2 & "</span>"
                '''''''strHTML3 &= "</div>"
                '''''''strHTML3 &= "<div>"
                '''''''strHTML3 &= "<label>" & "Fax:" & "</label>"
                '''''''strHTML3 &= "<span class='datainfo refereeDetails'>" & refereeFax1 & refereeFax2 & "</span>"
                '''''''strHTML3 &= "</div>"

                strHTML3 &= "</div>"
                strHTML3 &= "</div>"
                strHTML3 &= "</div>"
                strHTML3 &= "</div>"
                'Modal
                Dim refereeControl As RefereeControls
                refereeControl = LoadControl("~/Profile/Controls/RefereeControls.ascx")
                If refereeControl IsNot Nothing Then
                    refereeControl.keyVal = iRef
                    refereeControl.RefereeKey = referee.Key

                    refereeControl.FirstNameRef = refereeFirstName
                    refereeControl.LastNameRef = refereeLastName

                    refereeControl.MobileRef = refereeMobileNumber1 & " " & refereeMobileNumber2
                    refereeControl.LandRef = refereeLandline1 & " " & refereeLandline2
                    refereeControl.EmailRef = refereeEmail

                    refereeControl.CompanyRef = refereeCompany
                    refereeControl.PositionRef = refereePosition
                    refereeControl.RepRelationshipRef = refereeRepRel
                    refereeControl.TimeRef = refereeTimesToContact
                    candidatesrefereesmodal.Controls.Add(refereeControl)
                End If

                iRef = iRef + 1
            Next
            candidatesreferees.Text = strHTML3
            '---------------------Qualification---------------------
            Dim qualifications = objCandidate.Folders("CandidateQualifications")
            Dim strHTML4 As String = ""
            Dim iQual = 1
            For Each qual In qualifications
                Dim qualKey = qual.Key
                Dim Degree = GetValue(qual, "Degree")
                Dim Field = GetValue(qual, "Field")
                Dim School = GetValue(qual, "SchoolName")
                Dim FromYear = GetValue(qual, "FromYear")
                Dim ToYear = GetValue(qual, "ToYear")
                Dim Description = GetValue(qual, "Description")

                strHTML4 &= "<div class='referee-template'><input type='button' class='remove removeQualification btn' key='" & qualKey & "' id='removeQualification" & iQual & "' style='margin-right: 3rem; padding-bottom:2rem;'><div class='edit' style='margin-right: 3rem;' type='button' class='btn btn-primary' data-toggle='modal' data-target='#addQualification" & iQual & "'><i class='fa fa-pencil' aria-hidden='True'></i></div>"
                strHTML4 &= "<div class='referee-col1'>"
                strHTML4 &= "<h3 class='referee-title'>" & School & "</h3>"
                strHTML4 &= "<div>" & Degree & " (" & Field & ")"
                strHTML4 &= "<div class='toggle-icon'>"
                strHTML4 &= "<div class='infoToggler addthisdiv'>"
                strHTML4 &= "<span class='font-italic'>" & "Show details" & "</span>"
                strHTML4 &= "<img src='../img/arrow-down-flat.png' class='toggle-icon-img'>"
                strHTML4 &= "<span class='font-italic hidden'>" & "Hide details" & "</span>"
                strHTML4 &= "<img src='../img/arrow-up-flat.png' class='toggle-icon-img hidden'>"
                strHTML4 &= "</div>"
                strHTML4 &= "</div>"
                strHTML4 &= "<div class='toggle-p pad-l hidden'>"
                strHTML4 &= "<div>"
                strHTML4 &= "<label>" & "From Year:" & "</label>"
                strHTML4 &= "<span class='datainfo refereeDetails'>" & FromYear & "</span>"
                strHTML4 &= "</div>"
                strHTML4 &= "<div>"
                strHTML4 &= "<label>" & "To Year:" & "</label>"
                strHTML4 &= "<span class='datainfo refereeDetails'>" & ToYear & "</span>"
                strHTML4 &= "</div>"
                strHTML4 &= "<div>"
                strHTML4 &= "<label>" & "Description:" & "</label>"
                strHTML4 &= "<span class='datainfo refereeDetails'>" & Description & "</span>"
                strHTML4 &= "</div>"

                strHTML4 &= "</div>"
                strHTML4 &= "</div>"
                strHTML4 &= "</div>"
                strHTML4 &= "</div>"
                'Modal
                Dim qualificationControl As QualificationControl
                qualificationControl = LoadControl("~/Profile/Controls/QualificationControl.ascx")
                If qualificationControl IsNot Nothing Then
                    qualificationControl.keyVal = iQual
                    qualificationControl.QualificationKey = qual.Key

                    qualificationControl.Degree = Degree
                    qualificationControl.Field = Field

                    qualificationControl.School = School

                    qualificationControl.Description = Description
                    candidatesqualificationsmodal.Controls.Add(qualificationControl)
                    qualificationControl.FromYear = FromYear
                    qualificationControl.ToYear = ToYear

                End If

                iQual = iQual + 1
            Next
        candidatesqualifications.Text &= strHTML4

        '---------------------Agency---------------------
        Dim agencies = objCandidate.Folders("CandidateApproachedCompanies")
        Dim strHTML5 As String = ""
        Dim iAgency = 1
        For Each agency In agencies
            Dim agencyKey = agency.Key
            Dim companyName = GetValue(agency, "CompanyName")
            Dim contactName = GetValue(agency, "ContactName")
            Dim contactPosition = GetValue(agency, "ContactPosition")
            Dim whenAppoached = GetValue(agency, "WhenAppoached")
            Dim role = GetValue(agency, "Role")

            strHTML5 &= "<div class='referee-template'><input type='button' class='remove removeAgency btn' key='" & agencyKey & "' id='removeAgecy" & iAgency & "' style='margin-right: 3rem; padding-bottom:2rem;'><div class='edit' style='margin-right: 3rem;' type='button' class='btn btn-primary' data-toggle='modal' data-target='#addAgency" & iAgency & "'><i class='fa fa-pencil' aria-hidden='True'></i></div>"
            strHTML5 &= "<div class='referee-col1'>"
            strHTML5 &= "<h3 class='referee-title'>" & companyName & "</h3>"
            strHTML5 &= "<div>" & contactName & " (" & contactPosition & ")"
            strHTML5 &= "<div class='toggle-icon'>"
            strHTML5 &= "<div class='infoToggler addthisdiv'>"
            strHTML5 &= "<span class='font-italic'>" & "Show details" & "</span>"
            strHTML5 &= "<img src='../img/arrow-down-flat.png' class='toggle-icon-img'>"
            strHTML5 &= "<span class='font-italic hidden'>" & "Hide details" & "</span>"
            strHTML5 &= "<img src='../img/arrow-up-flat.png' class='toggle-icon-img hidden'>"
            strHTML5 &= "</div>"
            strHTML5 &= "</div>"
            strHTML5 &= "<div class='toggle-p pad-l hidden'>"
            strHTML5 &= "<div>"
            strHTML5 &= "<label>" & "Date Applied:" & "</label>"
            strHTML5 &= "<span class='datainfo refereeDetails'>" & whenAppoached & "</span>"
            strHTML5 &= "</div>"
            strHTML5 &= "<div>"
            strHTML5 &= "<label>" & "Role:" & "</label>"
            strHTML5 &= "<span class='datainfo refereeDetails'>" & role & "</span>"
            strHTML5 &= "</div>"

            strHTML5 &= "</div>"
            strHTML5 &= "</div>"
            strHTML5 &= "</div>"
            strHTML5 &= "</div>"
            'Modal
            Dim agencyControl As AgencyControl
            agencyControl = LoadControl("~/Profile/Controls/AgencyControl.ascx")
            If agencyControl IsNot Nothing Then
                agencyControl.keyVal = iAgency
                agencyControl.AgencyKey = agency.Key
                agencyControl.Agency = companyName
                agencyControl.NameOfContact = contactName
                agencyControl.DateApplied = whenAppoached
                agencyControl.Position = contactPosition
                agencyControl.Role = role
                candidatesagenciesmodal.Controls.Add(agencyControl)


            End If

            iAgency = iAgency + 1
        Next
        candidatesagencies.Text &= strHTML5       '---------------------Documents---------------------
        'End If

    End Sub

    Protected Sub savePersonalInfo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles savePersonalInfo.Click

        Dim objUserName As String = Session("Username")
        Dim objCandidate As IAeClassInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Candidate", False, "Username='" & Session("Username") & "'")
        saved = False
        Dim objValidate As IAeValidate = Nothing

        Dim objTransaction As IAeTransaction = CType(Master.Master, Portal).SIFSystem.BeginTransaction
        If Not objCandidate Is Nothing Then

            Dim phoneL As String = PersonalDetailsID.Phone
            phoneL = phoneL.Trim()
            If InStr(phoneL, " ") > 0 Then
                Dim pLS As String() = phoneL.Split(" ")
                SetValue(objCandidate, "Phone.AreaCode", pLS(0))
                SetValue(objCandidate, "Phone.Number", pLS(1))
            Else
                SetValue(objCandidate, "Phone.AreaCode", Nothing)
                SetValue(objCandidate, "Phone.Number", phoneL)
            End If
            Dim phoneM As String = PersonalDetailsID.Mobile
            phoneM = phoneM.Trim()
            If InStr(phoneM, " ") > 0 Then
                Dim pMS As String() = phoneM.Split(" ")
                SetValue(objCandidate, "Mobile.AreaCode", pMS(0))
                SetValue(objCandidate, "Mobile.Number", pMS(1))
            Else
                SetValue(objCandidate, "Mobile.AreaCode", Nothing)
                SetValue(objCandidate, "Mobile.Number", phoneM)
            End If
            SetValue(objCandidate, "Emailaddress.eMailAddress", PersonalDetailsID.Email)
            SetValue(objCandidate, "WorkeMailAddress.Emailaddress", PersonalDetailsID.AltEmail)
            SetValue(objCandidate, "Address.Address", PersonalDetailsID.Address)
            SetValue(objCandidate, "Address.City", PersonalDetailsID.City)
            SetValue(objCandidate, "Address.Suburb", PersonalDetailsID.Suburb)
            SetValue(objCandidate, "Address.PostCode", PersonalDetailsID.PostCode)
            Dim strCtryKey = GetInstance(CType(Master.Master, Portal).SIFSystem, "Countries", False, "Name='" + PersonalDetailsID.Country & "'").Key
            SetValue(objCandidate, "Address.country", strCtryKey)

            Dim dob() As String = PersonalDetailsID.DOB.Split("/")
            SetValue(objCandidate, "DOB.DateDay", dob(0))
            SetValue(objCandidate, "DOB.DateMonth", dob(1))
            SetValue(objCandidate, "DOB.DateYear", dob(2))
            SetValue(objCandidate, "CandidatePlaceOfBirth", PersonalDetailsID.POB)
            SetValue(objCandidate, "LinkedInPage.wwwAddress", PersonalDetailsID.Linkedin)
            SetValue(objCandidate, "SkypeName", PersonalDetailsID.Skype)
            If Not PersonalDetailsID.Gender <> "" Or PersonalDetailsID.Gender = Nothing Then
                SetValue(objCandidate, "CandidateGender", Nothing)
            Else
                SetValue(objCandidate, "CandidateGender", PersonalDetailsID.Gender)
            End If
            SetValue(objCandidate, "CandidateDriversLicense", PersonalDetailsID.DriversLicense)
            SetValue(objCandidate, "CandidateOwnTransport", PersonalDetailsID.OwnTransport)
            SetValue(objCandidate, "CandidateSmoker", PersonalDetailsID.Smoker)
            SetValue(objCandidate, "CandidateAvailability", PersonalDetailsID.Availability)

            SetValue(objCandidate, "AlternateContact.Name.FirstName", PersonalDetailsID.EmContName)
            SetValue(objCandidate, "AlternateContact.Name.LastName", PersonalDetailsID.EmContLastName)
            Dim phoneEm As String = PersonalDetailsID.EmPhone
            phoneEm = phoneEm.Trim()
            If InStr(phoneEm, " ") > 0 Then
                Dim pEm As String() = phoneM.Split(" ")
                SetValue(objCandidate, "AlternateContact.PhoneNumber.AreaCode", pEm(0))
                SetValue(objCandidate, "AlternateContact.PhoneNumber.Number", pEm(1))
            Else
                SetValue(objCandidate, "AlternateContact.PhoneNumber.AreaCode", Nothing)
                SetValue(objCandidate, "AlternateContact.PhoneNumber.Number", phoneEm)
            End If
            SetValue(objCandidate, "AlternateContact.Email.eMailAddress", PersonalDetailsID.EmEmail)
            SetValue(objCandidate, "AlternateContact.Relationship", PersonalDetailsID.EmContRelationship)

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

    Protected Sub saveSkills_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles saveSkills.Click


        Dim objUserName As String = Session("Username")
        Dim objCandidate As IAeClassInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Candidate", False, "Username='" + Session("Username") & "'")
        saved = False
        Dim objValidate As IAeValidate = Nothing
        Dim objTransaction As IAeTransaction = CType(Master.Master, Portal).SIFSystem.BeginTransaction

        Dim objFolders As IAeFolders = CType(Master.Master, Portal).SIFSystem.Folders
        Dim objFolder As IAeFolder = objFolders("SkillGroup")
        Dim skillgroups As IAeFolder = objFolder

        Dim candidateskills = objCandidate.Folders("candidateskills")
        Dim intSkillCount = objFolders("SkillGroup").Count

        If Not objCandidate Is Nothing Then
            For Each candidateskill In objCandidate.Folders("candidateskills")
                Dim valuetodelete = candidateskill.Key.ToString
                Dim deletecandidateprofilevalue = CType(Master.Master, Portal).SIFSystem.Classes("CandidateSkill").GetInstance(valuetodelete)
                deletecandidateprofilevalue.Delete()
            Next
            For i = 0 To (intSkillCount - 1)
                Dim currentvalue As Array
                For Each category As IAeClassInst In skillgroups
                    Dim CategoryValues As IAeFolder = category.Folders("Skills")
                    For Each categoryvalue As IAeClassInst In CategoryValues
                        currentvalue = Split(Request.Form("skill" & i), ",")
                        For j = 0 To UBound(currentvalue)
                            If currentvalue(j) > "" Then
                                currentvalue(j) = Replace(currentvalue(j), " ", "")
                                Dim newskill = CType(Master.Master, Portal).SIFSystem.Classes("Skill").GetInstance(currentvalue(j))
                                Dim newcandidateskill As IAeClassInst = candidateskills.CreateNewInstance
                                SetJoinValue(newskill.Key.ToString(), newcandidateskill, "Skill")
                                SetJoinValue(objCandidate.Key.ToString(), newcandidateskill, "candidate")
                                newcandidateskill.Save(objTransaction)
                                newcandidateskill = Nothing
                            End If
                        Next
                        Exit For
                    Next
                    Exit For
                Next
            Next
            objCandidate.Save(objTransaction)
            objValidate = objTransaction.Validate
            'validate before commit
            If objValidate.Status <> 3 Then
                objTransaction.Commit()
                saved = True
                Response.Redirect(HttpContext.Current.Request.Url.ToString(), True)
            Else
                'lblMessage.Text = objValidate.Result.Message
                objTransaction = Nothing
                saved = False
            End If
            objTransaction = Nothing
            objValidate = Nothing
        End If
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
    <WebMethod()> Public Shared Function RemoveQualification_Click(ByVal key As String) As String
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
            Dim sqlStr As String = "DELETE FROM [Omega Live].[dbo].[CandidateQualification] WHERE [CandidateQualification] = '" + key + "'"
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
    <WebMethod()> Public Shared Function RemoveAgency_Click(ByVal key As String) As String
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
            Dim sqlStr As String = "DELETE FROM [Omega Live].[dbo].[CandidateApproachedCompany] WHERE [CandidateApproachedCompany] = '" + key + "'"
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
End Class