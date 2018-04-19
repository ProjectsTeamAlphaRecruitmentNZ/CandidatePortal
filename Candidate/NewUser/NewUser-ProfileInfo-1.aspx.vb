Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Web.Script.Services
Imports StayinFront.Engine
Imports System.Net
Imports System.Globalization
Imports System.Object
Imports System.Web.UI
Imports System.IO

Partial Public Class ProfileInfo1
    Inherits System.Web.UI.Page
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim body As HtmlGenericControl = CType(Master.Master.FindControl("mainBody"), HtmlGenericControl)
        body.Attributes.Add("class", "new-user")
        body.Attributes.Add("ng-app", "formController")

        Dim CPH As ContentPlaceHolder = CType(Master.Master.FindControl("portalBody"), ContentPlaceHolder)
        Dim div As HtmlControl = CType(CPH.FindControl("form_container"), HtmlControl)
        div.Attributes.Add("ng-app", "app")
        div.Attributes.Add("ng-controller", "MainCtrl")

        If Not Page.IsPostBack Then
            'Set the logged in User
            Dim objUserName As String = Session("Username")
            Dim strHTML As String = Nothing
            strHTML &= "<input type='hidden' id='sess' value='" & objUserName & "'>"
            session_fileds.Text = strHTML

            Dim objCandidate As IAeClassInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Candidate", False, "Username='" + Session("Username") & "'")

            If Not objCandidate Is Nothing Then
                'Stop
                'PopulateEnumPickList(ddl, "stdPersonName_Title", CType(Master.Master, Portal).SIFSystem, True)
                'Dim strHtml As String = ""
                'strHtml &= "<div class='radio-input-grid__column'>"
                'strHtml &= "<input type='radio' value=" & GetEnumValue(objCandName, "Title") & " name=" & GetEnumValue(objCandName, "Title") & " id=" & GetEnumValue(objCandName, "Title") & " class='radio-check'/>"
                'strHtml &= "<label for=" & GetEnumValue(objCandName, "Title") & "> " & GetEnumValue(objCandName, "Title") & " </label>"
                'strHtml &= "</div>"
                'CandTitles.Text = strHtml

                'Title.SelectedValue = GetValue(objCandidate, "Name.Title")
                'rdTitle.SelectedValue = GetValue(objCandidate, "Name.Title")
                litFName.Text = GetValue(objCandidate, "Name.FirstName")
                first_name.Text = GetValue(objCandidate, "Name.FirstName")
                middle_name.Text = GetValue(objCandidate, "Name.MiddleName")
                last_name.Text = GetValue(objCandidate, "Name.LastName")

                phone_l.Text = GetValue(objCandidate, "Phone.AreaCode") & " " & GetValue(objCandidate, "Phone.Number")

                If phone_l.Text = " " Then
                    phone_l.Text = Nothing
                End If


                phone_m.Text = GetValue(objCandidate, "Mobile.AreaCode") & " " & GetValue(objCandidate, "Mobile.Number")
                If phone_m.Text = " " Then
                    phone_m.Text = Nothing
                End If
                email.Text = GetValue(objCandidate, "Emailaddress.eMailAddress")
                w_email.Text = GetValue(objCandidate, "WorkeMailAddress.Emailaddress")

                Dim dob As String = System.Convert.ToString(GetValue(objCandidate, "DOB.DateDay"))
                dob = dob & "/" & System.Convert.ToString(GetValue(objCandidate, "DOB.DateMonth"))
                dob = dob & "/" & System.Convert.ToString(GetValue(objCandidate, "DOB.DateYear"))
                birthday.Value = dob
                Dim fullAddress As String() = System.Text.RegularExpressions.Regex.Split(GetValue(objCandidate, "Address.Address"), vbCrLf)

                address.Text = GetValue(objCandidate, "Address.Address")
                suburb.Text = GetValue(objCandidate, "Address.Suburb")
                city.Text = GetValue(objCandidate, "Address.City")
                postCode.Text = GetValue(objCandidate, "Address.PostCode")
                'Dim coountry As String = GetValue(objCandidate, "Address.Country.Name")
                'If Not coountry Is Nothing Then
                '    ddlCountry.Attributes.Add("data-default-value", GetValue(objCandidate, "Address.Country.Name"))

                'End If

                'If (Not String.IsNullOrEmpty(GetValue(objCandidate, "Address.Country.Name"))) Then
                ddlCountry.SelectedValue = GetValue(objCandidate, "Address.Country.Name")

                'Else
                '    'ddlCountry.Attributes.Add("data-default-value", GetValue(objCandidate, "Address.Country.Name"))
                '    'End If
                '    ddlCountry.SelectedValue = "New Zealand"
                '    'Dim coountry As String = GetValue(objCandidate, "Address.Country.Name")
                '    'If coountry Then
                'End If
                'CityVal.Value = GetValue(objCandidate, "Address.City")
                'city.Attributes.Add("data-default-value", GetValue(objCandidate, "Address.City"))

                birthPlace.Text = GetValue(objCandidate, "CandidatePlaceOfBirth")
                linkedin.Text = GetValue(objCandidate, "LinkedInPage.wwwAddress")
                skype_name.Text = GetValue(objCandidate, "SkypeName")

                Gender.SelectedValue = GetValue(objCandidate, "CandidateGender")
                'par_occ.Text = GetValue(objCandidate, "CandidatePartnerOcc")
                driving.Checked = GetValue(objCandidate, "CandidateDriversLicense")
                ownTransport.Checked = GetValue(objCandidate, "CandidateOwnTransport")
                smoker.Checked = GetValue(objCandidate, "CandidateSmoker")
                availability.Text = GetValue(objCandidate, "CandidateAvailability")

                alt_first_name.Text = GetValue(objCandidate, "AlternateContact.Name.FirstName")
                alt_last_name.Text = GetValue(objCandidate, "AlternateContact.Name.LastName")
                alt_phone_l.Text = GetValue(objCandidate, "AlternateContact.PhoneNumber.AreaCode") & GetValue(objCandidate, "AlternateContact.PhoneNumber.Number")
                alt_email.Text = GetValue(objCandidate, "AlternateContact.Email.eMailAddress")
                alt_rel.Text = GetValue(objCandidate, "AlternateContact.Relationship")

                'w_phone.Text = GetValue(objCandidate, "WorkPhone.AreaCode") & GetValue(objCandidate, "WorkPhone.Number")
                'w_email.Text = GetValue(objCandidate, "WorkeMailAddress.eMailAddress")

                currEmp.Text = GetValue(objCandidate, "CandidateCurrentEmployer")
                currPos.Text = GetValue(objCandidate, "CandidateCurrentPosition")
                currSal.Text = GetValue(objCandidate, "CandidateCurrentSalary")
                sal_sought.Text = GetValue(objCandidate, "CandidateSalarySought")
                notice_time_perm.Text = GetValue(objCandidate, "CandidateNoticePeriod_Perm")

                currAgen.Text = GetValue(objCandidate, "CandidateRegisteredAgencies")
                temp_sought.Text = GetValue(objCandidate, "CandidateRateSought")
                current_work_at.Text = GetValue(objCandidate, "CandidateCurrentTempEmployer")
                notice_time.Text = GetValue(objCandidate, "CandidateNoticePeriod")

                exist.Value = GetValue(objCandidate, "IsDirectCandidate")
                UserCounter.Value = GetValue(objCandidate, "OnlineRegCounter")
                isNewUser.Value = GetValue(objCandidate, "isNewUser")
                IsDirect.Value = GetValue(objCandidate, "IsDirectCandidate")
            End If

        End If
    End Sub
    <System.Web.Services.WebMethod()> Public Shared Function SaveCity_Click(ByVal city As String, ByVal key As String) As String
        Try
            Dim objSystem As New AeSystem
            Dim name As String

            objSystem.EnableDebugging()
            objSystem.Connect("", "Omega", "system", "")
            HttpContext.Current.Session("SIFSystem") = objSystem
            Dim objReferee As IAeClassInst = GetInstance(objSystem, "Candidate", False, "Username='" + key + "'")
            Dim objTransaction As IAeTransaction = objSystem.BeginTransaction
            SetValue(objReferee, "Address.City", city)

            objReferee.Save(objTransaction)
            objTransaction.Commit()
            objTransaction = Nothing


        Catch ex As Exception
            Return ex.ToString()
        End Try


    End Function
    Protected Sub next_btn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles next_btn.Click
        Dim objUserName As String = Session("Username")
        Dim objCandidate As IAeClassInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Candidate", False, "Username='" + Session("Username") & "'")
        saved = False
        Dim objValidate As IAeValidate = Nothing
        Dim objTransaction As IAeTransaction = CType(Master.Master, Portal).SIFSystem.BeginTransaction
        If Not objCandidate Is Nothing Then

            'Dim counter = GetValue(objCandidate, "OnlineRegCounter")
            'If counter Is Nothing Then
            '    counter = 2
            'End If
            'SetValue(objCandidate, "OnlineRegCounter", counter)
            SetValue(objCandidate, "Name.Firstname", first_name.Text)
            SetValue(objCandidate, "Name.MiddleName", middle_name.Text)
            SetValue(objCandidate, "Name.LastName", last_name.Text)

            Dim phoneL As String = phone_l.Text
            phoneL = phoneL.Trim()
            If InStr(phoneL, " ") > 0 Then
                Dim pLS As String() = phoneL.Split(" ")
                SetValue(objCandidate, "Phone.AreaCode", pLS(0))

                Dim num As String = ""
                Dim cout As Integer = pLS.Length - 1
                If cout > 1 Then
                    For index As Integer = 1 To cout
                        num &= pLS(index)
                    Next
                Else
                    num = pLS(1)
                End If
                SetValue(objCandidate, "Phone.Number", num)
            Else
                SetValue(objCandidate, "Phone.AreaCode", Nothing)
                SetValue(objCandidate, "Phone.Number", phoneL)
            End If

            Dim phoneM As String = phone_m.Text
            phoneM = phoneM.Trim()
            If InStr(phoneM, " ") > 0 Then
                Dim pMS As String() = phoneM.Split(" ")
                SetValue(objCandidate, "Mobile.AreaCode", pMS(0))

                Dim num As String = ""
                Dim cout As Integer = pMS.Length - 1
                If cout > 1 Then
                    For index As Integer = 1 To cout
                        num &= pMS(index)
                    Next
                Else
                    num = pMS(1)
                End If
                SetValue(objCandidate, "Mobile.Number", num)
            Else
                SetValue(objCandidate, "Mobile.AreaCode", Nothing)
                SetValue(objCandidate, "Mobile.Number", phoneM)
            End If
            SetValue(objCandidate, "Emailaddress.Emailaddress", email.Text)
            SetValue(objCandidate, "WorkeMailAddress.Emailaddress", w_email.Text)
            Dim dob() As String = birthday.Value.Split("/")
            SetValue(objCandidate, "DOB.DateDay", dob(0))
            SetValue(objCandidate, "DOB.DateMonth", dob(1))
            SetValue(objCandidate, "DOB.DateYear", dob(2))

            SetValue(objCandidate, "Address.Address", address.Text)
            SetValue(objCandidate, "Address.Suburb", suburb.Text)
            SetValue(objCandidate, "Address.City", city.Text)
            SetValue(objCandidate, "Address.PostCode", postCode.Text)

            Dim strCtryKey = GetInstance(CType(Master.Master, Portal).SIFSystem, "Countries", False, "Name='" + ddlCountry.SelectedValue & "'").Key
            SetValue(objCandidate, "Address.country", strCtryKey)

            SetValue(objCandidate, "CandidatePlaceOfBirth", birthPlace.Text)
            SetValue(objCandidate, "LinkedInPage.wwwAddress", linkedin.Text)
            SetValue(objCandidate, "SkypeName", skype_name.Text)

            If Not Gender.SelectedValue <> "" Or Gender.SelectedValue = Nothing Then
                SetValue(objCandidate, "CandidateGender", Nothing)
            Else
                SetValue(objCandidate, "CandidateGender", Gender.SelectedValue)
            End If

            SetValue(objCandidate, "CandidateDriversLicense", driving.Checked)
            SetValue(objCandidate, "CandidateOwnTransport", ownTransport.Checked)
            SetValue(objCandidate, "CandidateSmoker", smoker.Checked)

            SetValue(objCandidate, "CandidateAvailability", availability.Text)

            SetValue(objCandidate, "AlternateContact.Name.FirstName", alt_first_name.Text)
            SetValue(objCandidate, "AlternateContact.Name.LastName", alt_last_name.Text)
            Dim phoneAL As String = alt_phone_l.Text
            If InStr(phoneAL, " ") > 0 Then
                Dim pLS As String() = phoneAL.Trim().Split(" ")
                SetValue(objCandidate, "AlternateContact.PhoneNumber.AreaCode", pLS(0))
                SetValue(objCandidate, "AlternateContact.PhoneNumber.Number", pLS(1))
            Else
                SetValue(objCandidate, "AlternateContact.PhoneNumber.AreaCode", Nothing)
                SetValue(objCandidate, "AlternateContact.PhoneNumber.Number", phoneAL)
            End If
            SetValue(objCandidate, "AlternateContact.Email.eMailAddress", alt_email.Text)
            SetValue(objCandidate, "AlternateContact.Relationship", alt_rel.Text)

            'Dim phoneAWL As String = w_phone.Text
            'If InStr(phoneAWL, " ") > 0 Then
            '    Dim pLS As String() = phoneAWL.Trim().Split(" ")
            '    SetValue(objCandidate, "WorkPhone.AreaCode", pLS(0))
            '    SetValue(objCandidate, "WorkPhone.Number", pLS(1))
            'Else
            '    SetValue(objCandidate, "WorkPhone.AreaCode", pLS(0))
            '    SetValue(objCandidate, "WorkPhone.Number", phoneAWL)
            'End If
            'SetValue(objCandidate, "WorkeMailAddress.eMailAddress", w_email.Text)

            SetValue(objCandidate, "CandidateCurrentEmployer", currEmp.Text)
            SetValue(objCandidate, "CandidateCurrentPosition", currPos.Text)
            SetValue(objCandidate, "CandidateCurrentSalary", currSal.Text)
            SetValue(objCandidate, "CandidateSalarySought", sal_sought.Text)
            SetValue(objCandidate, "CandidateNoticePeriod_Perm", notice_time_perm.Text)

            SetValue(objCandidate, "CandidateRegisteredAgencies", currAgen.Text)
            SetValue(objCandidate, "CandidateRateSought", temp_sought.Text)
            SetValue(objCandidate, "CandidateCurrentTempEmployer", current_work_at.Text)
            SetValue(objCandidate, "CandidateNoticePeriod", notice_time.Text)


            '----Upload Photo
            If photoUpload.PostedFile Is Nothing OrElse String.IsNullOrEmpty(photoUpload.PostedFile.FileName) OrElse photoUpload.PostedFile.InputStream Is Nothing Then
            Else
                Dim extension1 As String = System.IO.Path.GetExtension(photoUpload.PostedFile.FileName).ToLower()
                Dim mimeType1 As String = Nothing
                Select Case extension1
                    Case ".jpeg"
                        mimeType1 = "image/jpeg"
                    Case ".jpg"
                        mimeType1 = "image/jpg"
                    Case ".bmp"
                        mimeType1 = "image/bmp"
                    Case ".png"
                        mimeType1 = "image/png"
                    Case ".tiff"
                        mimeType1 = "image/tiff"
                    Case Else
                        'Invalid file type upload
                        lblPhotoUpload.Text = "Not a valid file format. File extensions allowed: .jpg, .jpeg, .png, .bmp, .tiff"
                        Exit Sub
                End Select
                Dim savePath As String = "C:\inetpub\wwwroot\savefiles\"
                If photoUpload.HasFile Then

                    savePath += photoUpload.FileName
                    photoUpload.SaveAs(savePath)
                    lblPhotoUpload.Text = "Your file was uploaded successfully."

                    Dim objMimeDocument As New Elk9Utils.MimeDocument
                    objMimeDocument.LoadFromFile(savePath, False)

                    Dim objDoc As IAeClassInst
                    objDoc = objCandidate.Folders("Documents").CreateNewInstance
                    SetValue(objDoc, "MimeType", photoUpload.PostedFile.ContentType)
                    SetValue(objDoc, "Name", photoUpload.PostedFile.FileName)
                    SetValue(objDoc, "FileSize", My.Computer.FileSystem.GetFileInfo(savePath).Length / 1024)
                    SetValue(objDoc, "DocumentDescription", photoUpload.PostedFile.FileName)
                    SetValue(objDoc, "CandidatePhoto", True)
                    SetValue(objDoc, "Compressed", True)
                    SetValue(objDoc, "Content", objMimeDocument.GetContent(True))
                    SetValue(objDoc, "VisibleOnWeb", True)
                    objDoc.Save()
                    objCandidate.Save()
                Else
                    lblPhotoUpload.Text = "You did not specify a file to upload."
                End If

                Dim file1 As FileInfo = New FileInfo(savePath)
                If file1.Exists Then
                    file1.Delete()
                End If
            End If
            'If photoUpload.PostedFile Is Nothing OrElse String.IsNullOrEmpty(photoUpload.PostedFile.FileName) OrElse photoUpload.PostedFile.InputStream Is Nothing Then
            '    lblPhotoUpload.Text = "Please Upload Valid file"
            '    Exit Sub
            'End If
            ''Make sure we are dealing with image files

            objCandidate.Save(objTransaction)
            objValidate = objTransaction.Validate
            'validate before commit
            If objValidate.Status <> 3 Then
                objTransaction.Commit()
                saved = True
                Response.Redirect("~/NewUser/NewUser-ProfileInfo-2.aspx")
            Else
                'lblMessage.Text = objValidate.Result.Message
                objTransaction = Nothing
                saved = False
            End If
            objTransaction = Nothing
            objValidate = Nothing
        End If

    End Sub
End Class